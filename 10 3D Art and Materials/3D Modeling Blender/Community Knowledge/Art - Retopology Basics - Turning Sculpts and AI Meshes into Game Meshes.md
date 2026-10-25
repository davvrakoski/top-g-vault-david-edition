---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Retopology Basics - Turning Sculpts and AI Meshes into Game Meshes"
tags: [roblox, community-knowledge, 3d-art, blender, retopology]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.blender.org/manual/en/latest/modeling/meshes/retopology.html
  - https://docs.blender.org/manual/en/latest/modeling/modifiers/deform/shrinkwrap.html
  - https://github.com/wjakob/instant-meshes
  - https://create.roblox.com/docs/art/modeling/specifications
---
# Retopology Basics - Turning Sculpts and AI Meshes into Game Meshes

Sculpts, photogrammetry scans and AI-generated models (Tripo, Rodin, Studio's own generators) come out as millions of uneven triangles. Roblox caps a single mesh at 20,000 triangles, and anything that deforms (characters, creatures, cloth) needs edge loops in the right places. Retopology means building a new, light mesh on top of the dense one, then baking the detail back as textures. It is slower than Decimate but gives clean UVs, good deformation and predictable LODs.

## Decide first: retopo, remesh or decimate?

| Asset | Method |
|---|---|
| Static rock, debris, background prop | Decimate (Collapse/Planar) and bake, fast |
| Hard-surface prop | Manual retopo or clean re-model over the AI mesh as a reference |
| Character, creature, anything skinned | Manual or guided quad retopo with loops for joints |
| Rough blockout from a sculpt | Voxel Remesh or QuadriFlow, then clean up |

## Blender's built-in tools

- **Voxel Remesh** (*Object Data > Remesh*): even density, good for sculpting further, not final.
- **QuadriFlow Remesh**: automatic quads to a target face count; decent for static organic props.
- **Manual retopo setup:**
  1. Put the dense mesh in its own collection, disable selection.
  2. New mesh object; enable snapping to **Face** with *Project Individual Elements* (or *Face Nearest* in newer versions).
  3. Add a **Shrinkwrap** modifier targeting the dense mesh (small offset) so the new surface sticks to it.
  4. Use **Poly Build** or extrude/fill to lay quads; add a Mirror modifier first for symmetric shapes.
- Overlay *In Front* plus a different viewport colour keeps the new mesh visible.

## Free external option

**Instant Meshes** (open source, by Wenzel Jakob; check its repo licence before bundling, link only here) generates a quad mesh from a dense input with paint-on orientation guides. Export OBJ, bring back to Blender, fix poles by hand. See also [[Free 3D Apps Beside Blender - Blockbench, Instant Meshes and MeshLab]].

## Where to spend polygons

- **Silhouette first:** loops where the outline is seen. Interior flat areas can be very sparse.
- **Deformation:** 3 loops around elbows, knees, knuckles; a loop ring around the mouth and eyes if the face animates.
- **Avoid:** long thin triangles, poles (5+ edge vertices) on joints, and n-gons on bends.
- **Rough targets for Roblox (house guidance):** small prop 200-1,000 tris, hero prop 2-6k, creature 6-15k, all under the 20k per-mesh limit.

## After retopo

1. UV unwrap the new mesh (seams on hidden edges, consistent texel density: [[UV Unwrapping and Texel Density in Studs]]).
2. Bake normal and AO from the dense mesh ([[Baking Normal and AO Maps in Blender for Roblox]]).
3. For AI meshes, also bake the base colour so the original texture survives the new UVs.
4. Check shading with smooth/hard edges set before baking.

## Pitfalls

- Retopologising details a normal map could carry (screws, stitches, small cracks).
- Shrinkwrap offset at 0, causing z-fighting with the source while working.
- Uneven density: one dense area and one sparse area bake with visibly different sharpness.

## Related
[[3D Modeling Blender - Hub]] - [[Hero Creature Production — From Sculpt to Roblox]] - [[Tripo → Blender → Roblox Production Pipeline]] - [[Baking Normal and AO Maps in Blender for Roblox]]
