---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/entity-ra"
title: "Entity RA - GPL Land Vehicle Chassis From the A-Chassis Line"
tags: [roblox, community, vehicles, chassis, gpl, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "GPL-3.0"
sources:
  - https://github.com/totallyahuman445/Roblox-Entity-RA
---
# Entity RA - GPL Land Vehicle Chassis From the A-Chassis Line

| | |
|---|---|
| **What** | A community land-vehicle chassis that continues A-Chassis 6C (1.5 / 1.51); v0.50 was forked from an A-Chassis 1.6 prototype from June 2023 |
| **Maintainer** | `totallyahuman445` (GitHub), with a Discord and Roblox group linked from the README |
| **Version seen** | Release badge points at 0.51.4; repo pushed 2026-10 |
| **License** | GPL-3.0 |
| **Bundle-safe?** | No - **link only**. GPL-3.0 is copyleft; shipping it in a kit would force the kit's code under GPL too |
| **Link** | https://github.com/totallyahuman445/Roblox-Entity-RA |

## Goals (from the README)
- Recreate as many self-propelled land vehicle types as possible.
- Easier tuning, realism and configurability.
- Better performance, plugins that can talk to each other, and respect for the player's avatar setup.
- Open to pull requests and to merging good forks.

## The setup tip worth knowing even if you never use it
Entity RA does **not** add its own gravity hacks. Its README asks you to switch the place to realistic physics, or the suspension crushes:

| Setting | Suggested value |
|---|---|
| `Workspace.Gravity` | 35.025 |
| Jump setting (for realism, about 0.7 m) | 2.143 |
| Road `Friction` | 2 |
| Road `FrictionWeight` | 3.5 |

Default Roblox gravity is 196.2 studs/s², about 5.6 times stronger. A chassis tuned for one gravity will bottom out or float under the other, so pick one early and tune every spring against it. The unit table is in [[Roblox units]].

## Install
- **Roblox version:** take the model into your inventory and insert it.
- **GitHub version:** insert the `.rbxm`, or use the `.rbxmx` source (the author prefers it because GitHub can show diffs).
- Then set the chassis position to 0 in its properties, as the README says.

## A-Chassis or Entity RA?
| | A-Chassis | Entity RA |
|---|---|---|
| License | MPL-2.0 (file-level copyleft) | GPL-3.0 (whole-work copyleft) |
| Focus | Broad, beginner-friendly kit | Realism, many vehicle types, extensibility |
| Physics | Works on default gravity | Expects realistic gravity |

Read both licenses before you mix code from either into a closed project.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[A-Chassis - Community Car Chassis Kit]] · [[Choosing a Roblox Car Chassis - VehicleSeat, Constraint, Raycast or Server Authority]] · [[Vehicle Suspension, Chassis and Grip]] · [[Roblox units]]

<!-- TDOD_GRAPH_END -->
