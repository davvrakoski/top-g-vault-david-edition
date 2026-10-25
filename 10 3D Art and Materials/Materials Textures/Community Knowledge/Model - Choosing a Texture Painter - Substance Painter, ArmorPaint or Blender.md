---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Choosing a Texture Painter - Substance Painter, ArmorPaint or Blender"
tags: [roblox, community-knowledge, materials, textures, tools, substance, armorpaint]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/armory3d/armortools
  - https://raw.githubusercontent.com/armory3d/armortools/main/license.md
  - https://www.blender.org/about/license/
  - https://create.roblox.com/docs/art/modeling/texture-specifications
  - https://create.roblox.com/docs/art/modeling/surface-appearance
---
# Choosing a Texture Painter - Substance Painter, ArmorPaint or Blender

Every Roblox artist eventually asks which program to texture in. The honest answer depends on **art style, budget and team size**, because Roblox only receives four flat images in the end (Color, Normal, Roughness, Metalness). Any painter that can export those maps works. This note compares the three common choices and what each costs. Export settings are in [[Texture Export from Blender and Substance for SurfaceAppearance]].

## The short comparison

| | Blender Texture Paint | ArmorPaint | Adobe Substance 3D Painter |
|---|---|---|---|
| Cost | Free | Source code free; prebuilt binaries are paid (to fund the project) | Paid (Adobe subscription; a standalone licence has also been sold on Steam, check current offers) |
| Licence | Blender is GPL; your art is yours | Source: zlib licence (permissive); art is yours | Commercial EULA; art is yours |
| Layers | No real layer stack (use bakes and multiple images) | Layers and masks | Full layer stack, masks, smart materials |
| Smart materials / wear generators | Manual, via baked masks | Yes (node-based materials) | Yes, extensive |
| Baking (AO, curvature, normal) | Yes (Cycles) | Yes | Yes, fast and reliable |
| Best at | Stylised, hand-painted, quick fixes | Budget PBR painting | Realistic PBR at production speed |

Prices and offers change; check the current product pages before buying. ArmorPaint's own README states that distributed binaries are paid, while the zlib-licensed source can be built yourself.

## Decision guide

- **Stylised / low-poly game, solo dev:** Blender. Palette atlases, vertex colours and hand-painted textures need no smart materials ([[Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours]]).
- **PBR props on a budget:** ArmorPaint gives layers, masks and PBR painting for little or no cost.
- **Realistic game, many assets, team of artists:** Substance Painter. Smart materials and export presets make 100 assets look like one set, and many freelance artists already use it.
- **Already have Tripo/AI or scanned textures:** fix them in Blender or a 2D editor; a full painter is overkill ([[Free 2D Art Apps - Krita, GIMP, Photopea and Pixel Editors]]).

## Roblox-specific settings for any painter

1. **Document size:** paint at 2048 and export at the size you need (often 512 or 1024). Roblox's texture spec suggests about 256 for a 5-stud object, 512 for 10 studs, 1024 for 20 studs.
2. **Normal format:** OpenGL (Y+). Substance can export DirectX by default in some templates; switch it ([[Normal Map Rules for Roblox - OpenGL Green, Tangents and Flat Values]]).
3. **Maps:** Color (sRGB), Normal, Roughness, Metalness, all PNG. No height or AO channel exists in SurfaceAppearance, so bake AO into the colour map if you want it.
4. **One texture set per mesh:** each MeshPart takes one SurfaceAppearance, so keep one texture set per exported mesh ([[One Material per MeshPart - Splitting vs Atlasing Multi-Material Models]]).
5. **Check in Studio**, not just in the painter viewport. Roblox lighting (Future, ShadowMap, Voxel) and its tone mapping differ from any painter's preview.

## Team and file hygiene

- Save the painter's project file (.spp, .arm, .blend) next to the exported PNGs with matching names.
- Keep your smart-material or brush presets in a shared folder so every artist uses the same wear, dirt and edge settings.
- Write the export preset down once; most mismatched assets come from different export presets, not different painting skill.

## Pitfalls

- Buying a pro painter for a low-poly game that only needs flat colours.
- Treating ArmorPaint as "free to download" from third-party sites: get it from the official project only.
- Judging roughness in the painter's HDRI preview; it always looks different under Roblox lighting.

## Related
[[Materials Textures - Hub]] - [[Texture Export from Blender and Substance for SurfaceAppearance]] - [[Model - Texture Painting in Blender - Setup, Layers by Baking and Export to SurfaceAppearance]] - [[Free Texture Makers - Material Maker and Materialize]]
