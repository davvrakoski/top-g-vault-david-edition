---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
source_note: "04_3D_Art_Materials_Lighting/12_MATERIALS_PBR_and_TEXTURES"
title: "MATERIALS, PBR & TEXTURES"
tags: [roblox, tdod-vault, reference, "cluster/materials-textures"]
status: verified-baseline
cssclasses: [tg-a10]
---

# MATERIALS, PBR & TEXTURES

=================================================

PBR = Physically Based Rendering.

COMMON MAPS:
Color/Albedo = base color.
Normal = small surface direction detail.
Roughness = how rough/shiny.
Metalness = metallic behavior.
AO = ambient occlusion detail, depending on workflow.

ROBLOX:
SurfaceAppearance can apply PBR maps to MeshParts.
MaterialVariants can provide reusable material appearances.

RULE:
Do not use 4K textures just because "4K = better."
If an object occupies 100 pixels on screen, giant textures are waste.

TEXEL DENSITY:
Keep similar objects at reasonably consistent texture detail.

MATERIAL READABILITY:
At gameplay distance, players mostly read:
- silhouette
- color grouping
- roughness contrast
- large surface detail
- edge wear only if visible
- decals/details at meaningful scale

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Materials Textures - Hub]]

**Related notes:** [[Texture and PBR Specs — 2026 Snapshot]] · [[Low, Mid, and High Poly Strategy]] · [[Material Response Framework]]

<!-- TDOD_GRAPH_END -->
