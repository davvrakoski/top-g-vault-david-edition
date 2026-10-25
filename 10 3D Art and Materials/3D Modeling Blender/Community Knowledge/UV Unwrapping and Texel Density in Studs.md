---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "UV Unwrapping and Texel Density in Studs"
tags: [roblox, community-knowledge, blender, uv, texel-density, textures]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/modeling/texture-specifications
  - https://create.roblox.com/docs/art/modeling/surface-appearance
  - https://www.vertexschool.com/texel-density-guide
  - https://learn.foundry.com/modo/content/help/pages/uving/texel_density.html
---
# UV Unwrapping and Texel Density in Studs

Texel density is how many texture pixels land on one unit of surface. If a crate has 256 px per stud and the wall behind it has 32, the crate looks razor sharp and the wall looks like mud, even though both textures are "high quality". Keeping density consistent across a scene is what makes Roblox environments look coherent, and it also stops you wasting texture memory on small props.

## Roblox's own numbers

From the Creator Docs texture specifications:

| Reference | Density |
| --- | --- |
| Built-in part materials: 1024 px across an 8-stud face | **128 px/stud** |
| Terrain materials: 512 px across 8 studs | **64 px/stud** |
| Guidance: 256 px for ~5-stud objects, 512 for ~10, 1024 for ~20 | ~51 px/stud |
| PBR budget: 256 px per 2×2×2 unit space | ~128 px per unit |

Pick one target per game and per distance class. A practical scheme:

| Asset class | Target |
| --- | --- |
| Hero props held or seen up close (weapons, doors) | 128 px/stud |
| World props and buildings | 64 px/stud |
| Background / distant | 32 px/stud |

## Doing the math in Blender

Blender works in metres; your export scale decides what a stud is (see the FBX import note). Simplest workflow: model with 1 Blender unit = 1 stud.

`texture_px_needed = largest_surface_span_in_studs × target_px_per_stud`

A 4×4-stud crate face at 64 px/stud needs 256 px across that face. If the whole crate unwraps into one square, a 512 map is plenty (faces share space).

## Unwrapping rules that save time

1. **Mark seams on hard edges and hidden places** (under, behind, inside corners). Seams are where texture breaks; put them where nobody looks.
2. **Unwrap with Angle Based or Conformal**, then use *Average Islands Scale* so all islands share one density. This one button does most of the "consistent density" work.
3. **Pack islands** with 2-4 px margin per 512 px (more for small maps), because mipmaps bleed colour across tight gaps.
4. **Straighten** islands on architectural pieces so tiling details (planks, bricks) run along the U or V axis.
5. **Stay in 0-1 UV space** for SurfaceAppearance meshes. The docs require it. Use tiling (UVs outside 0-1) only with a texture that repeats, and test it.
6. **One UV set only**: Roblox reads a single UV channel, so a second lightmap UV channel is ignored.

Overlapping UVs are allowed: mirror symmetrical halves onto the same pixels to double effective density (avoid it where text or asymmetric damage is painted).

## Checking density

- Apply a checker texture (Blender's *UV Grid* generated image) to everything in the scene; squares should look the same size on every asset at the same distance.
- Free add-ons such as Texel Density Checker can set islands to an exact px/unit value (license varies; check before bundling).

## Pitfalls

- Scaling a mesh in Studio does **not** rescale its texture density; a crate scaled 3x has a third of the density. Make a bigger asset or a bigger texture instead.
- Big maps are capped (1024 px is the documented PBR maximum in the UV section, even though images up to 4096 can be uploaded), so large objects need tiling materials or trim sheets, not one giant unique texture.
- Stretching shows up most on cylinders and organic shapes; add a seam rather than accept smearing.

## Related
[[3D Modeling Blender - Hub]] · [[Texture Memory and Triangle Budgets for Roblox Scenes]] · [[Trim Sheets for Roblox Environments]] · [[FBX Import Settings, Scale and Collision Fidelity]]
