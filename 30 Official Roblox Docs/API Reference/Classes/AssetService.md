---
title: "AssetService"
description: "A non-replicated service that handles asset-related queries to the Roblox web API."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AssetService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A non-replicated service that handles asset-related queries to the Roblox web API.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

**AssetService** is a non-replicated service that handles asset-related queries to the Roblox web API.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#AllowInsertFreeAssets\|AllowInsertFreeAssets]] | boolean | Controls whether [[30 Official Roblox Docs/API Reference/Classes/AssetService#LoadAssetAsync\|AssetService:LoadAssetAsync()]] can load assets that are not owned by the experience creator. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#ComposeDecalAsync\|ComposeDecalAsync()]] | () | Modifies an existing [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]] to contain a composite PBR textures created by layering the provided textures in the order they are provided in the `layers` array. Textures layer based on the alpha value of the color map. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateAssetAsync\|CreateAssetAsync()]] | Tuple | Uploads a new asset to Roblox from the given object. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateAssetVersionAsync\|CreateAssetVersionAsync()]] | Tuple | Uploads a new version for an existing asset from the given object. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateDataModelContentAsync\|CreateDataModelContentAsync()]] | Tuple | Creates ephemeral, [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]-scoped content from the provided content input. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateDecalAsync\|CreateDecalAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]] object using the provided [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] content maps. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableImage\|CreateEditableImage()]] | [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableImageAsync\|CreateEditableImageAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] object populated with the given image. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableMesh\|CreateEditableMesh()]] | [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] | Creates a new, empty [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableMeshAsync\|CreateEditableMeshAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] | Returns a new [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] object created from an existing mesh content ID. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateMeshPartAsync\|CreateMeshPartAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with a specified mesh ID and an optional table of fidelity values. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreatePlaceAsync\|CreatePlaceAsync()]] | int64 | Clones a place through the given `templatePlaceID`. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreatePlaceInPlayerInventoryAsync\|CreatePlaceInPlayerInventoryAsync()]] | int64 | **Deprecated.** Clones a place through the given `templatePlaceID` and puts it into the inventory of the given player. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateSurfaceAppearanceAsync\|CreateSurfaceAppearanceAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance\|SurfaceAppearance]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance\|SurfaceAppearance]] object using the provided content maps. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#GetAssetIdsForPackage\|GetAssetIdsForPackage()]] | Array | **Deprecated.** Returns an array of asset IDs that are contained in a specified package. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#GetAssetIdsForPackageAsync\|GetAssetIdsForPackageAsync()]] | Array | Returns an array of asset IDs that are contained in a specified package. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#GetAudioMetadataAsync\|GetAudioMetadataAsync()]] | Array | Provides relevant metadata about a specific audio source. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#GetBundleDetailsAsync\|GetBundleDetailsAsync()]] | Dictionary | Returns details of the contents of specified bundle. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#GetCreatorAssetID\|GetCreatorAssetID()]] | int64 | **Deprecated.** Returns the UserId of the account who created the creationID asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#GetGamePlacesAsync\|GetGamePlacesAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/StandardPages\|StandardPages]] object which contains the name and [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|PlaceId]] of places within the current experience. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#LoadAssetAsync\|LoadAssetAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Loads a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] instance given its asset ID. This is the modern replacement for [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset\|InsertService:LoadAsset()]] and supports loading third-party assets. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#PromptCreatePlatformContentAsync\|PromptCreatePlatformContentAsync()]] | Tuple | Allows in-experience asset creation for users by prompting a publish dialog. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#PromptImportAnimationClipFromVideoAsync\|PromptImportAnimationClipFromVideoAsync()]] | Tuple | Prompts the specified player to select and upload a video, which is then converted into an [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#SavePlaceAsync\|SavePlaceAsync()]] | () | Saves the state of the current place. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#SearchAudio\|SearchAudio()]] | [[30 Official Roblox Docs/API Reference/Classes/AudioPages\|AudioPages]] | **Deprecated.** Finds audio assets matching a variety of search criteria. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetService#SearchAudioAsync\|SearchAudioAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/AudioPages\|AudioPages]] | Finds audio assets matching a variety of search criteria. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AllowInsertFreeAssets

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true

