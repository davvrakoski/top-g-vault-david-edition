---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/map-performance-budgets"
title: "Map Performance Budgets - Draw Calls, Triangles and Mesh Reuse"
tags: [roblox, community, optimization, budgets, draw-calls, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art/optimize-your-experience
  - https://create.roblox.com/docs/performance-optimization/scene-analysis
---
# Map Performance Budgets - Draw Calls, Triangles and Mesh Reuse

"Optimize your map" is useless advice without numbers. This note collects the concrete budgets published by Roblox and by MrChickenRocket (Peter McNeill) in his Roblox-staff guest article on the DevForum, and turns them into a per-zone budget you can build against.

## Published reference budgets
| Source | Triangles | Draw calls | Memory / network |
|---|---|---|---|
| MrChickenRocket, *Real world building and scripting optimization for Roblox* (DevForum, Aug 2024), mid-2024 targets | ~500,000 in scene | ~500 in scene | Client memory under 1.3 GB to support 2 GB phones; network receive under 50 KB/s |
| Roblox *Design for performance* (Creator Docs), an example of limits found on one baseline device | under 1,000,000 | under 1,000 | Pick your own baseline device and measure |

These are starting points, not rules. Roblox's page recommends choosing at least one baseline (low-end) device, testing on it throughout development, and recording where it breaks.

## Split the budget: fixed map vs everything else
MrChickenRocket's example game (Cardboard Box Simulator) splits the budget:
- **Map (fixed):** ~300,000 triangles and ~300 draw calls.
- **Flexible:** ~200,000 triangles and ~200 draw calls for players, pets, coins and effects.
- **Zones:** at most 8 zones visible at once, so ~40,000 triangles and ~40 draw calls per zone.

His measured result: a typical view at ~95-100 draw calls and ~140,000-150,000 triangles; one zone at 44,353 triangles and 23 draw calls.

**Make your own version.** Decide the most zones a player can see at once, divide the map budget by that number, and give every zone builder that number.

## Where draw calls come from
- **Each unique mesh + material combination.** Reusing the same MeshId and material lets the engine batch; vary colour, rotation and scale for variety. In the article, a four-mesh tree reused across the map costs only 2 draw calls.
- **Each unique texture or decal**, particle emitter and beam.
- **SurfaceGuis and BillboardGuis** add draw calls quickly.
- **Semi-transparent parts**, especially with decals or textures, may not batch. Roblox's docs also recommend transparency of only 0 or 1 where possible, and warn about layered transparency overdraw (foliage, glass).
- **Duplicate imports.** The same mesh imported twice has two asset IDs and costs twice. Roblox recommends converting assets to **packages** and reusing them.

## Techniques with measured wins (from the article)
- **Bake parts into meshes per material:** townhouses went from 12 draw calls and 100 instances each to 6 draw calls and 6 mesh instances.
- **A small set of general-purpose meshes** (e.g. a bevelled ~80-triangle cube used for walls) instead of many unique ones.
- **Few lights:** a few small, non-shadow-casting point and spot lights; avoid big lights and extra shadow casters.
- **Few materials and vertex colour** to keep batching efficient.

## Measure
1. Render stats (the article: Ctrl+F2 in game, Ctrl+Shift+F2 in Studio): read **Draw (Scene)**, CPU and GPU times. Whichever of CPU or GPU is higher is your bottleneck.
2. Memory and network (the article: Ctrl+F7) and the Developer Console (F9). See [[Developer Console Memory Categories Explained]].
3. [[Scene Analysis]] (Window > Performance Summary): triangle composition by pass (shadows, opaque, transparent, terrain, grass, particles) and instance counts by category.
4. Count what you built: [[Map Audit Command Bar Script - Parts, Mesh IDs, Collision and Shadows]].
5. Test on the baseline device itself. Studio runs client and server together, so its memory numbers are higher than a real client.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Design for performance]] · [[Optimize your game]] · [[Performance Audit Procedure]] · [[Zone Visibility Culling for Indoor and City Maps]]

<!-- TDOD_GRAPH_END -->
