---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Physics - Spin and Angular Motion - AssemblyAngularVelocity, Torque and Angular Impulse"
tags: [roblox, community-knowledge, physics, angular-velocity, torque, rotation]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/classes/Torque
  - https://create.roblox.com/docs/physics/mover-constraints
---
# Physics - Spin and Angular Motion - AssemblyAngularVelocity, Torque and Angular Impulse

Spinning blades in obbies, rolling barrels, tumbling debris after an explosion, fidget-spinner style toys and car flips all involve angular motion. The Roblox API has the same three levels for rotation as for movement: set the angular velocity, apply an instant angular impulse, or apply a continuous torque. Knowing which to use and how the vectors are read avoids blades spinning the wrong way or debris that never tumbles.

## Reading an angular velocity vector

`BasePart.AssemblyAngularVelocity` is a Vector3 in **radians per second**. Its direction is the spin axis (right-hand rule: thumb along the vector, fingers curl in the spin direction) and its length is the speed. `Vector3.new(0, math.pi * 2, 0)` is one full turn per second, counter-clockwise seen from above.

## The three tools

| Tool | Effect | Mass/inertia aware |
| --- | --- | --- |
| `part.AssemblyAngularVelocity = w` | sets spin instantly | no |
| `part:ApplyAngularImpulse(L)` | instant change of spin | yes (heavier, bigger objects spin less) |
| `Torque` constraint | continuous twisting force | yes |
| `AngularVelocity` constraint | holds a spin rate using up to `MaxTorque` | yes, up to the cap |
| `part:ApplyImpulseAtPosition(J, p)` | push off-centre: linear + spin | yes |

The BasePart reference does not list a moment-of-inertia property, so "spin by exactly N rad/s" is easiest by setting `AssemblyAngularVelocity`, and "spin naturally for its size" by an angular impulse you tune by feel.

## Recipes (own code)

**Spinning obby blade (physical, pushes players):**
```lua
local av = Instance.new("AngularVelocity")
av.Attachment0 = blade.Attachment
av.AngularVelocity = Vector3.new(0, 4, 0) -- rad/s
av.MaxTorque = math.huge
av.RelativeTo = Enum.ActuatorRelativeTo.World
av.Parent = blade
-- plus a HingeConstraint or AlignPosition to keep the blade in place
```

**Debris tumble after a hit:**
```lua
local rng = Random.new()
chunk:ApplyImpulse(dir * 80 * chunk.AssemblyMass)
chunk.AssemblyAngularVelocity = rng:NextUnitVector() * rng:NextNumber(4, 12)
```

**Spin to face a target with Torque (PD, simplified):**
```lua
local yawErr = shortestDelta(currentYaw, goalYaw) -- see angle wrapping note
local wy = part.AssemblyAngularVelocity.Y
torque.Torque = Vector3.new(0, (KP * yawErr - KD * wy) * part.AssemblyMass, 0)
```
Scaling by mass is an approximation (true inertia also depends on shape); tune `KP`/`KD` per object.

## Off-centre pushes

An impulse at a point offset `r` from the center of mass adds angular impulse `r:Cross(J)`. Hitting a crate low and at the edge makes it spin forward and tip over; hitting it at the center only slides it. Use `ApplyImpulseAtPosition` with the actual hit point for weapons that should feel physical.

## Pitfalls

- Setting `AssemblyAngularVelocity` every frame fights collisions; set it once or use a constraint.
- Very high spin on small parts can tunnel through thin walls; keep spin below what you need and give fast blades a thicker collision box.
- Like linear impulses, call these where the part is simulated (network owner); server calls on client-owned parts may not show.

## Related
[[Physics Ragdolls - Hub]] · [[Physics - Impulse Math - ApplyImpulse, Mass and Velocity Change]] · [[Math - Cross Product Recipes - Surface Alignment and Signed Angles]] · [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]]