This property can only be modified in Studio's **Experience Settings** by changing **Allow Loading Third Party Assets**.

When `false` (default), [[30 Official Roblox Docs/API Reference/Classes/AssetService#LoadAssetAsync|AssetService:LoadAssetAsync()]] can only load assets that meet one of the following:

- The asset must be **created or owned** by the game creator.
- The asset must be **shared** by the asset owner.
- The asset must be owned by Roblox.

When `true`, [[30 Official Roblox Docs/API Reference/Classes/AssetService#LoadAssetAsync|AssetService:LoadAssetAsync()]] can additionally load any public free asset on the Creator Store.

## Methods

### ComposeDecalAsync

```lua
AssetService:ComposeDecalAsync(decal: Decal, layers: Array): ()
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Modifies an existing [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] to contain a composed texture derived from one or more layered texture sets. Each set can include color, roughness, metalness, and normal maps. Each layer in `layers` is composited in the order they are provided, with the color map alpha channel used to determine blending.

- There is a limit of 8 layers.
- Layering order is bottom-to-top: the first layer in the list provides the bottom-most textures.
- Each dictionary table should contain the following key-value pairs:
  - **ColorMap**: A [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] referencing a color (albedo) texture by assetId.
  - **RoughnessMap**: A [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] referencing a roughness texture by assetId.
  - **MetalnessMap**: A [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] referencing a metalness texture by assetId.
  - **NormalMap**: A [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] referencing a normal texture by assetId.
- `ColorMap` is mandatory in every layer. The ColorMap's alpha channel is used to control blending of the entire layer.
- `NormalMap`, `MetalnessMap`, `RoughnessMap` are optional. If omitted, this layer doesn't perform any blending for those maps.

Calling this method on a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] that already has a pending `ComposeDecalAsync` call in progress raises an error; wait for the first call to resolve before issuing another on the same instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `decal` | [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]] |  | A [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]] instance that will be modified to contain a representation of the layers. Any existing maps on this instance will be cleared. |
| `layers` | Array |  | An array of dictionary tables that maps PBR names to [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] IDs. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`AssetService-ComposeDecalAsync`) are published on the source page; their code is not part of the open-source repo.*

### CreateAssetAsync

```lua
AssetService:CreateAssetAsync(object: Object, assetType: AssetType, requestParameters: Dictionary = nil): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** AssetCreateUpdate · **Tags:** `Yields`

Uploads a new asset to Roblox from the given object.

Currently, this method can only be used in locally loaded plugins and uploads assets without prompting first.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `object` | [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] |  | The object to be created as an asset. |
| `assetType` | [[30 Official Roblox Docs/API Reference/Enums/AssetType\|AssetType]] |  | Currently supported types are:<br><br>- [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Model]] – with `object` as any valid [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] root. - [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Plugin]] – with `object` as any valid [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] root. - [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Mesh]] – with `object` as any valid [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] root. - [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Image]] – with `object` as any valid [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] root. - [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Audio]] – with `object` as any valid [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] root. |
| `requestParameters` | Dictionary | `nil` | Options table containing asset metadata:<br><br>- `Name` – Name of the asset as a string. Defaults to `[object.Name]`. - `Description` – Description of the asset as a string. Defaults to `"Created with AssetService:CreateAssetAsync"`. - `CreatorId` – ID of the asset creator as a number. Defaults to the logged in Roblox Studio user for Plugin context. Required for Open Cloud Luau Execution context. - `CreatorType` – [[30 Official Roblox Docs/API Reference/Enums/AssetCreatorType\|Enum.AssetCreatorType]] indicating the type of asset creator. Defaults to [[30 Official Roblox Docs/API Reference/Enums/AssetCreatorType\|Enum.AssetCreatorType.User]] in Plugin context. Required for Open Cloud Luau Execution context. - `IsPackage` – Boolean value, only applicable to the [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Model]] type. Defaults to `true`. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The [[30 Official Roblox Docs/API Reference/Enums/CreateAssetResult\|Enum.CreateAssetResult]] and asset ID pair if successful. |

