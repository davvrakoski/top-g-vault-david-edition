---
title: "CurveAnimation"
description: "Stores animation data in the form of curves for each individual channel to animate."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CurveAnimation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Stores animation data in the form of curves for each individual channel to animate.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`CurveAnimation` is a subtype of [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] consumed by Roblox's animation system. It stores animation data for each animated channel in a rig as a separate, individual curve. For example, `CurveAnimation` stores the position channel for an articulated joint as a [[30 Official Roblox Docs/API Reference/Classes/Vector3Curve|Vector3Curve]], and it might store the rotation channel as a [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve|EulerRotationCurve]] or [[30 Official Roblox Docs/API Reference/Classes/RotationCurve|RotationCurve]].

#### Structure

`CurveAnimation` stores curves in a hierarchical manner, matching the hierarchy of the structure of [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]] in the animated model. Under each `CurveAnimation` instance lies a hierarchy of [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] instances representing animated joints in the model. Under each such folder instance, several possible instances may exist. An instance named `Position` of type [[30 Official Roblox Docs/API Reference/Classes/Vector3Curve|Vector3Curve]] can drive the local translation of the [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] on the animated model, while an instance named `Rotation` of type [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve|EulerRotationCurve]] or [[30 Official Roblox Docs/API Reference/Classes/RotationCurve|RotationCurve]] can drive the local rotation of the [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] on the animated model.

#### Partial matching of hierarchy

You can match partial hierarchies to a model when playing a `CurveAnimation` in Roblox's animation system. This means that not all joints need to be present in the hierarchy for the existing joints to apply properly. Furthermore, you can match hierarchies in a "relative" manner. For example, the first child [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] instance root can be `UpperTorso` and the animation system matches that to any existing sub-hierarchies in the model.

#### Animating miscellaneous channels

`CurveAnimation` can also animate other numerical values in a model. For example, you can animate FACS controls for facial animations by creating a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] under the `CurveAnimation` instance named after an existing [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] instance in the model. Then, to animate individual facial controllers, you can store individual [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] instances named after the animated [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] property.

#### Usage when making animations

As with other [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] types such as [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]], you must first upload `CurveAnimation` instances to Roblox before playing them. If you want to preview an animation before uploading it to Roblox, you can generate a temporary ID using [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#RegisterAnimationClip|AnimationClipProvider:RegisterAnimationClip()]]; this generates a hash ID that you can use for localized animation testing.

If you want to download the `CurveAnimation` corresponding to an existing uploaded animation using Luau scripts, use [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider#GetAnimationClipAsync|AnimationClipProvider:GetAnimationClipAsync()]].

---
*Source: [CurveAnimation](https://create.roblox.com/docs/reference/engine/classes/CurveAnimation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
