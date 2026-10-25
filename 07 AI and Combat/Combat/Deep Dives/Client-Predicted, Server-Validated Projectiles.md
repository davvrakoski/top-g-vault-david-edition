---
area: "07 AI and Combat"
cluster: "Combat"
tags: [deep-dive, roblox, combat, projectiles, networking]
cssclasses: [tg-a07]
---

# Client-Predicted, Server-Validated Projectiles

> **Why this matters:** Spawning a physical `Part` per bullet on the server gives you laggy-looking shots, network ownership fights and physics cost that scales with fire rate. Trusting the client's projectile hits gives exploiters free kills.
> The production pattern is: projectiles are **data**, simulated by the same deterministic step function on the shooter, the server and every observer, with the server as the only one allowed to deal damage.

---

## 1. Architecture

```
Shooter client                   Server                         Other clients
--------------                   ------                         -------------
press fire
spawn visual immediately ---->   validate (rate, ammo, origin)
simulate locally (cosmetic)      simulate authoritatively ---->  spawn visual (from fire event)
                                 hit? -> damage, broadcast  ---> play impact
                                                                 simulate locally (cosmetic)
```

Key decisions:

- **Projectiles are not Parts on the server.** The server holds `{ origin, velocity, gravity, radius, spawnTime, ownerId }` and steps it with raycasts or spherecasts.
- **Same simulation code everywhere.** A shared module guarantees that the visual path on clients matches the server path (to within frame timing).
- **Only the server damages.** Client hit detection, if any, is a hint the server can use with rewind.
- **Fire events are reliable** (`RemoteEvent`). A missing fire event means a projectile that never appears for someone. Per-frame updates are never sent; observers simulate from the initial state.

## 2. The shared simulation step

```lua
--!strict
-- ReplicatedStorage/Shared/ProjectileSim.lua
local Workspace = game:GetService("Workspace")

local ProjectileSim = {}

export type Proj = {
	id: number,
	position: Vector3,
	velocity: Vector3,
	gravity: Vector3,      -- e.g. Vector3.new(0, -workspace.Gravity * 0.5, 0) for a lobbed shot
	radius: number,        -- 0 = raycast, > 0 = spherecast
	maxDistance: number,
	traveled: number,
	params: RaycastParams,
	alive: boolean,
}

-- Advances one projectile by dt. Returns a RaycastResult if it hit something this step.
function ProjectileSim.step(p: Proj, dt: number): RaycastResult?
	if not p.alive then return nil end
	local v0 = p.velocity
	local v1 = v0 + p.gravity * dt
	-- displacement with constant acceleration
	local displacement = v0 * dt + p.gravity * (0.5 * dt * dt)
	local dist = displacement.Magnitude
	if dist < 1e-4 then
		p.velocity = v1
		return nil
	end

	local result: RaycastResult?
	if p.radius > 0 then
		result = Workspace:Spherecast(p.position, p.radius, displacement, p.params)
	else
		result = Workspace:Raycast(p.position, displacement, p.params)
	end

	if result then
		p.position = result.Position
		p.alive = false
		return result
	end

	p.position += displacement
	p.velocity = v1
	p.traveled += dist
	if p.traveled >= p.maxDistance then
		p.alive = false
	end
	return nil
end

-- Fast-forward a projectile that was fired `age` seconds ago (used by observers and the server).
function ProjectileSim.catchUp(p: Proj, age: number, maxStep: number): RaycastResult?
	local remaining = math.clamp(age, 0, 0.5)
	while remaining > 0 and p.alive do
		local dt = math.min(remaining, maxStep)
		local hit = ProjectileSim.step(p, dt)
		if hit then return hit end
		remaining -= dt
	end
	return nil
end

return ProjectileSim
```

Notes on the math:

- Displacement uses `v0·dt + ½·g·dt²`, which is exact for constant gravity, so large `dt` on low-FPS clients does not change the arc. The derivation is in [[Projectile Ballistics Math]].
- Each step casts along the **segment** the projectile travels, so fast projectiles never tunnel.
- `Spherecast` has a 1,024-stud maximum distance per call and a 256-stud maximum radius; a single step will never approach those.
- Spherecasts do not hit things already overlapping the sphere at the start of the cast. Spawn projectiles slightly in front of the muzzle and exclude the shooter.

## 3. Shooter client

