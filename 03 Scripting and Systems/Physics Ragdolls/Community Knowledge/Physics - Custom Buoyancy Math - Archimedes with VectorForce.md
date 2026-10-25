---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Physics - Custom Buoyancy Math - Archimedes with VectorForce"
tags: [roblox, community-knowledge, physics, buoyancy, water, boats, vectorforce]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/units
  - https://create.roblox.com/docs/reference/engine/classes/VectorForce
  - https://create.roblox.com/docs/reference/engine/classes/BuoyancySensor
  - https://en.wikipedia.org/wiki/Archimedes%27_principle
---
# Physics - Custom Buoyancy Math - Archimedes with VectorForce

Terrain water already floats parts lighter than water, but many games use **part water** (a blue box, a moving wave mesh, a flood that rises) where the engine does nothing. Then you write buoyancy yourself. The math is Archimedes plus a damping term, and in Roblox units it is unusually clean because water density is exactly 1 RMU/stud3.

## The principle

Upward force = fluid density x submerged volume x gravity. With water density 1 (units page):

```
F_up = 1 * V_submerged * Workspace.Gravity
```

An object floats when its average density is below 1, and at rest the submerged fraction equals its density (density 0.6 rides 60% underwater).

## Per-point buoyancy for boats (own code)

Sampling a few points (corners of the hull) gives tilt and roll for free:

```lua
local POINTS = {Vector3.new(-3,-1,-6), Vector3.new(3,-1,-6), Vector3.new(-3,-1,6), Vector3.new(3,-1,6)}
local DEPTH = 2          -- studs of hull below each point for "fully submerged"
local DAMP = 3           -- per-second damping of vertical speed

local att = Instance.new("Attachment", hull)
local force = Instance.new("VectorForce")
force.Attachment0 = att
force.RelativeTo = Enum.ActuatorRelativeTo.World
force.ApplyAtCenterOfMass = true
force.Parent = hull

RunService.Heartbeat:Connect(function()
	local g = workspace.Gravity
	local mass = hull.AssemblyMass
	local total = Vector3.zero
	for _, lp in POINTS do
		local wp = hull.CFrame:PointToWorldSpace(lp)
		local depth = math.clamp((waterLevel(wp) - wp.Y) / DEPTH, 0, 1)
		total += Vector3.new(0, depth * g * mass * 1.6 / #POINTS, 0)
	end
	local vy = hull.AssemblyLinearVelocity.Y
	total -= Vector3.new(0, vy * mass * DAMP, 0) * (total.Y > 0 and 1 or 0)
	force.Force = total
end)
```

- `1.6` makes the boat float when about 1/1.6 = 62% submerged at rest (tune for freeboard).
- One VectorForce at the center of mass gives lift only; for tilting, use one VectorForce per point with its own attachment at that point (set `ApplyAtCenterOfMass = false`).
- `waterLevel(p)` returns a flat height or samples your wave function at `p.X, p.Z`.

## Why damping matters

Pure Archimedes is a spring with no friction: the boat bobs forever. Real water resists motion; subtracting a force proportional to vertical speed (`vy * mass * DAMP`) settles it in a second or two. Add a little horizontal drag too (`-velocity * mass * 0.3`) so boats do not glide forever.

## Choosing the approach

| Water type | Approach |
| --- | --- |
| Terrain water | engine buoyancy; set densities, optionally use `BuoyancySensor` to read state |
| Flat part water | this note's VectorForce math |
| Animated waves | same math with `waterLevel` sampling the wave function on both server and client |

## Pitfalls

- Run the script on the network owner of the boat (the driver's client while driving), or the force lags behind the motion.
- Forces are in Rowtons: always scale by `AssemblyMass`; a hard-coded force breaks the moment the boat model changes.
- Characters standing on deck add mass; the hull sinks a little, which is correct but may need extra lift margin.

## Related
[[Physics Ragdolls - Hub]] · [[Boats and Ocean Resources - BuoyancySensor, Gerstner Waves and FFT Ocean]] · [[Physics - Roblox Units Cheat Sheet - Studs, RMU, Rowtons and Gravity]] · [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]]
