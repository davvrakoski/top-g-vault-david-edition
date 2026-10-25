---
area: "07 AI and Combat"
cluster: "Combat"
tags: [deep-dive, roblox, combat, hitbox, spatial-query, raycast]
cssclasses: [tg-a07]
---

# Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts

> **Why this matters:** `.Touched` hitboxes miss fast swings, fire twice, and are trivially abused. The spatial query API gives you deterministic, filterable, sweepable hit detection on both client and server.
> Choosing the right query per attack shape (box, sphere, ray, swept shape) is the difference between "hits feel fair" and "hits feel random".

---

## 1. The toolbox (current API)

All of these live on `WorldRoot` (so `workspace:` or a `WorldModel`).

| Method | Shape | Returns | Hits things already inside at start? | Limits from docs |
|---|---|---|---|---|
| `GetPartBoundsInBox(cframe, size, overlapParams)` | Oriented box vs **bounding boxes** | `{BasePart}` | Yes (it is an overlap test) | Bounding-box accuracy only |
| `GetPartBoundsInRadius(position, radius, overlapParams)` | Sphere vs bounding boxes | `{BasePart}` | Yes | Bounding-box accuracy only |
| `GetPartsInPart(part, overlapParams)` | Exact geometry of a part | `{BasePart}` | Yes | More accurate, more expensive |
| `Raycast(origin, direction, raycastParams)` | Line | `RaycastResult?` (first hit) | n/a | Direction length up to 15,000 studs |
| `Blockcast(cframe, size, direction, raycastParams)` | Swept box | first hit | **No** | Size up to 512, distance up to 1,024 studs |
| `Spherecast(position, radius, direction, raycastParams)` | Swept sphere | first hit | **No** | Radius up to 256, distance up to 1,024 studs |
| `Shapecast(part, direction, raycastParams, cframeOverride?, sizeOverride?)` | Swept actual part geometry | first hit | **No** | Distance up to 1,024 studs |

Two newer `RaycastParams` fields are worth knowing:

- `Margin` expands the cast shape in every direction. A non-zero `Margin` on `Raycast()` makes it behave like a sphere cast of that radius.
- `SizeGradient` scales the shape along the cast (`0.5` = ends 50% larger, `-1` shrinks to nothing). That is a cheap way to sweep a **cone** for a shotgun or breath attack.

And on `OverlapParams`:

- `ExcludeInstances` / `IncludeInstances` are the current filtering fields (they supersede `FilterDescendantsInstances` + `FilterType`, which still work). Exclusions win over inclusions. `IncludeInstances = nil` includes everything; `IncludeInstances = {}` includes nothing.
- `MaxParts` caps results (0 = no limit).
- `CollisionGroup` filters by collision group rules.
- `Tolerance` slightly grows the query volume (clamped 0 to 0.05 studs).
- `RespectCanCollide` uses `CanCollide` instead of `CanQuery` to decide eligibility.

All spatial queries respect `BasePart.CanQuery`. Your hitbox parts and character hit volumes must have `CanQuery = true`; decorative parts should have it off.

## 2. Which query for which attack

| Attack | Best query | Why |
|---|---|---|
| Punch, short sword, slam with a clear area | `GetPartBoundsInBox` each frame of the active window | Cheap, predictable, catches targets already in range |
| AoE explosion, shockwave ring | `GetPartBoundsInRadius` once | One call, then filter by distance and line of sight |
| Long weapon arc (greatsword, spear) | Raycasts between blade points, swept frame to frame | Follows the actual blade path |
| Fast dash attack | `Blockcast` from last position to current | No tunneling at high speed |
| Hitscan bullet | `Raycast` | Exact |
| Thick projectile (fireball) | `Spherecast` per step | Fair hit radius, no tunneling |
| Shotgun/breath cone | `Spherecast` or `Blockcast` with `SizeGradient > 0` | One swept call approximates a cone |
| Grab (must touch exact body) | `GetPartsInPart` | Exact geometry |

Because the casts do not report things that are **already overlapping at the start**, a common pattern is: overlap query at the start of the window, then casts for the movement during the window.

## 3. Collision group and filter setup

