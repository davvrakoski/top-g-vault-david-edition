---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/choosing-a-chassis"
title: "Choosing a Roblox Car Chassis - VehicleSeat, Constraint, Raycast or Server Authority"
tags: [roblox, community, vehicles, chassis, decision-guide, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
  - https://devforum.roblox.com/t/tank-chassis-constraint-chassis/59923
  - https://devforum.roblox.com/t/how-do-you-make-a-car/1675381
  - https://devforum.roblox.com/t/car-suspension-scripted/92283
  - https://github.com/lisphm/A-Chassis
  - https://github.com/OpenChassis/OpenChassis
  - https://github.com/VanillaEdge/Server-Authoritive-Vehicle
  - https://starrybit.itch.io/
---
# Choosing a Roblox Car Chassis - VehicleSeat, Constraint, Raycast or Server Authority

Four families of car show up again and again on the DevForum. Pick the family first, then the kit.

## The four families
| Family | How it moves | Feel | Main risk |
|---|---|---|---|
| **VehicleSeat "tank" chassis** | The seat drives hinged wheels directly connected to it, using its `MaxSpeed`, `Torque`, `TurnSpeed` | Stable, simple, steers like a tank (no real steering angle) | Unrealistic turning; the seat only drives motors connected to it directly or through rigid joints |
| **Constraint chassis** | Springs + prismatic / cylindrical constraints for suspension, HingeConstraint motors for drive and steering | Real suspension and steering; most "realistic" | Many constraints per car; hard to rescale; costs physics time |
| **Raycast chassis** | One rigid body; each corner raycasts down and pushes up with a spring force; grip is scripted | Very tunable, cheap on the solver, great for arcade | You script friction and grip yourself; low FPS can make it bounce |
| **Server authority car** | Server simulates; clients send inputs and predict | Responsive *and* cheat-resistant | Needs the newer server authority engine and its quirks |

## What the community recommends
- A 2017 thread from a long-time racing builder argued the classic VehicleSeat tank chassis is still loved by the racing crowd, while others replied that cylindrical constraints allow far more interesting cars. Another reply showed how to script each wheel's HingeConstraint motor from the seat input to get the best of both.
- "How do you make a car?" replies: the default VehicleSeat car is easiest and stable on big ovals; **A-Chassis** is a very good open-source steering car, but it runs on the driver's client.
- Raycast cars in the "Car Suspension (Scripted)" thread: cast from each corner, push up based on ray length, then move the visual wheel welds to the hit point. Friction must be scripted.

## Free kits by family
| Kit | Family | License | Our use |
|---|---|---|---|
| [[A-Chassis - Community Car Chassis Kit]] | Constraint (tuned, plugin-based) | MPL-2.0 | Use / link only |
| [[Entity RA - GPL Land Vehicle Chassis From the A-Chassis Line]] | Constraint | GPL-3.0 | Link only |
| [[Constraint Chassis by ItsJustFahed - DevForum Open Car]] | Constraint | None stated | Link only |
| [[Roblox Racing Template - Dune Buggy Chassis and Server Authority Version]] | Constraint (official buggy) | Roblox template | Use only |
| OpenChassis (github.com/OpenChassis/OpenChassis) | Motored chassis, "spiritual successor" to A-Chassis / SS6 | MIT | Bundle-safe but **very early and stale** (2018). Read, don't ship |
| [[Server-Authoritive-Vehicle - MIT Server Authority Car Kit]] | Server authority | MIT | Bundle-safe |
| StarryDrive (starrybit.itch.io) | Plugin: 4-point spherecast suspension on one primary part | Paid ($7.99), license not stated | Link only |

For a raycast car you write yourself, see [[Raycast Suspension Car - Spring-Damper Pattern and Pitfalls]].

## Decision table
| Your game | Start with |
|---|---|
| Hangout / roleplay city, many casual cars | Constraint kit (A-Chassis) or the vault build in [[Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat]] |
| Arcade racing / karts / drifting | Raycast or force-based arcade car: [[Arcade Handling and Drifting Without Fighting Physics]] |
| Competitive racing with leaderboards | Server authority car, or client-owned car plus strong server checks ([[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]]) |
| Oval racing, very simple builds | VehicleSeat tank chassis |
| Tanks, bulldozers | Hinge-driven skid steer: [[Tanks and Tracked Vehicles - Hinge Tracks and Skid Steering]] |

## Before you commit
- Build one car and run it with 20+ copies on a phone. Check `physicsStepped` in the MicroProfiler ([[Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions]]).
- Decide who owns the physics ([[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]).
- Read the license before copying code into a kit you sell.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Vehicle Framework]] · [[Vehicle Suspension, Chassis and Grip]] · [[VehicleSeat]] · [[Vehicles - Hub]]

<!-- TDOD_GRAPH_END -->
