---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "MaterialVariant and MaterialService - Custom Materials for Parts and Terrain"
tags: [roblox, community-knowledge, materials, materialvariant, terrain, pbr]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/parts/materials
  - https://create.roblox.com/docs/parts/custom-terrain-materials
  - https://create.roblox.com/docs/reference/engine/classes/MaterialVariant
  - https://create.roblox.com/docs/reference/engine/classes/MaterialService
  - https://create.roblox.com/docs/reference/engine/enums/MaterialPattern
---
# MaterialVariant and MaterialService - Custom Materials for Parts and Terrain

A `MaterialVariant` is a custom **tiling** PBR material that lives in `MaterialService` and can be applied to any Part, MeshPart or terrain like a built-in material. It is the right tool for big surfaces (floors, walls, roads, cliffs, ground) because it tiles by studs and needs no UV work on Parts. `SurfaceAppearance`, by contrast, is a UV-mapped texture set for one specific mesh. Most good-looking Roblox maps use both: MaterialVariants on the large stuff, SurfaceAppearance on hero props.

## Properties that matter

| Property | What it does |
| --- | --- |
| `BaseMaterial` | The built-in material it inherits physics and sounds from (e.g. Concrete). Parts using the variant get `Material` set to this. |
| `ColorMap`, `NormalMap`, `RoughnessMap`, `MetalnessMap` (and `*Content` versions) | The PBR maps; square textures work best. |
| `StudsPerTile` | Texture scale. Larger = bigger, repeats less. |
| `MaterialPattern` | `Regular` for ordered, man-made (bricks, planks); `Organic` reduces visible repetition for stone, dirt, grass. |
| `CustomPhysicalProperties` | Override density/friction/elasticity, e.g. a slippery ice variant. |
| `AlphaMode`, emissive properties | Present in the API; check current docs for support status before relying on them. |

## Setting StudsPerTile from your texture

Match the real-world size the texture shows. If a brick texture photo covers about 2 m × 2 m, and you use the common 1 stud ≈ 0.28 m conversion, that is about 7 studs: `StudsPerTile = 7`. Check against a character (about 5 studs tall) standing next to the wall; bricks should look the right size at a glance.

## Applying

- **Per part**: Material widget, Material Manager, or set `BasePart.MaterialVariant` to the variant's **name** (a string). Studio sets `Material` to the variant's base.
- **Override**: in Material Manager, *Set as Override* makes the variant replace a base material place-wide, including terrain. Scripted: `MaterialService:SetBaseMaterialOverride(Enum.Material.Grass, "MyGrass")`.
- **Terrain faces**: with an override set, `TerrainDetail` children customize **top**, **side** and **bottom** faces (grass on top, dirt on the sides).
- **Many terrain variants in one place**: use the custom terrain materials feature (requires Expanded Terrain), described on its own docs page.

## Name-based lookup (and its trap)

Parts store the variant by **name**. Rename a variant after applying it and those parts silently fall back to the base material. The docs call this intentional: it enables "adaptive materials", where any model using "Brick" picks up your game's Brick variant. Use it on purpose: name your variants after the style ("Brick", "Wood") and imported free models will adopt your look.

## Building a variant library

1. Collect CC0 sets (ambientCG, Poly Haven) at 1K; 1024 px is plenty for tiling materials.
2. Convert normals to OpenGL if needed; ensure roughness/metalness are greyscale.
3. Create variants in Material Manager; name by surface (`Concrete_Clean`, `Concrete_Dirty`).
4. Save the set as a package or a `.rbxm` to reuse across places.

## Pitfalls

- Too-small `StudsPerTile` makes obvious repetition; break it with decals, vertex-coloured meshes or `Organic` pattern.
- Every unique variant is four more textures for players to download; keep a palette of 10-20 variants per game, not 80.
- `MaterialService.Use2022Materials` switches the built-in material set; decide once early, because it changes how every built-in material looks.

## Related
[[Materials Textures - Hub]] · [[SurfaceAppearance PBR from Poly Haven Textures]] · [[ambientCG to Roblox - CC0 Tiling Materials as MaterialVariants]] · [[Realistic Rock and Cliff Surfaces — PBR Without Waste]]
