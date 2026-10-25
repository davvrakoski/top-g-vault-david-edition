---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends"
tags: [roblox, community-knowledge, physics, constraints, movers, knockback, flight]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/mover-constraints
  - https://create.roblox.com/docs/reference/engine/classes/AlignPosition
  - https://create.roblox.com/docs/reference/engine/classes/LinearVelocity
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
---
# Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends

Dashes, knockback, hover boards, flying mounts, grapple hooks, carried objects, floating pets: all of these push assemblies with physics. The legacy Body movers (`BodyVelocity`, `BodyGyro`, `BodyPosition`, `BodyForce`) are deprecated ([[Deprecated Roblox APIs and Their Modern Replacements]]), and the modern constraint movers have more modes than most tutorials show. Picking the right one (or none) avoids jitter, flinging and exploits.

## The movers (official list)

| Constraint | What it does | Classic use |
| --- | --- | --- |
| `LinearVelocity` | applies force to hold a velocity along a **vector, line or plane** | dashes, conveyor push, hover drift |
| `AngularVelocity` | applies torque to hold a spin rate | spinning traps, turrets |
| `AlignPosition` | pulls attachment toward another attachment or a goal position | carried objects, pets, grapple pull, hover height |
| `AlignOrientation` | rotates toward another attachment or goal orientation | keep upright, face camera, mounts |
| `VectorForce` | constant force | thrusters, wind, anti-gravity |
| `Torque` | constant torque | engines, spin-up |
| `LineForce` | force along the line between two attachments (optionally inverse-square) | magnets, black holes |
| `AnimationConstraint` | drives attachments by an offset CFrame | physics-friendly animated parts |

## Key properties that change behaviour

**LinearVelocity**
- `VelocityConstraintMode`: `Vector` (full 3D velocity), `Line` (only along `LineDirection` with `LineVelocity`), `Plane` (two axes with `PlaneVelocity`, free on the third). Plane mode is the trick for "steer horizontally but let gravity act vertically".
- `MaxForce` / `ForceLimitMode` / `ForceLimitsEnabled`: cap how hard it can push. A huge force is a perfect velocity lock but flings anything it hits.
- `RelativeTo`: world, attachment or other attachment frame.

**AlignPosition**
- `Mode`: one attachment + goal `Position`, or two attachments.
- `Responsiveness`: how quickly it closes the gap; `MaxVelocity` caps speed; `MaxForce` caps strength.
- `RigidityEnabled`: as stiff as possible (ignores responsiveness); good for "glued to hand", bad for anything that should feel soft.
- `ApplyAtCenterOfMass`, `ReactionForceEnabled` (whether the other assembly gets pushed back).

## Decision table

| You want | Use |
| --- | --- |
| One-off push (knockback, jump pad, explosion shove) | `part:ApplyImpulse(dir * mass * speed)` or set `AssemblyLinearVelocity` once. No constraint needed. |
| Dash that ignores gravity for 0.2 s | `LinearVelocity` (Vector mode) enabled briefly, then disabled |
| Hover board / boat that steers but still falls | `LinearVelocity` in Plane mode + `AlignOrientation` to stay upright |
| Pet or drone following an offset | `AlignPosition` + `AlignOrientation`, moderate `Responsiveness`, server-owned or client-owned consistently |
| Held object (gravity gun) | `AlignPosition` + `AlignOrientation` on the client that owns it, with a `MaxForce` so it can't shove vehicles |
| Constant wind zone | `VectorForce` on each affected assembly (or modify velocity in a zone script) |
| Rope swing / grapple | `RopeConstraint` + optional `AlignPosition` to reel in |

## Mass matters
Forces and impulses scale with mass: the same impulse moves a 10 kg part ten times more than a 100 kg one. Multiply by `part.AssemblyMass` when you want consistent velocity changes across avatars of different sizes, or use velocity-based movers (`LinearVelocity`) which handle mass for you within `MaxForce`.

## Network ownership is half the battle
Movers only behave smoothly when the machine simulating the assembly is the one changing them. For a player's character, set movers on the **client**; the server adding a LinearVelocity to a character is delayed and looks laggy ([[Smooth Knockback - What Works for All Clients]]). For server-controlled NPCs and objects, set ownership with `SetNetworkOwner(nil)` and drive them from the server.

## Pitfalls
1. **Forgetting to disable or destroy** a temporary mover leaves characters sliding forever; put it in a cleanup object or use `Debris:AddItem` ([[Trove vs Janitor - Cleanup API Side by Side]]).
2. **Infinite MaxForce** on anything players can touch becomes a fling exploit.
3. **Movers on anchored parts** do nothing; anchored parts are outside physics.
4. **Sleeping assemblies** wake when forces change, but very small forces may not move a sleeping part as expected ([[Physics Throttling, Sleep and Adaptive Timestepping]]).

## Related
[[Physics Ragdolls - Hub]] · [[Physics, Collisions and Ragdolls]] · [[Smooth Knockback - What Works for All Clients]] · [[Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions]]
