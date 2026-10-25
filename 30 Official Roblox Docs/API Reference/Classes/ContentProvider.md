---
title: "ContentProvider"
description: "Service that is used to load content, or assets, into a game."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ContentProvider"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service that is used to load content, or assets, into a game.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Service that loads content (assets) into a game.

Roblox servers stream all assets to the client at runtime: objects in the Workspace, mesh assets, texture assets, etc. Assets such as mesh visual data, textures, decals, and sounds are streamed in as required, regardless of whether [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|Streaming]] is enabled.

In some cases, this behavior is undesirable, as it can lead to a delay before the content loads into the experience.

`ContentProvider` lets you preload assets into an experience using the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#PreloadAsync|ContentProvider:PreloadAsync()]] method. You might want to display a loading screen, preload critical assets, and only then allow the player into the experience.

#### Best Practices for Preloading

- Only preload essential assets, **not** the entire [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. You might get occasional pop-in, but it decreases load times and generally doesn't disrupt the player experience. Assets that are good candidates for preloading include those required for the loading screen, the UI, or the starting area.
- Let players skip the loading screen, or automatically skip it after a certain amount of time.

*Code samples for this API (`ContentProvider1`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ContentProvider); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#BaseUrl\|BaseUrl]] | string | Used by the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider\|ContentProvider]] to download assets from the Roblox website. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RequestQueueSize\|RequestQueueSize]] | int | Gives the number of items in the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider\|ContentProvider]] request queue that need to be downloaded. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#GetAssetFetchStatus\|GetAssetFetchStatus()]] | [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|AssetFetchStatus]] | Gets the current [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus]] of the `contentId` provided. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#GetAssetFetchStatusChangedSignal\|GetAssetFetchStatusChangedSignal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | A signal that fires when the [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus]] of the provided content changes. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#ListEncryptedAssets\|ListEncryptedAssets()]] | Array | Returns an array of the asset IDs that currently have a registered encryption key. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#Preload\|Preload()]] | () | **Deprecated.** Queues an asset to be downloaded by the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider\|ContentProvider]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#PreloadAsync\|PreloadAsync()]] | () | Yields until all of the assets associated with the given [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] have loaded. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterDefaultEncryptionKey\|RegisterDefaultEncryptionKey()]] | () | Registers a fallback encryption key used to decrypt any encrypted asset that doesn't have its own key registered. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterDefaultSessionKey\|RegisterDefaultSessionKey()]] | () | Decrypts the provided session key and registers the result as the default encryption key. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterEncryptedAsset\|RegisterEncryptedAsset()]] | () | Registers an encryption key used to decrypt a specific encrypted asset. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterSessionEncryptedAsset\|RegisterSessionEncryptedAsset()]] | () | Decrypts the provided session key and registers it as the encryption key for a specific asset. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#UnregisterDefaultEncryptionKey\|UnregisterDefaultEncryptionKey()]] | () | Clears the default encryption key previously set on the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider\|ContentProvider]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#UnregisterEncryptedAsset\|UnregisterEncryptedAsset()]] | () | Removes the encryption key registered for a specific asset. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#AssetFetchFailed\|AssetFetchFailed]] | `assetId` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider\|ContentProvider]] fails to fetch an asset, passing the asset's ID. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BaseUrl

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** AssetManagement · **Tags:** `ReadOnly`, `NotReplicated`

Used by the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider|ContentProvider]] to download assets from the Roblox website.

This URL points to a Roblox hosted website from which assets are downloaded and is pulled from the AppSettings.xml file, located in the version-hash folder.

It is possible to overwrite this property using the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider|ContentProvider:SetBaseUrl()]] function in the command bar; however, this is not recommended and may cause asset loading issues.

### RequestQueueSize

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** AssetManagement · **Tags:** `ReadOnly`, `NotReplicated`

Gives the number of items in the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider|ContentProvider]] request queue that need to be downloaded.

Items are added to the client's request queue when an asset is used for the first time or [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#PreloadAsync|ContentProvider:PreloadAsync()]] is called.

