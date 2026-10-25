---
title: "InsertService"
description: "Used to insert assets from the Roblox website."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/InsertService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Used to insert assets from the Roblox website.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

InsertService is used to insert assets from the Roblox website, typically the [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|LoadAsset]] function.

To load an asset, it must be accessible by the creator of the experience loading it, which can be either a user or group. Should an experience be uploaded by a different creator, the asset data would not be accessible. See the [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|LoadAsset()]] method for more details on this security check. Note that you should **not** use this service for loading API keys or other secrets. Use [[30 Official Roblox Docs/API Reference/Classes/HttpService#GetSecret|HttpService:GetSecret()]] instead.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/AssetService|AssetService]], which can provide information about assets you might want to load using InsertService

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#AllowInsertFreeModels\|AllowInsertFreeModels]] | boolean | **Deprecated.** Indicates whether ''Free Models'' can be inserted into the game. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#ApproveAssetId\|ApproveAssetId()]] | () | **Deprecated.** Deprecated. Accepts an asset ID for InsertService approval; calling it has no effect. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#ApproveAssetVersionId\|ApproveAssetVersionId()]] | () | **Deprecated.** Deprecated. Accepts an asset version ID for InsertService approval; calling it has no effect. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#CreateMeshPartAsync\|CreateMeshPartAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with specified fidelity values. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetBaseCategories\|GetBaseCategories()]] | Array | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetBaseSets\|GetBaseSets()]] | Array | **Deprecated.** Returns an array of dictionaries, containing information about various Roblox approved sets. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetCollection\|GetCollection()]] | Array | **Deprecated.** Returns the most recently uploaded models in the specified category. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetFreeDecals\|GetFreeDecals()]] | Array | **Deprecated.** Retrieves a list of free Decals from the Catalog. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetFreeDecalsAsync\|GetFreeDecalsAsync()]] | Array | Retrieves a list of free Decals from the Catalog. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetFreeModels\|GetFreeModels()]] | Array | **Deprecated.** Retrieves a list of Free Models from the Catalog. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetFreeModelsAsync\|GetFreeModelsAsync()]] | Array | Retrieves a list of Free Models from the Catalog. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetLatestAssetVersionAsync\|GetLatestAssetVersionAsync()]] | int64 | Returns the latest AssetVersionId of an asset for assets created by the place creator. Can be used in combination with [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAssetVersion\|InsertService:LoadAssetVersion()]] to load the latest version of a model, even if it gets updated while the game is running. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetUserCategories\|GetUserCategories()]] | Array | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetUserSets\|GetUserSets()]] | Array | **Deprecated.** Returns an array of dictionaries, containing information about sets owned by the user. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#Insert\|Insert()]] | () | **Deprecated.** Inserts [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] into [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset\|LoadAsset()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] containing the asset. |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#loadAsset\|loadAsset()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAssetVersion\|LoadAssetVersion()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns a model inserted into [[30 Official Roblox Docs/API Reference/Classes/InsertService\|InsertService]] containing the asset with the given assetVersionId. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AllowInsertFreeModels

> [!warning] Deprecated
> This item was never released. Do not use it in new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** LoadUnownedAsset · **Tags:** `NotReplicated`, `NotBrowsable`, `Deprecated`

The AllowInsertFreeModels property toggles whether ''Free Models'' can be inserted into the game, regardless of whether the place owner owns the asset.

## Methods

### ApproveAssetId

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

```lua
InsertService:ApproveAssetId(assetId: int64): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Deprecated. Accepts an asset ID that was once used to approve assets for [[30 Official Roblox Docs/API Reference/Classes/InsertService|InsertService]]. Calling it has no effect. Retained only for backward compatibility; do not use it in new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  | The ID of the asset. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ApproveAssetVersionId

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

```lua
InsertService:ApproveAssetVersionId(assetVersionId: int64): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Deprecated. Accepts an asset version ID that was once used to approve assets for [[30 Official Roblox Docs/API Reference/Classes/InsertService|InsertService]]. Calling it has no effect. Retained only for backward compatibility; do not use it in new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetVersionId` | int64 |  | The version ID of the asset. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### CreateMeshPartAsync

```lua
InsertService:CreateMeshPartAsync(meshId: ContentId, collisionFidelity: CollisionFidelity, renderFidelity: RenderFidelity): MeshPart
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Creates a new [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] with specified [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|CollisionFidelity]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity|RenderFidelity]]. Because [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshId|MeshPart.MeshId]] is read only, this is the way to create a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] through scripts without having to clone an existing one. It throws errors if creation fails.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `meshId` | ContentId |  | Mesh asset ID. |
| `collisionFidelity` | [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity\|CollisionFidelity]] |  | Set [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity\|MeshPart.CollisionFidelity]]. |
| `renderFidelity` | [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity\|RenderFidelity]] |  | Set [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity\|MeshPart.RenderFidelity]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] | New [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] instance. |

### GetBaseCategories

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

```lua
InsertService:GetBaseCategories(): Array
```

**Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| Array |  |

### GetBaseSets

