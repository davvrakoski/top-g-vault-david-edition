---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "EditableMesh and EditableImage - Runtime Uses, Limits and Gotchas"
tags: [roblox, community-knowledge, 3d-art, editablemesh, editableimage, procedural]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/EditableMesh
  - https://create.roblox.com/docs/reference/engine/classes/EditableImage
  - https://create.roblox.com/docs/reference/engine/classes/AssetService
  - https://devforum.roblox.com/t/editablemesh-memory-leak/2907271
  - https://devforum.roblox.com/t/editablemesh-rate-limit/3525044
---
# EditableMesh and EditableImage - Runtime Uses, Limits and Gotchas

`EditableMesh` and `EditableImage` let scripts build or change mesh geometry and textures while the game runs: deformable terrain chunks, dents in a car, procedural rocks, a paint canvas, a minimap drawn pixel by pixel. They are powerful but expensive, gated by a settings toggle and asset permissions, and capped in size. This note is the "should I use it, and what will bite me" summary as of October 2026; the full API is in the official class pages.

## Status snapshot (from the official docs, Oct 2026)

- **Opt-in for published games:** both fail by default outside Studio. Enable *Configure > Settings > Enable Mesh / Image APIs* on the Creator Dashboard, or *Experience Settings > Security > Allow Mesh / Image APIs* in Studio, after reviewing the Terms of Use.
- **Permissions:** `AssetService:CreateEditableMeshAsync()` / `CreateEditableImageAsync()` only load assets owned by or shared with the experience owner, the Studio user, the player (client side), or a group where they have edit rights. Other assets throw.
- **Memory:** strict client-side memory budgets; the server, Studio and plugins are unlimited. Docs suggest `FixedSize` meshes and multi-referencing one editable object from several Content properties to save memory.
- **EditableMesh limits:** 60,000 vertices and 20,000 triangles (a quad face counts as 2).
- **EditableImage limits:** maximum 1024x1024, not resizable (create a new one and draw into it). Only one displayed `EditableImage` updates per frame.
- **Ephemeral content:** `AssetService:CreateDataModelContentAsync()` turns an editable mesh or image into DataModel-scoped content; it can fail with `StorageLimitExceeded`.

## Creating and showing a mesh

1. `AssetService:CreateEditableMesh()` (blank) or `CreateEditableMeshAsync(Content.fromAssetId(id))` (copy of an asset, fixed-size by default; pass `{FixedSize = false}` to add or remove faces).
2. Build with `AddVertex`, `AddTriangle`, or `AddFace` (3 or 4 vertex IDs).
3. Display by creating a MeshPart: `AssetService:CreateMeshPartAsync(Content.fromObject(editable))`.
4. After big edits, collision does not update by itself: create a new MeshPart and `MeshPart:ApplyMesh()` to refresh collision and fluid geometry.

Vertex, face, UV and normal IDs are **stable but not sequential**. Iterate the tables from `GetVertices()` / `GetFaces()`, never `for i = 1, n`.

Face winding: front faces have counter-clockwise vertices when seen from the front. A procedural mesh that looks invisible is usually wound the wrong way.

## Good uses

| Use | Why it fits |
|---|---|
| Procedural rocks, caves, terrain tiles | geometry generated once per session, then left alone |
| Damage dents, soft-body wobble | small vertex moves on a fixed-size mesh |
| Mesh-accurate hit tests | `RaycastLocal` and closest-point queries work without displaying the mesh |
| Paint / decal canvas, minimap, fog-of-war | `EditableImage` with `WritePixelsBuffer` on a `buffer` |
| Player-made content | combined with `PromptCreatePlatformContentAsync` publishing flows |

## Poor uses

- Anything a pre-made mesh, `Bone` deformation or a `Decal` swap can do.
- Per-frame full rewrites of large meshes or 1024 images on mobile.
- Server-built meshes you expect every client to see: community threads report that editable data does not replicate, so build on each client or publish to content (unverified against current docs; test it).

## Gotchas

1. Call `:Destroy()` on editables you no longer need; `EditableImage:Destroy()` frees memory immediately. A DevForum thread reports leaks when this is skipped (link below).
2. Loading many assets quickly can be rate-limited (community report of HTTP 429 from `CreateEditableMeshAsync`).
3. Pixel writes are fastest with `WritePixelsBuffer` on a reused `buffer`, not per-pixel calls.
4. Test on a low-end phone early; memory budgets are a client concern.

## Related
[[3D Modeling Blender - Hub]] - [[Texture Memory and Triangle Budgets for Roblox Scenes]] - [[Parts, Unions or MeshParts - Choosing the Geometry Type]] - [[Level of Detail on Roblox - RenderFidelity, SLIM and Hand-Made LODs]]
