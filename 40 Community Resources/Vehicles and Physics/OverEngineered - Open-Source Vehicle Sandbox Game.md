---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/overengineered"
title: "OverEngineered - Open-Source Vehicle Sandbox Game"
tags: [roblox, community, vehicles, sandbox, open-source-game, roblox-ts, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "Apache-2.0"
sources:
  - https://github.com/anywaymachines/overengineered
---
# OverEngineered - Open-Source Vehicle Sandbox Game

| | |
|---|---|
| **What** | A full Roblox **physics sandbox game**: build vehicles, planes, ships and machines from blocks, wire them with logic or custom Lua, then crash and destroy them |
| **Maintainer** | anywaymachines (GitHub; ~31 stars) |
| **Status** | **Archived, read-only since 2025-12-06.** The README says the official place may be down after DMCA takedowns and points to join.anywaymachines.com for the current version |
| **License** | Apache-2.0 |
| **Bundle-safe?** | No - **link only** (Apache-2.0 is not one of our bundle licenses) |
| **Link** | https://github.com/anywaymachines/overengineered |

## Why study it
It is one of very few complete, open-source Roblox games built around **player-made vehicles**: thrusters, motors, hinges, logic blocks and destruction in one codebase. Good for learning how a real project organizes a building system on top of Roblox physics.

## Tech stack (from the README)
| Tool | Role |
|---|---|
| TypeScript with a **modified roblox-ts** | Game code |
| Rojo | Syncs files into Studio |
| Lune | Assembles the place file (`lune run assemble`) |
| Rokit | Toolchain management |
| npm / Node.js 20 LTS | Build scripts |

Folders: `src/`, `game/`, `lune/`, `scripts/`, plus `default.project.json`, `rokit.toml`, `tsconfig.json`, `CONTRIBUTING.md`.

## Caveats
- The README describes features, not internals; expect to read the source to learn how blocks and physics are wired.
- A submodule with private database and anti-exploit services is **not** included (not needed for local development).
- The modified roblox-ts means it may not build with stock tooling without effort.
- Being archived, nobody will answer issues.

## Lessons a sandbox teaches about vehicle physics
- Player-built machines can have **hundreds of constraints**. Budget physics per player and cap block counts ([[Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions]]).
- Ownership of a player's machine should belong to its builder while they drive it ([[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]).
- Destruction means breaking joints at runtime, which costs assembly rebuild time (the MicroProfiler `Simulation/assemble` tag).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Open Source Games - Hub]] · [[Vehicle Damage, Repair and Failure States]] · [[Vehicle Damage and Impact Blueprint]] · [[Physics, Collisions and Ragdolls]]

<!-- TDOD_GRAPH_END -->
