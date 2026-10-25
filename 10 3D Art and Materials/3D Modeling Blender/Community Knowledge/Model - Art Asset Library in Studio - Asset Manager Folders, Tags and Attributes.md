---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Art Asset Library in Studio - Asset Manager Folders, Tags and Attributes"
tags: [roblox, community-knowledge, 3d-art, pipeline, asset-manager, organization]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/assets/manager
  - https://create.roblox.com/docs/projects/assets/packages
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/studio/importer
---
# Art Asset Library in Studio - Asset Manager Folders, Tags and Attributes

After a few months a Roblox project has hundreds of meshes, images and materials with names like `Meshes/rock_final2`. Artists re-upload things that already exist, scripts grab the wrong version, and nobody knows which assets are licensed CC BY. A small library system fixes this at three levels: **the cloud inventory** (Asset Manager folders), **the place** (a fixed folder layout for source models) and **metadata on the instances** (tags and attributes). Packages are covered separately in [[Packages for Beginners - Reuse One Asset Everywhere]] and [[Packages for Map Kits - Shared Props Across Places Without Drift]].

## Level 1: Asset Manager folders (cloud inventory)

The Asset Manager (Window menu or Home tab) bulk-imports images, meshes and more, and now supports **folders** inside My Inventory, group inventories that support folder operations, and a game's own inventory under Project.

Limits from the docs: up to 50,000 folders per account or root inventory, 100 child folders per folder, 20,000 assets per folder, 20 levels of nesting. Assets and folders move only **within the same inventory** (no moves from personal to group). Folder names cannot contain `\ / : * ? " < > |` or end with a period.

A layout that works (upload everything for a group game to the **group**, not a personal account):

```
Project
  Env/        Rocks, Trees, Buildings, Props
  Characters/ NPCs, Pets
  Weapons/
  UI/         Icons, Frames
  Materials/  Textures for MaterialVariants
  _Deprecated/
```

## Level 2: the source-of-truth place layout

Keep one master copy of every imported asset in a known place so scripts and builders never use stray copies:

```
ServerStorage
  ArtLibrary
    Env
    Props
    Weapons
ReplicatedStorage
  ClientAssets   (things the client clones: VFX, pets, viewmodels)
```

- Builders drag from `ArtLibrary` (or the package version), never duplicate from a random spot in Workspace.
- Use the Importer once per asset and keep the imported model as the master; re-import with the same name to update.

## Level 3: tags and attributes as metadata

`CollectionService` tags (Properties panel > Tags) and attributes travel with the instance, are searchable, and cost nothing at runtime when unused.

| Metadata | As | Example |
|---|---|---|
| Asset category | Tag | `Art_Prop`, `Art_Foliage`, `Art_Hero` |
| Source and licence | Attributes | `Source = "ambientCG"`, `License = "CC0"` |
| Author | Attribute | `Author = "TDOD"` |
| Budget class | Attribute | `TriClass = "S"` (S < 500, M < 2k, L < 10k: house values) |
| Status | Tag | `Art_WIP`, `Art_Final` |

A command-bar audit can then list anything without a licence attribute:

```lua
for _, m in game:GetService("ServerStorage").ArtLibrary:GetDescendants() do
	if m:IsA("Model") or m:IsA("MeshPart") then
		if m:GetAttribute("License") == nil then
			print("No licence:", m:GetFullName())
		end
	end
end
```

Explorer search also filters by tag and property, which makes "select all foliage" a one-line query.

## Naming that matches all three levels

Use the same name in Blender, the uploaded asset, and the Studio instance (`SM_Rock_Large_A`, `T_Rock_Large_A_Color`); see [[Art - Naming Conventions for Meshes, Materials and Textures]]. When names match, the Asset Manager search, the Explorer and your scripts all find the same thing.

## Pitfalls

- Uploading to a personal inventory for a group game: assets cannot be moved across inventories later, and permissions get messy.
- Keeping licence info only in a spreadsheet: it drifts. Put it on the instance and keep the log ([[Asset and License Log Template]]).
- Deleting "unused" assets from inventory while old places still reference them.

## Related
[[3D Modeling Blender - Hub]] - [[Art - Naming Conventions for Meshes, Materials and Textures]] - [[Packages for Map Kits - Shared Props Across Places Without Drift]] - [[Asset Manager]]
