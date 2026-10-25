---
title: "Pose"
description: "Holds the `CFrame` applied to the `Motor6D` connected to its associated `BasePart`. The part which is controlled depends on the name of the Pose."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Pose"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Holds the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] applied to the [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] connected to its associated [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. The part which is controlled depends on the name of the Pose.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PoseBase|PoseBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

A Pose holds the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] applied to the [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] connected to its associated [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. The part which is controlled depends on the name of the Pose.

Poses are the fundamental building blocks of animations and, with `Keyframes`, make up `KeyframeSequences`.

## Poses, joints and hierarchy

Although a Pose is assigned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] by name, the object manipulated during animation playback is actually the [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] connected to this part. Animation rigs branch out from the model's root part through such joints.

In an [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|R15 character rig]], the root part is the HumanoidRootPart. The LowerTorso is connected to the HumanoidRootPart by the a motor named 'Root'. Therefore, the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of a Pose named 'LowerTorso' in a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] would be applied to the motor named 'Root', and not the LowerTorso itself.

Poses are arranged in a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] based on joint hierarchy. This means, the Pose's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] is applied to the motor connecting the part associated with the pose to the part associated with the pose's parent. See below for a visual example of the structure of Poses on a R15 character.

## Pose CFrame

The Roblox animation system applies [[30 Official Roblox Docs/API Reference/Classes/Pose#CFrame|Pose.CFrame]] to the corresponding [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] by manipulating the relative transformation of the motor, the [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Motor6D.Transform]] property. The original [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C0]] and [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]] values are not changed.

*Code samples for this API (`Keyframe-Generate-Poses`, `Keyframe-Reset-Poses`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Pose); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Pose#CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | This [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] applies to the [[30 Official Roblox Docs/API Reference/Classes/Motor6D\|Motor6D]] corresponding with the [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]] when the [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform\|Motor6D.Transform]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/Pose#MaskWeight\|MaskWeight]] | float | **Deprecated.**  |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Pose#AddSubPose\|AddSubPose()]] | () | Adds a sub [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]] to the [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]] by parenting it. |
| [[30 Official Roblox Docs/API Reference/Classes/Pose#GetSubPoses\|GetSubPoses()]] | Instances | Returns an array containing all sub [[30 Official Roblox Docs/API Reference/Classes/Pose\|Poses]] that have been added to a [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Pose#RemoveSubPose\|RemoveSubPose()]] | () | Removes a sub [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]] from the [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]] by parenting it to `nil`. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PoseBase|PoseBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

This [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] applies to the [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] corresponding with the [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] when the [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Motor6D.Transform]] is changed. The original [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|Motor6D.C0]] and [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|Motor6D.C1]] values are not changed.

[[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] objects are arranged in a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] based on joint hierarchy. This means, that the [[30 Official Roblox Docs/API Reference/Classes/Pose#CFrame|Pose.CFrame]] is applied to the motor connecting the part associated with the pose to the part associated with the pose's parent.

### MaskWeight

> [!warning] Deprecated
> This property is deprecated. Use the `Class.AnimationTrack:AdjustWeight()`
> function when blending multiple animations.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Animation · **Tags:** `NotReplicated`, `Deprecated`

## Methods

### AddSubPose

```lua
Pose:AddSubPose(pose: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Adds a sub [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] to the [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] by parenting it to it. It is functionally identical to setting the new pose's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] to the pose.

Note, this function will not error when an instance other than a [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] is given as the pose parameter and will parent it successfully.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pose` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Pose\|Pose]] to be added. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Keyframe-Add-Remove-Pose`) are published on the source page; their code is not part of the open-source repo.*

### GetSubPoses

```lua
Pose:GetSubPoses(): Instances
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns an array containing all sub [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] that have been added to a [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]]. This is functionally the same as using the [[30 Official Roblox Docs/API Reference/Classes/Instance#GetChildren|Instance:GetChildren()]] function on the [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]].

Note: this function returns all children of the [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]], including non [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] if any are present.

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array of sub [[30 Official Roblox Docs/API Reference/Classes/Pose\|Poses]]. |

*Code samples for this member (`Keyframe-Reset-Poses`) are published on the source page; their code is not part of the open-source repo.*

### RemoveSubPose

```lua
Pose:RemoveSubPose(pose: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Removes a sub [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] from the [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] by parenting it to `nil`. This is functionally identical to setting the new pose's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] to `nil`.

Note: If an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] other than [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] is used as a [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] parameter, this function removes that [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] and does not provide an error.

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
*Source: [Pose](https://create.roblox.com/docs/reference/engine/classes/Pose) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
