---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Physics - Roblox Units Cheat Sheet - Studs, RMU, Rowtons and Gravity"
tags: [roblox, community-knowledge, physics, units, constraints, tuning]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/units
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/parts/materials
---
# Physics - Roblox Units Cheat Sheet - Studs, RMU, Rowtons and Gravity

Every force, stiffness and density field in Roblox is in Roblox units, and copying real-world numbers ("a car spring is 30,000 N/m") straight in gives nonsense. This sheet collects the official conversions from the Roblox units page and turns them into the rules of thumb you need when tuning constraints, VectorForces and custom materials.

## Primary units (official)

| Quantity | Roblox | Metric |
| --- | --- | --- |
| Time | 1 s | 1 s |
| Length | 1 stud | 28 cm |
| Mass | 1 RMU (Roblox Mass Unit) | 21.952 kg |

## Derived units (official, rounded to 3 significant figures)

| Quantity | Metric | Roblox |
| --- | --- | --- |
| Water density | 1 g/cm3 | 1 RMU/stud3 |
| Air density (sea level) | 0.00129 g/cm3 | 0.00129 RMU/stud3 |
| 1 atmosphere | 101,325 Pa | 1290 RMU/(stud s2) |
| Velocity | 1 m/s | 3.57 studs/s |
| Force | 1 N | 0.163 Rowtons |
| Torque | 1 N m | 0.581 Rowton-studs |
| Spring stiffness | 1 N/m | 0.0456 RMU/s2 |
| Spring damping | 1 N s/m | 0.0456 RMU/s |

A **Rowton** is the Roblox force unit (1 RMU x 1 stud/s2).

## Gravity

| Setting | Roblox | Metric |
| --- | --- | --- |
| Roblox default `Workspace.Gravity` | 196.2 studs/s2 | 54.936 m/s2 |
| Realistic | 35 studs/s2 | 9.8 m/s2 |

So default Roblox gravity is about 5.6x real gravity at the official stud scale. That is why default jumps feel snappy and why "realistic" games often lower gravity and raise forces.

## Physical limits (official)

| Property | Min | Max |
| --- | --- | --- |
| Density (RMU/stud3) | 0.0001 | 100 |
| Friction | 0 | 2 |
| FrictionWeight | 0 | 100 |
| Elasticity | 0 | 1 |
| ElasticityWeight | 0 | 100 |

## Rules of thumb (derived from the tables)

- A part floats in terrain water when its density is **below 1** (water is exactly 1 RMU/stud3). Plastic is 0.7, Ice 0.919, Concrete 2.403 (Materials page).
- Mass of a part = density x volume: a 4 x 1 x 2 Plastic brick is `8 x 0.7 = 5.6` RMU (`BasePart:GetMass()`; check `AssemblyMass` for welded groups).
- Holding something up against gravity needs force `mass x Workspace.Gravity`: that 5.6 RMU brick needs about 1,099 Rowtons at default gravity.
- Converting a real spring: multiply N/m by 0.0456. A 30,000 N/m car spring is about 1,370 RMU/s2 in a `SpringConstraint.Stiffness`, then tune by feel because Roblox gravity is not real gravity.
- Speeds: a 16 studs/s walk is about 4.5 m/s (a brisk jog), 100 studs/s is about 28 m/s (100 km/h).

## Pitfalls

- The engine does not care about your unit choice; only consistency matters. If your art uses 1 stud = 1 foot, the docs show water density then means 1 RMU = 28.3 kg, and every number above shifts.
- Changing `Workspace.Gravity` affects jumps, vehicles, ragdolls and projectiles at once. Decide it early.
- Huge forces on tiny masses cause jitter; scale forces with `AssemblyMass` rather than hard-coding.

## Related
[[Physics Ragdolls - Hub]] · [[Physics, Collisions and Ragdolls]] · [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]] · [[Physics - Jump Height, JumpPower and Gravity Conversions]]