*Code samples for this member (`AssetService-CreateAssetAsync`) are published on the source page; their code is not part of the open-source repo.*

### CreateAssetVersionAsync

```lua
AssetService:CreateAssetVersionAsync(object: Object, assetType: AssetType, assetId: int64, requestParameters: Dictionary = nil): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** AssetCreateUpdate · **Tags:** `Yields`

Uploads a new version for an existing asset from the given object.

Currently, this method can only be used in locally loaded plugins and uploads assets without prompting first.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `object` | [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] |  | The object to be created as an asset. |
| `assetType` | [[30 Official Roblox Docs/API Reference/Enums/AssetType\|AssetType]] |  | Currently supported types are:<br><br>- [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Model]] – with `object` as any valid [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] root. - [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Plugin]] – with `object` as any valid [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] root. - [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Mesh]] – with `object` as any valid [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] root. - [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Image]] – with `object` as any valid [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] root. |
| `assetId` | int64 |  | The ID of the asset for the new version. |
| `requestParameters` | Dictionary | `nil` | Options table containing asset metadata:<br><br>- `Name` – A `string`. Name of the asset. Default: object.Name. - `Description` – A `string`. Description of the asset. Default: "Created with AssetService:CreateAssetAsync". - `CreatorId` – A `number`. ID of the asset creator. Default: The logged in Roblox Studio user for Plugin context. Required for Open Cloud Luau Execution context. - `CreatorType` – A [[30 Official Roblox Docs/API Reference/Enums/AssetCreatorType\|Enum.AssetCreatorType]]. Type of asset creator. Default: [[30 Official Roblox Docs/API Reference/Enums/AssetCreatorType\|Enum.AssetCreatorType.User]] in Plugin context. Required for Open Cloud Luau Execution context. - `IsPackage` – A `bool`. Only applicable to the [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Model]] type. Default: true. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The [[30 Official Roblox Docs/API Reference/Enums/CreateAssetResult\|Enum.CreateAssetResult]] and asset version number pair if successful. |

*Code samples for this member (`AssetService-CreateAssetVersionAsync`) are published on the source page; their code is not part of the open-source repo.*

### CreateDataModelContentAsync

```lua
AssetService:CreateDataModelContentAsync(content: Content, options: Dictionary?): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `Yields`

Creates ephemeral, [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]-scoped content from the provided content input.

If the server storage budget is exhausted during this call, the creation will fail and the method will return [[30 Official Roblox Docs/API Reference/Enums/CreateContentResult|Enum.CreateContentResult.StorageLimitExceeded]] alongside an empty [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] object.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `content` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |  | Reference to the input content. Currently, this only supports [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] wrapping a [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] or [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]]. |
| `options` | Dictionary? |  | Optional dictionary containing configuration controls for the created [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]] content. Currently no controls are surfaced and this parameter exists for future functionality. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing an [[30 Official Roblox Docs/API Reference/Enums/CreateContentResult\|Enum.CreateContentResult]] indicating the success or failure of the request, and the resulting [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]-scoped [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|Opaque]] [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]]. |

### CreateDecalAsync

