---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Unions vs MeshParts - When CSG Costs More Than It Saves"
tags: [roblox, community-knowledge, optimization, csg, unions, meshes]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/parts/solid-modeling
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://devforum.roblox.com/t/unions-vs-meshparts-2023/2638232
  - https://devforum.roblox.com/t/do-unions-reduce-lag/476186
  - https://devforum.roblox.com/t/should-i-use-meshparts-instead-of-a-bunch-of-parts/295061
---
# Unions vs MeshParts - When CSG Costs More Than It Saves

Studio's solid modeling tools (Union, Intersect, Negate, Subtract) make it fast to cut windows, arches and pipes without leaving Studio. The question every builder eventually asks is whether those unions are slower than a MeshPart from Blender. The honest answer from the forum is "it depends on triangles, reuse and collision", and there is no official benchmark. This note collects what is documented and what the community agrees on, so the decision is made per asset instead of by superstition.

## What is documented

- Unions and MeshParts are both triangle meshes at render time. The Improve Performance guide says triangle count matters less than draw calls, and that duplicate meshes with different asset IDs break instancing.
- The guide also warns that importing a whole map at once creates a separate asset per piece, even for identical tiles. The same logic applies to unions: twenty separately built windows are twenty unique meshes.
- Runtime CSG through `GeometryService:UnionAsync` / `SubtractAsync` is asynchronous and the Solid Modeling page warns against calling it many times in quick succession.
- `CollisionFidelity` and `RenderFidelity` apply to unions as well as MeshParts (both inherit from `TriangleMeshPart`).

## What the community reports (not benchmarks)

| Claim | Where | Confidence |
| --- | --- | --- |
| CSG can produce more triangles than the same shape modeled by hand | Unions vs MeshParts 2023 thread, several older threads | Plausible; check with the Studio stats overlay |
| Unions with reasonable triangle counts perform like any other part | Same thread, counter-view | Plausible |
| Subtracting holes (especially cylinders) can lower triangle count versus building the shape from many parts | "Do unions reduce lag?" | Case by case |
| Unions should use Hull or Box collision unless players must pass through an opening | Unions vs MeshParts 2023 | Matches official fidelity guidance |
| Unions load more slowly than plain parts | Older threads | (unverified) |

## A decision table

| Asset | Recommended | Reason |
| --- | --- | --- |
| One-off architectural cut (a single arch, a unique window) | Union is fine | Unique anyway; quick to iterate |
| Repeated modular piece (window frame used 60 times) | Build once, then duplicate that one union or MeshPart; never rebuild it per copy | Reused geometry can be instanced; rebuilt copies are unique (instancing behaviour for duplicated unions: unverified, check draw calls) |
| Organic shape (rock, tree, character prop) | MeshPart from a DCC tool | CSG is not designed for organic forms |
| Gameplay-precise opening (doorway, vent players crawl through) | Either, with `PreciseConvexDecomposition` only on that piece | Precise is the most expensive fidelity |
| Destructible at runtime | Pre-fractured parts, or `GeometryService` with throttling | Avoid bursts of async CSG calls |

## How to measure instead of guessing

1. Enable the Render stats overlay (Shift+F2 in a client) and note draw calls and triangles looking at the area.
2. Replace a group of unions with a single MeshPart version (export from Studio, clean up in Blender, re-import once, duplicate).
3. Compare draw calls, triangles and `PhysicsParts` memory in the Developer Console.
4. Keep the version that wins on your target device, not in Studio on a desktop.

## Pitfalls

- Separating a union back into parts and re-unioning creates a new asset each time; repeated edits can leave many near-identical meshes in the place.
- Very thin negated parts can leave slivers of stray geometry; our own rule of thumb is to keep cutters clearly thicker than the wall they cut.
- Unions keep per-part colors unless `UsePartColor` is on; whether a multi-material union costs more draw calls than one material is (unverified), so measure it.

## Related
[[Optimization - Hub]] · [[Draw Calls and Mesh Instancing - Official Rules vs Forum Lore]] · [[Collision Property Tuning - CanCollide, CanQuery, CanTouch and CollisionFidelity]] · [[Texture Memory and Triangle Budgets for Roblox Scenes]]
