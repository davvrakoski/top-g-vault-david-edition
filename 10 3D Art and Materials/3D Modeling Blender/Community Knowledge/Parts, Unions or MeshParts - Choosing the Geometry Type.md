---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Parts, Unions or MeshParts - Choosing the Geometry Type"
tags: [roblox, community-knowledge, blender, parts, csg, meshpart, building]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/parts
  - https://create.roblox.com/docs/parts/solid-modeling
  - https://create.roblox.com/docs/parts/meshes
  - https://create.roblox.com/docs/reference/engine/classes/PartOperation
  - https://create.roblox.com/docs/performance-optimization/improve
---
# Parts, Unions or MeshParts - Choosing the Geometry Type

Roblox gives you three ways to make shapes: primitive **Parts** (blocks, wedges, cylinders, spheres), **solid modeling** results (Union, Intersect, Negate, stored as `PartOperation` instances), and imported **MeshParts**. Builders argue about this endlessly; the practical answer depends on what the object is and how many copies exist. This note gives a decision table and the hidden costs of each.

## Quick comparison

| | Parts | Unions / Intersects (`PartOperation`) | MeshParts |
| --- | --- | --- | --- |
| Made in | Studio | Studio | Blender etc., then imported |
| Texturing | Built-in materials, `MaterialVariant`, `Texture`/`Decal` | Same; `UsePartColor` controls colour | Built-in materials or a UV-mapped `SurfaceAppearance` |
| Editable later | Always | Yes (Separate) | Re-import |
| Triangle cost | Very low (simple primitives) | Can be surprisingly high (`TriangleCount` shows it) | What you modeled |
| Collision | Exact primitive shapes | `CollisionFidelity` options | `CollisionFidelity` options |
| Instancing | Excellent | Each union is its own geometry asset | Excellent when the same mesh is reused |

## Decision guide

- **Blockout and greybox**: Parts. Fast to change, cheap, and the shape is still being decided.
- **Simple architecture** (walls, floors, stairs) in a blocky or realistic style: Parts with `MaterialVariant`s look good and stay editable.
- **One-off shapes** with holes (an arch, a window cut, a rounded counter) made by builders without Blender: Union/Negate. Keep them few and simple.
- **Anything repeated many times** (lamp posts, fences, crates, trees): MeshPart. One mesh asset, many instances.
- **Anything needing unique painted detail**: MeshPart + `SurfaceAppearance`.
- **Characters, vehicles, weapons**: MeshParts.

## Hidden costs to know

- **Unions triangulate badly**: CSG boolean results can produce long thin triangles and high counts. Select a union and read `TriangleCount`; a "simple" arch at a few thousand triangles is a sign to remodel it as a mesh.
- **Solid modeling needs watertight input**: the docs define watertight as closed, manifold, non-self-intersecting; imported meshes that are not will fail or produce garbage.
- **`SmoothingAngle`** on a `PartOperation` controls shading across edges (0 = faceted); raise it carefully, as high values smear lighting across hard corners.
- **Many tiny Parts** (hundreds of 0.2-stud bricks for detail) cost more than one mesh with the same look: each part is an instance to replicate, simulate and draw.
- **Importing a whole map as one file** creates a separate mesh asset for every duplicated tile (the Importer does not de-duplicate, per the performance docs). Import each kit piece once and duplicate in Studio.

## Converting

- Union to mesh: a common route is exporting the union (Export Selection to OBJ), cleaning it in Blender, and re-importing as a MeshPart.
- Parts to mesh: same export route; useful for freezing a finished part-built prop into one cheaper object.
- Keep the original Parts version in `ServerStorage` or a dev place in case you need to edit again.

## Checklist

- [ ] Greybox in Parts; replace with meshes once the layout is final
- [ ] Repeated props are MeshParts sharing one asset
- [ ] Unions audited with `TriangleCount`
- [ ] Collision fidelity set per object type
- [ ] No map-wide single-file imports

## Related
[[3D Modeling Blender - Hub]] · [[Asset vs Effect Decision Matrix — What Should Be Geometry]] · [[Modular Kits and Grid Snapping in Studs]] · [[Free Building Plugins - Stravant, F3X and Archimedes]]
