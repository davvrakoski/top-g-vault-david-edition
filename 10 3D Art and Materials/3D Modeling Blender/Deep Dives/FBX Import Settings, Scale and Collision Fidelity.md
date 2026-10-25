---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
tags: [deep-dive, roblox, fbx, importer, collision-fidelity, meshpart]
verified: 2026-10-25
cssclasses: [tg-a10]
---

# FBX Import Settings, Scale and Collision Fidelity

## Why this matters
Most "my model is broken in Roblox" reports come from three decisions made in about ten seconds in the Importer: units, pivots and collision. Get them wrong and you get tiny or giant meshes, props that rotate around a point in space, and walls players can walk through or doorways they can't.
This note covers each Importer setting, the mesh rules Studio enforces, and how to choose collision and render fidelity per asset type.

---

## 1. Before you export: Roblox's mesh rules

From Creator Docs › Art › General specifications and Texture specifications:

| Rule | Requirement |
|---|---|
| Triangle budget | An individual mesh **cannot exceed 20,000 triangles** (avatar items have their own budgets) |
| Watertight | No exposed holes or backfaces |
| N-gons | Quads where possible, no n-gons |
| Volume | No zero-thickness geometry |
| UVs | **Single UV set**, coordinates inside **0–1**, overlaps allowed |
| Materials | A mesh object can only have **one material** assigned |
| Rigs | Bones frozen (scale 1, rotation 0), root at 0,0,0, max 4 influences per vertex, no influence on the root |
| Animation | One animation track per FBX export |
| Textures | `.png`, `.jpg`, `.tga`, `.bmp` up to 4096×4096; normal maps must be **OpenGL tangent-space** |

**Multi-material sources** (common in scanned or store assets): split by material in Blender before export, or expect the Importer to produce **several MeshParts** under one Model. Check the hierarchy panel before importing.

The Poly Haven models in the vault ship textures as `.exr` for some maps (normal, metal, roughness). **`.exr` is not a supported Roblox image format.** Convert to `.png` first (see [[SurfaceAppearance PBR from Poly Haven Textures]]).

---

## 2. The Importer, setting by setting

Open with **File › Import**. One file opens the **import preview**; several files open the **import queue**.

### File General
| Setting | Default | Recommendation |
|---|---|---|
| Name | file name | Rename to your convention (`SM_Crate_Wood_A`) |
| Import Only As Model | On | Keep on for multi-part assets so they import as one Model asset |
| Upload to Roblox | On | **Off** while iterating (no inventory spam); on for final |
| Import as Package | Off | On for assets reused across places |
| Creator | you | Set to the **group** if the game is group-owned, otherwise you'll have permission problems later |
| Add to Workspace | On | Also grants the open game permission to use the restricted asset |
| Insert Using Scene Position | Off | On when importing pieces of a scene laid out in Blender |
| Keep Zero Influence Bones | Off | On only if you need helper bones (attachment points) |
| Set Pivot to Scene Origin | On | **Off** for props whose pivot you set deliberately in Blender |
| Anchored | Off | **On** for environment art (disabled automatically for rigged meshes) |
| Uses Cage | auto | Leave as detected; cages become `WrapLayer`/`WrapTarget` |

### Transform and Geometry
| Setting | Default | Notes |
|---|---|---|
| World Forward / World Up | Front / Top | Change only if the model arrives rotated; better to fix the export axes once |
| **Scale Unit** | **Studs** | Tells Studio what unit the file was authored in. If the file is in metres and you want real-world size, choose metres (1 stud = 28 cm, so 1 m ≈ 3.57 studs) |
| Merge Meshes | Off | On for static props made of many pieces; gives one MeshPart (fewer instances) |
| Invert Negative Faces | Off | Fixes meshes mirrored with negative scale |
| Make Double Sided (per object) | Off | Costs more performance; use only for thin foliage/cloth cards |
| Ignore Vertex Colors (per object) | Off | On if stray vertex colours tint your mesh |
| Use Imported Pivot (per object) | On | Keeps the object's own pivot |

**Presets:** after configuring one asset, use **⋯ › Save as new** (for example *Env Prop Anchored*), and **Set as default** for your team. In the queue, right-click › **Apply settings to all**.

### glTF vs FBX
The docs show the hierarchies differ: FBX imports a Model with MeshParts directly inside; glTF/GLB imports a Model containing **a Model per mesh**, with one MeshPart per primitive (and extra cage Models you can delete). Scripts that expect `model.MeshPart` paths break if you switch formats.

---

## 3. Scale: a reliable method

1. Decide the in-game size from gameplay metrics (door height, seat height, prop pick-up size), **not** from unit theory.
2. If you model for Roblox directly, treat 1 Blender unit as 1 stud (Studio defaults to Studs). Export with Roblox's documented Blender settings: **Path Mode = Copy** with **Embed Textures** on, **Apply Scalings = FBX Unit Scale**, **Add Leaf Bones off**, and **Bake Animation off** unless the file carries animation. If sizes still come in wrong, the Blender page's "Adjust scale (FBX)" section lists alternatives.
3. For third-party assets in real metres, either import with Scale Unit = metres (×3.57) or import at studs and use `Model:ScaleTo(factor)`.
4. Verify after import:

```lua
-- Command bar: print bounding size of selected models/parts in studs and metres
local Selection = game:GetService("Selection")
for _, inst in Selection:Get() do
	local size = inst:IsA("Model") and inst:GetExtentsSize() or (inst:IsA("BasePart") and inst.Size)
	if size then
		print(string.format("%s  %.2f x %.2f x %.2f studs  (%.2f x %.2f x %.2f m)",
			inst.Name, size.X, size.Y, size.Z, size.X * 0.28, size.Y * 0.28, size.Z * 0.28))
	end
end
```

