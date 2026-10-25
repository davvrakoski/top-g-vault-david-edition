---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Plane Stall, Flaps, Landing Gear and Runway Rules"
tags: [roblox, community-knowledge, vehicles, planes, flight]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/aerodynamic-physics-for-airplanes/3412855
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
  - https://create.roblox.com/docs/reference/engine/classes/PrismaticConstraint
  - https://create.roblox.com/docs/reference/engine/classes/VectorForce
  - https://www.grc.nasa.gov/www/k-12/airplane/lifteq.html
---
# Ride - Plane Stall, Flaps, Landing Gear and Runway Rules

The vault already has a scripted lift/drag/thrust model and notes on the Fluid Forces beta. This note adds the systems that make a plane feel like an aircraft instead of a flying car: a stall you can recover from, flaps that let you land slowly, landing gear that matters, and runway rules for multiplayer airports.

## Lift recap in one line
NASA's lift equation: lift = Cl x 0.5 x density x speed squared x wing area. In a game you only need **Cl as a function of angle of attack (AoA)** and the speed squared term. AoA is the angle between the wing chord (the plane's forward axis) and the velocity direction.

```lua
local v = root.AssemblyLinearVelocity
local fwd, up = root.CFrame.LookVector, root.CFrame.UpVector
local aoa = math.deg(math.atan2(-v:Dot(up), v:Dot(fwd)))
```

## A stall curve that is fun
| AoA | Cl (normalized) | Feel |
|---|---|---|
| 0 | 0.25 | Cruise |
| 0 to 14 | rises linearly to 1.2 | More pitch = more lift |
| 14 to 18 | drops to 0.7 | Stall: buffet, nose drops |
| above 18 | about 0.6, drag doubles | Deep stall, must push nose down |

- Warn early: at about 12 degrees start a stall horn and small camera shake; at 14 wobble roll randomly by a few degrees.
- Recovery = pushing the nose down to reduce AoA, then lift comes back. That is the lesson players learn in 30 seconds.
- On mobile or casual games, add "stall assist": automatically lower the nose when AoA stays above 16 for 1 s.

## Flaps
Flaps add lift and drag so you can fly slower. Give them 3 positions:

| Flap | Cl bonus | Drag bonus | Max safe speed |
|---|---|---|---|
| 0 | 0 | 0 | any |
| 1 (takeoff) | +0.3 | +15% | 70% of max |
| 2 (landing) | +0.6 | +40% | 50% of max |

Animate the visible flap with a `HingeConstraint` in Servo mode (`TargetAngle` 0, 15, 35). Above the max safe speed, either block extension or apply flap damage (good for simulator games).

## Landing gear
- Gear down adds drag (about +20%) and is required to land. Gear up while on the ground = belly landing damage.
- Visual: each leg on a `HingeConstraint` Servo, wheel on a free hinge. Or swap welded models if you want zero physics cost.
- Physics: wheels need low friction in the rolling direction and a little brake force. Toggle collision of the gear parts with a collision group when retracted so they do not snag.
- Auto-gear option for casual players: gear down below 150 studs altitude and below 50% speed.

## Touchdown rules
Score landings by vertical speed at the moment the gear first touches: below 8 studs/s = smooth, 8 to 20 = hard (minor damage), above 20 = crash. Also check bank angle under 10 degrees and gear down.

## Runway and airport rules (multiplayer)
- Runway as a zone part; "runway occupied" flag when a plane is on it below takeoff speed.
- Tower UI: queue for takeoff, landing clearance. Even a fake tower stops players spawning planes on top of each other.
- Clear stuck planes off the runway after 60 s idle.

## Pitfalls
- Computing AoA from a velocity near zero gives garbage; skip lift below a small speed.
- The DevForum thread notes many old planes used the deprecated BodyVelocity and BodyGyro; use `LinearVelocity`, `VectorForce` and `AlignOrientation` today.
- Apply lift at the center of mass or the plane will pitch strangely.

## Related
[[Vehicles - Hub]] - [[Scripted Airplane Flight Model - Lift, Drag and Thrust]] - [[Aerodynamic Fluid Forces Beta - Planes, Gliders and Wind]] - [[Helicopter Controls - Lift, Tilt and Yaw With Movers]]
