---
area: "08 Vehicles"
cluster: "Vehicles"
tags: [deep-dive, roblox, vehicles, racing, checkpoints, server-authority]
cssclasses: [tg-a08]
---

# Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn

> **Why this matters:** The car physics is half of a racing game. The other half is the race: fair starts, laps that cannot be skipped, live positions, boost pads and instant respawns. Most Roblox racers get this wrong with `.Touched` and trust the client.
> This note builds the race layer server-side with plane-crossing checkpoints, so shortcuts and teleports cannot win.

---

## 1. Assets you already have

- **Track pieces:** [[Kenney - Racing Kit]] (112 CC0 models: road corners, ramps, barriers, grandstands, pit garages, checkered flags, overhead gantries, light posts).
- **Karts and cars:** [[Kenney - Car Kit]] (`kart-oobi`, `kart-oodi`, `kart-ooli`, `kart-oopi`, `kart-oozi`, `race`, `race-future`, plus wheels and debris parts for crash effects).
- **Handling:** [[Arcade Handling and Drifting Without Fighting Physics]] for kart-style drift boost, or [[Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat]] for sim-style.

Kenney units are metres; the catalog suggests ×3.57 for real-world scale. For karts, many games scale up more so tracks feel wide on phone screens. Decide once.

## 2. Checkpoints as planes, not touch parts

`.Touched` misses fast cars, fires repeatedly, and fires for parts that teleport through. Instead, a checkpoint is an **oriented plane with a width**: a part whose `CFrame` LookVector points along the track direction. The server checks, each frame, whether a car's position moved from behind the plane to in front of it within the gate's width.

Author it in Studio: invisible anchored parts named or attributed with an index, in `workspace.Track.Checkpoints`, `CanCollide = false`, `CanQuery = false`, `CanTouch = false`, `Size` = (gate width, gate height, 1), front face pointing along the race direction. Index 0 is the start/finish line.

```lua
--!strict
-- ServerScriptService/Race/Checkpoints.lua
local Checkpoints = {}

export type Gate = { index: number, cf: CFrame, halfWidth: number, halfHeight: number }

function Checkpoints.load(folder: Folder): { Gate }
	local gates: { Gate } = {}
	for _, p in folder:GetChildren() do
		if p:IsA("BasePart") then
			local idx = p:GetAttribute("Index")
			assert(typeof(idx) == "number", p:GetFullName() .. " needs a numeric Index attribute")
			table.insert(gates, { index = idx, cf = p.CFrame, halfWidth = p.Size.X / 2, halfHeight = p.Size.Y / 2 })
		end
	end
	table.sort(gates, function(a, b) return a.index < b.index end)
	for i, g in gates do
		assert(g.index == i - 1, "Checkpoint indices must be 0..N-1 without gaps")
	end
	return gates
end

-- True if the segment from a to b crosses the gate plane in the forward direction, inside its bounds.
function Checkpoints.crossed(g: Gate, a: Vector3, b: Vector3): boolean
	local la = g.cf:PointToObjectSpace(a)
	local lb = g.cf:PointToObjectSpace(b)
	-- forward is -Z in object space: crossing means going from z > 0 (behind) to z <= 0 (in front)
	if not (la.Z > 0 and lb.Z <= 0) then return false end
	local t = la.Z / (la.Z - lb.Z)
	local hit = la:Lerp(lb, t)
	return math.abs(hit.X) <= g.halfWidth and math.abs(hit.Y) <= g.halfHeight
end

return Checkpoints
```

Because it uses the segment between the last and current position, a car at 150 studs/s cannot skip a gate between frames.

## 3. Race state on the server