Measured reference points from the vault library (Blender, metres): Poly Haven `ArmChair_01_1k` ≈ 0.85 × 0.77 × 1.07 m (5,626 tris); Kenney `building-block` = a 1-unit grid module. Poly Haven assets are real-world scale; Kenney kits are grid-scale (see [[Modular Kits from the Kenney FBX Library]]).

---

## 4. Collision fidelity: choose per asset type

`CollisionFidelity` (on `MeshPart` and `PartOperation`) options, lowest to highest cost per the docs:

| Option | Shape | Use for |
|---|---|---|
| `Box` | Bounding box | Small props, decoration, anything players don't walk inside |
| `Hull` | Convex hull | Rocks, barrels, rounded props without cavities |
| `Default` | Approximate, supports concavity | General complex objects |
| `PreciseConvexDecomposition` | Most accurate (still not 1:1), most expensive | Arches, door frames, stairs, terrain-like meshes players walk through or on |
| `Tunable` | Convex decomposition with a `CollisionPrecision` slider from 0 (fast) to 1 (precise) | When Default is too loose and Precise too heavy |

Rules that bite:
- `CollisionFidelity` **cannot be read or changed by scripts at runtime** (Engine API). `CollisionPrecision` is writable only by plugins. Set them in Studio before publishing.
- Toggle **Collision fidelity** in the viewport's Visualization Options to *see* the collision shapes. Do this for every hero asset.
- If players never touch it, use `CanCollide = false` plus `CanTouch = false` and `CanQuery = false`. No collision is cheaper than any fidelity.
- For complex walkable meshes, an **invisible simple collider** (a few anchored Parts) is often both cheaper and more predictable than Precise decomposition.

### Bulk-setting collision in edit mode

```lua
-- Command bar: Box collision + no touch/query for everything tagged "Decor"
local CollectionService = game:GetService("CollectionService")
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local rec = ChangeHistoryService:TryBeginRecording("DecorCollision")
for _, p in CollectionService:GetTagged("Decor") do
	if p:IsA("MeshPart") then
		p.CollisionFidelity = Enum.CollisionFidelity.Box
		p.CanTouch = false
		p.CanQuery = false
	end
end
if rec then ChangeHistoryService:FinishRecording(rec, Enum.FinishRecordingOperation.Commit) end
```

(This runs in Studio edit context, where the restriction on runtime scripts doesn't apply.)

---

## 5. Render fidelity

`MeshPart.RenderFidelity` defaults to `Automatic`: highest detail under 250 studs, medium at 250–500 studs, lowest beyond 500 studs. Options are `Automatic`, `Precise` (always highest) and `Performance`.

- Leave `Automatic` for almost everything.
- `Precise` only for meshes that must not visibly simplify, such as large hero landmarks seen from far away that pop when they simplify.
- `Performance` for background filler.

For grouped models there is also `Model.LevelOfDetail` (`ModelLevelOfDetail` enum), which affects how models render when streamed out at distance. Test it with streaming enabled.

---

## 6. Post-import audit (every asset)
1. Hierarchy as expected (one MeshPart per material).
2. Size correct (script above).
3. Pivot where you want it (rotate the model in place).
4. Collision visualized; fidelity matches the table.
5. Anchored for environment pieces.
6. Textures assigned; normal map looks correct under a moving light (an inverted green channel means a DirectX normal map was used).
7. Triangle count ≤ 20,000 per MeshPart, and within your scene budget ([[Texture Memory and Triangle Budgets for Roblox Scenes]]).
8. Asset and licence recorded in your asset log.

---

## Common mistakes
- Leaving *Set Pivot to Scene Origin* on for props, so they rotate around a point metres away.
- Importing with *Upload to Roblox* on during dozens of test imports.
- Importing to your personal account when the game is group-owned.
- Expecting scripts to set `CollisionFidelity` at runtime (they can't).
- Using `PreciseConvexDecomposition` on small props.
- Shipping DirectX-format normal maps (Roblox needs OpenGL).
- Uploading `.exr` maps or 4K maps for a 2-stud prop.
- Merging meshes that need separate collision or interaction.

## Checklist
- [ ] Mesh under 20k triangles, single UV set within 0–1, one material per mesh
- [ ] Textures converted to png/jpg/tga/bmp; normal map OpenGL format
- [ ] Import preset saved and shared with the team
- [ ] Creator set to the owning group
- [ ] Scale verified in studs against gameplay metrics
- [ ] Pivot verified
- [ ] Collision fidelity chosen per the table and visualized
- [ ] `RenderFidelity` left at Automatic unless justified
- [ ] Decor props: CanTouch/CanQuery off

---

**Sources checked (2026-10-25):** Creator Docs: Studio › Importer; Art › General specifications; Art › Texture specifications; Workspace › Collisions (Mesh and solid model collisions); Physics › Roblox units; Engine API: TriangleMeshPart (CollisionFidelity, CollisionPrecision), MeshPart.RenderFidelity, CollisionFidelity enum, Model.LevelOfDetail.

**Related:** [[3D Modeling Blender - Hub]] · [[FBX Asset Library - Hub]] · [[Roblox Mesh and Avatar Geometry Specs — 2026 Snapshot]] · [[Blender Game-Ready Audit]] · [[Meshes, Topology and Blender]] · [[Tripo → Blender → Roblox Production Pipeline]]
