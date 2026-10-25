---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours"
tags: [roblox, community-knowledge, blender, low-poly, stylized, vertex-color, atlas]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/blender
  - https://create.roblox.com/docs/studio/importer
  - https://create.roblox.com/docs/art/modeling/texture-specifications
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
---
# Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours

Stylized low-poly is the most common art style on Roblox: it is cheap to make, reads well on phones and ages gracefully. The colour on these meshes usually comes from one of two tricks rather than painted textures. A **palette atlas** is one tiny image of colour swatches that every mesh in the game samples from. **Vertex colours** store colour directly on vertices; the Studio Importer reads them from FBX and glTF (there is an *Ignore Vertex Colors* option, off by default). Both avoid per-asset textures, which saves memory and keeps the style consistent.

## Option A: palette atlas

1. Make a small image, e.g. 64×64 or 128×128, split into a grid of flat colour swatches (8×8 swatches of 8 px is plenty). Leave a few spare rows for later.
2. In Blender, UV-unwrap each mesh, then in the UV editor **scale each face's island to nearly a point** and drop it in the middle of the swatch it should use. Gradients are possible by spanning a gradient strip.
3. Every mesh in the game uses the same image. In Studio, set `MeshPart.TextureID` (or a SurfaceAppearance `ColorMap`) to the palette.
4. Set the texture to sample cleanly: keep UV points in swatch centres, and keep swatches at least a few pixels wide so mipmaps do not blend neighbours.

Strengths: one texture for the whole game, recolour the world by editing one file, works with `SurfaceAppearance` so you can add a roughness palette later. Weaknesses: re-uploading changes the asset ID (update references), and UV work is fiddly without an add-on.

## Option B: vertex colours

1. In Blender, Object Data > **Color Attributes** > add one (Domain **Vertex** for smooth blends, **Face Corner** for crisp per-face colour).
2. Paint in Vertex Paint mode, or select faces in Edit mode and use *Set Vertex Color* (Ctrl+K in some versions; check your version's menu).
3. View it in Solid shading with Color set to **Attribute**.
4. Export FBX/glTF; leave *Ignore Vertex Colors* off in the Importer.

Strengths: no UVs or textures at all; colour detail follows geometry. Weaknesses: colour resolution is limited to vertex density; recolouring means editing meshes.

The Creator Docs' Blender page notes many Roblox creators combine vertex paint with Studio materials, `MaterialVariant`s and `SurfaceAppearance` to add variety to simple meshes. That combination (vertex colour for tint and material for surface texture) is a good mid-point.

## Interaction with Studio colour

- A MeshPart with a `TextureID` shows the texture; `BasePart.Color` does not tint it unless the texture has transparency.
- With no texture, `BasePart.Color` colours the whole mesh. A single-colour asset (a red barrel) needs no palette at all: just Color + Material.
- Vertex colours combine with the part's colour and material (exact blend behaviour: test in Studio before committing to a pipeline; not fully described in the docs we checked).

## Which to choose

| Situation | Pick |
| --- | --- |
| Whole game in one flat-shaded style | Palette atlas |
| Props with soft colour gradients (sunset rocks, fruit) | Vertex colours |
| You want built-in Roblox materials (wood grain, plastic) visible | Vertex colours or plain Part Color |
| Team of builders recolouring often | Palette atlas (one file) |

## Pitfalls

- Texture streaming: the docs warn that a shared atlas streams at the highest resolution any object requests. For a 64-128 px palette this does not matter; it does matter if the "palette" grows into a big detailed atlas.
- Palette textures with JPEG compression bleed colours; export PNG.
- Flat-shaded meshes need split normals (Shade Flat) or colours smear across faces.
- Keep a master `.blend` with the palette image so new artists sample the same swatches.

## Related
[[3D Modeling Blender - Hub]] · [[Smooth and Hard Edges - Shading Normals for Roblox Meshes]] · [[Stylized vs Realistic Art Direction on Roblox]] · [[Blender One-Shot Model Scripts (Copy-Paste)]]
