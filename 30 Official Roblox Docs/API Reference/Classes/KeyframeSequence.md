---
title: "KeyframeSequence"
description: "This object stores all of the `Keyframes` and other data for the animation."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/KeyframeSequence"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*This object stores all of the [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframes]] and other data for the animation.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

[[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] stores all the [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframes]] for an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]], determines if the animation will [[30 Official Roblox Docs/API Reference/Classes/AnimationClip#Loop|Loop]], and determines its [[30 Official Roblox Docs/API Reference/Classes/AnimationClip#Priority|Priority]] against other animations. The last [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] in the sequence, meaning the [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] with the highest [[30 Official Roblox Docs/API Reference/Classes/Keyframe#Time|Time]] property, determines the length of an animation.

Although [[30 Official Roblox Docs/API Reference/Classes/AnimationClip#Priority|Priority]] and [[30 Official Roblox Docs/API Reference/Classes/AnimationClip#Loop|Loop]] save the priority and looped animation settings for the sequence, note that [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] properties can eventually overwrite these properties at playback time.

If you want to preview an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] before uploading it to Roblox, you can generate a temporary hash ID using [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequenceProvider#RegisterKeyframeSequence|KeyframeSequenceProvider:RegisterKeyframeSequence()]] for localized animation testing.

#### Obtaining Sequences

In some cases you may wish to download the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] corresponding to an existing uploaded [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]]. You can use [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#GetAnimationClipAsync|AnimationClipProvider:GetAnimationClipAsync()]] to download an animation.

*Code samples for this API (`Get-KeyframeSequence-Length`, `KeyframeSequence-Instantiation`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/KeyframeSequence); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence#AuthoredHipHeight\|AuthoredHipHeight]] | float | Contains the hip height of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] of the model that was used to author this [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence#AddKeyframe\|AddKeyframe()]] | () | Adds a [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] to the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] by parenting it to the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]]. |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence#GetKeyframes\|GetKeyframes()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]]> | Returns an array that contains all [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframes]] contained in a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]]. |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence#RemoveKeyframe\|RemoveKeyframe()]] | () | This method removes a [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] from the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] by setting its parent to `nil`. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AuthoredHipHeight

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation · **Tags:** `Hidden`

Contains the hip height of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] of the model that was used to author this [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]]. Default value is `1.35` since that is the hip height set for a standard R15 character.

## Methods

### AddKeyframe

```lua
KeyframeSequence:AddKeyframe(keyframe: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This method adds a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] to the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] by parenting it to the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]]. It is functionally identical to setting the keyframe's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] to the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]].

Note that this method will not error when called with an instance other than a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] as the `keyframe` parameter and will parent it successfully.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keyframe` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] to be added. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`KeyframeSequence-Instantiation`) are published on the source page; their code is not part of the open-source repo.*

### GetKeyframes

```lua
KeyframeSequence:GetKeyframes(): List<Keyframe>
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This method returns an array that contains all [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframes]] that have been added to a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]].

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframes]]. |

*Code samples for this member (`Get-KeyframeSequence-Length`) are published on the source page; their code is not part of the open-source repo.*

### RemoveKeyframe

```lua
KeyframeSequence:RemoveKeyframe(keyframe: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This method removes a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] from the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] by setting its parent to `nil`. It is functionally identical to setting the keyframe's parent to `nil`.

Note that while this sets the keyframe's parent to `nil`, it does not destroy it. Provided another reference to the keyframe remains, it can be re-parented later.

Also note that this method will not error when called with an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] other than a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] as the keyframe parameter.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keyframe` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] to be removed. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`KeyframeSequence-RemoveKeyframe`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [KeyframeSequence](https://create.roblox.com/docs/reference/engine/classes/KeyframeSequence) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