```lua
--!strict
-- ServerScriptService/Race/RaceManager.server.lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Checkpoints = require(script.Parent.Checkpoints)

local gates = Checkpoints.load(Workspace.Track.Checkpoints)
local LAPS = 3
local MIN_LAP_TIME = 25        -- seconds; faster than this is impossible on this track
local RaceEvent = ReplicatedStorage.Remotes.RaceEvent :: RemoteEvent

type Racer = {
	player: Player,
	chassis: BasePart,
	nextGate: number,          -- index of the gate we must cross next
	lap: number,
	lastPos: Vector3,
	lapStart: number,
	finished: boolean,
	finishTime: number?,
	lastGoodCF: CFrame,        -- respawn point (CFrame of the last gate crossed)
}

local racers: { [Player]: Racer } = {}
local raceStart = math.huge

local function addRacer(player: Player, chassis: BasePart)
	racers[player] = {
		player = player, chassis = chassis, nextGate = 1, lap = 1,
		lastPos = chassis.Position, lapStart = 0, finished = false, finishTime = nil,
		lastGoodCF = gates[1].cf,
	}
end

local function startRace(countdown: number)
	raceStart = Workspace:GetServerTimeNow() + countdown
	RaceEvent:FireAllClients("countdown", raceStart)
	for _, r in racers do r.lapStart = raceStart end
end

local function progressOf(r: Racer): number
	-- higher = further ahead. lap, then gate, then closeness to next gate.
	local gate = gates[r.nextGate + 1] or gates[1]
	local dist = (r.chassis.Position - gate.cf.Position).Magnitude
	return r.lap * 1e6 + r.nextGate * 1e3 - math.min(dist, 999)
end

local posAccumulator = 0
RunService.Heartbeat:Connect(function(dt)
	local now = Workspace:GetServerTimeNow()
	if now < raceStart then return end

	for _, r in racers do
		if r.finished or not r.chassis.Parent then continue end
		local pos = r.chassis.Position
		local gate = gates[r.nextGate + 1]  -- gates[] is 1-based, indices are 0-based
		if Checkpoints.crossed(gate, r.lastPos, pos) then
			r.lastGoodCF = gate.cf
			if gate.index == 0 then
				-- crossed start/finish after visiting every other gate
				local lapTime = now - r.lapStart
				if lapTime < MIN_LAP_TIME then
					warn("Suspicious lap", r.player.Name, lapTime) -- do not count it
				else
					RaceEvent:FireClient(r.player, "lap", r.lap, lapTime)
					r.lap += 1
					r.lapStart = now
					if r.lap > LAPS then
						r.finished = true
						r.finishTime = now - raceStart
						RaceEvent:FireAllClients("finished", r.player.UserId, r.finishTime)
					end
				end
			end
			r.nextGate = (gate.index + 1) % #gates
		end
		r.lastPos = pos
	end

	-- positions at 4 Hz
	posAccumulator += dt
	if posAccumulator >= 0.25 then
		posAccumulator = 0
		local list = {}
		for _, r in racers do table.insert(list, r) end
		table.sort(list, function(a, b)
			if a.finished ~= b.finished then return a.finished end
			if a.finished then return (a.finishTime :: number) < (b.finishTime :: number) end
			return progressOf(a) > progressOf(b)
		end)
		for i, r in list do
			r.player:SetAttribute("RacePosition", i)
		end
	end
end)

Players.PlayerRemoving:Connect(function(p) racers[p] = nil end)
```

How the gate order works: a racer always has exactly one `nextGate`. Crossing any other gate does nothing. Start/finish (index 0) only counts as a lap after gate N-1 has been crossed, because `nextGate` only becomes 0 then. Shortcuts that skip a gate simply leave the racer waiting for that gate.

The code assumes the starting grid sits **just past** gate 0, so the first gate to cross is 1 (`nextGate = 1`, `lap = 1`). If your grid is behind the line, start racers with `nextGate = 0` and `lap = 0`, and treat the first crossing of gate 0 as "lap 1 begins" (skip the minimum-lap-time check for that crossing only).

`RacePosition` as a player attribute replicates for free; the HUD reads it.

## 4. Fair starts

- Server picks `raceStart = GetServerTimeNow() + 3.5` and broadcasts it. Every client counts down against the same clock, so lights change together regardless of ping.
- Until `raceStart`, the **client controller ignores throttle** and the server additionally anchors or holds karts with a `LinearVelocity` set to zero (remove it at `raceStart`). Do both: the client lock is for feel, the server hold is for security.
- Jump-start detection: any kart more than 2 studs from its grid slot at `raceStart` gets a penalty or is reset.

```lua
-- Client: countdown + input lock
RaceEvent.OnClientEvent:Connect(function(kind, value)
	if kind == "countdown" then
		local startAt = value :: number
		task.spawn(function()
			while workspace:GetServerTimeNow() < startAt do
				local remaining = math.ceil(startAt - workspace:GetServerTimeNow())
				-- update your countdown UI with `remaining`
				task.wait(0.05)
			end
			-- GO: enable driving input
		end)
	end
end)
```

## 5. Boost pads

The client detects the pad (instant feel) and applies the impulse; the server checks that the kart really was on that pad.