> [!warning] Deprecated
> [Sets have been removed](https://devforum.roblox.com/t/sunsetting-sets/189402)
> from Roblox.

```lua
InsertService:GetBaseSets(): Array
```

**Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

Returns an array of dictionaries, containing information about various Roblox approved sets.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of dictionaries containing information about Roblox-approved sets. |

### GetCollection

> [!warning] Deprecated
> [Sets have been removed](https://devforum.roblox.com/t/sunsetting-sets/189402)
> from Roblox.

```lua
InsertService:GetCollection(categoryId: int64): Array
```

**Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

Returns the most recently uploaded models in the specified category.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `categoryId` | int64 |  | The ID of the set (category) to retrieve models from. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of the most recently uploaded models in the specified set. |

*Code samples for this member (`InsertService-GetCollection1`) are published on the source page; their code is not part of the open-source repo.*

### GetFreeDecals

> [!warning] Deprecated
> Use `Class.InsertService:GetFreeDecalsAsync()|GetFreeDecalsAsync()`
> instead.

```lua
InsertService:GetFreeDecals(searchText: string, pageNum: int): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Retrieves a list of free Decals from the Catalog.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `searchText` | string |  | String used to search for free decals in the Catalog. |
| `pageNum` | int |  | The page number in the Catalog to return. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A single table (of returned free decals) wrapped in a table. |

*Code samples for this member (`InsertService-GetFreeDecals1`) are published on the source page; their code is not part of the open-source repo.*

### GetFreeDecalsAsync

```lua
InsertService:GetFreeDecalsAsync(searchText: string, pageNum: int): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

The GetFreeDecalsAsync function retrieves a list of free [[30 Official Roblox Docs/API Reference/Classes/Decal|Decals]] from the Catalog. The return type for this method is very odd, as it returns a single table wrapped in a table.

The best way to explain it is to show a visual of the array returned:

```lua
[1] = {
	CurrentStartIndex = 1, -- This can vary depending on the page you input.
	TotalCount = 21, -- Always 21.
	Results = {
		-- All parameters here are pseudo. They can vary depending on the asset.
		[1] = {
			Name = "Asset Name",
			AssetId = 0000000,
			AssetVersionId = 0000000,
			CreatorName = "Roblox",
		},
		-- [2], [3], and so on... up to [21]
	},
}
```

An example for iterating over this list has been provided at the bottom of this page.

Additionally, if you want to insert [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] instead, you can use the [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetFreeModelsAsync|InsertService:GetFreeModelsAsync()]] function.

_Note:_ The page argument starts at 0. So Page 1 = 0, Page 2 = 1, etc.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `searchText` | string |  | String used to search for free decals in the Catalog. |
| `pageNum` | int |  | The page number in the Catalog to return. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A single table (of returned free decals) wrapped in a table. |

*Code samples for this member (`InsertService-GetFreeDecals1`) are published on the source page; their code is not part of the open-source repo.*

### GetFreeModels

> [!warning] Deprecated
> Use `Class.InsertService:GetFreeModelsAsync()|GetFreeModelsAsync()`
> instead.

```lua
InsertService:GetFreeModels(searchText: string, pageNum: int): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Retrieves a list of Free Models from the Catalog.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `searchText` | string |  | String used to search for free models in the Catalog. |
| `pageNum` | int |  | The page number in the Catalog to return. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A single table (of returned free models) wrapped in a table. |

*Code samples for this member (`InsertService-GetFreeModels1`) are published on the source page; their code is not part of the open-source repo.*

### GetFreeModelsAsync

```lua
InsertService:GetFreeModelsAsync(searchText: string, pageNum: int): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

The GetFreeModelsAsync function retrieves a list of Free [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] from the Catalog. The return type for this method is very odd, as it returns a single table wrapped in a table.

The best way to explain it is to show a visual of the array returned:

```lua
[1] = {
	CurrentStartIndex = 1, -- This can vary depending on the page you input.
	TotalCount = 21, -- Always 21.
	Results = {
		-- All parameters here are pseudo. They can vary depending on the asset.
		[1] = {
			Name = "Asset Name",
			AssetId = 0000000,
			AssetVersionId = 0000000,
			CreatorName = "Roblox",
    		}
    		-- [2], [3], and so on... up to [21]
    	}
}
```

An example for iterating over this list has been provided at the bottom of this page.

Additionally, if you would like to insert free [[30 Official Roblox Docs/API Reference/Classes/Decal|Decals]], you can use the [[30 Official Roblox Docs/API Reference/Classes/InsertService#GetFreeDecalsAsync|InsertService:GetFreeDecalsAsync()]] function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `searchText` | string |  | String used to search for free decals in the Catalog. |
| `pageNum` | int |  | The page number in the Catalog to return. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A single table (of returned free models) wrapped in a table. |

*Code samples for this member (`InsertService-GetFreeModels1`) are published on the source page; their code is not part of the open-source repo.*

### GetLatestAssetVersionAsync

```lua
InsertService:GetLatestAssetVersionAsync(assetId: int64): int64
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns the latest AssetVersionId of an asset for assets created by the place creator. Can be used in combination with [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAssetVersion|InsertService:LoadAssetVersion()]] to load the latest version of a model, even if it gets updated while the game is running.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  | The ID of the asset to retrieve the latest version for. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | The latest asset version ID for the specified asset. |

### GetUserCategories

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

```lua
InsertService:GetUserCategories(userId: User): Array
```

**Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  |  |

**Returns**

| Type | Description |
| --- | --- |
| Array |  |

### GetUserSets

> [!warning] Deprecated
> [Sets have been removed](https://devforum.roblox.com/t/sunsetting-sets/189402)
> from Roblox.

```lua
InsertService:GetUserSets(userId: User): Array
```

**Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

Returns an array of dictionaries, containing information about sets owned by the user. This includes

- Sets the user is subscribed to.
- Sets that the user created.
- A single set containing the models created by the user.
- A single set containing the decals created by the user.

Note:

- All values in the dictionaries are
  [[30 Official Roblox Docs/Luau/Strings|strings]], even if they are a
  number.

| Name | Description |
| --- | --- |
| Name | The name of the set. |
| Description | The description of the set. |
| ImageAssetId | An assetId for the icon of the set. |
| CreatorName | The creator of the set. |
| AssetSetId | The set's unique ID on the website. |
| CategoryId | Identical to AssetSetId |
| SetType | The type of set that this set is. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The ID of the user whose sets to retrieve. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of dictionaries containing information about the user's sets. |

### Insert

> [!warning] Deprecated
> This function has been superseded by `Class.InsertService:LoadAsset()`
> which should be used in all new work.

```lua
InsertService:Insert(instance: Instance): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

This function is a legacy method used to insert an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] into [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to insert into [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`InsertService-Insert1`) are published on the source page; their code is not part of the open-source repo.*

### LoadAsset

```lua
InsertService:LoadAsset(assetId: int64): Instance
```

**Thread safety:** Unsafe · **Capabilities:** LoadOwnedAsset · **Tags:** `Yields`

The LoadAsset function fetches an asset given its ID and returns a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] containing the asset. For example, to load this public [Doge](https://www.roblox.com/library/257489726/Doge) [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], which has the asset ID **_257489726_**, you can use:

```lua
local InsertService = game:GetService("InsertService")
local Workspace = game:GetService("Workspace")

local assetId = 257489726
local model = InsertService:LoadAsset(assetId)
model.Parent = Workspace
```

Calls to this function may fail if a server providing a model is having problems. As such, it's generally a good idea to wrap calls to this function in `pcall` to catch these kinds of errors.

```lua
local InsertService = game:GetService("InsertService")
local Workspace = game:GetService("Workspace")

local assetId = 257489726

local success, model = pcall(InsertService.LoadAsset, InsertService, assetId)
if success and model then
	print("Model loaded successfully")
	model.Parent = Workspace
else
	print("Model failed to load!")
end
```

#### Security Check

An asset loaded by this function must meet one of the following:

- The asset must be **created or owned** by the game creator.
- The asset must be **shared** by the asset owner.
- The asset must be owned by Roblox.

Additionally, benign asset types such as t-shirts, shirts, pants and avatar accessories are loadable from any game as they are `OpenUse`.

To load assets which do not meet the above criteria, such as free Models published on the Store, you must use [[30 Official Roblox Docs/API Reference/Classes/AssetService#LoadAssetAsync|AssetService:LoadAssetAsync()]] and enable [[30 Official Roblox Docs/API Reference/Classes/AssetService#AllowInsertFreeAssets|AssetService.AllowInsertFreeAssets]].

See also:

- [[30 Official Roblox Docs/API Reference/Classes/AssetService#GetBundleDetailsAsync|AssetService:GetBundleDetailsAsync()]], to find out which assets are associated with a bundle.
- For plugins, see [[30 Official Roblox Docs/API Reference/Classes/DataModel#GetObjects|DataModel:GetObjects()]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  | The asset ID of the asset being loaded. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | An instance of the loaded asset. |

*Code samples for this member (`InsertService-LoadAsset1`) are published on the source page; their code is not part of the open-source repo.*

### loadAsset

> [!warning] Deprecated
> This function is a deprecated variant of `Class.InsertService:LoadAsset()`
> which should be used instead.

```lua
InsertService:loadAsset(assetId: int64): Instance
```

**Thread safety:** Unsafe · **Capabilities:** LoadOwnedAsset · **Tags:** `Yields`, `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

### LoadAssetVersion

```lua
InsertService:LoadAssetVersion(assetVersionId: int64): Instance
```

**Thread safety:** Unsafe · **Capabilities:** LoadOwnedAsset · **Tags:** `Yields`

Returns a model inserted into [[30 Official Roblox Docs/API Reference/Classes/InsertService|InsertService]] containing the asset with the given assetVersionId.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetVersionId` | int64 |  | The version ID of the asset to load. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | A [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] containing the asset at the specified version. |

*Code samples for this member (`InsertService-LoadAssetVersion1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [InsertService](https://create.roblox.com/docs/reference/engine/classes/InsertService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