```lua
AssetService:CreateDecalAsync(content: Dictionary): Decal
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Creates a new [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] object using the provided color and physically based rendering (PBR) content maps. Each supported key sets the corresponding [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] content property. All maps are optional individually, but at least one must be provided; a color texture is not required.

Use [[30 Official Roblox Docs/API Reference/Datatypes/Content#fromObject|Content.fromObject()]] to wrap a [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] for each map. Asset IDs, URI-based content, and [[30 Official Roblox Docs/API Reference/Datatypes/Content#none|Content.none]] are not accepted. To use an image asset, first load it with [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableImageAsync|AssetService:CreateEditableImageAsync()]], then wrap the returned [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] with [[30 Official Roblox Docs/API Reference/Datatypes/Content#fromObject|Content.fromObject()]].

Omitted maps remain unset. All other [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] properties retain their default values, and the returned decal has no parent. Set its [[30 Official Roblox Docs/API Reference/Classes/FaceInstance#Face|Face]] and parent it to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] to display it on the desired face.

Unrecognized keys are ignored with a warning. The method raises an error if no supported maps are provided, or if any supported key has a value that is not [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] containing a [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `content` | Dictionary |  | Dictionary containing one or more of the following key-value pairs. Each value must be a [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object containing a [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]]:<br><br>- `TextureContent` — The decal's color texture. - `NormalMapContent` — The decal's normal map. - `MetalnessMapContent` — The decal's metalness map. - `RoughnessMapContent` — The decal's roughness map. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]] | A new [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]] instance with the given maps from the `content` parameter. |

### CreateEditableImage

```lua
AssetService:CreateEditableImage(editableImageOptions: Dictionary?): EditableImage
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Creates a new [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]]. By default, the resolution is set at 512×512, but you can specify a different size using the method's option table.

If the device‑specific editable memory budget is exhausted, creation fails and this method returns `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `editableImageOptions` | Dictionary? |  | Options table containing controls for the method:<br><br>- `Size` – A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] that specifies the image's desired width and height. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] | The new [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]], or `nil` if the device-specific editable memory budget is exhausted. |

### CreateEditableImageAsync

```lua
AssetService:CreateEditableImageAsync(content: Content, editableImageOptions: Dictionary?): EditableImage
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Creates a new [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] object populated with the given texture. Non-asset texture IDs such as `rbxthumb://` are supported. If using an image asset, it must be associated with and/or owned by a creator of the experience, or it must have been created inside the experience. If the device-specific editable memory budget is exhausted, creation will fail and this method will return `nil`.

See the [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] documentation for special considerations when using this API.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `content` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |  | Reference to asset content stored externally or as an object within the place, wrapping a single value of one of the supported [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|Enum.ContentSourceType]] values. |
| `editableImageOptions` | Dictionary? |  | Table containing options for the created [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]]. Currently no options are available since resizing via [[30 Official Roblox Docs/API Reference/Classes/EditableImage#Size\|Size]] is not supported. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] | A new [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] containing the provided image. |

### CreateEditableMesh

```lua
AssetService:CreateEditableMesh(editableMeshOptions: Dictionary?): EditableMesh
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Creates a new, empty [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]]. Vertices, triangles, and their attributes can be added dynamically to it. If the device‑specific editable memory budget is exhausted, creation will fail and this method will return `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `editableMeshOptions` | Dictionary? |  | Table containing options for the created [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]]. Currently no options are available since [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#FixedSize\|FixedSize]] will always be `false` for empty editable meshes. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] | The new [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]], or `nil` if the device-specific editable memory budget is exhausted. |

### CreateEditableMeshAsync

```lua
AssetService:CreateEditableMeshAsync(content: Content, editableMeshOptions: Dictionary?): EditableMesh
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns a new [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] object created from an existing [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] or mesh [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] ID. By default, an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] created from this method will be fixed size such that mesh data can only be modified, not added nor removed. A fixed size [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] consumes less memory and should be preferred when possible.

If the device-specific editable memory budget is exhausted, creation will fail and this method will return `nil`.

See the **Enabling for Published Experiences** and **Permissions** sections of [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] for special considerations when using this API.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `content` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |  | Reference to asset content stored externally or as an object within the place, wrapping a single value of one of the supported [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|Enum.ContentSourceType]] values. |
| `editableMeshOptions` | Dictionary? |  | Options table containing controls for the method:<br><br>- `FixedSize` – A `bool`. Default value is `true`, and the returned [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] will not allow you to add or remove vertices, only modify their values. Set to `false` if the ability to change the mesh topology is required, at the expense of using more memory. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] | The new [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] object. |

### CreateMeshPartAsync

```lua
AssetService:CreateMeshPartAsync(meshContent: Content, options: Dictionary = nil): MeshPart
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This method creates a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] with a specified [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|CollisionFidelity]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity|RenderFidelity]], and [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#FluidFidelity|FluidFidelity]]. Because [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshId|MeshPart.MeshId]] is read only, this method is for creating a mesh with any mesh ID through scripts, without having to clone an existing [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. It throws errors if creation fails.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `meshContent` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |  | Reference to asset content stored externally or as an object within the place, wrapping a single value of one of the supported [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|Enum.ContentSourceType]] values. |
| `options` | Dictionary | `nil` | Options table containing one or more controls for the method:<br><br>- `CollisionFidelity` – The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity\|CollisionFidelity]] in the resulting part. Defaults to [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity\|Enum.CollisionFidelity.Default]] if the option is absent or the `options` table is `nil`. - `RenderFidelity` – The value of [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity\|RenderFidelity]] in the resulting part. Defaults to [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity\|Enum.RenderFidelity.Automatic]] if the option is absent or the `options` table is `nil`. - `FluidFidelity` – The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#FluidFidelity\|FluidFidelity]] in the resulting part. Defaults to [[30 Official Roblox Docs/API Reference/Enums/FluidFidelity\|Enum.FluidFidelity.Automatic]] if the option is absent or the `options` table is `nil`. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] | The new [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with the specified mesh and fidelity settings applied. |

