---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
source_note: "24_Visual_Reference_Production/32_Procedural_Vegetation_Scatter_and_Biome_Rules"
title: "Procedural Vegetation Scatter & Biome Rules"
tags: [roblox, premium, visual-reference, "cluster/terrain-vegetation"]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Procedural Vegetation Scatter & Biome Rules

Procedural placement should make authored worlds faster, not make them look random.

## Rule data
For each plant family define:
- allowed terrain/materials,
- slope range,
- height range,
- water distance,
- density,
- scale range,
- rotation rules,
- minimum spacing,
- exclusion zones,
- seed.

## Spatial logic
Use a grid/spatial hash for placement validation instead of checking every plant against every other plant.

## Exclusion zones
Roads, combat arenas, doors, spawn points, camera vistas and quest spaces should be able to remove/reduce vegetation.

## Art-direct after generation
Procedural output is a starting point. Add hero trees/rocks by hand and delete clutter that blocks sightlines.

## Runtime vs editor
Prefer generating static dressing in an editor/build workflow when it does not need to change every session. Runtime procedural systems should exist because the gameplay needs variability, not because placing trees manually is boring.

Related: [[Procedural Systems and Geometry|Procedural Systems]] · [[Spatial Hash for Nearby Queries|Spatial Hash]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Terrain Vegetation - Hub|Terrain Vegetation]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->