Do this once at server start (or in Studio's Collision Groups editor):

```lua
-- Server: collision groups for combat queries (WorldRoot collision-group methods)
local Workspace = game:GetService("Workspace")

if not Workspace:IsCollisionGroupRegistered("Hurtbox") then
	Workspace:RegisterCollisionGroup("Hurtbox")
end
if not Workspace:IsCollisionGroupRegistered("HitQuery") then
	Workspace:RegisterCollisionGroup("HitQuery")
end
-- HitQuery only "sees" Hurtbox parts
for _, group in Workspace:GetRegisteredCollisionGroups() do
	Workspace:CollisionGroupSetCollidable("HitQuery", group.name, group.name == "Hurtbox")
end
```

Then tag every character's hit volumes (`HumanoidRootPart` plus any custom hitbox parts) with `CollisionGroup = "Hurtbox"`, and run queries with `params.CollisionGroup = "HitQuery"`. Now world geometry, accessories, VFX and dropped items are never even considered.

(`PhysicsService` still exists for older group methods; the `WorldRoot` methods shown are the current ones listed in the reference.)

## 4. A reusable hitbox module (box per frame + dedupe)

```lua
--!strict
-- ReplicatedStorage/Shared/Hitbox.lua
-- Runs a box overlap every Heartbeat during an active window. Reports each model once per swing.
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Hitbox = {}
Hitbox.__index = Hitbox

export type Options = {
	attacker: Model,
	size: Vector3,
	offset: CFrame,            -- relative to attacker's HumanoidRootPart
	onHit: (victim: Model, part: BasePart) -> (),
	collisionGroup: string?,   -- "HitQuery"
	maxParts: number?,
}

-- Walk up from the hit part to the first Model that has a Humanoid (or an "Hittable" attribute).
local function modelFromPart(part: BasePart): Model?
	local node: Instance? = part.Parent
	while node and node ~= Workspace do
		if node:IsA("Model") and (node:FindFirstChildOfClass("Humanoid") or node:GetAttribute("Hittable")) then
			return node
		end
		node = node.Parent
	end
	return nil
end

function Hitbox.start(opts: Options)
	local self = setmetatable({}, Hitbox)
	local root = opts.attacker:FindFirstChild("HumanoidRootPart") :: BasePart
	local params = OverlapParams.new()
	params.ExcludeInstances = { opts.attacker }
	params.MaxParts = opts.maxParts or 32
	if opts.collisionGroup then
		params.CollisionGroup = opts.collisionGroup
	end

	local alreadyHit: { [Model]: boolean } = {}
	self.conn = RunService.Heartbeat:Connect(function()
		if not root.Parent then
			self:Stop()
			return
		end
		local cf = root.CFrame * opts.offset
		for _, part in Workspace:GetPartBoundsInBox(cf, opts.size, params) do
			local victim = modelFromPart(part)
			if victim and not alreadyHit[victim] then
				alreadyHit[victim] = true
				opts.onHit(victim, part)
			end
		end
	end)
	return self
end

function Hitbox:Stop()
	if self.conn then
		self.conn:Disconnect()
		self.conn = nil
	end
end

return Hitbox
```

Usage, opening the window from animation markers (see [[Animation Markers for Hit Frames, Footsteps and Sync]]):

```lua
local hb
track:GetMarkerReachedSignal("HitStart"):Connect(function()
	hb = Hitbox.start({
		attacker = character,
		size = Vector3.new(5, 5, 6),
		offset = CFrame.new(0, 0, -3.5),  -- 3.5 studs in front (forward is -Z)
		collisionGroup = "HitQuery",
		onHit = function(victim)
			attackRemote:FireServer("hit", swingId, victim)
		end,
	})
end)
track:GetMarkerReachedSignal("HitEnd"):Connect(function()
	if hb then hb:Stop() end
end)
track.Stopped:Connect(function()
	if hb then hb:Stop() end
end)
```

The `alreadyHit` table is the fix for most "double hit" reports: one swing, one hit per victim, regardless of how many frames the victim stays inside.

## 5. Swept blade raycasts (for long, curved swings)

A box in front of the character feels wrong for a greatsword arc that starts behind the shoulder. Put attachments along the blade (`Dmg1`...`Dmg5`), remember each attachment's world position from last frame, and raycast from old to new position every frame. This is the technique popularized by community "raycast hitbox" modules, implemented here in a few lines.

```lua
-- Blade sweep: call :Step() on Heartbeat (or PreSimulation) during the active window.
local BladeSweep = {}
BladeSweep.__index = BladeSweep

function BladeSweep.new(blade: BasePart, attacker: Model, onHit: (BasePart, Vector3) -> ())
	local self = setmetatable({}, BladeSweep)
	self.points = {}
	for _, a in blade:GetChildren() do
		if a:IsA("Attachment") and a.Name:match("^Dmg") then
			table.insert(self.points, a)
		end
	end
	self.last = {}
	self.params = RaycastParams.new()
	self.params.FilterType = Enum.RaycastFilterType.Exclude
	self.params.FilterDescendantsInstances = { attacker }
	self.params.CollisionGroup = "HitQuery"
	self.onHit = onHit
	return self
end

function BladeSweep:Step()
	for i, a in self.points do
		local now = a.WorldPosition
		local prev = self.last[i]
		if prev then
			local delta = now - prev
			if delta.Magnitude > 1e-3 then
				local result = workspace:Raycast(prev, delta, self.params)
				if result then
					self.onHit(result.Instance, result.Position)
				end
			end
		end
		self.last[i] = now
	end
end

function BladeSweep:Reset()
	table.clear(self.last)
end

return BladeSweep
```

Add a per-swing `alreadyHit` set in `onHit` exactly like the box module. With `RaycastParams.Margin = 0.3`, each ray becomes a thin sphere cast, which makes small targets easier to hit without moving to a full box.

## 6. Tunneling and frame rate

At 60 FPS a dash moving 80 studs/s travels 1.33 studs per frame; at 20 FPS it is 4 studs per frame. A 2-stud-deep box sampled once per frame will skip targets. Fixes:

1. **Sweep instead of sample.** `Blockcast` from last frame's CFrame to this frame's along the movement delta.
2. **Sub-step.** If `delta.Magnitude > size.Z * 0.5`, run 2 to 4 overlap queries along the path.
3. **Server uses its own clock.** The server runs Heartbeat at its own rate; do not assume it matches the client.

```lua
-- Swept box for a dash: catches anything between last and current position.
local function sweepBox(lastCF: CFrame, nowCF: CFrame, size: Vector3, params: RaycastParams)
	local delta = nowCF.Position - lastCF.Position
	if delta.Magnitude < 1e-3 then return nil end
	return workspace:Blockcast(lastCF, size, delta, params)
end
```

Remember that `Blockcast` returns only the **first** hit. For multi-target dashes, combine one overlap at the end position with the sweep, or repeat the cast after excluding the first victim (`params:AddToFilter(victimModel)`), up to a small cap.

## 7. Client detects, server decides

The usual production split:

1. **Client** runs the hitbox for its own attacks (responsive, matches what the player sees) and sends `victim` + `swingId`.
2. **Server** checks: is this swing active (timing table), is the victim alive, is the victim within `maxRange + slack` of the attacker *now*, is there line of sight, has this swing already hit this victim, is the attack rate legal.
3. Server applies damage and broadcasts the result.

For NPC attacks, the server runs the hitbox itself. For ranged and fast PvP, add server rewind: [[Lag Compensation and Server Rewind for Melee and Hitscan]]. Validation details are also in [[Server Melee Validation]] and [[Server-Authoritative Melee Pattern]].

## 8. Performance notes

- Spatial queries are cheap compared to `.Touched` with many moving parts, but not free. Budget roughly: overlap queries per active swing per frame, not per character per frame.
- `MaxParts` keeps worst cases bounded in crowded fights.
- A dedicated collision group that only sees `Hurtbox` parts is the biggest single speed-up: the broadphase skips everything else.
- Reuse `OverlapParams`/`RaycastParams` objects; the docs note you can change their members without creating new ones.
- Do not run hitboxes for idle characters "just in case". Open them only inside active windows.

## Common mistakes

- Using `.Touched` for weapons (misses at speed, fires on accessories, exploitable).
- Querying against every part in the world instead of a `Hurtbox` collision group.
- No per-swing dedupe, so one swing hits the same enemy on 8 frames.
- Expecting `Blockcast`/`Shapecast` to detect targets that start inside the shape.
- Forgetting `CanQuery = true` on custom hitbox parts (they are invisible to queries).
- Setting `IncludeInstances = {}` by accident and wondering why nothing hits.
- Trusting the client's hit report without a server range/timing check.
- Hit-testing against layered clothing or accessories, giving some avatars bigger hitboxes.

## Checklist

- [ ] `Hurtbox` and `HitQuery` collision groups registered and applied.
- [ ] Every character has consistent hurtbox parts with `CanQuery = true`.
- [ ] Attack shapes mapped to query types (box, radius, ray, sweep).
- [ ] Hitboxes open/close from markers and always close on `Stopped`.
- [ ] Per-swing dedupe set.
- [ ] Fast attacks swept or sub-stepped.
- [ ] Server re-validates range, timing, LOS, rate and dedupe.
- [ ] Params objects reused; `MaxParts` set.

---

**Related:** [[Combat - Hub]] · [[Combat double-hits or misses]] · [[Server Melee Validation]] · [[Server-Authoritative Melee Pattern]] · [[Secure Combat Vertical Slice]] · [[Spatial Hash for Nearby Queries]]
