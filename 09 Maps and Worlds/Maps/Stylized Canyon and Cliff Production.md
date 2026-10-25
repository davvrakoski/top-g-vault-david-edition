---
area: "09 Maps and Worlds"
cluster: "Maps"
source_note: "24_Visual_Reference_Production/03_Stylized_Canyon_Cliff_Production"
title: "Stylized Canyon & Cliff Production"
tags: [roblox, premium, visual-reference, "cluster/maps"]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Stylized Canyon & Cliff Production

A canyon scene needs scale, traversal clarity and depth. The reference succeeds because the foreground path is simple while tall cliffs create enclosure and distant mist creates separation.

## Geometry strategy
- Terrain: floor, broad slopes, banks.
- Modular cliff MeshParts: vertical walls, corner pieces, caps, ledges, isolated spires.
- Small rocks: clustered near transitions so terrain-to-mesh seams look intentional.
- Use a few hero cliffs, not hundreds of unique meshes.

## Composition
Create three depth bands:
- **foreground:** readable path/grass/rocks,
- **midground:** navigable canyon walls,
- **background:** simplified silhouettes softened by atmosphere.

## Gameplay checks
Cliffs must not create invisible snag points. Mark climbable surfaces deliberately. Test jump arcs, camera collision, NPC pathfinding and vehicle widths before art polish.

## Optimization
Use instance streaming. Keep background collision simple or absent when gameplay never reaches it. Use model LevelOfDetail settings where appropriate and avoid heavy shadows on small distant props.

## Common failure
Adding more rocks to make it "detailed" often makes the route noisy. Detail should reinforce path edges, landmarks and scale.

Related: [[Large Maps, Streaming and World Design|Large Maps & Streaming]] · [[Advanced Map Readability and Navigation|Map Readability]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps - Hub|Maps]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->