```lua
--!strict
-- StarterPlayerScripts/Shooter.client.lua (core parts)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local ProjectileSim = require(ReplicatedStorage.Shared.ProjectileSim)
local Visuals = require(ReplicatedStorage.Shared.ProjectileVisuals) -- pooled meshes/trails
local FireRemote = ReplicatedStorage.Remotes.FireProjectile :: RemoteEvent

local player = Players.LocalPlayer
local SPEED = 180
local nextId = 0
local live: { [number]: { proj: ProjectileSim.Proj, visual: any } } = {}

local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude

local function fire(muzzle: Attachment, aimPoint: Vector3)
	local character = player.Character
	if not character then return end
	params.FilterDescendantsInstances = { character, Workspace:FindFirstChild("Effects") }

	nextId += 1
	local origin = muzzle.WorldPosition
	local dir = (aimPoint - origin).Unit
	local proj: ProjectileSim.Proj = {
		id = nextId, position = origin, velocity = dir * SPEED,
		gravity = Vector3.zero, radius = 0.4, maxDistance = 400, traveled = 0,
		params = params, alive = true,
	}
	live[nextId] = { proj = proj, visual = Visuals.spawn("Orb", origin) }
	FireRemote:FireServer(nextId, origin, dir, Workspace:GetServerTimeNow())
end

RunService.Heartbeat:Connect(function(dt)
	for id, entry in live do
		local hit = ProjectileSim.step(entry.proj, dt)
		Visuals.move(entry.visual, entry.proj.position)
		if hit or not entry.proj.alive then
			Visuals.impact(entry.visual, entry.proj.position, hit and hit.Normal)
			-- cosmetic impact only; damage numbers wait for the server
			live[id] = nil
		end
	end
end)
```

The local impact is **cosmetic**. If the server disagrees (the target dodged on the server), the player sees a spark but no damage number. That mismatch is normal and rare at sane pings.

## 4. Server: validate, simulate, damage

```lua
--!strict
-- ServerScriptService/Combat/ProjectileServer.server.lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local ProjectileSim = require(ReplicatedStorage.Shared.ProjectileSim)
local FireRemote = ReplicatedStorage.Remotes.FireProjectile :: RemoteEvent
local SpawnRemote = ReplicatedStorage.Remotes.ProjectileSpawned :: RemoteEvent
local ImpactRemote = ReplicatedStorage.Remotes.ProjectileImpact :: RemoteEvent

local SPEED = 180
local FIRE_INTERVAL = 0.12
local MAX_ORIGIN_OFFSET = 8      -- studs from the shooter's root
local MAX_AGE = 0.3              -- how far we fast-forward a late fire request
local DAMAGE = 20

type Live = { proj: ProjectileSim.Proj, owner: Player }
local live: { [string]: Live } = {}
local lastFire: { [Player]: number } = {}

FireRemote.OnServerEvent:Connect(function(player, id: unknown, origin: unknown, dir: unknown, fireTime: unknown)
	if typeof(id) ~= "number" or typeof(origin) ~= "Vector3" or typeof(dir) ~= "Vector3" or typeof(fireTime) ~= "number" then
		return
	end
	local character = player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart") :: BasePart?
	if not root then return end

	local now = Workspace:GetServerTimeNow()
	if lastFire[player] and now - lastFire[player] < FIRE_INTERVAL * 0.9 then return end
	lastFire[player] = now
	-- (ammo / cooldown checks go here)

	if (origin - root.Position).Magnitude > MAX_ORIGIN_OFFSET then return end
	if dir.Magnitude < 0.9 or dir.Magnitude > 1.1 then return end

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = { character }

	local proj: ProjectileSim.Proj = {
		id = id, position = origin, velocity = dir.Unit * SPEED,
		gravity = Vector3.zero, radius = 0.4, maxDistance = 400, traveled = 0,
		params = params, alive = true,
	}
	local key = player.UserId .. ":" .. id
	live[key] = { proj = proj, owner = player }

	-- tell everyone else to draw it (shooter already drew it)
	for _, other in Players:GetPlayers() do
		if other ~= player then
			SpawnRemote:FireClient(other, player.UserId, id, origin, proj.velocity, fireTime)
		end
	end

	-- compensate for the time the request spent in flight (capped)
	local age = math.clamp(now - fireTime, 0, MAX_AGE)
	local hit = ProjectileSim.catchUp(proj, age, 1 / 60)
	if hit then
		-- handled in the same way as a stepped hit below
		live[key] = nil
		ImpactRemote:FireAllClients(player.UserId, id, hit.Position, hit.Normal)
	end
end)

local function onHit(entry: Live, result: RaycastResult)
	local model = result.Instance:FindFirstAncestorOfClass("Model")
	local humanoid = model and model:FindFirstChildOfClass("Humanoid")
	if humanoid and humanoid.Health > 0 then
		humanoid:TakeDamage(DAMAGE)   -- route through your damage service in production
	end
	ImpactRemote:FireAllClients(entry.owner.UserId, entry.proj.id, result.Position, result.Normal)
end

RunService.Heartbeat:Connect(function(dt)
	for key, entry in live do
		local result = ProjectileSim.step(entry.proj, dt)
		if result then
			onHit(entry, result)
			live[key] = nil
		elseif not entry.proj.alive then
			live[key] = nil
		end
	end
end)

Players.PlayerRemoving:Connect(function(p) lastFire[p] = nil end)
```

