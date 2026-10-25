---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Normal Map Rules for Roblox - OpenGL Green, Tangents and Flat Values"
tags: [roblox, community-knowledge, materials, normal-map, pbr, troubleshooting]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/art/modeling/texture-specifications
  - https://create.roblox.com/docs/art/modeling/surface-appearance
  - https://docs.ambientcg.com/license/
---
# Normal Map Rules for Roblox - OpenGL Green, Tangents and Flat Values

Normal maps are the most common reason a PBR asset "looks wrong" after import: bumps look like dents, lighting looks inside-out, or the map seems to do nothing at all. Roblox's API reference spells out exactly what it expects, so these problems are fixable in minutes once you know the rules.

## What Roblox expects

- **Tangent space** only. World-space and object-space normal maps are not supported.
- **OpenGL format**: the green channel is *not* inverted (Y+ up). Many texture sites and tools (Unreal-style, Substance "DirectX" preset) default to DirectX, which has green flipped.
- **RGB 24-bit** image; R, G, B = X, Y, Z of the surface normal.
- Byte mapping: 0 maps to -1 and 255 maps to about 1.016, stretched so that **127 is exactly 0**. A perfectly flat normal map is the colour **(127, 127, 255)**.
- The mesh must be imported **with tangents**. If the map "does nothing", the docs say to re-export the mesh with tangent information.

## Symptom table

| Symptom | Cause | Fix |
| --- | --- | --- |
| Bumps look like dents when lit from above | DirectX map (green inverted) | Invert the green channel once, or download the OpenGL (`_NormalGL`) version |
| Map has no visible effect | Mesh exported without tangents, or map assigned to the wrong slot | Export FBX with Tangent Space on; check `NormalMap` slot |
| Faceted seams across quads | Triangulation differs between baker and Roblox | Triangulate before baking and exporting |
| Shading seam along UV seams | Hard edge without seam, or seam without hard edge | Put hard edges on UV seams (and vice versa) |
| Flat areas look slightly tilted | Map saved with colour management (sRGB conversion) | Save as linear/Non-Color; re-export without colour profile adjustments |
| Strong noise at distance | Normal map too high-frequency for mipmaps | Blur fine detail, reduce intensity |

## Quick visual test (no tools needed)

Open the map and look at a raised bump: the docs describe that normals pointing **right** should look more red, and normals pointing **up** on screen should look more **green**. If the top edge of a bump is dark green and the bottom edge bright green, the map is DirectX: flip green.

## Where formats come from

- ambientCG material zips are commonly reported to contain both `NormalGL` and `NormalDX` files (not re-checked inside a zip for this note): pick **GL**.
- Poly Haven provides `nor_gl` and `nor_dx` variants: pick **gl**.
- Blender bakes OpenGL by default (swizzle +X +Y +Z).
- Substance export presets: choose an OpenGL normal output.

Check each source's file names; do not assume.

## Strength and compression

There is no normal "strength" property on `SurfaceAppearance`. To soften a map, blend it toward flat (127, 127, 255) in an image editor, or re-generate it at lower intensity. Keep normal maps no larger than the albedo; 512 px is often enough for props.

## Checklist

- [ ] Tangent space, OpenGL green
- [ ] Mesh exported with tangents and triangulated
- [ ] Map saved as Non-Color / linear PNG
- [ ] Verified under a moving light in Studio (rotate the sun with `ClockTime`)

## Related
[[Materials Textures - Hub]] · [[Baking Normal and AO Maps in Blender for Roblox]] · [[SurfaceAppearance PBR from Poly Haven Textures]] · [[Texture and PBR Specs — 2026 Snapshot]]
