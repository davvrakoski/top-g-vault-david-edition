---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Hair Cards and Cloth Cards - Strips, Alpha Textures and DoubleSided"
tags: [roblox, community-knowledge, 3d-art, blender, hair, cloth, alpha]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/MeshPart
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://docs.blender.org/manual/en/latest/modeling/curves/properties/geometry.html
---
# Hair Cards and Cloth Cards - Strips, Alpha Textures and DoubleSided

Roblox has no strand hair or cloth simulation for creators, so stylised hair, fur tufts, frayed capes, flags, banners, scarves and torn clothing are built from **cards**: flat or gently curved strips of polygons with an alpha-masked texture. Done well, a handful of cards gives a soft silhouette that solid meshes cannot. Done badly, they cost overdraw, show black backs and sort wrongly. The vault's hero-material note lists the idea ([[Fur, Hair, Teeth and Eyes — Hero Material Tricks]]); this is the modeling recipe.

## Solid first, cards second

The cheapest, most robust hair on Roblox is a **solid sculpted shell** (clumps modelled as closed shapes). Add cards only for the silhouette edge: bangs, a ponytail tip, loose strands, the fringe of a cape. Aim for a solid base with 10-40 cards for a hero head, not hundreds (house guidance).

## Making the card texture

1. Paint or render a strip atlas: 4-8 hair clumps (or fabric tatters) side by side on one texture, each with a clean alpha edge. 512 x 512 or 1024 x 512 is plenty.
2. Root at the top of each strip, tip at the bottom; tips fade to transparent.
3. Use a mid-tone colour in fully opaque areas and a slightly darker root to fake depth.
4. Export as PNG with alpha in the colour map.

## Building cards in Blender

1. **Curve method:** draw a bezier curve along the strand path, set *Geometry > Extrude* for width (and a small Bevel with 0 depth for a flat ribbon), add **Twist** if needed, then *Convert > Mesh*. 3-6 segments along the length is enough.
2. **Plane method:** a plane with 3-5 loop cuts along its length, bent with proportional editing (O).
3. UV each card onto one strip of the atlas (root at top). Many cards can share the same strip with different lengths and rotations.
4. Layer cards in 2-3 shells: inner (darker, denser), outer (lighter), and a few flyaways.
5. Give cards slight curvature across their width so they do not vanish when seen edge-on.

## Roblox setup

- One MeshPart for all cards (one material), with a `SurfaceAppearance`:
  - `AlphaMode = Transparency` for soft edges (sorting issues possible) or a hard cutout look if you keep alpha binary and want fewer sorting artefacts. See [[SurfaceAppearance AlphaMode and TintMask - Recolorable Assets]].
- **`MeshPart.DoubleSided = true`** so back faces render; the official API notes it is meant for card meshes like leaves, hair and cloth. Without it, half the cards disappear depending on the view.
- Normals: for hair, transfer normals from a smooth sphere/shell (Data Transfer modifier) before export so cards shade like one volume instead of flickering strips (the same trick as stylised tree canopies in [[Art - Stylized Trees and Foliage Cards - Alpha Cutouts, Two-Sided Leaves and Overdraw]]).

## Cloth cards: capes, flags, banners

- A cape is a 6-10 segment strip with an alpha-torn bottom edge. To animate it, either skin it to a few bones in a chain (Blender armature, exported with the character) or swing a rigid cape with a `Motor6D` and a scripted sway.
- Flags and banners: a single subdivided plane skinned to 2-4 bones, or a few frames of a modeled wave swapped by script for very cheap motion.
- Keep cloth cards out of collision (`CanCollide` false, `CanQuery` false).

## Performance

- Every transparent layer adds overdraw; stacked cards in front of the camera are the worst case ([[Perf - Transparency Overdraw - Glass, Foliage Cards and DoubleSided Meshes]]).
- Characters seen by many players should prefer solid hair with only a few cards.
- Test on a low-end phone with several characters on screen.

## Pitfalls

- Cards with no thickness and DoubleSided off: invisible from behind.
- Alpha edge with a white or black halo: bleed the colour outward past the alpha edge before export.
- Each card its own object: join them into one mesh.

## Related
[[3D Modeling Blender - Hub]] - [[Fur, Hair, Teeth and Eyes — Hero Material Tricks]] - [[Art - Stylized Trees and Foliage Cards - Alpha Cutouts, Two-Sided Leaves and Overdraw]] - [[Perf - Transparency Overdraw - Glass, Foliage Cards and DoubleSided Meshes]]
