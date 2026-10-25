---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Texture Painting in Blender - Setup, Layers by Baking and Export to SurfaceAppearance"
tags: [roblox, community-knowledge, materials, textures, blender, texture-painting]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/accessories/creating-rigid/texturing
  - https://create.roblox.com/docs/art/accessories/creating/texture-painting
  - https://docs.blender.org/manual/en/latest/sculpt_paint/texture_paint/introduction.html
  - https://create.roblox.com/docs/art/modeling/texture-specifications
---
# Texture Painting in Blender - Setup, Layers by Baking and Export to SurfaceAppearance

You do not need a paid painter to texture Roblox props. Blender's Texture Paint mode paints directly on the 3D model, and Roblox's own accessory tutorials use it. Its weakness is that it has no real layer stack, so the trick is to **build layers with bakes and multiple images**, then combine them. This note is the practical setup for game props and accessories. For exporting the finished maps, see [[Texture Export from Blender and Substance for SurfaceAppearance]].

## 1. Prepare the mesh

- Final topology and **clean UVs with margins** (at least 4-8 px at 1024) first. Painting before UVs are final means repainting ([[UV Unwrapping and Texel Density in Studs]]).
- Apply scale so brush size behaves the same on every object.
- One material per mesh, matching Roblox's one-SurfaceAppearance-per-MeshPart rule.

## 2. Create the images

1. In the Shader Editor, add an **Image Texture** node, click *New*, size 1024 x 1024 (or 512), colour = a neutral base. Connect it to Base Color.
2. For a roughness map, add a second image (*Non-Color* colour space), fill grey 0.7, connect to Roughness.
3. Save the images immediately (*Image > Save As*). Unsaved painted images are lost when Blender closes; this is the classic beginner loss.

## 3. Paint mode setup

- Switch to the **Texture Paint** workspace. The active Image Texture node in the shader is the one you paint on; click a node to switch targets.
- Useful settings: *Symmetry X* for characters and hats; *Falloff* for soft edges; **Stencil** or **Tiled** texture brushes for wood grain, noise and fabric; *Fill* brush (or *Image > Fill*) for base colours.
- Shortcuts: **F** brush radius, **Shift+F** strength, **E** stroke method, **S** sample a colour, **Ctrl** to invert (paint with secondary colour).
- Mask by faces: enable the face selection mask, then select faces in Edit Mode to paint only those areas (great for clean colour blocks).

## 4. Layers by baking (the key trick)

Instead of painting light and wear by hand, bake helper maps first and blend them in:

1. Bake **Ambient Occlusion** to a new image (Cycles > Bake > Ambient Occlusion).
2. Bake a **Pointiness/curvature** style mask (for example via the Geometry node's Pointiness in Cycles, baked as Emit) to find edges.
3. In the shader, combine: base colour multiplied by AO (subtle, about 30-50% strength), edges lightened for stylised highlights or for metal wear.
4. Bake the combined result (**Bake type: Diffuse, colour only**, or **Emit**) into a fresh final colour image. That flattened image is what Roblox gets.

This gives a hand-finished look in minutes and is repeatable when the mesh changes.

## 5. Export and size

- Roblox SurfaceAppearance uses Color (with optional alpha), Normal, Roughness and Metalness maps. Save as PNG.
- Resize by object size: the texture spec suggests about 256 for a 5-stud object, 512 for 10 studs, 1024 for 20 studs.
- Colour map in sRGB; roughness, metalness and normal as non-colour data ([[Normal Map Rules for Roblox - OpenGL Green, Tangents and Flat Values]]).

## When Blender painting is the right choice

| Good fit | Poor fit |
|---|---|
| Stylised props and accessories | Realistic PBR with many material layers |
| Hand-painted look | Complex smart-material wear on many assets |
| Quick fixes on AI or scanned textures | Large production batches needing reusable presets |

For the heavier cases, see [[Model - Choosing a Texture Painter - Substance Painter, ArmorPaint or Blender]].

## Pitfalls

- Painting on overlapping UVs (mirrored halves): paint appears on both sides; fine for symmetry, bad for text.
- Forgetting to save images: Blender's packed or unsaved images vanish.
- Painting roughness in sRGB: values shift; set Non-Color.
- Visible seams: paint across seams in 3D view with a soft brush, or add margin in bake settings.

## Related
[[Materials Textures - Hub]] - [[Texture Export from Blender and Substance for SurfaceAppearance]] - [[Baking Normal and AO Maps in Blender for Roblox]] - [[UV Unwrapping and Texel Density in Studs]]