Developers are advised not to use RequestQueueSize to create loading bars. This is because the queue size can both increase and decrease over time as new assets are added and downloaded. Developers looking to display loading progress should load assets one at a time (see example below).

*Code samples for this member (`ContentProvider-Loading-Bar`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### GetAssetFetchStatus

```lua
ContentProvider:GetAssetFetchStatus(contentId: ContentId): AssetFetchStatus
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement

Gets the current [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus|Enum.AssetFetchStatus]] of the `contentId` provided. Use [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#GetAssetFetchStatusChangedSignal|GetAssetFetchStatusChangedSignal()]] to listen for changes to this value.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `contentId` | ContentId |  | The ID of the content to fetch the status for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|AssetFetchStatus]] | The [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus]] of the content. |

*Code samples for this member (`ContentProvider-GetAssetFetchStatus1`) are published on the source page; their code is not part of the open-source repo.*

### GetAssetFetchStatusChangedSignal

```lua
ContentProvider:GetAssetFetchStatusChangedSignal(contentId: ContentId): RBXScriptSignal
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement

A signal that fires when the [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus|Enum.AssetFetchStatus]] of the provided content changes. Connect to this signal by using a callback with one argument of type [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus|Enum.AssetFetchStatus]]. This is particularly useful for assets that might update themselves automatically like the thumbnail of a user when they change clothes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `contentId` | ContentId |  | The ID of the content to monitor for fetch status changes. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | An [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] that fires when the [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus]] of the given content changes. |

*Code samples for this member (`ContentProvider-GetAssetFetchStatus1`) are published on the source page; their code is not part of the open-source repo.*

### ListEncryptedAssets

```lua
ContentProvider:ListEncryptedAssets(): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement

Returns an array containing every asset ID that currently has an encryption key registered on this [[30 Official Roblox Docs/API Reference/Classes/ContentProvider|ContentProvider]], whether the key was registered directly through [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterEncryptedAsset|RegisterEncryptedAsset()]] or through [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterSessionEncryptedAsset|RegisterSessionEncryptedAsset()]].

The default key set through [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterDefaultEncryptionKey|RegisterDefaultEncryptionKey()]] is not included, because it isn't associated with any specific asset.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of the asset IDs that currently have an encryption key registered on this [[30 Official Roblox Docs/API Reference/Classes/ContentProvider\|ContentProvider]]. |

### Preload

> [!warning] Deprecated
> This item has been superseded by `Class.ContentProvider:PreloadAsync()`
> which should be used in all new work.

```lua
ContentProvider:Preload(contentId: ContentId): ()
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Deprecated`

Usually, content is loaded only when it starts being used. That explains why it often takes a moment for an image to appear in a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], or a `Mesh|mesh` to appear in a [[30 Official Roblox Docs/API Reference/Classes/BasePart|part]], or why a [[30 Official Roblox Docs/API Reference/Classes/Sound|sound]] doesn't play for the first time. All because the asset has not yet finished loading. Preload is used to load this content beforehand, so that it works instantly.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `contentId` | ContentId |  | The content URL of the asset to preload. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ContentProvider-Preload1`) are published on the source page; their code is not part of the open-source repo.*

### PreloadAsync

```lua
ContentProvider:PreloadAsync(contentIdList: Array, callbackFunction: Function = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`

Yields until all of the assets associated with the given [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] have loaded. This can be used to pause a script and not use content until it is certain that the content has been loaded into the experience.

When called, the engine identifies links to content for each item in the list. For any of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] which have properties that define links to content, such as a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] or a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]], the engine attempts to load these assets from Roblox. For each requested asset, the callback function runs, indicating the asset's final [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus|Enum.AssetFetchStatus]].

If any of the assets fail to load, an error message appears in the output. The method itself will not error and it will continue executing until it has processed each requested instance.

##### Limitations

