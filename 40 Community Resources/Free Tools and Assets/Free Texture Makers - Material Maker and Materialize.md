---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/free-texture-makers"
title: "Free Texture Makers - Material Maker and Materialize"
tags: [roblox, community, tools, materials, textures, free-assets, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "mixed - see table"
sources:
  - https://www.materialmaker.org/
  - https://github.com/RodZill4/material-maker
  - https://boundingboxsoftware.com/materialize/
  - https://github.com/BoundingBoxSoftware/Materialize
cssclasses: [tg-a40]
---

# Free Texture Makers - Material Maker and Materialize

Free alternatives to Substance Designer / Bitmap2Material for making your own **PBR maps** (color, normal, roughness, metalness) for SurfaceAppearance and MaterialVariants. Textures you make are your own originals, which is the safest kind of asset for a sold product.

| Tool | Maker | What it does | License | Bundle-safe? | Link |
|---|---|---|---|---|---|
| **Material Maker** | Rodz Labs (RodZill4) | Node-based procedural material authoring (like Substance Designer) plus 3D model painting; built on Godot | MIT | YES (code) - link it | https://www.materialmaker.org/ |
| **Materialize** | Bounding Box Software | Builds a full material from one photo: height, normal, metallic, smoothness, edge and occlusion maps | GPL-3.0 | No - link only | https://boundingboxsoftware.com/materialize/ |

## Roblox-specific tips
- Roblox uses **roughness**, not smoothness. Materialize outputs a smoothness map: invert it (1 - smoothness) before using it as roughness.
- Normal maps must be **OpenGL style** (green up) for Roblox; flip the green channel if the tool exports DirectX style. Check this in [[PBR textures]].
- Keep sizes power-of-two and as small as the asset allows (512 or 1024 for most props). See [[Texture Memory and Triangle Budgets for Roblox Scenes]].
- For terrain and parts, the maps go into a **MaterialVariant**; for meshes, into **SurfaceAppearance**. Walkthrough: [[SurfaceAppearance PBR from Poly Haven Textures]].
- Studio also has its own AI [[Material Generator]] for quick variants.

## Photo sources
Only feed these tools photos **you took** or CC0 photos. CC0 texture sites already in the vault: Poly Haven and [[More Free Sources - ambientCG]]; more in [[More CC0 Texture Sites - 3DTextures.me and TextureCan]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[SurfaceAppearance PBR from Poly Haven Textures]] · [[PBR textures]] · [[Free 2D Art Apps - Krita, GIMP, Photopea and Pixel Editors]] · [[Materials Textures - Hub]]

<!-- TDOD_GRAPH_END -->
