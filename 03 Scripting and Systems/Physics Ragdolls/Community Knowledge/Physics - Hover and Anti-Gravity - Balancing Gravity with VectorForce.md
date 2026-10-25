---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Physics - Hover and Anti-Gravity - Balancing Gravity with VectorForce"
tags: [roblox, community-knowledge, physics, vectorforce, hover, gravity, pd-controller]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/VectorForce
  - https://create.roblox.com/docs/physics/mover-constraints
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
---
# Physics - Hover and Anti-Gravity - Balancing Gravity with VectorForce

Hoverboards, floating platforms, low-gravity zones, jetpacks and drones all start from the same equation: to cancel gravity, push up with `mass x gravity`. On top of that a small **PD controller** (spring plus damper) holds a target height. This is the physics-correct alternative to tweening anchored parts, and it reacts to collisions and riders.

## Cancel gravity exactly (own code)

```lua
local function antiGravity(part: BasePart, fraction: number): VectorForce
	local att = Instance.new("Attachment")
	att.Parent = part
	local vf = Instance.new("VectorForce")
	vf.Attachment0 = att
	vf.RelativeTo = Enum.ActuatorRelativeTo.World
	vf.ApplyAtCenterOfMass = true
	vf.Force = Vector3.new(0, part.AssemblyMass * workspace.Gravity * fraction, 0)
	vf.Parent = part
	return vf
end
```

- `fraction = 1`: weightless (drifts, keeps momentum).
- `fraction = 0.7`: feels like 30% gravity, a moon zone for one object.
- `RelativeTo = World` keeps the force pointing up even when the object tilts; `Attachment0` space would rotate with it.
- Recompute when mass changes (rider gets on, parts break off).

## Hold a height: PD controller (own code)

```lua
local TARGET = 5      -- studs above ground
local K = 40          -- spring (1/s^2)
local D = 10          -- damping (1/s)
RunService.Heartbeat:Connect(function()
	local m, g = board.AssemblyMass, workspace.Gravity
	local hit = workspace:Raycast(board.Position, Vector3.new(0, -50, 0), params)
	if not hit then vf.Force = Vector3.zero return end
	local err = TARGET - (board.Position.Y - hit.Position.Y)
	local vy = board.AssemblyLinearVelocity.Y
	local accel = g + K * err - D * vy
	vf.Force = Vector3.new(0, m * math.max(accel, 0), 0)
end)
```

- Critical damping (no bounce) is about `D = 2 * sqrt(K)`; with K = 40 that is 12.6. Lower D for a floaty bob, higher for stiff.
- `math.max(accel, 0)` stops the hover from pulling the board **down** into the ground.
- The raycast follows terrain, so the board climbs ramps.

## Jetpack thrust

Thrust that gives net upward acceleration `a`: `Force.Y = m * (g + a)`. Clamp fuel use by thrust level, and cut the force (not the velocity) when fuel runs out so the player falls naturally.

## When to use a different mover

| Need | Use |
| --- | --- |
| Exact position, ignores collisions | `AlignPosition` (rigidity) or anchored + CFrame |
| Exact velocity | `LinearVelocity` |
| Natural, collision-reactive forces | `VectorForce` as above |

## Pitfalls

- Put the script where the part is simulated (network owner). Driving the force from the server while a client owns the part causes visible lag.
- Characters: `AssemblyMass` of the HumanoidRootPart includes the whole character only if all limbs are part of the assembly (they normally are while alive).
- Changing `Workspace.Gravity` at runtime: recompute every frame (as in the PD loop) instead of once.

## Related
[[Physics Ragdolls - Hub]] · [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]] · [[Physics - Custom Buoyancy Math - Archimedes with VectorForce]] · [[Raycast Suspension Car - Spring-Damper Pattern and Pitfalls]]
