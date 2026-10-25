---
area: "07 AI and Combat"
cluster: "Combat"
tags: [deep-dive, roblox, combat, networking, lag-compensation, hitscan]
cssclasses: [tg-a07]
---

# Lag Compensation and Server Rewind for Melee and Hitscan

> **Why this matters:** At 120 ms ping, the enemy a player shoots is already ~0.1 to 0.2 s further along on the server. Without compensation, a server-authoritative game rejects shots that were clearly on target, and players call it "broken hitreg".
> Server rewind lets the server check the hit against where the target *was* when the shooter saw it, while still refusing impossible claims.

---

## 1. The problem in numbers

Three delays stack between "target is here on the server" and "my shot arrives at the server":

1. **Server to shooter:** the target's position takes about half the round-trip time to arrive.
2. **Interpolation on the shooter's client:** Roblox renders other players' replicated physics slightly in the past so motion is smooth. The exact buffer is engine-managed and not published as a number; measure it in your game (method in section 6).
3. **Shooter to server:** the shot request takes about half the round-trip time.

A target running at 16 studs/s with ~200 ms total effective delay is ~3.2 studs away from where the shooter aimed. A 2-stud-wide torso is completely missed.

## 2. Strategy options

| Strategy | How | Pros | Cons |
|---|---|---|---|
| **Client authority** | Server trusts the client's hit | Feels perfect | Trivially exploitable |
| **Server-only, no rewind** | Server raycasts at current positions | Simple, secure | Feels bad above ~60 ms ping |
| **Client hit + server sanity check** | Client reports victim; server checks range/LOS/rate with generous slack | Simple, good enough for melee | Slack can be abused for small reach hacks |
| **Server rewind** | Server keeps a position history and tests the claim against the past | Fair and secure | More code, memory per player |

For melee in most Roblox games, **client hit + server sanity check** is enough. For **hitscan PvP** and competitive melee, use **server rewind**. This note builds rewind.

## 3. A shared clock

`workspace:GetServerTimeNow()` returns the server's time on both server and clients, synchronized by the engine. That is your timestamp for everything.

The client sends `fireTime = workspace:GetServerTimeNow()` with every shot. The server never trusts it blindly: it clamps it to a window such as `[now - MAX_REWIND, now]`.

## 4. Position history on the server

Record each character's root CFrame every server frame into a fixed-size ring buffer. 1 second at 60 Hz is 60 samples per character; small.

```lua
--!strict
-- ServerScriptService/Combat/History.lua
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local History = {}

local CAPACITY = 64            -- ~1 s at 60 Hz
type Sample = { t: number, cf: CFrame }
type Ring = { samples: { Sample }, head: number, count: number }

local rings: { [Model]: Ring } = {}

local function track(character: Model)
	rings[character] = { samples = table.create(CAPACITY), head = 0, count = 0 }
	character.Destroying:Once(function()
		rings[character] = nil
	end)
end

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(track)
	player.CharacterRemoving:Connect(function(c) rings[c] = nil end)
end)

-- NPCs can be registered too: History.track(npcModel)
History.track = track

RunService.PostSimulation:Connect(function()
	local now = Workspace:GetServerTimeNow()
	for character, ring in rings do
		local root = character:FindFirstChild("HumanoidRootPart") :: BasePart?
		if root then
			ring.head = ring.head % CAPACITY + 1
			ring.samples[ring.head] = { t = now, cf = root.CFrame }
			ring.count = math.min(ring.count + 1, CAPACITY)
		end
	end
end)

-- Returns the interpolated root CFrame at time t, or nil if t is outside history.
function History.sample(character: Model, t: number): CFrame?
	local ring = rings[character]
	if not ring or ring.count == 0 then return nil end
	local newer: Sample? = nil
	-- walk backward from newest sample
	for i = 0, ring.count - 1 do
		local idx = (ring.head - 1 - i) % CAPACITY + 1
		local s = ring.samples[idx]
		if s.t <= t then
			if not newer then
				return s.cf -- t is newer than our newest sample: use newest
			end
			local span = newer.t - s.t
			local alpha = if span > 0 then (t - s.t) / span else 0
			return s.cf:Lerp(newer.cf, alpha)
		end
		newer = s
	end
	return nil -- older than history
end

return History
```

