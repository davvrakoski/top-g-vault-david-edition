---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
source_note: "24_Visual_Reference_Production/11_Vegetation_Layering_and_Composition"
title: "Vegetation Layering & Composition"
tags: [roblox, premium, visual-reference, "cluster/terrain-vegetation"]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Vegetation Layering & Composition

Good vegetation is not random density. It uses **layers and ecological logic**.

## Five layers
1. canopy/large trees,
2. medium bushes/saplings,
3. ground plants/grass,
4. accents: flowers, mushrooms, reeds,
5. debris: logs, stones, leaf litter.

## Placement rules
- cluster rather than uniform scatter,
- leave negative space around paths and combat areas,
- favor moisture around water,
- favor sun-loving growth near openings,
- vary scale/rotation without destroying art direction,
- frame landmarks instead of hiding them.

## Collision
Most decorative plants should have no collision. Tree collision should usually use simple trunks/proxies, not complex branch geometry.

## Performance
Watch transparency, shadow count and instance count. Distant vegetation should simplify aggressively. Avoid per-plant heartbeat scripts.

## Readability
Use vegetation to show safe routes, hidden routes, dangerous thickets and biome changes.

Related: [[Vegetation, Grass, and Trees Blueprint|Vegetation Blueprint]] · [[Procedural Vegetation Scatter and Biome Rules|Procedural Scatter]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Terrain Vegetation - Hub|Terrain Vegetation]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->