### CreatePlaceAsync

```lua
AssetService:CreatePlaceAsync(placeName: string, templatePlaceID: int64, description: string): int64
```

**Thread safety:** Unsafe · **Capabilities:** AssetCreateUpdate · **Tags:** `Yields`

Clones a place through the given `templatePlaceID` and returns the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId|PlaceId]] of the new place, which you can use with [[30 Official Roblox Docs/API Reference/Classes/TeleportService|TeleportService]]. The clone place displays within the inventory of the place's creator with the given name and description.

Note that the template place must have template copying enabled through place settings. You cannot use this method to clone places that you don't own.

Frequent use of this API is not recommended, particularly if the created places contain scripts, as updating the code in a large volume of places quickly becomes infeasible. For user-generated worlds, consider serializing user creations and saving them in [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStores]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `placeName` | string |  | Name of the new place. |
| `templatePlaceID` | int64 |  | [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|PlaceId]] of the place to clone. |
| `description` | string |  | Description of the new place. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|PlaceId]] of the new place. |

### CreatePlaceInPlayerInventoryAsync

> [!warning] Deprecated
> This method has been removed and is no longer functional.

```lua
AssetService:CreatePlaceInPlayerInventoryAsync(player: Instance, placeName: string, templatePlaceID: int64, description: string): int64
```

**Thread safety:** Unsafe · **Capabilities:** AssetCreateUpdate · **Tags:** `Yields`

This method was removed in release 471 and no longer functions; calling it raises an error. It previously cloned the place identified by `templatePlaceID` and placed the copy into the given player's inventory. There is no direct replacement.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose inventory receives the cloned place. |
| `placeName` | string |  | Name for the new place. |
| `templatePlaceID` | int64 |  | [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|PlaceId]] of the place to clone. |
| `description` | string |  | Description for the new place. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|PlaceId]] of the new place. |

### CreateSurfaceAppearanceAsync

```lua
AssetService:CreateSurfaceAppearanceAsync(content: Dictionary): SurfaceAppearance
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Creates a new [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] object using the provided content maps.

Currently, content only supports [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] and only content maps can be specified, but functionality will expand to include asset IDs as input. If you need to achieve this today, you can create an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] from an asset ID using the following:

`Class.AssetService:CreateEditableImageAsync(Content.fromUri(uri))`

Default values will be used for all other [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] properties. Note that the [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] assigned to each map cannot be reassigned or swapped after the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] is created.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `content` | Dictionary |  | Dictionary containing the following key-value pairs:<br><br>- `ColorMap` — A [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object that contains the color map. Default is `nil`. - `MetalnessMap` — A [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object that contains the metalness map. If more than one channel is present, only the red channel is used. Default is `nil`. - `NormalMap` — A [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object that contains the normal map. Default is `nil`. - `RoughnessMap` — A [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object that contains the roughness map. If more than one channel is present, only the red channel is used. Default is `nil`. - `EmissiveMask` — A [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object that contains the emissive mask. If more than one channel is present, only the red channel is used. Default is `nil`. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance\|SurfaceAppearance]] | A new [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance\|SurfaceAppearance]] instance with the given maps from the `content` parameter. |

*Code samples for this member (`AssetService-CreateSurfaceAppearanceAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetAssetIdsForPackage

