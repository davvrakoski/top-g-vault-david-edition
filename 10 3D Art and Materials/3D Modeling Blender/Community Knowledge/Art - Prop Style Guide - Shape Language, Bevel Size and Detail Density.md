---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Prop Style Guide - Shape Language, Bevel Size and Detail Density"
tags: [roblox, community-knowledge, 3d-art, art-direction, props, style-guide]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://create.roblox.com/docs/tutorials/curriculums/core/building/greybox-a-playable-area
  - https://create.roblox.com/docs/art/modeling/export-requirements
---
# Prop Style Guide - Shape Language, Bevel Size and Detail Density

When three people (or one person plus an AI generator) make props, the map quickly looks like an asset flip: one barrel is chunky and cartoon, the next is sharp and photoreal. A one-page prop style guide fixes this by writing down the few numbers that define your look. It is not a mood board; it is a set of rules an artist can check a model against in two minutes. Overall art direction is in [[Stylized vs Realistic Art Direction on Roblox]]; this note is the prop-level rulebook.

## 1. Shape language (one line each)

- **Primary shapes:** for example "chunky, slightly tapered, nothing perfectly straight" or "clean industrial boxes".
- **Proportion push:** how much you exaggerate. Stylized Roblox games often enlarge handles, lids and bolts 20-50% so they read at camera distance.
- **Silhouette test:** fill the prop black in a render; it should be recognisable from the gameplay camera angle.

## 2. Edge treatment (the most visible rule)

- Pick one **bevel width per size class**, for example: small props 2 cm, furniture 4 cm, buildings 8-10 cm (Blender metres at your export scale).
- Pick one **segment count** (1 for low-poly faceted, 2-3 for soft stylized).
- Decide how edges are shaded: weighted normals, baked normal map, or flat faceted (see [[Art - Blender Modifiers for Game Assets - Bevel, Weighted Normal, Mirror, Array, Decimate]]).

Mixed bevel sizes are the number-one tell that props came from different sources.

## 3. Detail density

- **Minimum feature size:** nothing smaller than about 0.1 studs is modeled; smaller detail goes into texture or is dropped. Judge at the actual camera distance.
- **Detail budget by size:** a crate has 2-4 features (planks, corner braces, a stencil), not 20.
- **Where detail goes:** focal props near paths get more; filler props far from paths get less.

## 4. Triangle and texture tiers (house numbers)

| Tier | Example | Tris | Texture |
|---|---|---|---|
| Filler | bottle, brick | 50-300 | shared atlas |
| Standard | crate, chair, bin | 300-1,500 | shared atlas or 512 |
| Focal | vending machine, car wreck | 1,500-5,000 | 1024 |
| Hero | boss door, centrepiece statue | 5,000-15,000 | 1024-2048 |

All stay under Roblox's 20,000 triangles per mesh. Shared atlases and trims keep memory down ([[Texture Memory and Triangle Budgets for Roblox Scenes]]).

## 5. Surface rules

- **Palette:** props use the project palette; accents only from the accent swatch (see [[Art - Colour Palettes for a Consistent Look - Value, Saturation and Accent Rules]]).
- **Texel density:** one target in pixels per stud for the whole game ([[UV Unwrapping and Texel Density in Studs]]).
- **Wear:** say where it goes (edges and bottoms only, never random mid-face scratches) and how strong (subtle vs heavy grime).
- **Roughness range:** for example "nothing below 0.3 except glass and wet surfaces" so props do not look plastic.

## 6. The two-minute review

1. Silhouette readable from the game camera?
2. Bevel width and segments match the size class?
3. Tris and texture size inside the tier?
4. Colours from the palette, wear in the agreed places?
5. Scale checked next to a 5-stud character?
6. Pivot and name follow the conventions ([[Art - Naming Conventions for Meshes, Materials and Textures]])?

## Applying it to AI-generated props

AI models (Tripo, Studio's generators) ignore your rules by default. Run them through the same review: retopo or decimate to tier, re-bevel or re-shade edges, and re-colour to the palette before they go in the map.

## Related
[[3D Modeling Blender - Hub]] - [[Stylized vs Realistic Art Direction on Roblox]] - [[Visual Style Guide Template]] - [[Blender Game-Ready Audit]]
