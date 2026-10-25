---
title: "Texture specifications"
description: "Texture Specifications lists the specific technical requirements and best practices for custom textures created outside of Studio."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/texture-specifications"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Texture Specifications lists the specific technical requirements and best practices for custom textures created outside of Studio.*

A **texture** is a digital image applied to the surface of a 3D object to simulate and enhance its visual appearance. Roblox supports various texture types that you import with a custom 3D object, or upload directly as individual image files. For details on implementing basic textures, see [[30 Official Roblox Docs/Parts/Textures and decals|textures and decals]].

Roblox also supports [[30 Official Roblox Docs/Art/Modeling/PBR textures|physically-based rendering (PBR) textures]] which override a mesh's existing [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]] and can be used to create immersive environments and objects.

> [!info]
> For information on how to properly connect textures to your model in Blender and Maya for import into Studio, see [[30 Official Roblox Docs/Art/Modeling/Blender and Maya texture settings|Blender / Maya texture settings]].

See the following requirements when creating your own basic and advanced textures:

- **File formats** — File formats for textures that are uploaded separately in Studio must be submitted as a `.png`, `.jpg`, `.tga`, or `.bmp`.

- **Resolution** — Roblox supports up to 4096×4096 pixel texture resolutions (4K). As a game loads, the engine automatically starts with lower quality versions of the texture and ramps up quality based on device resources. Even still, manually sizing textures before you upload them can improve memory usage in some situations. Consider the following general guidance:

  - For smaller 5×5 stud objects, use 256×256 texture resolutions.
  - For medium 10×10 stud objects, use 512×512 texture resolutions.
  - For larger 20×20 stud objects, use 1024×1024 texture resolutions.
  - See [[30 Official Roblox Docs/Art/Modeling/Texture specifications#Surface appearance|PBR texture budgets]] for similar guidances with PBR texture maps.

- **Single material** — Mesh objects can only have one material assigned.

> [!info]
> Roblox default [[30 Official Roblox Docs/Parts/Materials|materials]] follow a similar texel resolution pattern:
> - Parts display a 1024×1024 on an 8×8 stud face.
> - Terrain displays 512×512 across 8×8 studs.

## Surface appearance

You can add a [[30 Official Roblox Docs/Art/Modeling/PBR textures|surface appearance]] to your mesh in Studio to add PBR texture options. The [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] instance uses UV mapping, a form of texture mapping, to accurately map 2D images onto the mesh object.

> [!info]
> For information on how to properly connect PBR textures to your model in Blender and Maya for import into Studio, see [[30 Official Roblox Docs/Art/Modeling/Blender and Maya texture settings|Blender / Maya texture settings]].

See the following requirements for [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] assets:

### Texture Files

When possible, texture files should include the appropriate name affix and follow the appropriate image details:

| Texture type | Texture image details |
| --- | --- |
| [[30 Official Roblox Docs/Art/Modeling/PBR textures#Color (albedo)\|Albedo]] | RGB (24-bit) |
| [[30 Official Roblox Docs/Art/Modeling/PBR textures#Normal\|Normal]] | RGB (24-bit); Roblox only supports **OpenGL format - Tangent Space** normal maps |
| [[30 Official Roblox Docs/Art/Modeling/PBR textures#Roughness\|Roughness]] | Single Channel Grayscale (8-bit) |
| [[30 Official Roblox Docs/Art/Modeling/PBR textures#Metalness\|Metalness]] | Single Channel Grayscale (8-bit) |
| [[30 Official Roblox Docs/Art/Modeling/PBR textures#Emissive Mask\|Emissive Mask]] | Single Channel Grayscale (8-bit) |

### PBR Texture Budget

Use an appropriate texture map size based on the asset you are texturing to optimize for visual quality and performance. As a general guideline, each asset should have a texture resolution of 256×256 for every 2×2×2 unit space the asset occupies. If larger than a 2×2×2 cube, use the next highest resolution. The following are some baseline texture sizing examples:

| Recommended map size | Approximate asset size (unit cube) | Example assets |
| --- | --- | --- |
| 64×64–128×128 | 1×1×1 | Jewelry, sunglasses, eyebrows, mustaches. |
| 256×256 | 2×2×2 | Hair, shoes, tank tops, t-shirts, shorts, short skirts. <br><br>256x256 is the **maximum budget** for non-albedo maps for [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications#Textures\|rigid accessories]]. |
| 512×512 | 4×4×4 | Jackets, pants, overalls, long-sleeve shirts, long skirts. |
| 1024×1024 (maximum) | 8×8×8 | Full body clothing (onesies, robes), humanoid characters. |

> [!info]
> When rendering many textures at the same time, Roblox may downsample textures to optimize for performance.

## UV mapping

All textures use UV mapping, a 3D modeling process to project a 3D model's surface to a 2D image, or UV atlas. See the following requirements for UV mapping, especially if you're manually editing or optimizing your UV atlas:

- **Single UV Set** — Use a single UV set for each component, such as a humanoid or accessory. Studio doesn't allow for multiple UV sets.
- **Coordinates** — All UVs must be created within a 0:1 space.
- **Overlaps** — Overlapping UVs are allowed.
- **Maximum Texture Resolution** — Roblox supports up to 1024×1024 pixel spaces for texture maps.

---
*Source: [Texture specifications](https://create.roblox.com/docs/art/modeling/texture-specifications) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