> [!warning] Deprecated
> Use
> `Class.AssetService:GetAssetIdsForPackageAsync()|GetAssetIdsForPackageAsync()`
> instead.

```lua
AssetService:GetAssetIdsForPackage(packageAssetId: int64): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

This deprecated method returns an array of asset IDs contained in the specified package. Use [[30 Official Roblox Docs/API Reference/Classes/AssetService#GetAssetIdsForPackageAsync|GetAssetIdsForPackageAsync()]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `packageAssetId` | int64 |  | The asset ID of the package to query. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Asset IDs that are contained in a specified package. |

### GetAssetIdsForPackageAsync

```lua
AssetService:GetAssetIdsForPackageAsync(packageAssetId: int64): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns an array of asset IDs that are contained in a specified package.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `packageAssetId` | int64 |  | The asset ID of the package to query. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Asset IDs that are contained in a specified package. |

### GetAudioMetadataAsync

```lua
AssetService:GetAudioMetadataAsync(idList: Array): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Provides relevant metadata about a specific audio source (artist, title, duration, type, etc.).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `idList` | Array |  | Array of asset or content IDs for which to retrieve metadata. Max batch size is 30. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of dictionary tables in the same order as the request, where each dictionary contains the following metadata for its asset/content:<br><br>- `AssetId` (string)<br><br>- `Title` (string)<br><br>- `Artist` (string)<br><br>- `Duration` (number) in seconds<br><br>- `AudioType` ([[30 Official Roblox Docs/API Reference/Enums/AudioSubType\|Enum.AudioSubType]])<br><br>Note that if an error occurs on fetching metadata for any of the requested assets, for example the asset ID doesn't exist, its dictionary table is still included in the returned array but it only contains the `AssetId` field for reference purposes. Additionally, if the `AudioType` cannot be determined for a given asset (perhaps because it's private audio), the resulting dictionary will not contain an `AudioType` entry. |

*Code samples for this member (`AssetService-GetAudioMetadataAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetBundleDetailsAsync

```lua
AssetService:GetBundleDetailsAsync(bundleId: int64): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

This function returns details of the contents of the specified bundle.

If the bundle ID does not exist, it throws `HTTP 400 (Bad Request)`. If `bundleId` is not convertible to an integer, it throws `Unable to cast string to int64`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `bundleId` | int64 |  | The ID of the specified bundle. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | Dictionary with the following key-value pairs containing details about the specified bundle:<br><br>- `Id` — Bundle ID (same as passed `bundleId` argument)<br><br>- `Name` — Bundle name<br><br>- `Description` — Bundle description<br><br>- `BundleType` — String representing the [[30 Official Roblox Docs/API Reference/Enums/BundleType\|Enum.BundleType]], for example `"BodyParts"` or `"DynamicHead"`<br><br>- `Items` — Array of items in the bundle, each with details represented through the following keys: - `Id` — Item ID<br><br>- `Name` — Item name<br><br>- `Type` — Item type such as `"Asset"`<br><br>- `AssetType` — String representing the [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]]<br><br>- `SupportsHeadShapes` — Whether the asset supports head shape swapping. Only present if `AssetType` is `"DynamicHead"`. |

*Code samples for this member (`getting-bundle-details`) are published on the source page; their code is not part of the open-source repo.*

### GetCreatorAssetID

> [!warning] Deprecated
> This item is deprecated and no longer functions correctly. Do not use it
> for new work.

```lua
AssetService:GetCreatorAssetID(creationID: int64): int64
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

The GetCreatorAssetID function returns the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] of the account who created the _creationID_ asset.

