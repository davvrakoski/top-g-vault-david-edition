---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Level of Detail on Roblox - RenderFidelity, SLIM and Hand-Made LODs"
tags: [roblox, community-knowledge, blender, lod, performance, streaming]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/MeshPart
  - https://create.roblox.com/docs/reference/engine/enums/RenderFidelity
  - https://create.roblox.com/docs/reference/engine/enums/ModelLevelOfDetail
  - https://create.roblox.com/docs/workspace/streaming/slim
  - https://gamesbeat.com/?p=311638
---
# Level of Detail on Roblox - RenderFidelity, SLIM and Hand-Made LODs

In most engines you export LOD0-LOD3 meshes and the engine swaps them by distance. Roblox does not take artist-made LOD chains on a MeshPart (no such property in the MeshPart API as of 2026-10-25). Instead it gives you three engine systems plus whatever you script yourself. Knowing which one handles what lets you model sensibly: spend triangles where the camera actually gets close, and let the engine simplify the rest.

## The three engine systems

| System | Where | What it does |
| --- | --- | --- |
| `MeshPart.RenderFidelity` | Each MeshPart | `Automatic` (default) renders highest detail under 250 studs, medium at 250-500, lowest beyond 500. `Precise` always full. `Performance` simplifies aggressively. |
| `Model.LevelOfDetail = SLIM` | A Model, needs StreamingEnabled | Cloud-generated composite meshes with several detail levels, fewer draw calls, removes hidden internal geometry; still visible when streamed out. |
| `Model.LevelOfDetail = StreamingMesh` | A Model (legacy) | Coarse coloured "imposter" with no textures beyond the streaming radius. Docs offer a script to convert these to SLIM. |

SLIM requirements from the docs: StreamingEnabled on, place saved to Roblox, Team Create on. It is meant for **static** geometry; changing parts, materials or geometry at runtime stops it rendering correctly. Composite/imposter meshes have no physics, collision or raycasts (they are visual only).

## Modeling guidance that follows from this

- **RenderFidelity is automatic decimation.** It cannot know which edges matter; thin details (railings, antennae, chain links) break first. For those, use `Precise` only on hero assets near the play area, or model them as separate small meshes that you can cull.
- **Silhouette first.** Automatic LOD keeps rough shape; spend triangles on outline, not on flat interiors.
- **Group world props into Models** by area or building so SLIM can composite them; a thousand loose MeshParts at the Workspace root cannot be SLIM'd as a unit.
- **Do not hide geometry inside other geometry** expecting it to be free. Only SLIM removes hidden internals, and only at distance.

## Hand-made LOD (when you still need it)

For a few cases a scripted swap is worth it: a giant boss visible across the map, a skybox city, or a vehicle shown in a showroom.

1. Export `Tower_LOD0` (full) and `Tower_LOD1` (about 25% of the triangles) with the same pivot.
2. Keep both under one Model; LOD1 starts with `Transparency = 1`, `CanCollide = false`, `CanQuery = false`.
3. A client script checks distance every ~0.25 s (not every frame) and toggles `Transparency` between the two with a small hysteresis band (e.g. swap at 300 studs going out, 280 coming in) so they do not flicker.
4. Keep collision on LOD0 only, or on a separate invisible box.

For background-only scenery (mountains, skyline), skip swaps: model one low-poly version and use `RenderFidelity = Performance`.

## Budget reminders

- Per-mesh hard cap: 20,000 triangles (General specifications).
- Triangles are often not the bottleneck on Roblox; draw calls and unique textures are. Reusing a mesh many times (instancing) usually beats making it lighter.
- Measure with the MicroProfiler and the Developer Console (memory per category) on a phone, not on your PC.

## Checklist

- [ ] Hero assets near players: `RenderFidelity` decided per asset
- [ ] World props grouped into Models; SLIM tested in a published place
- [ ] Nothing interactive relies on composite meshes
- [ ] Hand-made LODs only for a few huge, far-visible assets, with hysteresis

## Related
[[3D Modeling Blender - Hub]] · [[Texture Memory and Triangle Budgets for Roblox Scenes]] · [[FBX Import Settings, Scale and Collision Fidelity]] · [[Low, Mid, and High Poly Strategy]]
