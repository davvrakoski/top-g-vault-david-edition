---
title: "Keyframe"
description: "A Keyframe holds the `Poses` applied to joints in a `Model` at a given point of time in an animation. `Keyframes` are interpolated between during animation playback."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Keyframe"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A Keyframe holds the [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] applied to joints in a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] at a given point of time in an animation. [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframes]] are interpolated between during animation playback.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

A Keyframe holds the [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] applied to joints in a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] at a given point of time in an animation. [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframes]] are interpolated between during animation playback.

Note, in most cases developers do not need to manipulate [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequences]] as the animation editor covers most animation functionality. However, in some cases a developer may wish to generate an animation from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or build their own plugin.

## Structure

Keyframes are held within a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] and contain [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] objects. The poses are named in accordance with the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] they correspond to and are structured in terms of joint hierarchy. This means each [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] is parented to the [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] corresponding to the part it is attached to.

Note, as [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] are named in accordance with the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] they correspond to, animations require distinct part names to play correctly.

## Interpolation

During animation playback the poses in different keyframes are interpolated between. This allows a smooth animation to be created without needing to define every frame. Note, the style of interpolation is determined in the [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] object. The Keyframe object merely holds the [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] at a defined point of time in the animation ([[30 Official Roblox Docs/API Reference/Classes/Keyframe#Time|Keyframe.Time]]).

*Code samples for this API (`Keyframe-Generate-Poses`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Keyframe); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Keyframe#Time\|Time]] | float | The [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] time position (in seconds) in an animation. This determines the time at which the [[30 Official Roblox Docs/API Reference/Classes/Pose\|Poses]] inside the keyframe will be shown. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Keyframe#AddMarker\|AddMarker()]] | () | Adds a [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker\|KeyframeMarker]] to the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] by parenting it to the keyframe. |
| [[30 Official Roblox Docs/API Reference/Classes/Keyframe#AddPose\|AddPose()]] | () | Adds a [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]] to the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] by parenting it to the keyframe. |
| [[30 Official Roblox Docs/API Reference/Classes/Keyframe#GetMarkers\|GetMarkers()]] | List<[[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker\|KeyframeMarker]]> | Returns an array containing all `KeyframeMarkers` that have been added to the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Keyframe#GetPoses\|GetPoses()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]]> | Returns an array containing all [[30 Official Roblox Docs/API Reference/Classes/Pose\|Poses]] that have been added to a [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Keyframe#RemoveMarker\|RemoveMarker()]] | () | Removes a [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker\|KeyframeMarker]] from the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] by settings its [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent\|Instance.Parent]] to `nil`. |
| [[30 Official Roblox Docs/API Reference/Classes/Keyframe#RemovePose\|RemovePose()]] | () | Removes a [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]] from the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] by setting its [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent\|Instance.Parent]] to `nil`. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Time

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

This property gives the [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] time position (in seconds) in an animation. This determines the time at which the [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] inside the keyframe will be shown.

Note the [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] with the highest time value in a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] is used to determine the length of the animation.

*Code samples for this member (`Get-KeyframeSequence-Length`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### AddMarker

```lua
Keyframe:AddMarker(marker: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This function adds a [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker|KeyframeMarker]] to the [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] by parenting it to the keyframe. It is functionally identical to setting the marker's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] to the Keyframe.

Note, this function will not error when an instance other than a KeyframeMarker is given as the parameter and will parent it successfully.

#### More about Keyframes

[[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] names do not need to be unique. For example, if an Animation has three keyframes named "Particles" the connected event returned by [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal|AnimationTrack:GetMarkerReachedSignal()]] will fire each time one of these keyframes is reached.

[[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] names can be set in the Roblox Animation Editor when creating or editing an animation. They cannot however be set by a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] on an existing animation prior to playing it.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Keyframe#RemoveMarker|Keyframe:RemoveMarker()]]
- [[30 Official Roblox Docs/API Reference/Classes/Keyframe#GetMarkers|Keyframe:GetMarkers()]]
- [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal|AnimationTrack:GetMarkerReachedSignal()]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `marker` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker\|KeyframeMarker]] being parented to the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`add-marker-remove-marker`) are published on the source page; their code is not part of the open-source repo.*

### AddPose

```lua
Keyframe:AddPose(pose: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This function adds a [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] to the [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] by parenting it to the keyframe. It is functionally identical to setting the pose's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] to the keyframe.

Note, this function will not error when an instance other than a [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] is given as the pose parameter and will parent it successfully.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pose` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]] to be added. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Keyframe-Generate-Poses`, `Keyframe-Add-Remove-Pose`) are published on the source page; their code is not part of the open-source repo.*

### GetMarkers

```lua
Keyframe:GetMarkers(): List<KeyframeMarker>
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This function returns an array containing all [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker|KeyframeMarkers]] that have been added to the [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]]. Note, this function will only return [[30 Official Roblox Docs/API Reference/Classes/Instance|instances]] of type KeyframeMarker.

#### More about Keyframes

[[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] names do not need to be unique. For example, if an Animation has three keyframes named "Particles" the connected event returned by [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal|AnimationTrack:GetMarkerReachedSignal()]] will fire each time one of these keyframes is reached.

[[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] names can be set in the Roblox Animation Editor when creating or editing an animation. They cannot however be set by a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] on an existing animation prior to playing it.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Keyframe#AddMarker|Keyframe:AddMarker()]]
- [[30 Official Roblox Docs/API Reference/Classes/Keyframe#RemoveMarker|Keyframe:RemoveMarker()]]
- [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal|AnimationTrack:GetMarkerReachedSignal()]]

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker\|KeyframeMarker]]> | An array containing all [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker\|KeyframeMarkers]] that have been added to the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]]. |

*Code samples for this member (`get-keyframe-markers-attached-to-a-keyframe`) are published on the source page; their code is not part of the open-source repo.*

### GetPoses

```lua
Keyframe:GetPoses(): List<Pose>
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This function returns an array containing all [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] that have been added to a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]].

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Pose\|Poses]]. |

*Code samples for this member (`Keyframe-Reset-Poses`) are published on the source page; their code is not part of the open-source repo.*

### RemoveMarker

```lua
Keyframe:RemoveMarker(marker: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This function removes a [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker|KeyframeMarker]] from the [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] by settings its [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] to `nil`.

The KeyframeMarker's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] is set to `nil` but it is not destroyed. This means, provided the marker is referenced it can be re-parented later.

Note, this function will not error when an instance other than a KeyframeMarker is given as the parameter.

#### More about Keyframes

[[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] names do not need to be unique. For example, if an Animation has three keyframes named "Particles" the connected event returned by [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal|AnimationTrack:GetMarkerReachedSignal()]] will fire each time one of these keyframes is reached.

[[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] names can be set in the Roblox Animation Editor when creating or editing an animation. They cannot however be set by a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] on an existing animation prior to playing it.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Keyframe#AddMarker|Keyframe:AddMarker()]]
- [[30 Official Roblox Docs/API Reference/Classes/Keyframe#GetMarkers|Keyframe:GetMarkers()]]
- [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal|AnimationTrack:GetMarkerReachedSignal()]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `marker` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The marker being removed from the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`add-marker-remove-marker`) are published on the source page; their code is not part of the open-source repo.*

### RemovePose

```lua
Keyframe:RemovePose(pose: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This function removes a [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] from the [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] by setting its [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] to `nil` without destroying it. This means the provided the pose is referenced and it can be re-parented later.

Note, this function will not error when an instance other than a [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] is given as the pose parameter.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pose` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]] to be removed. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Keyframe-Add-Remove-Pose`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Keyframe](https://create.roblox.com/docs/reference/engine/classes/Keyframe) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
