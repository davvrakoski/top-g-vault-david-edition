---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Cranes and Construction Vehicles - Winch Hooks, Booms and Excavator Arms"
tags: [roblox, community-knowledge, vehicles, crane, construction, constraints]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/constraints/rope
  - https://create.roblox.com/docs/reference/engine/classes/RopeConstraint
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
  - https://create.roblox.com/docs/reference/engine/classes/PrismaticConstraint
  - https://devforum.roblox.com/t/2223531
  - https://devforum.roblox.com/t/help-with-ropes/1733333
---
# Ride - Cranes and Construction Vehicles - Winch Hooks, Booms and Excavator Arms

Construction sims, sandbox building games and job roleplay (dock worker, builder, demolition) all need machines with **arms**: cranes that lift containers, excavators that dig, forklifts that raise pallets. These are vehicles where the fun is in the tool, not the wheels. Every one of them is a chain of servo joints plus, for cranes, a winch rope.

## Joint cheat sheet
| Machine part | Constraint | Key properties |
|---|---|---|
| Crane slew (turntable) | `HingeConstraint` Servo | `TargetAngle`, `AngularSpeed` 10-20 deg/s |
| Boom luff (raise/lower) | `HingeConstraint` Servo | `LimitsEnabled`, `LowerAngle`/`UpperAngle`, high `ServoMaxTorque` |
| Telescopic boom | `PrismaticConstraint` Servo | `TargetPosition`, `Speed`, `ServoMaxForce` |
| Hoist cable | `RopeConstraint` winch | `WinchEnabled`, `WinchTarget`, `WinchSpeed`, `WinchForce`, `WinchResponsiveness` |
| Excavator boom / stick / bucket | 3 x `HingeConstraint` Servo | per-joint speed, limits |
| Forklift mast | `PrismaticConstraint` Servo | slow `Speed`, big force |

Docs facts for the winch: when enabled, the rope pulls its attachments toward `WinchTarget` (a length in studs); `WinchSpeed` must be positive (negative values act as 0), so you reel in and out by changing `WinchTarget`, not the sign of the speed. `WinchForce` is a number, not a Vector3 (a mistake seen in the "Help with ropes" thread).

## Controls: move targets, not angles
Hold-to-move feels right for heavy machines. Each input changes a target slowly; the servo chases it.

```lua
-- client of the operator, every frame
boomTarget = math.clamp(boomTarget + input.boom * 12 * dt, -5, 70)
hoistTarget = math.clamp(hoistTarget + input.hoist * 6 * dt, 3, 80)
remote:FireServer(boomTarget, hoistTarget) -- throttle to ~15 Hz
```
Server side: clamp again, then set `boomHinge.TargetAngle` and `rope.WinchTarget`.

Map controls clearly: left stick or WASD drives/slews, right stick or arrow keys moves boom and hoist, a button grabs/releases. Show a small diagram on screen; players do not guess which key is the stick joint.

## Grabbing loads
- **Hook**: on "grab", find a nearby `HookPoint` Attachment on a load within 2 studs of the hook, then create a `RopeConstraint` (short sling) or `BallSocketConstraint` from hook to load. Release = destroy it.
- **Magnet / clamp**: `WeldConstraint` on grab (simplest, but no swing).
- Loads swinging on a rope is the fun of cranes. Keep it but damp it: a light `AlignOrientation` on the hook block prevents endless spinning.
- Capacity: compare the load's `AssemblyMass` to a crane limit; overload = rope breaks or the crane tips (counterweight rules are a nice sim detail).

## Excavator digging
Real terrain digging is possible with `Terrain:FillBall` using `Enum.Material.Air` at the bucket tip, plus a "bucket full" flag that later fills a truck. Limit the dig rate and run it on the server only.

## Ownership and stability
- Give the operator network ownership of the machine, but keep counterweights and limits so a client cannot spin the boom through the floor.
- Heavy arms on light chassis flip. Increase the chassis density or add outriggers (prismatic legs that extend to the ground) before allowing slews.
- The "Issue scripting RopeConstraint" thread notes jittery behaviour that came from the winch itself; if a hoist vibrates, lower `WinchResponsiveness` or fix the length and disable the winch while holding.

## Related
[[Vehicles - Hub]] - [[HingeConstraint Motors and Servos for Wheels and Steering]] - [[Ride - Anchors and Mooring with RopeConstraint]] - [[Trailers and Towing with BallSocketConstraint]]