This member is broken and doesn't function correctly. Avoid using it.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `creationID` | int64 |  | The asset ID to look up for creator information. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the account that created the asset. |

### GetGamePlacesAsync

```lua
AssetService:GetGamePlacesAsync(): Instance
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns a [[30 Official Roblox Docs/API Reference/Classes/StandardPages|StandardPages]] object which contains the name and [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId|PlaceId]] of places within the current experience.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | A [[30 Official Roblox Docs/API Reference/Classes/StandardPages\|StandardPages]] object whose pages contain the name and [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|PlaceId]] of each place in the current experience. |

*Code samples for this member (`AssetService-GetGamePlacesAsync1`) are published on the source page; their code is not part of the open-source repo.*

### LoadAssetAsync

```lua
AssetService:LoadAssetAsync(assetId: int64): Instance
```

**Thread safety:** Unsafe · **Capabilities:** LoadUnownedAsset · **Tags:** `Yields`

Loads the latest version of an asset from the given `assetId` and returns it wrapped in a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. This method is the modern replacement for [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|InsertService:LoadAsset()]] and [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAssetVersion|InsertService:LoadAssetVersion()]] methods.

Calls to this function may fail if the asset does not exist, or if the server providing the model is having problems. It is recommended to wrap calls to this function in `pcall()` to handle potential errors.

```lua
local AssetService = game:GetService("AssetService")

local assetId = 257489726

local success, model = pcall(AssetService.LoadAssetAsync, AssetService, assetId)
if success and model then
	print("Model loaded successfully")
	model.Parent = workspace
else
	warn("Model failed to load:", model) -- 'model' will contain the error message
end
```

#### Script Sandbox Security

For enhanced security, the returned [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] is sandboxed by default ([[30 Official Roblox Docs/API Reference/Classes/Instance#Sandboxed|Sandboxed]] is `true`) and has no script [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability|Capabilities]]. This prevents untrusted scripts descending from the returned Model from running. To enable scripts in a model you trust, you can manually grant a safe set of [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability|Capabilities]] on the Model after loading.

#### Third-Party Asset Loading

Unlike [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|InsertService:LoadAsset()]], this method can load public assets created by **third parties** (assets not owned by the experience creator). To enable this functionality, toggle on **Allow Loading Third Party Assets** in Studio's **Experience Settings**.

If this setting is disabled (which it is by default), `LoadAssetAsync` will only load assets that are owned by the experience creator, behaving identically to the old [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|InsertService:LoadAsset()]] security check.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  | The asset ID number of the asset being loaded. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | A [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] instance containing the loaded asset. |

### PromptCreatePlatformContentAsync

```lua
AssetService:PromptCreatePlatformContentAsync(player: Player, object: Object, assetType: AssetType): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** AssetCreateUpdate · **Tags:** `Yields`

