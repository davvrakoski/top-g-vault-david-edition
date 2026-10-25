---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "PBR Decals and Textures - Normal, Roughness, Metalness and Emissive Maps on Decal"
tags: [roblox, community-knowledge, materials, decals, pbr, textures]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Decal
  - https://create.roblox.com/docs/reference/engine/classes/Texture
  - https://create.roblox.com/docs/parts/textures-decals
  - https://create.roblox.com/docs/art/modeling/surface-appearance
---
# PBR Decals and Textures - Normal, Roughness, Metalness and Emissive Maps on Decal

For years a Roblox `Decal` was just a flat picture stuck on a face: a puddle decal looked like a painted puddle, a crack looked printed on. The current API reference lists full **PBR maps on `Decal`** (and therefore on `Texture`, which inherits from Decal): `ColorMap`, `NormalMap`, `RoughnessMap`, `MetalnessMap` and an emissive mask with strength and tint. A decal with any of those extra maps becomes a physically based surface, so a wet patch can be glossy, a crack can have depth, and a sign can glow. This note summarises what the reference says and how to use it for detail work. Basic decal vs texture choice is in [[Texture vs Decal vs SurfaceAppearance - Which Surface Tool to Use]].

## What the API reference says (Oct 2026)

| Property | What it does | Who can set it |
|---|---|---|
| `ColorMap` / `ColorMapContent` | Colour and opacity (albedo). Replaces the deprecated `Texture` / `TextureContent` | Normal scripts and Studio |
| `NormalMap` / `NormalMapContent` | Bumps and grooves via normals | Write: **PluginSecurity** (Studio/plugins), not game scripts |
| `RoughnessMap` / `RoughnessMapContent` | Sharp vs blurry reflections | Write: PluginSecurity |
| `MetalnessMap` / `MetalnessMapContent` | Metal vs non-metal response | Write: PluginSecurity |
| `EmissiveMaskContent`, `EmissiveStrength`, `EmissiveTint` | Glow areas, strength and colour | Mask write: PluginSecurity; `EmissiveStrength` and `EmissiveTint` are script-settable (good for flicker or pulse) |
| `TexturePackContent` | Engine-managed packed texture for PBR decals | Engine only |
| `ZIndex` | Draw order of decals on the same face; higher draws on top | Scripts and Studio |

Notes from the reference:
- Setting any of the normal, roughness, metalness or emissive maps turns the decal into a **PBR surface**; the engine then packs all its maps into one texture-pack asset.
- The `...Map` string properties are hidden; set maps through Studio's Properties panel or a plugin, and plan to author them in **edit time**, not at runtime. (Exactly how Studio exposes them in the UI was not verified for this note.)
- `AutoLocalize` capture is suppressed for PBR decals, so localised sign images should stay non-PBR.

## Detail recipes

- **Wet puddle / spill:** a soft-edged dark ColorMap with alpha, and a RoughnessMap near 0.05-0.2 in the middle fading to the floor's roughness at the edge. It now reflects the sky like real water on concrete.
- **Cracks and dents:** a crack ColorMap plus a NormalMap baked from a small sculpt or generated in a texture tool ([[Free Texture Makers - Material Maker and Materialize]]); roughness slightly higher in the crack.
- **Metal plates and bolts on a concrete wall:** ColorMap + Metalness 1 in the plate area + roughness 0.3-0.5. One decal, no extra geometry.
- **Glowing signs and screens:** an emissive mask on the decal with `EmissiveStrength` and `EmissiveTint`, instead of a Neon part ([[Glowing Surfaces - Neon Material, Emissive Masks and Bloom]]).
- **Tiled grime with depth:** use `Texture` (tiling) with the same PBR maps for large areas such as tiled floors with grout depth.

## Authoring rules

- Same map conventions as SurfaceAppearance: colour in sRGB, normal in OpenGL (Y+) format, roughness and metalness as greyscale ([[Normal Map Rules for Roblox - OpenGL Green, Tangents and Flat Values]]).
- Keep all maps the **same resolution and aligned**; the decal stretches each map over the face.
- Decals stretch to the full face; design the image for the face's aspect ratio or use helper parts sized to the decal.
- Use `ZIndex` spacing of 10 or more between layers so you can insert new decals later (the reference suggests wide gaps).

## Cost

- Each PBR decal carries several textures; they count toward texture memory like any other surface ([[Texture Memory and Triangle Budgets for Roblox Scenes]]).
- Reuse the same few PBR decal sets across a map; unique 1024 sets for every stain add up fast.
- Many overlapping transparent decals still cost overdraw and can flicker in sorting.

## Pitfalls

- Trying to set NormalMap from a server or local script at runtime: write access is PluginSecurity.
- Using deprecated `Decal.Texture` in new code: use `ColorMapContent` / `ColorMap`.
- DirectX-format normal maps: lighting looks inverted on bumps.

## Related
[[Materials Textures - Hub]] - [[Texture vs Decal vs SurfaceAppearance - Which Surface Tool to Use]] - [[Model - Weathering and Grime - Edge Wear, Dirt Masks and Decal Layers]] - [[Glowing Surfaces - Neon Material, Emissive Masks and Bloom]]