`PostSimulation` runs after physics each frame, so samples reflect the simulated positions. Positions of player characters on the server are themselves replicated from each owning client, which is fine: we are reconstructing what the server knew at that time.

## 5. Hit test against a rewound hitbox (pure math)

Do not move real parts back in time. Moving parts on the server replicates, disturbs physics and can be seen by everyone. Instead, test the ray against a **virtual** oriented box built from the rewound CFrame.

```lua
-- Ray vs oriented box (slab method). Returns distance along the ray or nil.
local function rayOBB(origin: Vector3, dir: Vector3, boxCF: CFrame, halfSize: Vector3): number?
	local o = boxCF:PointToObjectSpace(origin)
	local d = boxCF:VectorToObjectSpace(dir)
	local tMin, tMax = 0, math.huge
	for _, axis in { "X", "Y", "Z" } do
		local oa = (o :: any)[axis]
		local da = (d :: any)[axis]
		local h = (halfSize :: any)[axis]
		if math.abs(da) < 1e-8 then
			if oa < -h or oa > h then return nil end
		else
			local t1 = (-h - oa) / da
			local t2 = (h - oa) / da
			if t1 > t2 then t1, t2 = t2, t1 end
			tMin = math.max(tMin, t1)
			tMax = math.min(tMax, t2)
			if tMin > tMax then return nil end
		end
	end
	return tMin
end
```

`dir` here is the full ray vector (unit direction × max range), so the returned `tMin` is a fraction 0..1 of that vector; multiply by its length for studs.

A good hitbox for rewind is one box covering the character body around the root (for R15 roughly 4 × 5.5 × 2 studs, offset up from the root). Use the same box size on client prediction so both agree.

## 6. Server validation flow for a hitscan shot

```lua
--!strict
-- ServerScriptService/Combat/HitscanServer.server.lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local History = require(script.Parent.History)

local FireRemote = ReplicatedStorage.Remotes.Fire :: RemoteEvent

local MAX_REWIND = 0.30          -- seconds; never rewind further than this
local INTERP_ESTIMATE = 0.10     -- measured render delay estimate; tune per game
local MAX_RANGE = 300
local MUZZLE_SLACK = 6           -- studs allowed between claimed origin and server head position
local HALF = Vector3.new(2, 2.75, 1)  -- body box half-size
local BOX_OFFSET = CFrame.new(0, 0.5, 0)

local lastShot: { [Player]: number } = {}
local FIRE_INTERVAL = 0.1        -- weapon rate limit

local worldParams = RaycastParams.new()
worldParams.FilterType = Enum.RaycastFilterType.Exclude

FireRemote.OnServerEvent:Connect(function(player, origin: unknown, direction: unknown, fireTime: unknown, claimedVictim: unknown)
	-- 1. type checks (never trust remote args)
	if typeof(origin) ~= "Vector3" or typeof(direction) ~= "Vector3" or typeof(fireTime) ~= "number" then return end
	local character = player.Character
	local head = character and character:FindFirstChild("Head") :: BasePart?
	if not head then return end

	-- 2. rate limit
	local now = Workspace:GetServerTimeNow()
	if lastShot[player] and now - lastShot[player] < FIRE_INTERVAL * 0.9 then return end
	lastShot[player] = now

	-- 3. origin plausibility
	if (origin - head.Position).Magnitude > MUZZLE_SLACK then return end
	if direction.Magnitude < 0.5 then return end
	local ray = direction.Unit * MAX_RANGE

	-- 4. clamp the rewind time
	local t = math.clamp(fireTime - INTERP_ESTIMATE, now - MAX_REWIND, now)

	-- 5. world occlusion at present time (walls rarely move)
	worldParams.FilterDescendantsInstances = { character }
	local wallHit = Workspace:Raycast(origin, ray, worldParams)
	local wallDist = if wallHit then wallHit.Distance else MAX_RANGE

	-- 6. test candidate victims against rewound boxes
	local bestModel, bestDist = nil, math.huge
	for _, other in Players:GetPlayers() do
		local oc = other.Character
		if other ~= player and oc then
			local cf = History.sample(oc, t)
			if cf then
				local frac = rayOBB(origin, ray, cf * BOX_OFFSET, HALF)
				if frac then
					local dist = frac * MAX_RANGE
					if dist < bestDist and dist <= wallDist + 1 then
						bestModel, bestDist = oc, dist
					end
				end
			end
		end
	end

	if bestModel then
		-- optional: require it to match the client's claim to catch desync bugs
		-- apply damage here via your damage service
	end
end)
```