Allows in-experience asset creation for users by prompting a publish dialog. When called, it presents a dialog to the user, allowing them to enter a name, description, and preview the asset. Upon submitting, it saves the asset to the user's inventory. Can only be invoked on the server side.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The user who submits an asset creation. |
| `object` | [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] |  | The source object for the asset to be created. Currently can only be an `EditableImage`. |
| `assetType` | [[30 Official Roblox Docs/API Reference/Enums/AssetType\|AssetType]] |  | The asset type. Currently can only be [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Image]]. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The [Enum.PromptCreatePlatformContentResult](https://create.roblox.com/docs/reference/engine/enums/PromptCreatePlatformContentResult) and asset ID pair if successful. |

### PromptImportAnimationClipFromVideoAsync

```lua
AssetService:PromptImportAnimationClipFromVideoAsync(player: Player, progressCallback: Function): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`

Prompts the given `player` to select and upload a video on their own client, then converts the uploaded video into an [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] and returns it. The player must grant consent through the prompt before the upload proceeds; if they decline or provide no input, the method resolves with [[30 Official Roblox Docs/API Reference/Enums/AnimationClipFromVideoStatus|Enum.AnimationClipFromVideoStatus.Cancelled]] and no clip.

This method can only be called from the server. The returned [[30 Official Roblox Docs/API Reference/Enums/AnimationClipFromVideoStatus|Enum.AnimationClipFromVideoStatus]] reports success or the reason processing failed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player who is prompted, on their own client, to select and upload a video. The player's consent is required before the video is uploaded. |
| `progressCallback` | Function |  | A function that receives status updates (an [[30 Official Roblox Docs/API Reference/Enums/AnimationClipFromVideoStatus\|Enum.AnimationClipFromVideoStatus]] value) while the video is uploaded and processed. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing an [[30 Official Roblox Docs/API Reference/Enums/AnimationClipFromVideoStatus\|Enum.AnimationClipFromVideoStatus]] describing the outcome and, on success, the resulting [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] (`nil` otherwise). |

### SavePlaceAsync

```lua
AssetService:SavePlaceAsync(requestParameters: Dictionary?): ()
```

**Thread safety:** Unsafe · **Capabilities:** AssetCreateUpdate · **Tags:** `Yields`

Saves the current state of the place. Keep in mind the following guidelines and restrictions:

- This method only works for places that are created with [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreatePlaceAsync|AssetService:CreatePlaceAsync()]] or that have the API enabled through the place's settings.
- This method overwrites the previous state of the place. To revert a save, publish an older version of the place.
- There are cases when saves can occur simultaneously in Studio and in multiple experience servers. The order of the saves happen in the order they are called.
- An active Team Create session in Studio blocks all saves from occurring.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `requestParameters` | Dictionary? |  | Optional dictionary that includes `SaveWithoutPublish`, a boolean indicating whether to save with publish or without publish, and `PlaceId`, the destination place ID to save over. An example usage would be: AssetService:SavePlaceAsync(). If PlaceId is not provided, the default behavior will save over the current original place which is calling SavePlaceAsync. If SaveWithoutPublish is not provided, the default behavior is SaveWithoutPublish=false. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SearchAudio

> [!warning] Deprecated
> Use `Class.AssetService:SearchAudioAsync()|SearchAudioAsync()` instead.

```lua
AssetService:SearchAudio(searchParameters: AudioSearchParams): AudioPages
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

This deprecated method finds audio assets matching a variety of search criteria. Use [[30 Official Roblox Docs/API Reference/Classes/AssetService#SearchAudioAsync|SearchAudioAsync()]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `searchParameters` | [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams\|AudioSearchParams]] |  | A [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams\|AudioSearchParams]] object defining the search criteria such as keyword, title, artist, audio type, and duration range. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPages\|AudioPages]] | An [[30 Official Roblox Docs/API Reference/Classes/AudioPages\|AudioPages]] object containing the paginated results of the audio search. |

*Code samples for this member (`printing-search-audio-result-titles`) are published on the source page; their code is not part of the open-source repo.*

### SearchAudioAsync

```lua
AssetService:SearchAudioAsync(searchParameters: AudioSearchParams): AudioPages
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns a [[30 Official Roblox Docs/API Reference/Classes/AudioPages|AudioPages]] object containing the result of the given search. Will not return fields with empty values.

Note that this method has a low HTTP request limit and can throw an error, so it should always be wrapped in `pcall()` for error handling. Possible error messages include:

| Error Message | Reason |
| --- | --- |
| HTTP 429 (Too Many Requests) | [[30 Official Roblox Docs/API Reference/Classes/AssetService#SearchAudio\|AssetService:SearchAudio()]] has been called too many times. |
| Unexpected type for data, expected array got null | The keyword argument was filtered. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `searchParameters` | [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams\|AudioSearchParams]] |  | A [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams\|AudioSearchParams]] object defining the search criteria such as keyword, title, artist, audio type, and duration range. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPages\|AudioPages]] | An [[30 Official Roblox Docs/API Reference/Classes/AudioPages\|AudioPages]] object containing the paginated results of the audio search. |

*Code samples for this member (`printing-search-audio-result-titles`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [AssetService](https://create.roblox.com/docs/reference/engine/classes/AssetService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
