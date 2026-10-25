---
title: "KeyframeSequenceProvider"
description: "Provides functions to load and preview `KeyframeSequence`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/KeyframeSequenceProvider"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides functions to load and preview [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]].*

> [!warning] Deprecated
> This service is deprecated and does not support the newer
> `Class.AnimationClip`. It's recommended to use `Class.AnimationClipProvider`
> instead.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

The **KeyframeSequenceProvider** service provides functions to load and preview [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequences]]. It includes a number of functions that are useful when working with [[30 Official Roblox Docs/API Reference/Classes/Animation|Animations]].

A [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] stores a series of [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] that encode the hierarchy and motion of an animation. The animation data Roblox uses in the playback of an animation, referenced by the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] property, can be constructed from a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]]. [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequences]] are usually created by the Roblox [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] but can be created through other plugins or even manually.

*Code samples for this API (`KeyframeSequenceProvider-RegisterKeyframeSequence`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/KeyframeSequenceProvider); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider#GetAnimations\|GetAnimations()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** This function returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] object which can be used to iterate over animations owned by a specific user. |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider#GetAnimationsAsync\|GetAnimationsAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | This function returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] object which can be used to iterate over animations owned by a specific user. |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider#GetKeyframeSequence\|GetKeyframeSequence()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Returns a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] from a given asset URL. |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider#GetKeyframeSequenceAsync\|GetKeyframeSequenceAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns a KeyframeSequence based on the specified assetId asynchronously. |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider#GetKeyframeSequenceById\|GetKeyframeSequenceById()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Returns a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] from the supplied assetId. |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider#RegisterActiveKeyframeSequence\|RegisterActiveKeyframeSequence()]] | ContentId | Generates a temporary asset ID from a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] that can be used for localized testing of an animation. Generates an _active://_ URL. |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider#RegisterKeyframeSequence\|RegisterKeyframeSequence()]] | ContentId | Generates a temporary asset ID from a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] that can be used for localized testing of an animation. Generates a hash. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetAnimations

> [!warning] Deprecated
> This member is deprecated.

```lua
KeyframeSequenceProvider:GetAnimations(userId: User): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Yields`, `Deprecated`

This function returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages|InventoryPages]] object which can be used to iterate over animations owned by a specific user.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The user ID of the user. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | An [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] of animations. |

*Code samples for this member (`KeyframeSequenceProvider-GetAnimations`) are published on the source page; their code is not part of the open-source repo.*

### GetAnimationsAsync

```lua
KeyframeSequenceProvider:GetAnimationsAsync(userId: User): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Yields`

This function returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages|InventoryPages]] object which can be used to iterate over animations owned by a specific user.

This function has a number of potential uses, such as allowing users to browse and import animations into a custom animation plugin.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The user ID of the user. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | An [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] of animations. |

*Code samples for this member (`KeyframeSequenceProvider-GetAnimations`) are published on the source page; their code is not part of the open-source repo.*

### GetKeyframeSequence

> [!warning] Deprecated
> This function is deprecated and can lead to the game freezing until the
> animation is loaded. Developers are recommended to use
> `Class.KeyframeSequenceProvider:GetKeyframeSequenceAsync()` instead.

```lua
KeyframeSequenceProvider:GetKeyframeSequence(assetId: ContentId): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Deprecated`

Returns a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] from a given asset URL.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | ContentId |  | The content ID of the animation. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] found. |

### GetKeyframeSequenceAsync

```lua
KeyframeSequenceProvider:GetKeyframeSequenceAsync(assetId: ContentId): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Yields`

GetKeyframeSequenceAsync returns a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] based on the specified assetId. The assetId must correspond to an animation. The function will yield until the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] is loaded from the website. Because this is a webcall it should wrapped in a pcall.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | ContentId |  | The content ID of the animation. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] found. |

*Code samples for this member (`KeyframeSequenceProvider-GetKeyframeSequenceAsync1`) are published on the source page; their code is not part of the open-source repo.*

### GetKeyframeSequenceById

> [!warning] Deprecated
> This function is deprecated and can lead to the game freezing until the
> animation is loaded. Developers are recommended to use
> `Class.KeyframeSequenceProvider:GetKeyframeSequenceAsync()` instead.

```lua
KeyframeSequenceProvider:GetKeyframeSequenceById(assetId: int64, useCache: boolean): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Deprecated`

Returns a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] from the supplied assetId. Can optionally cache to reduce unnecessary loading freezes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  | The content ID of the animation. |
| `useCache` | boolean |  | True if a cached version can be returned. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] found. |

### RegisterActiveKeyframeSequence

```lua
KeyframeSequenceProvider:RegisterActiveKeyframeSequence(keyframeSequence: Instance): ContentId
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Generates a temporary asset ID from a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] that can be used for localized testing of an animation.

This function performs the same function to [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider#RegisterKeyframeSequence|KeyframeSequenceProvider:RegisterKeyframeSequence()]] however this function generates an _active://_ URL instead of a hash.

The ID generated can be used in an [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] property for testing.

The asset ID generated by this function is temporary and cannot be used outside of Studio. Developers wishing to generate an asset ID that can be used online should upload the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] to Roblox.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keyframeSequence` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] to be used. |

**Returns**

| Type | Description |
| --- | --- |
| ContentId | A temporary asset ID generated for localized animation playback. |

*Code samples for this member (`KeyframeSequenceProvider-RegisterKeyframeSequence`) are published on the source page; their code is not part of the open-source repo.*

### RegisterKeyframeSequence

```lua
KeyframeSequenceProvider:RegisterKeyframeSequence(keyframeSequence: Instance): ContentId
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Generates a temporary asset ID from a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] that can be used for localized testing of an animation.

This function performs the same function to [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider#RegisterActiveKeyframeSequence|KeyframeSequenceProvider:RegisterActiveKeyframeSequence()]] however this function generates a hash instead of an _active://_ URL.

The ID generated can be used for the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] property to test animations.

The asset ID generated by this function is temporary and cannot be used outside of Studio. Developers wishing to generate an asset ID that can be used online should upload the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] to Roblox.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keyframeSequence` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] to be used. |

**Returns**

| Type | Description |
| --- | --- |
| ContentId | A temporary asset ID generated for localized animation playback. |

*Code samples for this member (`KeyframeSequenceProvider-RegisterKeyframeSequence1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [KeyframeSequenceProvider](https://create.roblox.com/docs/reference/engine/classes/KeyframeSequenceProvider) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
