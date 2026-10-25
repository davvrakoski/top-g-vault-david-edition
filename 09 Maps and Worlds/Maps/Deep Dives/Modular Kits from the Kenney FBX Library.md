---
area: "09 Maps and Worlds"
cluster: "Maps"
tags: [deep-dive, roblox, modular-kit, kenney, fbx, level-art]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Modular Kits from the Kenney FBX Library

## Why this matters
The vault ships 49 Kenney kits (4,436 FBX, all CC0) that can take a Roblox map from greybox to shippable stylized art in days instead of weeks, but only if they are imported at one consistent scale, snapped to one grid and textured from one shared palette.
Done carelessly, a kit becomes thousands of mismatched MeshParts with random pivots, wrong sizes and duplicate textures. This note is the repeatable pipeline.

---

## 1. What is actually in the library (measured)

From the [[FBX Asset Library - Hub]] and a measurement pass in Blender 5.2 on 2026-10-25:

| Fact | Detail |
|---|---|
| License | CC0 1.0 for every Kenney kit (`License.txt` in each folder). Credit is appreciated, not required. |
| Texturing | Kits use a tiny shared palette texture, `colormap.png` (for example 7.5 KB in Modular Buildings), plus some `variation-a/b.png`. One texture serves the whole kit. |
| Geometry | Very low triangle counts. Measured: `building-block` 12 tris, `building-door` 28, `building-sample-house-a` 304, animals ~260–290. |
| Materials | One material per mesh in the files measured, so each piece imports cleanly as a single MeshPart. |
| Grid | Modular Buildings pieces measure **1.0 × 1.0** units in footprint (Blender metres) with a 0.625 depth/height axis. Sample houses are about 1.1 × 2.0 × 1.1. Pieces are built on a **1-unit grid**. |

> [!warning] Four kits are ASCII FBX
> A header scan found **734 ASCII-format FBX files** in four kits: **Furniture Kit (140), Nature Kit (329), Racing Kit (112), Space Kit (153)**. All other Kenney kits are binary FBX.
> Blender's FBX importer refuses ASCII FBX ("ASCII FBX files are not supported"). Roblox's docs don't say whether the Studio Importer accepts ASCII FBX. **Test one file first.** If it fails, either convert with a tool that reads ASCII FBX, or download the same CC0 kit from kenney.nl in its GLB/OBJ formats (the Studio Importer supports `.gltf`/`.glb` and `.obj`).

---

## 2. Decide your kit scale once

Roblox's units page gives **1 stud = 28 cm**, so 1 m ≈ **3.57 studs**. That is the physically correct conversion, but Kenney's modules are not built to real-world metres for Roblox avatars. A 1-unit Kenney wall scaled ×3.57 becomes a 3.57-stud wall, smaller than a default avatar (about 5 studs tall).

Choose the scale from **gameplay metrics**, not unit theory:

| Kit type | Rule of thumb | Typical factor (verify!) |
|---|---|---|
| Modular buildings, dungeons, castles (1-unit grid) | One grid cell ≈ one comfortable doorway width + walls | ×8 (8-stud modules) |
| Props (furniture, food, survival) | Chair seat at avatar seat height | ×3.57 to ×5 |
| Vehicles (Car Kit, Toy Car Kit) | Avatar fits in the seat | Measure the seat; often ×4–×6 |
| Characters (Blocky, Mini) | Match your rig or keep them as NPC decoration | Case by case |

Write the chosen factor for each kit in your map note and **never mix factors inside one kit**. Use the metrics gym from [[Map Blockout to Art Pass Workflow]] to confirm: walk through a door, jump onto a ledge, check camera clearance indoors.

### Two ways to apply scale
1. **At import:** the Importer's *File Geometry › Scale Unit* setting tells Studio what units the file uses (default **Studs**). Picking a metric unit applies the metric conversion (×3.57 for metres), which is usually too small for buildings. Use it for props.
2. **After import (recommended for building kits):** import at Studs, then scale every model by your factor with `Model:ScaleTo()`. This scales parts, offsets and attachments together.

```lua
-- Command bar (edit mode): scale every Model in a folder by a kit factor
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local FOLDER = workspace:WaitForChild("Kit_ModularBuildings")
local FACTOR = 8

local rec = ChangeHistoryService:TryBeginRecording("ScaleKit")
for _, m in FOLDER:GetChildren() do
	if m:IsA("Model") then
		m:ScaleTo(m:GetScale() * FACTOR)
	end
end
if rec then ChangeHistoryService:FinishRecording(rec, Enum.FinishRecordingOperation.Commit) end
```

If the importer produced bare MeshParts (with *Import Only As Model* off), group them into Models first, or scale `Size` and positions manually.

---

## 3. Import pipeline (per kit)

1. **File › Import**, select all FBX in the kit folder. They appear in the **import queue**.
2. In one item's settings, set:
   - *Upload to Roblox*: **off** while iterating (avoids filling your inventory with test copies); **on** for the final import.
   - *Add to Workspace*: on.
   - *Anchored*: **on** (environment pieces).
   - *Set Pivot to Scene Origin*: keep consistent. For snapping kits, Kenney pivots are usually at a corner or base, so **Use Imported Pivot** keeps them grid-aligned.
   - *Merge Meshes*: off for modular pieces; on only for a finished, static prop group.
