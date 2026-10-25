---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Stylized Trees and Foliage Cards - Alpha Cutouts, Two-Sided Leaves and Overdraw"
tags: [roblox, community-knowledge, 3d-art, blender, foliage, trees]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/reference/engine/classes/MeshPart
  - https://devforum.roblox.com/t/meshpart-doublesided/864664
  - https://devforum.roblox.com/t/double-sided-lighting-on-leaves/3902291
  - https://devforum.roblox.com/t/problem-with-stylized-trees/2319769
---
# Stylized Trees and Foliage Cards - Alpha Cutouts, Two-Sided Leaves and Overdraw

Trees are where Roblox maps most often lose frame rate and look cheap at the same time. Two approaches work: **solid blob canopies** (no transparency, cheapest, very "toy" look) and **leaf cards** (flat planes with a leaf-cluster texture whose alpha cuts out the shape). Cards look far richer but bring three problems: back faces disappear, lighting on the back looks wrong, and transparent pixels cost fill rate (overdraw). Here is how to keep the look and avoid the costs.

## Option 1: solid canopy (fastest)

- Sculpt or model 3-6 lumpy shapes per crown, 100-400 tris each, flat or gradient colour from a palette (see [[Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours]]).
- No alpha at all, so no sorting issues and no overdraw. Good for mobile-heavy games and far trees.

## Option 2: leaf cards

### Texture

- Paint or bake 4-8 leaf clusters into one atlas (512 or 1024 is plenty for stylized). Store the cut-out in the ColorMap alpha.
- Use `SurfaceAppearance.AlphaMode = Transparency`. Per the Roblox docs, keeping the MeshPart's `Transparency` at **0** in this mode renders opaque pixels fully opaque and works better with depth-based effects and occlusion. A `Transparency` of 0.02 or more switches to a soft blend that sorts less reliably, so avoid it on foliage.

### Card geometry

- Trim each card's outline to the leaf silhouette (4-8 verts instead of a square). Less empty, transparent area means less overdraw.
- Cross or fan cards around branches; 20-60 cards per stylized tree is a common range.
- Merge all cards of a tree into one MeshPart (one draw), plus a separate trunk mesh.

### Back faces

- `MeshPart.DoubleSided` renders both faces of each polygon and is meant for leaf, hair and cloth cards. Community reports note that lighting on the back side can look inverted (bright when facing away from the sun).
- The robust fix many artists use: in Blender, duplicate the cards, flip the normals of the copy (*Mesh > Normals > Flip*), and keep `DoubleSided` off. This doubles card triangles but lighting is correct on both sides.

### Canopy normals (the stylized trick)

Cards lit by their own flat normals look like a pile of paper. Transfer normals from a simple sphere or blob around the canopy onto the cards (Blender *Data Transfer* modifier, Face Corner Data, Custom Normals), so the whole crown shades like one soft volume. Apply before export.

## Performance settings in Studio

- `CastShadow` off for small bushes and far trees; keep it on for hero trees only.
- `CanCollide` off on canopies; collide only with a simple trunk part.
- Use `RenderFidelity` and hand-made LODs for forests (see [[Level of Detail on Roblox - RenderFidelity, SLIM and Hand-Made LODs]]).
- Reuse the same 3-5 tree meshes rotated and scaled in Studio instead of 50 unique trees.

## Pitfalls

- Square cards with mostly transparent texture: high overdraw for little leaf.
- Setting `Transparency` 0.5 on the canopy "to soften it": sorting errors and flicker.
- Forgetting mip padding: leaf alpha bleeds to grey edges at distance. Extend the colour past the alpha edge when painting.

## Related
[[3D Modeling Blender - Hub]] - [[SurfaceAppearance AlphaMode and TintMask - Recolorable Assets]] - [[Level of Detail on Roblox - RenderFidelity, SLIM and Hand-Made LODs]] - [[Smooth and Hard Edges - Shading Normals for Roblox Meshes]]
