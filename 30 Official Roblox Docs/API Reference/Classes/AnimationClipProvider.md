---
title: "AnimationClipProvider"
description: "Provides functions to load and preview `AnimationClips`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AnimationClipProvider"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides functions to load and preview [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClips]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Provides functions to load and preview [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClips]]. It includes a number of functions that are useful when working with an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]].

The [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider|AnimationClipProvider]] replaces the deprecated [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider|KeyframeSequenceProvider]] that was used to download `KeyframeSequences` by content ID.

The AnimationClipProvider has a number of uses.

- Download the [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] associated with an animation content ID from the Roblox website, regardless of the underlying type of [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] ([[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] or [[30 Official Roblox Docs/API Reference/Classes/CurveAnimation|CurveAnimation]]).
- Generate a temporary ID to locally preview an animation.
- Fetch the content IDs of animations owned by a particular user.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#GetAnimationClip\|GetAnimationClip()]] | [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] | **Deprecated.** Returns a [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] from a given asset URL. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#GetAnimationClipAsync\|GetAnimationClipAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] based on the specified assetId asynchronously. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#GetAnimationClipById\|GetAnimationClipById()]] | [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] | **Deprecated.** Returns a [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] from the supplied assetId. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#GetAnimations\|GetAnimations()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** This function returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] object which can be used to iterate over animations owned by a specific user. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#GetAnimationsAsync\|GetAnimationsAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | This function returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] object which can be used to iterate over animations owned by a specific user. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#GetClipEvaluatorAsync\|GetClipEvaluatorAsync()]] | ClipEvaluator | Returns a `ClipEvaluator` for the [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] at the given content ID, loaded asynchronously. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#RegisterActiveAnimationClip\|RegisterActiveAnimationClip()]] | ContentId | Generates a temporary asset ID from a [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] that can be used for localized testing of an animation. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#RegisterAnimationClip\|RegisterAnimationClip()]] | ContentId | Generates a temporary asset ID from a [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] that can be used for localized testing of an animation. Generates a hash. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetAnimationClip

> [!warning] Deprecated
> This function is deprecated and can lead to the game freezing until the
> animation is loaded. Developers are recommended to use
> `GetAnimationClipAsync` instead.

```lua
AnimationClipProvider:GetAnimationClip(assetId: ContentId): AnimationClip
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Deprecated`

Returns a [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] from a given asset URL.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | ContentId |  | The content ID of the animation. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] | The [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] found. |

### GetAnimationClipAsync

```lua
AnimationClipProvider:GetAnimationClipAsync(assetId: ContentId): AnimationClip
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Yields`

Fetches an [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] based on the specified assetId. The assetId must correspond to an animation asset in Roblox. The function will yield until the [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] is loaded from the website and should be wrapped in a `pcall`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | ContentId |  | The content ID of the animation. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] | The [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] found. |

### GetAnimationClipById

> [!warning] Deprecated
> This function is deprecated and can lead to the game freezing until the
> animation is loaded. Developers are recommended to use
> `GetAnimationClipAsync` instead.

```lua
AnimationClipProvider:GetAnimationClipById(assetId: int64, useCache: boolean): AnimationClip
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Deprecated`

Returns a [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] from the supplied assetId. Can optionally cache to reduce unnecessary loading freezes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  | The content ID of the animation. |
| `useCache` | boolean |  | True if a cached version can be returned. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] | The [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] found. |

### GetAnimations

> [!warning] Deprecated
> This member is deprecated.

```lua
AnimationClipProvider:GetAnimations(userId: User): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Yields`, `Deprecated`

This function returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages|InventoryPages]] object which can be used to iterate over animations owned by a specific user. It yields until the first page of results is loaded from the website. The `userId` must be a positive number; otherwise the call errors.

This function is deprecated. Use [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#GetAnimationsAsync|GetAnimationsAsync]] instead, which behaves identically.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The user ID of the user. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | An [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] of animations. |

### GetAnimationsAsync

```lua
AnimationClipProvider:GetAnimationsAsync(userId: User): Instance
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

### GetClipEvaluatorAsync

```lua
AnimationClipProvider:GetClipEvaluatorAsync(assetId: ContentId): ClipEvaluator
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Yields`

Fetches the [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] at the specified `assetId` and returns a `ClipEvaluator` that wraps it. A `ClipEvaluator` samples the clip at an arbitrary time to produce an animation pose, so you can read animation data directly instead of playing it back through an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]].

The `assetId` must be an animation asset on Roblox. Yields until the clip is loaded and should be wrapped in a `pcall`. Loads through the same path as [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#GetAnimationClipAsync|GetAnimationClipAsync]], at the local player animation priority.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | ContentId |  | The content ID of the animation to load. |

**Returns**

| Type | Description |
| --- | --- |
| ClipEvaluator | A `ClipEvaluator` that can sample the loaded [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]]. |

### RegisterActiveAnimationClip

```lua
AnimationClipProvider:RegisterActiveAnimationClip(animationClip: AnimationClip): ContentId
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Generates a temporary asset ID from a [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] that can be used for localized testing of an animation. This performs the same function as [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#RegisterAnimationClip|RegisterAnimationClip()]] but generates an `active://` URL instead of a hash. The generated ID can be used as an [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|AnimationId]] property for testing.

The asset ID generated by this function is temporary and cannot be used outside of Studio. Developers wishing to generate an asset ID that can be used online should upload the [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] to Roblox.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `animationClip` | [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] |  | The [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] to be used. |

**Returns**

| Type | Description |
| --- | --- |
| ContentId | A temporary asset ID generated for localized animation playback. |

### RegisterAnimationClip

```lua
AnimationClipProvider:RegisterAnimationClip(animationClip: AnimationClip): ContentId
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Generates a temporary asset ID from a [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] that can be used for localized testing of an animation.

This function performs the same function to [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#RegisterActiveAnimationClip|RegisterActiveAnimationClip]] yet generates a hash instead of an `active://` URL.

The ID generated can be used for the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] property to test animations.

The asset ID generated by this function is temporary and cannot be used outside of Studio. Developers wishing to generate an asset ID that can be used online should upload the [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] to Roblox.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `animationClip` | [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] |  | The [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] to be used. |

**Returns**

| Type | Description |
| --- | --- |
| ContentId | A temporary asset ID generated for localized animation playback. |

---
*Source: [AnimationClipProvider](https://create.roblox.com/docs/reference/engine/classes/AnimationClipProvider) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