3. Right-click that item › **Apply settings to all**, then **Save as new** preset (for example *Kenney Modular*).
4. Import, then move everything into a `Kit_<Name>` folder in `ServerStorage` (library) and only place copies in Workspace.
5. **Texture:** check that pieces show the palette. If a MeshPart is untextured, upload `colormap.png` once and assign it to every piece:

```lua
-- Command bar: assign one uploaded palette texture to every MeshPart in a kit
local KIT = game:GetService("ServerStorage"):WaitForChild("Kit_ModularBuildings")
local TEXTURE = "rbxassetid://0000000000" -- replace with your uploaded colormap.png ID
for _, d in KIT:GetDescendants() do
	if d:IsA("MeshPart") then
		d.TextureID = TEXTURE
	end
end
```

One shared texture across hundreds of pieces is one of the cheapest art setups possible on Roblox. Don't break it by re-uploading the palette per piece.

6. **Collision pass:** set `CollisionFidelity = Box` on walls, floors and simple blocks, `Hull` on rounded props. Use `PreciseConvexDecomposition` only for walk-through pieces such as arches and door frames whose openings must be passable (see [[FBX Import Settings, Scale and Collision Fidelity]]).
7. **Physics flags:** decorative props get `CanTouch = false`, `CanQuery = false` and often `CastShadow = false` for tiny items.

---

## 4. Building with the kit

- **Studio grid:** set Move increment to your module size (8 studs at ×8) and Rotate to 90°. Kenney modules are designed to snap on a grid; free placement breaks the seams.
- **Packages for reuse:** convert each finished building (not each tiny piece) to a **Package** so edits propagate across every copy. Packages auto-update (`PackageLink.AutoUpdate`) when enabled.
- **Prefab, then dress:** build 3–5 "sample" buildings from the kit (the kit includes `building-sample-*` references), package them, and use variations (colour, roof, door) rather than hand-building every house.
- **Mix kits only if they share style:** City Kit (Commercial/Industrial/Suburban/Roads) pieces are designed to work together; Modular Buildings with Fantasy Town Kit look different. Mixing styles reads as "asset flip".
- **Recolour by palette swap:** palette textures map UV islands to colour swatches, so a recolour is just a copy of `colormap.png` with shifted swatches assigned to a variant set (for example a "winter" town). `MeshPart.Color` only shows through transparent areas of a texture, so it won't tint an opaque palette.

### Suggested kit pairings

| Game type | Kits |
|---|---|
| Greybox / prototyping | Prototype Kit |
| Town hub / simulator lobby | City Kit (Commercial, Suburban, Roads), Modular Buildings |
| Fantasy RPG | Fantasy Town Kit, Castle Kit, Retro Fantasy Kit, Nature Kit (ASCII, see above) |
| Dungeon / roguelite | Modular Dungeon Kit, Mini Dungeon, Graveyard Kit |
| Sci-fi | Space Station Kit, Modular Space Kit, Space Kit (ASCII) |
| Obby / platformer | Platformer Kit, Marble Kit, Coaster Kit |
| Tower defense | Tower Defense Kit, Hexagon Kit |

---

## 5. Performance notes
- Kenney geometry is light. The cost usually comes from **instance count**, not triangles. A street built from 1×1 modules can be thousands of MeshParts. Merge static, never-interacted sections (Importer *Merge Meshes* on a Blender-combined export, or build bigger modules in Blender) once the layout is locked.
- Group by zone in Models with sensible `ModelStreamingMode` so streaming can unload whole districts.
- Keep `RenderFidelity = Automatic` (the default) so distant meshes can use lower detail; `Precise` everywhere wastes performance.

---

## Common mistakes
- Using ×3.57 for building kits because it is "the conversion", so doors end up shorter than avatars.
- Mixing scale factors between pieces of one kit, which leaves seams that never line up.
- Re-uploading `colormap.png` for each piece, which multiplies texture memory and inventory clutter.
- Importing hundreds of pieces with *Upload to Roblox* on during experiments.
- Leaving `PreciseConvexDecomposition` (or the default) on hundreds of simple wall modules.
- Assuming every kit is binary FBX; four are ASCII and may need a different source format.
- Placing pieces freehand without a grid.
- Shipping the Kenney sample buildings unchanged as hero assets. They are CC0, but unmodified kit buildings make a map look generic and can hurt "unique metadata/visuals" goals.

## Checklist
- [ ] Kit chosen for style coherence; license file kept in the project's asset log
- [ ] ASCII FBX check done (Furniture, Nature, Racing, Space kits)
- [ ] One scale factor per kit decided from metrics and written down
- [ ] Import preset saved (anchored, pivots consistent, upload off for tests)
- [ ] Single palette texture uploaded once and shared
- [ ] Collision fidelity and physics flags set per piece type
- [ ] Studio grid matches the module size
- [ ] Finished buildings converted to Packages
- [ ] Instance count reviewed per zone; static sections merged after layout lock

---

**Sources checked (2026-10-25):** Vault library files in `20 FBX Asset Library\Kenney` (licence files, textures, FBX headers, Blender 5.2 measurements); Creator Docs: Studio › Importer; Physics › Roblox units; Engine API: Model.ScaleTo, MeshPart, PackageLink, CollisionFidelity, RenderFidelity.

**Related:** [[FBX Asset Library - Hub]] · [[Kenney - Modular Buildings]] · [[Kenney - Prototype Kit]] · [[Buildings, Interiors and Modular Streaming]] · [[Low-Poly Village Kit — Clean Stylized Production]] · [[Asset and License Log Template]]
