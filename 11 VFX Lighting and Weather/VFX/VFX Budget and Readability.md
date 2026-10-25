---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "08_VFX_Lighting_Weather/01_VFX_Budget_and_Readability"
title: "VFX Budget and Readability"
tags: [roblox, premium, "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# VFX Budget and Readability

Every VFX should answer:
- What gameplay fact does the effect communicate?
- Can the player read it at gameplay camera distance?
- How many can exist simultaneously?
- What happens on low graphics/mobile?

## Layer order
1. motion/shape
2. timing
3. brightness/value contrast
4. color
5. particles
6. light
7. camera/audio support

More particles are often the wrong fix. First improve timing and silhouette.

## Distance policy
Near: full effect.
Medium: fewer particles, no small debris.
Far: simplified flash/beam/sprite or nothing.

## Global caps
Create per-system caps for decals, debris, blood impacts, explosions, lightning flashes, and temporary lights. Oldest/least important effect can be recycled first.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub]]

**Related notes:** [[Water and Surface Interaction]] · [[Post-Processing - Bloom, Color and DOF]] · [[Blood - Gore System — Architecture + Policy Gate]] · [[VFX]]

<!-- TDOD_GRAPH_END -->
