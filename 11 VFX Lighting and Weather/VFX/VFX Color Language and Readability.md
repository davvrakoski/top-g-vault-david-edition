---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "24_Visual_Reference_Production/17_VFX_Color_Language_and_Readability"
title: "VFX Color Language & Readability"
tags: [roblox, premium, visual-reference, "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# VFX Color Language & Readability

Color should communicate **type and gameplay meaning**, not merely make the screen colorful.

## Build a color dictionary
Example:
- fire = orange/red,
- ice = cyan/blue,
- poison = green,
- healing = green/teal or your chosen safe color,
- holy = warm white/gold,
- danger/unblockable = a consistent warning accent.

Your game can choose different colors; consistency matters more than convention.

## Value first
Check the effect in grayscale. If the core action disappears, color alone is carrying too much information.

## Contrast hierarchy
1. attack telegraph,
2. hit/impact,
3. lingering decoration.
Do not let lingering particles be brighter than the attack players need to react to.

## Team/accessibility
Never encode critical state with color only. Add shape, icon, timing or sound cues for color-vision accessibility.

## Style matching
Realistic games need restrained bloom/particle saturation. Anime/fantasy games can push color harder, but still need controlled values and screen occupancy.

Related: [[Post-Processing - Bloom, Color and DOF|Post Processing]] · [[Settings and Accessibility Blueprint|Accessibility Settings]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub|VFX]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->
