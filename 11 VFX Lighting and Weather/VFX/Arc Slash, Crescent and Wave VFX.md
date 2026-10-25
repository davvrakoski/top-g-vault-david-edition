---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "24_Visual_Reference_Production/13_Arc_Slash_and_Wave_VFX"
title: "Arc Slash, Crescent & Wave VFX"
tags: [roblox, premium, visual-reference, "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Arc Slash, Crescent & Wave VFX

The curved slash reference is a classic example of **shape-first VFX**. The main read is one clear crescent, then secondary particles support it.

## Build recipe
1. Create a crescent mesh or Beam path with a transparent gradient texture.
2. Attach it to the attack origin or spawn it at the swing moment.
3. Scale/fade over 0.15–0.45 seconds depending on style.
4. Add a small secondary spark/smoke layer.
5. Use a Trail on the weapon only if it improves motion readability.
6. Add impact VFX separately when a hit is confirmed.

## Gameplay separation
The visual crescent is **not the hitbox**. Damage should be validated by the gameplay system/server using the intended hit-detection method. Cosmetic shape can be client-side.

## Shape language
- narrow bright core = speed/energy,
- softer outer falloff = glow,
- tapered ends = direction,
- expanding radius = power,
- distortion/noise = magic/instability.

## Avoid
Do not use five overlapping crescents just because the effect looks empty. Improve silhouette, timing and contrast first.

Related: [[Melee Combo Blueprint|Melee Combo Blueprint]] · [[VFX Color Language and Readability|VFX Color Language]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub|VFX]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->
