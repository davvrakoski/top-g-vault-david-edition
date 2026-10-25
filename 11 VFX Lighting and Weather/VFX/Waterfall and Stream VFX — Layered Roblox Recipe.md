---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "24_Visual_Reference_Production/12_Waterfall_and_Stream_VFX"
title: "Waterfall & Stream VFX — Layered Roblox Recipe"
tags: [roblox, premium, visual-reference, "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Waterfall & Stream VFX — Layered Roblox Recipe

A convincing waterfall should be built from **layers**, not one giant particle emitter.

## Suggested layer stack
- body: mesh/beam/transparent surface carrying the main falling shape,
- streaks: sparse fast particles or beams,
- mist: soft particles near impact,
- splash: short bursts at the base,
- foam: shoreline/impact particles or simple animated presentation,
- sound: loop + splash detail,
- lighting: usually environment-driven; avoid glowing water unless stylized.

## Runtime design
The waterfall itself can be static. Only the mist/splash layers need continuous particle work. Use distance-based enablement for decorative layers.

## Stream
For a small stylized stream, combine Terrain water or a mesh surface with rocks/reeds and localized sparkle/foam. The geometry and color do more work than particle count.

## Common mistakes
- full-map mist,
- too many transparent layers,
- pure white water with no value variation,
- particle speed unrelated to gravity/flow,
- loud loop audible from the entire map.

Related: [[VFX|VFX Foundations]] · [[VFX Performance, LOD and Pooling|VFX Performance]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub|VFX]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->
