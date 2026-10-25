---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges"
tags: [roblox, community-knowledge, materials, pbr, albedo, roughness, metalness]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.adobe.com/learn/substance-3d-designer/web/the-pbr-guide-part-2
  - https://physicallybased.info
  - https://80.lv/articles/physically-based-a-database-of-pbr-values-for-real-world-materials/
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/art/modeling/surface-appearance
---
# PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges

PBR only looks right when the numbers in your maps are plausible. Under Roblox's Future lighting, an albedo painted pure black looks like a hole, pure white glows like neon, and a metalness map full of greys looks like plastic covered in dust. These ranges come from Adobe's widely used *PBR Guide* and the open Physically Based database; they apply directly to `SurfaceAppearance` and `MaterialVariant` maps, which use the metal/roughness workflow.

## Albedo (ColorMap) for non-metals

| Rule | Value (sRGB 0-255) |
| --- | --- |
| Darkest allowed | **30** (tolerant) to **50** (strict) |
| Brightest allowed | **240** |
| Coal/charcoal | near the dark limit, never 0 |
| Fresh snow | near the bright limit, never 255 |

- The albedo carries **colour only**: no baked shadows, no highlights. Roblox's docs make the same distinction between albedo and older "diffuse" maps with lighting baked in.
- Exception: a small amount of baked AO (30-60%) multiplied into albedo is a common Roblox compromise because there is no AO slot.

## Metals

| Map | Value |
| --- | --- |
| Metalness for raw metal | **255** (white), authored 235-255 |
| Metalness for non-metal | **0** (black) |
| Metal albedo (its reflectance colour) | bright: **180-255** sRGB |
| Grey metalness (1-234) | only for transitions: dirt, rust, paint chipping over metal |

Metal albedo should be bright and tinted (gold is yellow, copper is orange). A dark grey "iron" albedo with metalness 1 looks black and wrong.

The Roblox reference also notes that when `Lighting.EnvironmentSpecularScale` is 0, metalness has **no effect**. For realistic metals it recommends `EnvironmentSpecularScale` and `EnvironmentDiffuseScale` at 1 (and `Ambient`/`OutdoorAmbient` at black).

## Roughness

Roughness is the most "artistic" map: black = mirror smooth, white = fully rough. Useful anchors:

| Surface | Typical roughness (0-1) |
| --- | --- |
| Polished chrome, still water | 0.0-0.1 |
| Glossy plastic, varnished wood | 0.2-0.4 |
| Painted metal, leather | 0.4-0.6 |
| Raw wood, concrete | 0.7-0.9 |
| Chalk, dry dirt, rubber | 0.9-1.0 |

These are common starting points (not from a single official table); tune by eye under moving light. The PBR Guide recommends using the normal map as a starting point and adding variation (scratches, fingerprints, worn edges) because flat roughness reads as fake.

## Reflectance (F0)

You do not paint specular in metal/roughness: non-metals use a fixed 4% (0.04 linear) reflectance. Exotic values (gems, liquids) cannot be represented exactly; fake them with low roughness.

## Quick validation in an image editor

1. Desaturate the albedo and check the histogram: nothing below ~30 or above ~240 except metals.
2. Metalness histogram: two spikes at 0 and 255, little in between.
3. Roughness: a spread, not a single flat grey.

The Physically Based database (CC0, open API) lists measured colours and properties for real materials; use it to sanity-check colours like skin, brick or gold.

## Common mistakes

- Photo textures used directly as albedo (with shadows and highlights): delight first or use a scanned set.
- Metalness used to "make it shiny": shininess is roughness; metalness is only for metal.
- Over-saturated albedo under Future lighting with bloom; real materials are less saturated than you think.

## Related
[[Materials Textures - Hub]] · [[Materials, PBR and Textures]] · [[Material Response Framework]] · [[Normal Map Rules for Roblox - OpenGL Green, Tangents and Flat Values]]
