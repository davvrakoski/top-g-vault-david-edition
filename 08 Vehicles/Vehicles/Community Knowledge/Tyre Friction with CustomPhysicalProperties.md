---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Tyre Friction with CustomPhysicalProperties"
tags: [roblox, community-knowledge, vehicles, friction, physicalproperties, grip]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/PhysicalProperties
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/physics/units
---
# Tyre Friction with CustomPhysicalProperties

On a constraint car, grip is not a "grip" property: it is the friction between the wheel part and whatever it touches. Roblox blends the two parts' friction with a weighted average, which means the **road can override your tyres** unless you set weights on purpose. Understanding that one formula explains ice levels that do nothing, drift cars that will not drift and wheels that grip walls.

## The formula (from the PhysicalProperties docs)
When part A touches part B:

```
friction = (A.Friction * A.FrictionWeight + B.Friction * B.FrictionWeight)
         / (A.FrictionWeight + B.FrictionWeight)
```

Elasticity is blended the same way using `ElasticityWeight`. With equal weights you get the midpoint; when one weight is much bigger, that part's value wins.

Ranges: density 0.0001-100 (clamped), friction 0-2, elasticity 0-1, weights 0-100 (see the Roblox units page for the physical limits table).

## Setting it in code
```lua
-- density, friction, elasticity, frictionWeight, elasticityWeight
local TYRE = PhysicalProperties.new(1.2, 1.4, 0, 100, 100)
for _, wheel in car.Wheels:GetChildren() do
	wheel.CustomPhysicalProperties = TYRE
end
```

- High `FrictionWeight` (100) on the tyres means the tyre's friction dominates on almost every surface: consistent handling map-wide.
- Elasticity 0 with a high weight stops the car bouncing off kerbs and landing jumps like a ball.
- Leaving `CustomPhysicalProperties` nil means the wheel uses its **Material** defaults, which changes if an artist swaps the material from Rubber to Plastic.

## Surface design patterns
| Goal | Tyres | Surface |
|---|---|---|
| Same grip everywhere | friction 1.2-1.5, weight 100 | anything |
| Ice / oil patch that really works | weight 1-5 | friction 0.02-0.1, weight 100 |
| Mud that slows but does not slide | normal | add drag in script when on that material instead of friction |
| Drift car | rear tyres friction ~0.5-0.8, front higher | normal |

To let surfaces matter, tyres need a **low** weight. You cannot have both "tyres always win" and "ice wins"; pick per game, or switch tyre properties at runtime when a raycast under the wheel reports a material:

```lua
local result = workspace:Raycast(wheel.Position, Vector3.new(0, -3, 0), params)
if result and result.Material == Enum.Material.Ice then
	wheel.CustomPhysicalProperties = ICE_TYRE
end
```
Change properties only when the surface changes, not every frame.

## Density matters too
Wheel density affects rotational inertia and how hard the motor works. Very light wheels on a heavy chassis (big mass ratio) make constraints unstable; the AssemblyMass docs warn about large mass differences. Keep wheels a reasonable fraction of the chassis mass, and use `Massless` on decorative parts instead of lowering wheel density to zero.

## Pitfalls
- Changing `Material` later resets nothing if custom properties are set, which surprises artists. Document it in the car's README.
- Friction does not cure sideways sliding at speed on raycast cars: those need a scripted lateral force (see [[Raycast Suspension Car - Spring-Damper Pattern and Pitfalls]]).
- Spherical wheels have a tiny contact patch; cylinders are more predictable.

## Related
[[Vehicles - Hub]] · [[Vehicle Suspension, Chassis and Grip]] · [[Drift and Handling Tuning - Community Tips for Constraint Cars]] · [[Center of Mass, Anti-Flip and Self-Righting]]