```lua
-- Client (driver): check pads every frame with a small overlap box under the kart
local padParams = OverlapParams.new()
padParams.IncludeInstances = { workspace.Track.BoostPads }
local lastPadTime = 0

local function checkPads(chassis: BasePart)
	if os.clock() - lastPadTime < 0.5 then return end
	local hits = workspace:GetPartBoundsInBox(chassis.CFrame * CFrame.new(0, -1.5, 0), Vector3.new(4, 2, 6), padParams)
	local pad = hits[1]
	if pad then
		lastPadTime = os.clock()
		local strength = pad:GetAttribute("Boost") or 35
		local dir = pad.CFrame.LookVector
		chassis:ApplyImpulse(dir * strength * chassis.AssemblyMass)
		RaceEvent:FireServer("pad", pad)
	end
end
```

Server side: on `"pad"`, confirm the pad is a real `BoostPads` child and the chassis is within ~10 studs of it, then grant a temporary speed-cap allowance (`maxSpeed + strength` for 1.5 s) so the speed sanity check does not flag the boost. Pads that are only cosmetic on the server cannot be abused by firing the remote from across the map.

Make pads readable: animated arrows using a `Beam` with `TextureSpeed` (see [[Beams, Trails and Attachments - Production Setups]]).

## 6. Respawn

Players need a reset button, and the game needs an automatic reset for karts that fall off, flip or get stuck.

- **Manual:** client fires `"respawn"`; server rate-limits (once per 3 s) and teleports.
- **Automatic (server):** below a kill height, upside down for > 2 s (`chassis.CFrame.UpVector.Y < -0.3`), or speed < 2 studs/s for > 4 s while the race is running.
- **Where:** `lastGoodCF` (the last gate crossed), lifted 4 studs, zero velocity.

```lua
local function respawn(r)
	local cf = r.lastGoodCF * CFrame.new(0, 4, 0)
	local model = r.chassis:FindFirstAncestorOfClass("Model")
	if model then
		model:PivotTo(cf)
	end
	r.chassis.AssemblyLinearVelocity = Vector3.zero
	r.chassis.AssemblyAngularVelocity = Vector3.zero
	r.lastPos = cf.Position   -- important: do not let the teleport count as crossing a gate
end
```

Because the driver's client owns the kart, a server `PivotTo` is replicated to the owner and applied, but there can be a short tug-of-war. A robust approach: briefly set the network owner to the server (`SetNetworkOwner(nil)`), teleport, wait one or two frames, then hand ownership back to the driver.

## 7. Anti-cheat summary

| Exploit | Defence |
|---|---|
| Teleport across the track | Gate order + segment crossing; teleports skip gates and gain nothing |
| Teleport through a gate | Lap time minimum; `lastPos` reset on server-initiated teleports only |
| Speed hack | Server speed cap per vehicle with temporary allowances for boosts |
| Fake boost remote | Server proximity check against real pads |
| Jump start | Server hold until `raceStart` + grid distance check |
| Fake finish | Finish computed only by the server; client never reports results |

Rewards (coins, XP, leaderboard times) are written by the server from `finishTime` only. Leaderboards: [[Leaderboard Blueprint]].

## Common mistakes

- Checkpoints with `.Touched` (missed gates at speed, double counts).
- Counting a lap whenever the finish line is touched.
- Position ranking by distance to the finish line only (breaks on loops and crossovers).
- Client-reported lap times.
- Countdown with `task.wait(3)` on each client (different start times per ping).
- Respawning without resetting `lastPos`, so the teleport counts as a gate crossing.
- No minimum lap time sanity check.

## Checklist

- [ ] Gates authored as oriented planes with 0..N-1 indices.
- [ ] Segment-plane crossing on the server every frame.
- [ ] One `nextGate` per racer; laps only via full sequence.
- [ ] Positions ranked by lap, gate, distance to next gate; published as an attribute.
- [ ] Synchronized countdown via `GetServerTimeNow()`; server hold until start.
- [ ] Boost pads client-applied, server-verified, with speed-cap allowance.
- [ ] Manual and automatic respawn at the last gate.
- [ ] Results and rewards server-only.

---

**Related:** [[Vehicles - Hub]] · [[Racing Starter Architecture]] · [[Vehicle Framework]] · [[Leaderboard Blueprint]] · [[Remote Rate Limiting Pattern]] · [[Kenney - Racing Kit]]
