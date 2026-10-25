---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Texture Export from Blender and Substance for SurfaceAppearance"
tags: [roblox, community-knowledge, materials, export, blender, substance, surfaceappearance]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/modeling/assign-textures
  - https://create.roblox.com/docs/art/modeling/export-requirements
  - https://create.roblox.com/docs/art/modeling/texture-specifications
  - https://create.roblox.com/docs/art/modeling/surface-appearance
  - https://create.roblox.com/docs/studio/importer
  - https://www.adobe.com/learn/substance-3d-designer/web/the-pbr-guide-part-2
---
# Texture Export from Blender and Substance for SurfaceAppearance

You can apply PBR maps to a MeshPart by hand in Studio, but the cleaner path is to connect them in your modeling tool so the Studio Importer builds the `SurfaceAppearance` for you. Either way, the maps must match what Roblox reads: **separate** greyscale roughness and metalness images (no channel-packed ORM texture), an OpenGL normal map, and an albedo with no baked lighting. This note is a practical export checklist for Blender and Substance-style painters.

## What Roblox wants (from the texture specifications)

| Map | Format |
| --- | --- |
| Albedo (Color) | RGB 24-bit; alpha only if you use an alpha mode |
| Normal | RGB 24-bit, **OpenGL, tangent space** |
| Roughness | Single-channel greyscale 8-bit |
| Metalness | Single-channel greyscale 8-bit |
| Emissive mask | Single-channel greyscale 8-bit |

Upload formats: PNG, JPG, TGA or BMP. Sizes: up to 1024 px is the documented SurfaceAppearance budget for a full humanoid; most props need 256-512.

## Blender: connect maps so the Importer picks them up

Per the official Blender/Maya texture settings page, the material should be a **Principled BSDF** with image textures plugged in:

1. Image Texture (Color, sRGB) -> **Base Color**.
2. Image Texture (Non-Color) -> **Normal Map** node -> **Normal** input.
3. Image Texture (Non-Color) -> **Roughness**.
4. Image Texture (Non-Color) -> **Metallic**.
5. Export FBX with Path Mode **Copy** and the embed-textures toggle on, or glTF (which carries textures and PBR channels natively).
6. In the Importer, check that the preview shows a SurfaceAppearance with each map.

Keep one material per mesh (Roblox meshes take one material); split or bake if you have more.

## Substance-style painters: export preset

Create a custom export preset rather than relying on an engine preset:

| Output file | Channel setup |
| --- | --- |
| `Asset_Color.png` | Base Color RGB (+ alpha mask if using TintMask/Transparency) |
| `Asset_Normal.png` | Normal, **OpenGL** |
| `Asset_Roughness.png` | Roughness as greyscale |
| `Asset_Metalness.png` | Metallic as greyscale |
| `Asset_Emissive.png` (optional) | Emissive as greyscale mask |

Unreal-style presets pack occlusion, roughness and metallic into one RGB image and use DirectX normals: both wrong for Roblox. Unity presets often store smoothness (inverted roughness) in an alpha channel: also wrong.

## Baking AO in

There is no AO slot. Multiply AO into the base colour at partial strength in the painter (a fill layer set to Multiply at 30-60%) before export.

## Size and padding

- Paint at 2K/4K, export at the final size (512 or 1024). Downscaling gives cleaner results than painting small.
- Dilation/padding 8-16 px so mips do not bleed the background into islands.
- Name files with clear suffixes; consistent names make batch imports and audits easy.

## Final check in Studio

- [ ] All four maps present on the SurfaceAppearance
- [ ] Normal looks right under a moving sun (no inverted bumps)
- [ ] Metal areas look metallic only where intended
- [ ] Albedo has no shadows baked in beyond the planned AO
- [ ] Texture sizes match the asset's on-screen size

## Related
[[Materials Textures - Hub]] · [[PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges]] · [[Normal Map Rules for Roblox - OpenGL Green, Tangents and Flat Values]] · [[SurfaceAppearance PBR from Poly Haven Textures]]