(`rayOBB` from section 5 is assumed to be in scope.)

**Measuring `INTERP_ESTIMATE`:** in a test server, have one client stand still and a second client strafe at constant speed. On the shooter's client, log the target's rendered position with `GetServerTimeNow()`; on the server, log the true position with the same clock. The average time offset between matching positions is your render delay. Re-measure after major engine updates; it is not a contract.

## 7. Melee with rewind

Same idea, but with an overlap test. The client reports `{ swingId, victim, clientTime }`. The server:

1. Confirms the swing is active at `clientTime` using the timing table (see [[Animation Markers for Hit Frames, Footsteps and Sync]]).
2. Samples **both** attacker and victim at `t = clamp(clientTime - INTERP_ESTIMATE, now - MAX_REWIND, now)`.
3. Builds the attacker's hitbox from the rewound attacker CFrame and checks it against the rewound victim box (OBB-vs-OBB or the cheaper "victim centre inside expanded attacker box").
4. Applies damage once per swing per victim.

## 8. Limits and fairness rules

- **Cap rewind** (`MAX_REWIND` 0.2 to 0.35 s is a common range). Players with 600 ms ping should not be able to hit people who already reached cover a long time ago. High-ping players get a worse experience; that is the correct trade.
- **"Shot behind cover" complaints** are the cost of rewind: the victim reached cover on their screen, but the shooter's older view still showed them. Cap rewind and keep TTK long enough that this is rare.
- **Do not rewind world geometry.** Doors and moving platforms are rare enough to ignore, or handle with a separate history.
- **Never rewind to a time later than now** or earlier than history; the clamp handles both.
- **Log rejected hits** with reason codes (range, LOS, rate, timing). A spike in one reason after an update usually means your constants are wrong, not that everyone is cheating.

## Common mistakes

- Trusting `fireTime` without clamping it, letting exploiters rewind seconds into the past.
- Moving real character parts back in time to test hits.
- Testing against detailed limbs instead of one stable body box, so results differ client vs server.
- Recording history at a different point than physics (e.g. on `Stepped` before simulation) and getting off-by-one-frame positions.
- Forgetting NPCs: if players shoot NPCs, register NPC models in the history too.
- Rewinding but still checking walls at the rewound time with moved parts.
- Hard-coding an interpolation delay "from the forums" instead of measuring.

## Checklist

- [ ] Shared clock: `GetServerTimeNow()` on client and server.
- [ ] Ring buffer per character, sampled in `PostSimulation`.
- [ ] Rewind clamped to `[now - MAX_REWIND, now]`.
- [ ] Math-only hit test against a fixed body box.
- [ ] Origin, rate, range and wall checks before rewind tests.
- [ ] Render delay measured in your game and stored as config.
- [ ] Rejection reasons logged and reviewed.
- [ ] Same box dimensions used by client prediction.

---

**Related:** [[Combat - Hub]] · [[Latency, Prediction and Reconciliation]] · [[Network Protocol and Server Authority]] · [[Hitscan and Projectile Weapon Blueprint]] · [[Remote Payload Validation]] · [[Server Melee Validation]]
