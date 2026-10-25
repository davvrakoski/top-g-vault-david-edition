---
area: "05 Performance and Optimization"
cluster: "Optimization"
source_note: "24_Visual_Reference_Production/25_Visual_Scalability_and_Quality_Tiers"
title: "Visual Scalability & Quality Tiers"
tags: [roblox, premium, visual-reference, "cluster/optimization"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Visual Scalability & Quality Tiers

A premium Roblox visual system needs a **degradation plan**. "High graphics" cannot mean "all effects always on."

## Tier design
### Tier A — essential gameplay
Never remove telegraphs, objective markers, collision-relevant geometry or feedback needed to react.

### Tier B — primary presentation
Main weapon trail, main explosion shape, landmark meshes, character silhouette, core lighting.

### Tier C — secondary polish
extra sparks, debris, mist, dynamic lights, small decals, far foliage, secondary shadows.

Low quality removes Tier C first, then simplifies B without harming A.

## Scene budgets
Create budgets for:
- active particles,
- transparent screen coverage,
- shadow-casting lights,
- hero mesh complexity,
- unique textures/materials,
- NPC/character count,
- physics debris.

## Distance LOD
Near = full.
Mid = simplified.
Far = silhouette/cheap representation.
Streamed-out = no local work.

## Test methodology
Use the same camera route on low-end/mobile and high-end desktop. Compare frame time, memory, load time and visual readability—not just FPS.

Related: [[Performance Budget Template|Performance Budget]] · [[Mobile Performance Deep Dive|Mobile Performance]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Optimization - Hub|Optimization]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->
