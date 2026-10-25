---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Hard-Surface Props with Booleans - Cleanup for Clean Game Shading"
tags: [roblox, community-knowledge, 3d-art, blender, hard-surface, booleans]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.blender.org/manual/en/latest/modeling/modifiers/generate/booleans.html
  - https://docs.blender.org/manual/en/latest/modeling/meshes/editing/mesh/cleanup.html
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://create.roblox.com/docs/art/modeling/export-requirements
---
# Hard-Surface Props with Booleans - Cleanup for Clean Game Shading

Booleans (cutting or adding one shape with another) are the fastest way to model vents, doorways, panel cuts and machinery. Left as they are, they export as long thin triangles and n-gons that shade with dark smears in Roblox, waste triangles, and break bevels. A short cleanup routine turns boolean results into clean, light game meshes. It applies equally to Studio's own solid modeling (Unions), which is why many builders do the cutting in Blender and import a MeshPart instead (see [[Parts, Unions or MeshParts - Choosing the Geometry Type]]).

## Boolean modifier basics (Blender)

- Operations: **Difference** (cut), **Union** (add), **Intersect** (keep overlap).
- Solver: **Exact** handles overlapping and coplanar cases best; **Fast** is quicker but fails on tricky geometry.
- Keep cutters as separate objects (display as *Wire* or *Bounds*, hidden from render) so the cut stays editable until the end.
- Cutter meshes must be closed (manifold) or results become unpredictable.

## Cleanup routine after applying

1. **Apply** the Boolean on a copy; keep the editable original.
2. *Mesh > Clean Up > Merge by Distance* (tiny distance, for example 0.0001 m) to weld duplicate vertices.
3. *Clean Up > Delete Loose* and *Degenerate Dissolve* to remove zero-area faces and stray verts.
4. **Limited Dissolve** (*X > Limited Dissolve*, about 5°) removes unnecessary edges on flat areas, then re-triangulate only where needed.
5. **Fix long triangles:** connect vertices across the cut (*J* to join vertices) so faces are roughly even, and route stray edges toward existing corners.
6. **Shading:** mark the cut's outline edges sharp (or use Smooth by Angle) and add a Weighted Normal modifier so flat faces stay flat around the hole (see [[Art - Blender Modifiers for Game Assets - Bevel, Weighted Normal, Mirror, Array, Decimate]]).
7. Check *Face Orientation* overlay: all blue (outward). Recalculate with *Shift+N* if not.

## Keep triangle count in check

- Cut holes with low-sided cutters: an 8 or 12-sided cylinder is plenty for a stylized bolt hole; 32 sides on a small vent is wasted.
- Shallow detail (panel lines, rivets) is cheaper as a baked normal map or a trim sheet than real cuts ([[Baking Normal and AO Maps in Blender for Roblox]], [[Trim Sheets for Roblox Environments]]).
- Each Roblox mesh must stay under 20,000 triangles; a boolean-heavy machine can hit that quickly, so split large machines into several MeshParts.

## Collision after booleans

- A doorway cut into a wall needs real collision. Use `CollisionFidelity = PreciseConvexDecomposition` only on meshes that need concave collision, and simpler fidelity (`Hull`, `Box`) everywhere else.
- Alternative: keep the visual mesh `CanCollide` off and build collision from a few invisible parts. This is cheaper and fully predictable (see [[FBX Import Settings, Scale and Collision Fidelity]]).

## Pitfalls

- Coplanar faces between object and cutter: random missing faces. Make the cutter poke slightly past the surface.
- Bevel modifier after an uncleaned boolean: spiky artifacts. Clean first, bevel second.
- N-gons left on curved surfaces: they triangulate unpredictably on import and shade badly.
- Leaving hidden cutters in the export selection: they arrive in Studio as extra invisible meshes.

## Related
[[3D Modeling Blender - Hub]] - [[Smooth and Hard Edges - Shading Normals for Roblox Meshes]] - [[Parts, Unions or MeshParts - Choosing the Geometry Type]] - [[Meshes, Topology and Blender]]
