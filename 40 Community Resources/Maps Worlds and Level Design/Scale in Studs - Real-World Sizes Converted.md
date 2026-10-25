---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/scale-in-studs"
title: "Scale in Studs - Real-World Sizes Converted"
tags: [roblox, community, level-design, scale, metrics, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/physics/units
  - https://create.roblox.com/docs/avatar/rigid-accessories/specifications
  - https://create.roblox.com/docs/characters/pathfinding
  - https://create.roblox.com/docs/studio/terrain-editor
  - https://create.roblox.com/docs/reference/engine/classes/StarterPlayer
---
# Scale in Studs - Real-World Sizes Converted

A quick reference for turning real measurements and reference photos into studs, plus the Roblox numbers that should override "real" sizes. For a hands-on metrics test course, build the metrics gym in [[Map Blockout to Art Pass Workflow]].

## The official conversion
Roblox's units page: **1 stud = 0.28 m (28 cm)**, so **1 m = 3.57 studs**. The page recommends keeping standard Roblox units so physics and VR behave as expected.

## Avatar heights (official accessory mannequins)
| Body scale | Approx. height | In metres (x 0.28) |
|---|---|---|
| Classic | ~4.75 studs | ~1.33 m |
| Rthro Slender | ~5.25-6.25 studs | ~1.5-1.75 m |
| Rthro Normal | ~5.75-6.5 studs | ~1.6-1.8 m |

Players bring many body types, so a doorway that fits Rthro Normal comfortably fits everyone.

## Real-world sizes in studs
Arithmetic from 1 m = 3.57 studs, rounded:

| Thing | Real size | Studs |
|---|---|---|
| Stair tread depth | 0.28 m | 1 |
| Stair riser | 0.18 m | 0.64 |
| Interior door (height x width) | 2.1 x 0.9 m | 7.5 x 3.2 |
| Room ceiling | 2.7 m | 9.6 |
| Shop / mall ceiling | 4-5 m | 14-18 |
| Narrow corridor | 1.2 m | 4.3 |
| Car (length x width) | 4.5 x 1.8 m | 16 x 6.4 |
| Road lane | 3.5 m | 12.5 |
| Basketball court | 28 x 15 m | 100 x 54 |
| Football pitch | 105 x 68 m | 375 x 243 |
| Large tree | 10-15 m | 36-54 |
| 1 km | 1,000 m | 3,571 |

## Roblox numbers that should win over realism
| Constraint | Value | Why it matters |
|---|---|---|
| NPC pathfinding `AgentRadius` default | 2 studs | Gaps narrower than ~4 studs block default agents |
| NPC pathfinding `AgentHeight` default | 5 studs | Spaces lower than 5 studs (under stairs, vents) are non-walkable for NPCs |
| Default walk speed | 16 studs/s (~4.5 m/s, a fast jog) | Real-size cities feel tiny; travel time matters more than metres |
| Default jump height | 7.2 studs (~2 m) | Much higher than a real jump; low walls do not stop players |
| Terrain voxel | 4 studs | Terrain edits and `FillBlock` snap to 4 |
| Heightmap pixel | 4 studs (1.12 m) | See [[Real-World Heightmaps - Free DEM Sources and Licenses]] |

**What this means in practice:**
- A third-person camera needs room. Real 1.2 m corridors (4.3 studs) feel cramped and cause camera clipping; a good starting point for main corridors is 8-12 studs wide, then test with the camera.
- Because players move ~4.5 m/s and jump ~2 m, a "realistic" city block is crossed in seconds. Design with **time**: at 16 studs/s, 10 seconds = 160 studs.
- Ruski's PvP tutorial makes **perimeter walls 3-4x player height** so they read as walls, not jumpable ledges.

## Quick conversions for the command bar
```lua
local STUDS_PER_METRE = 1 / 0.28
local function m(metres: number): number return metres * STUDS_PER_METRE end
print(m(2.1)) --> 7.5 (door height)
print(m(3.5) * 2) --> 25 (two-lane road)
```

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Map Blockout to Art Pass Workflow]] · [[FBX Import Settings, Scale and Collision Fidelity]] · [[Modular Kit Grid Audit - Module Sizes and an Off-Grid Finder]] · [[Enemy AI Pathing Loop with PathfindingService]]

<!-- TDOD_GRAPH_END -->
