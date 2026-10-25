---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Baking Normal and AO Maps in Blender for Roblox"
tags: [roblox, community-knowledge, blender, baking, normal-map, ambient-occlusion]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.blender.org/manual/en/latest/render/cycles/baking.html
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/art/modeling/texture-specifications
  - https://create.roblox.com/docs/art/modeling/surface-appearance
---
# Baking Normal and AO Maps in Blender for Roblox

Roblox meshes are capped at 20,000 triangles each and mobile players need far fewer, so detail like bolts, bevels, cloth folds and carved trim has to live in textures. Baking transfers that detail from a high-poly sculpt or model onto a low-poly game mesh as a **normal map**, and bakes contact shadow as **ambient occlusion (AO)**. Blender's Cycles baker does both for free. The Roblox-specific rules are: tangent-space OpenGL normals, mesh exported with tangents, and AO multiplied into the albedo (SurfaceAppearance has no AO slot).

## Prepare the two meshes

1. **Low-poly**: final topology, UV unwrapped (no overlaps where the bake must differ), smooth shading with hard edges only where UV seams are.
2. **High-poly**: same silhouette, all the detail. It needs no UVs.
3. Place them in the same spot (overlapping). Name them `crate_low` / `crate_high`.

## Bake setup (Cycles)

1. Render engine: **Cycles** (bake is Cycles-only). GPU if available; 16-64 samples is enough for normals, 128+ for AO.
2. On the low-poly's material, add an **Image Texture** node with a new image (e.g. 1024 px, no alpha). For the normal map set the image colour space to **Non-Color**. Keep this node **selected/active**: Blender bakes into the active image node.
3. Select the high-poly, then shift-select the low-poly (active).
4. Bake panel: **Selected to Active** on. Set **Extrusion** (how far rays start outside the low-poly; start ~0.02-0.05 m at stud-scale models) and **Max Ray Distance**, or use a **Cage** object for tricky shapes.
5. Output **Margin** 8-16 px so colours bleed past island edges (mipmaps need it).

## Normal map specifics

- Bake Type **Normal**, Space **Tangent**, swizzle **+X +Y +Z**. That is OpenGL style, which Roblox expects; do not flip green.
- Export the low-poly FBX with tangents (in FBX export, Geometry > *Tangent Space* on, mesh triangulated or with a stable triangulation). The SurfaceAppearance docs warn that a normal map that "does nothing" usually means tangents were missing.
- Triangulate the low-poly **before** baking (a Triangulate modifier, applied) so Blender's and Roblox's triangulation match; otherwise shading seams appear on quads.

## AO specifics

- Bake Type **Ambient Occlusion** from the high-poly (Selected to Active) or from the low-poly alone.
- Roblox's `SurfaceAppearance` has colour, normal, roughness, metalness and emissive slots, no AO slot. **Multiply the AO into the albedo** at 30-60% strength in Blender's compositor or an image editor. Full strength looks dirty under Roblox's own ambient lighting.

## Checking the result

1. Plug the baked normal into the low-poly's Principled BSDF via a **Normal Map** node and orbit: details should read, no waviness.
2. Look for **ray misses** (black or garbage patches): increase Extrusion or Max Ray Distance, or use a cage.
3. Look for **skewing** on flat bevelled faces: add support loops or harden edges with seams on the low-poly.
4. Import to Studio, add `SurfaceAppearance`, and view under both day and night lighting.

## Pitfalls

- Mirrored UV halves bake fine for AO but can show seams on normals at the mirror line; offset one half by exactly 1 in U before baking if needed.
- Baking at 4096 and downscaling to 1024 gives cleaner results than baking at 1024 directly.
- Name maps clearly (`_Color`, `_Normal`, `_Roughness`, `_Metalness`) so the Importer can pick them up.

## Related
[[3D Modeling Blender - Hub]] · [[Trim Sheets for Roblox Environments]] · [[Normal Map Rules for Roblox - OpenGL Green, Tangents and Flat Values]] · [[Blender Game-Ready Audit]]
