---
title: "AnimationController"
description: "Allows animations to be loaded and applied to a character or model in place of a `Humanoid`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AnimationController"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Allows animations to be loaded and applied to a character or model in place of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

An object which allows animations to be loaded and applied to a character or model in place of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. Creates an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] and loads animations to update [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]] of said character to react in the way that is described within the animation asset referenced by an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object.

Note that the [[30 Official Roblox Docs/API Reference/Classes/AnimationController#LoadAnimation|LoadAnimation()]] method of this class has been deprecated. Instead, you should call [[30 Official Roblox Docs/API Reference/Classes/Animator#LoadAnimation|Animator:LoadAnimation()]] directly from an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] which can be created manually in Studio and directly referenced in scripts. When the deprecated method is called from an [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]], the controller itself does nothing regarding the animation intended to be loaded, except to automatically generate an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]], onto which the loading call and animation ID are transferred. In this way, the [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]] can be thought of as nothing more than an empty shell for a child [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] object which handles any actual functionality regarding animations.

*Code samples for this API (`AnimationController`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AnimationController); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationController#GetPlayingAnimationTracks\|GetPlayingAnimationTracks()]] | Array | **Deprecated.** Returns an array of all [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTracks]] that are currently being played by the [[30 Official Roblox Docs/API Reference/Classes/AnimationController\|AnimationController]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationController#LoadAnimation\|LoadAnimation()]] | [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] | **Deprecated.** Loads an [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] onto an [[30 Official Roblox Docs/API Reference/Classes/AnimationController\|AnimationController]], returning an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] that can be used for playback. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationController#AnimationPlayed\|AnimationPlayed]] | `animationTrack` | **Deprecated.** Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/AnimationController\|AnimationController]] begins playing an animation. It returns the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] playing. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetPlayingAnimationTracks

> [!warning] Deprecated
> This member is deprecated.

```lua
AnimationController:GetPlayingAnimationTracks(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Deprecated`

Returns an array of all [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] that are currently being played by the [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]].

A typical use for this function is stopping currently playing tracks using [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Stop|AnimationTrack:Stop()]].

Note this function will not return [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] that have loaded but are not playing. If the developer wishes to track these they will need to index them manually. See below for one example of how this could be achieved:

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of playing [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTracks]]. |

*Code samples for this member (`GetPlayingAnimationTracks`, `AnimationController-GetPlayingAnimationTracks`) are published on the source page; their code is not part of the open-source repo.*

### LoadAnimation

> [!warning] Deprecated
> This function is deprecated in favor of using
> `Class.Animator:LoadAnimation()` directly (the `Class.Animator` may be
> created while editing or at runtime).

```lua
AnimationController:LoadAnimation(animation: Animation): AnimationTrack
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Deprecated`

This function loads an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] onto an [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]], returning an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] that can be used for playback.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `animation` | [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] to be used. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] |  |

*Code samples for this member (`AnimationController`) are published on the source page; their code is not part of the open-source repo.*

## Events

### AnimationPlayed

> [!warning] Deprecated
> This member is deprecated.

```lua
AnimationController.AnimationPlayed(animationTrack: AnimationTrack)
```

**Capabilities:** Animation · **Tags:** `Deprecated`

This event fires whenever the [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]] begins playing an animation. It returns the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] playing.

The [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] can be used to access the animation's playback functions and events. It will only fire for animations playing on the specific [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]].

See [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AnimationPlayed|Humanoid.AnimationPlayed]] for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] variant of this function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `animationTrack` | [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] |  | The [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] that was played. |

---
*Source: [AnimationController](https://create.roblox.com/docs/reference/engine/classes/AnimationController) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
