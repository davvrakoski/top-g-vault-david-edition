---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Toon and Cel Looks on Roblox - Inverted Hull Outlines, Ramps and Highlight Limits"
tags: [roblox, community-knowledge, materials, stylized, toon, cel-shading, outlines]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Highlight
  - https://create.roblox.com/docs/reference/engine/classes/MeshPart
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://devforum.roblox.com/t/r15-and-r6-cel-shading/869167
  - https://devforum.roblox.com/t/how-do-i-use-cell-shading/903220
---
# Toon and Cel Looks on Roblox - Inverted Hull Outlines, Ramps and Highlight Limits

A real cel-shaded look (hard light/shadow bands plus ink outlines) normally comes from custom shaders. Roblox does not let creators write shaders or post-process passes, so you cannot get true cel lighting. What you **can** do is fake most of it with geometry and textures: inverted-hull outlines, painted shading bands, flat colours and soft lighting settings. Knowing the limits up front saves weeks of chasing a look the engine cannot render.

## What is and is not possible

| Effect | Possible? | How |
|---|---|---|
| Hard-banded lighting that reacts to the sun | No (no custom shading) | Fake with painted bands |
| Black outlines around characters/props | Yes | Inverted hull mesh, or `Highlight` |
| Flat colours, no texture noise | Yes | SmoothPlastic or flat SurfaceAppearance |
| Screen-space edge detection | No | No custom post-process |
| Soft, low-contrast stylised lighting | Yes | `Lighting.LightingStyle = Soft`, tuned ambient |

DevForum replies on cel shading reach the same conclusion: outlines built in Blender as MeshParts are the closest available route.

## Inverted hull outlines (the main trick)

1. In Blender, duplicate the mesh.
2. In Edit Mode select all and use *Shrink/Fatten* (*Alt+S*) to push the copy outward along its normals by about 0.03-0.08 studs (house guidance; scale with object size).
3. **Flip normals** on the copy (*Alt+N > Flip*). Its front faces now point inward, so with back-face culling you only see the far side of the shell, which peeks out around the silhouette as an outline.
4. Give the copy a black (or dark-hue) material, export both meshes.
5. In Studio: the outline MeshPart with `DoubleSided` **off** (it must cull), black colour or `SmoothPlastic`, `CastShadow` off, `CanCollide`/`CanQuery`/`CanTouch` off, welded to the main part. For skinned characters, skin the hull to the same bones so it deforms together.

Limits: outlines appear only on silhouettes, not on interior creases; concave areas and very close surfaces can show gaps; it doubles the triangle count of that object. Use it on hero characters and key props, not on every rock.

## The Highlight alternative

`Highlight` draws an outline (and optional fill) around a model in real time with no extra mesh. It is excellent for selection and team outlines, but Roblox limits how many can render at once (see [[Highlight Instance - Outlines, X-Ray and the 255 Limit]]) and the outline is the same thickness everywhere, so it reads as a UI effect more than ink. Use it for gameplay highlights, not as your art style.

## Shading bands in the texture

- Paint 2-3 flat value bands (light, mid, shadow) into the colour map, with the shadow band on the underside and the side away from your typical sun.
- Keep hard edges between bands (no soft gradients) for the anime look.
- Set roughness high (0.9-1.0) and metalness 0 so engine reflections do not break the flat style ([[Model - Hand-Painted Texture Style on Roblox - Baked Light, Edge Highlights and Flat PBR]]).

## Lighting settings that help

- `LightingStyle = Soft` (the documented stylised option), modest `Brightness`, and coloured `Ambient`/`OutdoorAmbient` so shadows stay saturated rather than grey.
- Avoid heavy bloom and strong `ColorCorrection` contrast; they push away from flat colour.
- Test on mobile: the look must survive the lowest quality level, where shadows simplify.

## Pitfalls

- Hull with `DoubleSided` on: covers the whole model in black.
- Hull thickness constant in studs on very different-sized objects: tiny props get fat outlines. Scale per object.
- Expecting outlines on interior lines (eye shapes, clothing seams): paint them into the texture instead.

## Related
[[Materials Textures - Hub]] - [[Highlight Instance - Outlines, X-Ray and the 255 Limit]] - [[Stylized vs Realistic Art Direction on Roblox]] - [[Smooth and Hard Edges - Shading Normals for Roblox Meshes]]
