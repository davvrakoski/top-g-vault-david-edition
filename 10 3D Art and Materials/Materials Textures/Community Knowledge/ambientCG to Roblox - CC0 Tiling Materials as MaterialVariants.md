---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "ambientCG to Roblox - CC0 Tiling Materials as MaterialVariants"
tags: [roblox, community-knowledge, materials, ambientcg, cc0, materialvariant, free-assets]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.ambientcg.com/license/
  - https://docs.ambientcg.com/
  - https://ambientcg.com/view?id=Bricks076C
  - https://create.roblox.com/docs/parts/materials
  - https://create.roblox.com/docs/art/modeling/texture-specifications
---
# ambientCG to Roblox - CC0 Tiling Materials as MaterialVariants

ambientCG is one of the best free sources of tiling PBR materials for Roblox: bricks, concrete, wood, ground, metal and more, released under **CC0 1.0** (public domain dedication, no attribution required, commercial use fine). That makes it **bundle-safe** under this vault's rules. Its sets map almost one-to-one onto a `MaterialVariant`, so a whole material library can be built in an afternoon.

## License in one line

The ambientCG license page says all assets are provided under CC0 1.0 Universal. Credit is appreciated but optional; a suggested credit line is given on that page. Keep a credits file anyway so you know where each texture came from.

## What a download looks like

Each material page offers ZIPs at 1K, 2K, 4K and 8K, as JPG or PNG. Example: *Bricks076C* lists 1K JPG at about 9 MB and 8K PNG at about 914 MB, and states a physical size of roughly 2 m × 2 m. The physical size is the key number for Roblox scale.

**Download 1K or 2K, not 8K.** Roblox's material references top out at 1024 px per tile (built-in part materials show 1024 px across 8 studs), and large textures are downsampled on many devices anyway.

## Map mapping

Map names below are the ones commonly found in ambientCG zips; the asset page itself does not list file names, so check what your zip contains.

| ambientCG map | MaterialVariant slot | Notes |
| --- | --- | --- |
| Color | `ColorMap` | sRGB colour |
| Normal (GL version) | `NormalMap` | Roblox wants OpenGL; avoid the DX file |
| Roughness | `RoughnessMap` | Greyscale |
| Metalness (metal sets only) | `MetalnessMap` | Omit for non-metals; empty = non-metal |
| AmbientOcclusion | none | Optionally multiply 30-50% into Color first |
| Displacement | none | Roblox has no height/parallax slot; skip |
| Opacity (some sets) | alpha of `ColorMap` | Only for cut-out materials (fences, leaves) |

## Setting the scale

`StudsPerTile` = physical size in studs. With 1 stud = 0.28 m, a 2 m × 2 m set is about **7 studs** per tile. Put a default character (about 5 studs tall) next to a wall and compare the bricks to the body; adjust until they read right.

## Step by step

1. Download the 1K or 2K JPG zip. Extract to a folder named after the asset ID.
2. Resize if needed (1024 is a good cap) and convert to PNG if you want lossless roughness.
3. Studio > Material Manager > pick the right **base material** (Brick for bricks, so footsteps and physics match) > Create Material Variant.
4. Import Color, NormalGL, Roughness (and Metalness).
5. Set `StudsPerTile` from the physical size; set `MaterialPattern` to `Regular` for bricks/planks/tiles and `Organic` for ground, rock, gravel.
6. Name it by surface ("Brick", "Brick_Old") and, if you want it everywhere, *Set as Override*.
7. Note `ambientCG / Bricks076C / CC0` in your credits file.

## Making them look less tiled

- `Organic` pattern for natural surfaces.
- Larger `StudsPerTile` on far surfaces, smaller on close ones (use two variants).
- Break repetition with decals (dirt, cracks) and props at seams.

## Related CC0 sources

Poly Haven (CC0) has a separate deep-dive note in this vault; more CC0 sites are listed in the community resources folder. Always confirm the license on the asset page itself; individual sites can change terms.

## Related
[[Materials Textures - Hub]] · [[MaterialVariant and MaterialService - Custom Materials for Parts and Terrain]] · [[SurfaceAppearance PBR from Poly Haven Textures]] · [[More CC0 Texture Sites - 3DTextures.me and TextureCan]]
