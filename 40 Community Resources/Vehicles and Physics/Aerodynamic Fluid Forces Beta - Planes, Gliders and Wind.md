---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/aerodynamic-fluid-forces"
title: "Aerodynamic Fluid Forces Beta - Planes, Gliders and Wind"
tags: [roblox, community, vehicles, planes, aerodynamics, physics, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/enums/FluidForces
  - https://create.roblox.com/docs/reference/engine/enums/FluidFidelity
  - https://create.roblox.com/docs/reference/engine/classes/FluidForceSensor
  - https://create.roblox.com/docs/reference/engine/classes/AtmosphereSensor
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://devforum.roblox.com/t/2024-h1-physics-recap/3118248
  - https://devforum.roblox.com/t/how-would-i-make-parts-be-affected-by-globalwind/2724449
  - https://devforum.roblox.com/t/new-studio-racing-template/2805745
---
# Aerodynamic Fluid Forces Beta - Planes, Gliders and Wind

Roblox has a built-in **aerodynamic force model**. Parts that opt in get lift and drag from their real shape as they move through air, so a wing-shaped part can actually glide. The 2024 H1 Physics Recap lists the newer, more realistic model as arriving in the April 2024 Studio Beta. It is still labelled **experimental**: the docs warn its behavior may change during the beta.

## Switch it on
| Setting | Where | Notes |
|---|---|---|
| `Workspace.FluidForces` = `Experimental` | Studio Properties on Workspace | Cannot be set from Luau; Studio only |
| `BasePart.EnableFluidForces` = true | Each part that should feel air | Only these parts get aerodynamic force |
| `Workspace.AirDensity` | Workspace | Ground-level density in RMU/stud³; default is realistic sea-level air. Falls with height, to 5% at Y = 100,000 studs; fixed below Y = 0 |
| `Workspace.AirTurbulenceIntensity` | Workspace | 0 (off) to 1 (strongest) turbulence in the wind field |
| `FluidFidelity` (MeshParts, unions) | Part property | `Automatic`, `UseCollisionGeometry`, or `UsePreciseGeometry` (more accurate, can raise join and replication time at scale) |

## Read what the air is doing
| Class | Gives you |
|---|---|
| `FluidForceSensor` | `Force`, `Torque`, `CenterOfPressure` from the last physics frame, plus `EvaluateAsync(linearVelocity, angularVelocity, cframe)` to ask "what force would I get at this speed and attitude?" |
| `AtmosphereSensor` | `AirDensity` and `RelativeWindVelocity` at its position |

`CenterOfPressure` is the offset from the center of mass. If it sits **in front of** the center of mass, the plane is unstable in pitch; move the wings back or add a tail. `EvaluateAsync` is a quick way to check trim in Studio before you fly.

## Practical tips
- **Opt in only what matters.** Wings, tail and fuselage on a plane; not every bolt. Each enabled part costs force calculation.
- **Use collision-geometry fidelity** for most meshes. Precise geometry only on the main wing if you need it.
- **Mass matters.** A DevForum thread on wind found that heavy assemblies need strong wind to move. Light gliders, kites and parachutes show the effect best.
- **Throttle and control** still come from you: thrust with a `VectorForce` along the nose, and control surfaces either as hinged parts (the air moves them physically) or as scripted torque. See [[Scripted Airplane Flight Model - Lift, Drag and Thrust]] for the manual approach.
- **Cars:** turn it off for ground vehicles unless you want downforce experiments. The Racing template announcement lists a known issue where the car can fling out of the world with the aerodynamics beta on.

## Built-in or scripted?
| Built-in fluid forces | Scripted flight model |
|---|---|
| Shape-accurate, no math to write | Full control, predictable, easy to make "arcade" |
| Beta: behavior may change | Stable across engine updates |
| Hard to make a plane that is also fun to fly for beginners | Easy to add assists (auto-level, stall protection) |
| Great for gliders, debris, sails, physics sandboxes | Best for dogfights and mobile-friendly planes |

Many games mix them: built-in air for realism, plus scripted assists on top.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Hover, Boat and Flying Vehicles with Mover Constraints]] · [[AtmosphereSensor]] · [[Global wind]] · [[Helicopter Controls - Lift, Tilt and Yaw With Movers]]

<!-- TDOD_GRAPH_END -->
