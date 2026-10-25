---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/slim-renderfidelity-lod"
title: "SLIM, RenderFidelity and LOD Choices for Map Builders"
tags: [roblox, community, optimization, lod, slim, streaming, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/workspace/streaming/slim
  - https://create.roblox.com/docs/reference/engine/classes/Model#LevelOfDetail
  - https://create.roblox.com/docs/reference/engine/enums/RenderFidelity
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/performance-optimization/improve
---
# SLIM, RenderFidelity and LOD Choices for Map Builders

Roblox gives map builders four level-of-detail (LOD) levers. They overlap, and old tutorials still talk about ones that have been replaced. This note sorts them out for people building worlds; the scripting side of streaming is in [[StreamingEnabled Gotchas and Streaming-Safe Client Code]].

## The levers
| Lever | Set on | What it does | Use for |
|---|---|---|---|
| `MeshPart.RenderFidelity` | Each mesh / union | `Automatic` (default) lowers detail with distance: highest under 250 studs, medium 250-500, lowest beyond 500. `Precise` always full detail. `Performance` favours speed over looks | Leave on Automatic; `Precise` only for hero meshes seen up close from far away |
| `Model.LevelOfDetail` = `SLIM` | Models (needs streaming) | Cloud-generated composite meshes with several LOD levels; renders even after the model streams out | Buildings, rock clusters, landmarks, static props |
| `Model.LevelOfDetail` = `StreamingMesh` | Models (needs streaming) | Older coarse "imposter" mesh outside the streaming radius, no textures | Legacy; convert to SLIM |
| `Workspace.EnableSLIMAvatars` | Workspace | Cheap animated stand-ins for distant player avatars | Crowded hubs, concerts, social games |
| Manual culling | Your scripts | Hide or remove things yourself by zone or distance | Interiors, dense cities (see [[Zone Visibility Culling for Indoor and City Maps]]) |

## SLIM in practice (Creator Docs)
**Requirements:** `StreamingEnabled` on, the place **saved to Roblox** (not a local file) and **Team Create** enabled, because SLIM assets are generated in the cloud.

**What SLIM does:** combines a model's parts into fewer draw calls, builds several LOD levels, removes hidden inner geometry and optimises textures. All parts of a model switch LOD together, so there's no part-by-part popping. The docs show distance bands: full parts up close, SLIM composite when more efficient, SLIM only (with a tiny placeholder in the DataModel) once streamed out, then nothing.

**Works on** Parts, MeshParts, Decals, Textures, SurfaceAppearance, unions/negates and SpecialMeshes inside the model.

**Does not work for:**
- Models changed at runtime (parts added/removed, properties changed) or animated models.
- Models containing a `Humanoid` (NPCs are excluded; SLIM avatars cover players only, R15 only).
- Models with `Scale` 0.
- Platforms where SLIM isn't supported yet: those fall back to `Disabled`.

**First run:** generation happens in the background; if a model doesn't show as SLIM straight away, wait a minute or two and rejoin.

**Debug:** Studio's Visualization Options and the Developer Console's `SlimTintMode` colour models by LOD level, by streaming state, or (in edit mode) by transcoder status.

## How to structure a map for SLIM
- **One Model per static building or cluster**, not one giant "Map" model and not thousands of single-part models. A whole street block is a good size.
- **Separate the moving parts.** Doors, lights that change, collectibles and anything scripted go in a different Model (or folder) that is *not* SLIM, so the static shell can be.
- **Landmarks first.** The biggest win is distant silhouettes that used to vanish at the streaming radius. Mark them SLIM before anything else (see [[Wayfinding with Landmarks and Weenies]]).
- **Converting from StreamingMesh:** the docs give a command-bar loop that switches every `StreamingMesh` model to `SLIM`; some models with overlapping parts or complex unions may need fixes after.

## Command bar: list models still on the legacy setting
```lua
local legacy, slim = 0, 0
for _, d in workspace:GetDescendants() do
	if d:IsA("Model") then
		if d.LevelOfDetail == Enum.ModelLevelOfDetail.StreamingMesh then
			legacy += 1
			print("StreamingMesh:", d:GetFullName())
		elseif d.LevelOfDetail == Enum.ModelLevelOfDetail.SLIM then
			slim += 1
		end
	end
end
print(slim, "SLIM models,", legacy, "legacy StreamingMesh models")
```

## What none of these do
- They don't fix **too many unique meshes and textures**: each unique asset still costs memory. Reuse assets ([[Map Performance Budgets - Draw Calls, Triangles and Mesh Reuse]]).
- They don't remove **collision cost**. LOD composites have no physics; your original parts still collide, so simplify collision separately ([[FBX Import Settings, Scale and Collision Fidelity]]).
- They don't stop **transparency overdraw** up close.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[SLIM]] · [[Instance Streaming Deep Dive]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[Map Audit Command Bar Script - Parts, Mesh IDs, Collision and Shadows]]

<!-- TDOD_GRAPH_END -->
