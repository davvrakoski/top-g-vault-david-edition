---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Texture vs Decal vs SurfaceAppearance - Which Surface Tool to Use"
tags: [roblox, community-knowledge, materials, decal, texture, surfaceappearance, streaming]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/parts/textures-decals
  - https://create.roblox.com/docs/reference/engine/classes/Decal
  - https://create.roblox.com/docs/reference/engine/classes/Texture
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/parts/materials
---
# Texture vs Decal vs SurfaceAppearance - Which Surface Tool to Use

Roblox has five ways to put an image on a 3D surface, and new builders use the wrong one constantly: a logo as a tiling `Texture`, a brick wall as a stretched `Decal`, a whole prop's look built from twenty decals. Each tool has a clear job. The API also changed recently: `Decal` now has its own PBR maps (normal, roughness, metalness, emissive) plus `UVOffset`, `UVScale` and `Rotation`, which makes decals much more useful for grime and signage.

## The five tools

| Tool | Maps to | Tiles? | PBR? | Best for |
| --- | --- | --- | --- | --- |
| `Decal` | One face of a part, stretched to fit | No (but has `UVScale`/`UVOffset`) | Yes, when normal/roughness/metalness/emissive maps are set | Signs, posters, dirt patches, cracks, logos |
| `Texture` | One face, repeating | Yes: `StudsPerTileU/V`, `OffsetStudsU/V` | No | Repeating patterns on Parts (tiles, wallpaper), animated scrolling (conveyors, water) |
| `MaterialVariant` | Whole part or terrain, by material | Yes: `StudsPerTile` | Yes | Big surfaces: floors, walls, ground |
| `SurfaceAppearance` | A MeshPart's UVs | Per UVs | Yes | Unique props, characters, vehicles, trim sheets |
| `MeshPart.TextureID` | A MeshPart's UVs | Per UVs | No (colour only) | Stylized meshes, palette atlases |

## Decision rules

1. **Is it a MeshPart with UVs?** Use `SurfaceAppearance` (PBR) or `TextureID` (colour only). Do not decal a mesh.
2. **Is it a big surface?** Use a `MaterialVariant`; it tiles by studs and keeps physics/sounds via its base material.
3. **Is it a pattern on one Part face?** `Texture`, and set `StudsPerTile` to match the world size.
4. **Is it a one-off image?** `Decal`. Add a normal and roughness map for embossed metal signs or wet stains.

## Decal tricks worth knowing

- **Layering**: several decals on one face draw in `ZIndex` order; put dirt above the base sign.
- **Tinting**: `Decal.Color3` multiplies the image; one white arrow decal serves every colour.
- **Fading**: tween `Decal.Transparency` for blood that dries away or footprints that vanish.
- **Rotation / UVScale / UVOffset**: rotate or crop a decal without re-uploading; scale it down to make a tiling-like effect, or use a sprite sheet and step `UVOffset` for simple animation.
- Decals are **face-locked**: they stretch to the whole face. For a small sticker on a big wall, put it on a thin invisible part sized to the sticker.

## Texture tricks worth knowing

- Tweening `OffsetStudsU` scrolls the texture: conveyor belts, flowing water strips, scrolling lava (the official docs include a tween example).
- Mismatched `StudsPerTileU` and `StudsPerTileV` make stretched bricks; keep them equal unless the source image is not square.

## Streaming and memory

Texture streaming is on automatically and covers MeshParts, SurfaceAppearance, Texture, Decal and MaterialVariant: low-quality versions arrive first, then quality rises within the device's memory budget. Official best practices:

- Prefer **unique textures** over shared atlases (except on batchable parts), since an atlas streams at the highest resolution any user of it needs.
- Keep **texel density near-uniform** so the engine picks good resolutions.

## Pitfalls

- Uploading the same image several times creates several assets (and several downloads). Reuse one asset ID.
- A Decal's image and a Clothing template are different asset types; IDs are not interchangeable.
- Many overlapping transparent decals cost overdraw on mobile.

## Related
[[Materials Textures - Hub]] · [[MaterialVariant and MaterialService - Custom Materials for Parts and Terrain]] · [[SurfaceAppearance AlphaMode and TintMask - Recolorable Assets]] · [[Texture Memory and Triangle Budgets for Roblox Scenes]]
