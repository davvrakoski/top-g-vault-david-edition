---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Hand-Painted Texture Style on Roblox - Baked Light, Edge Highlights and Flat PBR"
tags: [roblox, community-knowledge, materials, textures, stylized, hand-painted]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/modeling/surface-appearance
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://create.roblox.com/docs/art/modeling/texture-specifications
---
# Hand-Painted Texture Style on Roblox - Baked Light, Edge Highlights and Flat PBR

The hand-painted look (think classic fantasy MMOs and many popular Roblox adventure games) puts the lighting **into the colour texture**: painted highlights on top edges, darker crevices, soft colour gradients. It looks rich on cheap low-poly meshes and holds up on phones because it does not depend on the device's lighting quality. The catch: Roblox's lighting is physically based, so you must stop the engine from fighting the painted light. This note covers how to paint for that and how to set the material so it stays readable.

## What to paint into the colour map

1. **Base colour blocks** with gentle hue shifts (warmer in lit areas, cooler in shadow) instead of flat fills.
2. **Top-down light:** lighten the upper faces and upper edges, darken toward the bottom. A baked AO or a "top gradient" from a world-space normal bake gives a quick starting mask ([[Model - Texture Painting in Blender - Setup, Layers by Baking and Export to SurfaceAppearance]]).
3. **Edge highlights:** a thin bright line on convex edges (planks, stone blocks, metal rims). This is the single most recognisable hand-painted feature.
4. **Crevice darks:** dark, slightly saturated (not black) in gaps and under overhangs.
5. **Texture detail as brush marks:** wood grain, stone chips, cloth folds painted with a few strokes rather than photo detail.

## Keep painted light and engine light from clashing

- Paint highlights at moderate strength. Roblox will still add its own sun and shadows on top, so very bright painted highlights look like plastic glare on the shadow side.
- Light from roughly above and slightly front; avoid a strong side direction that contradicts your sun.
- `Lighting.LightingStyle = Soft` is described in the API as the stylised look and generally suits painted assets better than Realistic; test both with your sky ([[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]]).

## Material settings: "flat PBR"

Hand-painted assets still go through PBR shading in Roblox, so set neutral values:

| Map | Setting for hand-painted |
|---|---|
| Color | Your painted texture (lighting baked in) |
| Metalness | 0 everywhere (even metal is painted; metalness would darken it) |
| Roughness | High and flat, about 0.8-1.0, to kill shiny reflections |
| Normal | None or very soft; strong normals add real shading that doubles the painted shading |

You can apply this as a `SurfaceAppearance` with only a ColorMap (Roblox then uses default roughness and metalness behaviour; test the result), or set explicit flat roughness/metalness maps (a tiny 4 x 4 image is enough) for full control.

For simple tiling surfaces such as painted grass or cobblestone, a `MaterialVariant` with a painted colour map and flat roughness keeps the same style on Parts and terrain ([[MaterialVariant and MaterialService - Custom Materials for Parts and Terrain]]).

## Texture size and density

- Hand-painted textures tolerate low resolution: 256-512 for most props. The brush marks hide the pixel softness.
- Keep **texel density consistent** across a scene so one prop does not look sharper than its neighbour ([[UV Unwrapping and Texel Density in Studs]]).
- Trim sheets work very well for painted buildings ([[Trim Sheets for Roblox Environments]]).

## Checklist

- [ ] Light direction in all textures roughly matches (top-front)
- [ ] Edge highlights on convex edges, darks in crevices
- [ ] Metalness 0, roughness high and flat
- [ ] Normal maps off or subtle
- [ ] Checked under day and night lighting in Studio

## Pitfalls

- Using photo textures next to painted ones: style break.
- Painted shadows on the "wrong" side relative to the sun; pick a top-down light so any sun angle looks plausible.
- Glossy default roughness making painted wood look wet.

## Related
[[Materials Textures - Hub]] - [[Stylized vs Realistic Art Direction on Roblox]] - [[Trim Sheets for Roblox Environments]] - [[PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges]]