[[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] are not supported by [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#PreloadAsync|PreloadAsync()]] because these objects rely on processed texture pack assets rather than directly loading individual textures. Calling it on a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] instance will not do anything, but the associated textures will still be streamed in during runtime.

If PreloadAsync is called on [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] that are not currently visible, such as a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] or an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]], the Engine will download and store textures used by those Instances in its disk cache. Because the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] are not visible in these cases, the Engine may reduce memory consumption by unloading the textures after preloading them.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `contentIdList` | Array |  | An array of instances to load. |
| `callbackFunction` | Function | `nil` | The function called when each asset request completes. Returns the [[30 Official Roblox Docs/API Reference/Datatypes/Content\|content]] string and the asset's final [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ContentProvider-PreloadAsync1`) are published on the source page; their code is not part of the open-source repo.*

### RegisterDefaultEncryptionKey

```lua
ContentProvider:RegisterDefaultEncryptionKey(encryptionKey: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement

Sets a fallback encryption key that the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider|ContentProvider]] uses to decrypt any encrypted asset that isn't matched by a key registered for a specific asset through [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterEncryptedAsset|RegisterEncryptedAsset()]]. When an asset is fetched, the engine first looks for a key registered for that asset's ID; if none exists, it falls back to this default key.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `encryptionKey` | string |  | The key to use as the default for decrypting encrypted assets. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RegisterDefaultSessionKey

```lua
ContentProvider:RegisterDefaultSessionKey(sessionKey: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement

Decrypts `sessionKey` using the session's cryptographic context and then registers the decrypted result as the default encryption key, exactly as [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterDefaultEncryptionKey|RegisterDefaultEncryptionKey()]] does. Use this variant when the key is delivered to the client in session-encrypted form rather than as plaintext.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `sessionKey` | string |  | The session-encrypted key to decrypt and register as the default encryption key. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RegisterEncryptedAsset

```lua
ContentProvider:RegisterEncryptedAsset(assetId: ContentId, encryptionKey: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement

Associates `encryptionKey` with the given `assetId` so that, when the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider|ContentProvider]] fetches that asset, it uses the key to decrypt the downloaded file. A key registered for a specific asset takes precedence over the default key set through [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterDefaultEncryptionKey|RegisterDefaultEncryptionKey()]]. The method throws an error if `assetId` isn't a valid asset ID.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | ContentId |  | The asset to associate the encryption key with. |
| `encryptionKey` | string |  | The key used to decrypt the specified asset. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RegisterSessionEncryptedAsset

```lua
ContentProvider:RegisterSessionEncryptedAsset(contentId: ContentId, sessionKey: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement

Decrypts `sessionKey` using the session's cryptographic context and then registers the decrypted result as the encryption key for `contentId`, exactly as [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterEncryptedAsset|RegisterEncryptedAsset()]] does. Use this variant when the per-asset key is delivered to the client in session-encrypted form rather than as plaintext.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `contentId` | ContentId |  | The asset to associate the decrypted key with. |
| `sessionKey` | string |  | The session-encrypted key to decrypt and register for the specified asset. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### UnregisterDefaultEncryptionKey

```lua
ContentProvider:UnregisterDefaultEncryptionKey(): ()
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement

Removes the default encryption key registered through [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterDefaultEncryptionKey|RegisterDefaultEncryptionKey()]], so that assets without a specifically registered key are no longer decrypted with a fallback key. Keys registered for individual assets through [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterEncryptedAsset|RegisterEncryptedAsset()]] are unaffected.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### UnregisterEncryptedAsset

```lua
ContentProvider:UnregisterEncryptedAsset(assetId: ContentId): ()
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement

Removes the encryption key associated with `assetId` by [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterEncryptedAsset|RegisterEncryptedAsset()]], so the asset is no longer decrypted with that key. If no key is registered for the asset, the call has no effect.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | ContentId |  | The asset whose registered encryption key should be removed. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### AssetFetchFailed

```lua
ContentProvider.AssetFetchFailed(assetId: ContentId)
```

**Capabilities:** AssetManagement

Fires when an asset requested through the [[30 Official Roblox Docs/API Reference/Classes/ContentProvider|ContentProvider]] fails to be fetched, passing the content ID of the asset that failed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | ContentId |  | The content ID of the asset that failed to load. |

---
*Source: [ContentProvider](https://create.roblox.com/docs/reference/engine/classes/ContentProvider) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