In the `catchUp` branch, call `onHit` too (shown inline as a remote broadcast for brevity). Catching up by the request age means the server's projectile is roughly where the shooter's visual already is, instead of starting behind it.

**Should the server catch up?** For slow, visible projectiles (fireballs, arrows), yes: it keeps the server path aligned with what the shooter sees. For very fast projectiles that hit players, combine it with target rewind ([[Lag Compensation and Server Rewind for Melee and Hitscan]]); otherwise the server tests against targets that have moved on.

## 5. Observer clients

```lua
-- Other clients: draw projectiles fired by others, fast-forwarded by network delay.
SpawnRemote.OnClientEvent:Connect(function(ownerId, id, origin, velocity, fireTime)
	local proj = {
		id = id, position = origin, velocity = velocity, gravity = Vector3.zero,
		radius = 0.4, maxDistance = 400, traveled = 0, params = observerParams, alive = true,
	}
	local age = workspace:GetServerTimeNow() - fireTime
	ProjectileSim.catchUp(proj, age, 1 / 30)
	if proj.alive then
		observerLive[ownerId .. ":" .. id] = { proj = proj, visual = Visuals.spawn("Orb", proj.position) }
	end
end)

ImpactRemote.OnClientEvent:Connect(function(ownerId, id, position, normal)
	local key = ownerId .. ":" .. id
	local entry = observerLive[key]
	if entry then
		Visuals.impact(entry.visual, position, normal)
		observerLive[key] = nil
	else
		Visuals.impactAt(position, normal) -- impact for a projectile we never drew (or the shooter's own)
	end
end)
```

Observers start the visual "in the middle of its flight" by fast-forwarding. On the shooter's own client, the server impact replaces the local guess: if the local projectile is already gone, just play the impact at the server position.

## 6. Bandwidth

- One fire event: id (number), origin (Vector3), direction (Vector3), time (number). Small.
- Per-projectile per-frame updates: **zero**.
- For automatic weapons at high fire rates, batch: send one event per 0.1 s containing several shots, or send a seed and let clients reproduce spread patterns deterministically.
- `UnreliableRemoteEvent` is appropriate for purely cosmetic, frequent, loss-tolerant data (aim direction updates). The docs note payloads larger than 1,000 bytes are dropped. Do not use it for fire/impact events that must arrive.

## 7. Visual pooling

A projectile visual is usually a small `MeshPart` (the bundled `VFX_Sphere_Shell` or `VFX_Flare_Crossed` from [[Top G Originals - VFX Mesh Pack]]) plus a `Trail`. Pool them: creating and destroying instances per shot is a common frame spike source. Pattern in [[Object Pooling Without Making a Mess]], visual recipes in [[Energy Orb and Projectile VFX]].

Move pooled visuals with `workspace:BulkMoveTo(parts, cframes, Enum.BulkMoveMode.FireCFrameChanged)` when you have many; it is cheaper than setting `CFrame` on each part.

## Common mistakes

- Server `Part` with `AssemblyLinearVelocity` per bullet, owned by whoever is nearest.
- Client reports "I hit player X" and the server applies damage.
- Different step code on client and server (arcs disagree).
- Stepping position by `velocity * dt` and raycasting from the new position only (tunneling).
- No cap on the server's catch-up age, so exploiters fire "from the past".
- Sending projectile positions every frame.
- Fire events on `UnreliableRemoteEvent`, so some players never see shots.
- Not excluding the shooter, so projectiles hit their own character at spawn.

## Checklist

- [ ] Projectiles are data on the server; visuals only on clients.
- [ ] One shared deterministic step function (segment casts, exact gravity).
- [ ] Server validates rate, ammo, origin, direction length.
- [ ] Server catch-up capped (0.2 to 0.3 s).
- [ ] Observers fast-forward from fire time.
- [ ] Only the server applies damage; impacts broadcast.
- [ ] Visuals pooled; many moved with `BulkMoveTo`.
- [ ] Tested at 150 to 250 ms simulated latency.

---

**Related:** [[Combat - Hub]] · [[Hitscan and Projectile Weapon Blueprint]] · [[Projectile Ballistics Math]] · [[Energy Orb and Projectile VFX]] · [[Remote Payload Validation]] · [[Network Ownership and Physics Replication]]
