---
title: "Bone"
description: "Bones are non-rendered objects that drive the movement of one or more parts for the purposes of animation, or creating clothing and characters."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Bone"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Bones are non-rendered objects that drive the movement of one or more parts for the purposes of animation, or creating clothing and characters.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Bones are non-rendered objects that drive the movement of one or more parts for the purposes of animation, or creating clothing and characters. Bones are part of a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object's skeletal **rig** that you typically access and animate through the [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]].

Rigs are created during the modeling process in third-party software such as Blender or Maya. After importing the rigged model into Studio, you can add the model directly to your experience, or save and share the model as an asset. See [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning|Rigging]] for more details on creating and using rigged models.

Note that you can parent [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]] under other [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]] and parts. When parenting a bone to another bone, the child bone's world position will be relative to the parent bone's position, and the hierarchy of parented [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] objects can change the behavior of affected parts during posing or animation.

##### Relationship with Motor6D

To support animations with older rigs using joints, such as [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], you can use the [[30 Official Roblox Docs/API Reference/Classes/Bone#Transform|Bone.Transform]] property in the same way as [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Motor6D.Transform]]. Roblox uses the offset of the bones from the default pose to drive an animation, and bones are not replicated or serialized.

##### Bone.CFrame

Bones inherit the [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame|CFrame]] property of [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] which Roblox uses as the bone's reference position. The inherited [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldCFrame|WorldCFrame]] and other world properties return the initial un-transformed position.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Bone#Transform\|Transform]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Determines the current animated offset of the bone in its local space. |
| [[30 Official Roblox Docs/API Reference/Classes/Bone#TransformedCFrame\|TransformedCFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Describes the combined [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame\|CFrame]] offset of the bone and the current animation offset in the bone local space. |
| [[30 Official Roblox Docs/API Reference/Classes/Bone#TransformedWorldCFrame\|TransformedWorldCFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Describes the combined [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame\|CFrame]] offset of the bone and the current animation offset in world space. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Transform

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** true/false · **Capabilities:** Basic, Animation · **Tags:** `NotReplicated`

**Transform** determines the current animated offset of the bone relative to its [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame|CFrame]]. This property is set by Roblox when animations on skinned meshes are played, although it can be manipulated manually in a manner similar to [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Motor6D.Transform]].

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Motor6D.Transform]], a property which plays a similar role in character rig animation
- [[30 Official Roblox Docs/API Reference/Classes/Bone#TransformedCFrame|TransformedCFrame]] and [[30 Official Roblox Docs/API Reference/Classes/Bone#TransformedWorldCFrame|TransformedWorldCFrame]], whose values are partially determined by this property

### TransformedCFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Derived Data · **Loaded/Saved:** false/false · **Capabilities:** Basic, Animation · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

**TransformedCFrame** describes the combined [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame|CFrame]] offset of the bone and the current animation offset ([[30 Official Roblox Docs/API Reference/Classes/Bone#Transform|Transform]]) in the bone's local space.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Bone#Transform|Transform]], a property which partially determines this property's value
- [[30 Official Roblox Docs/API Reference/Classes/Bone#TransformedWorldCFrame|Bone.TransformedWorldCFrame]], a world-space variant of this property

### TransformedWorldCFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** Unsafe · **Category:** Derived World Data · **Loaded/Saved:** false/false · **Capabilities:** Basic, Animation · **Tags:** `ReadOnly`, `NotReplicated`

**TransformedWorldCFrame** describes the combined [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame|CFrame]] offset of the bone and the current animation offset ([[30 Official Roblox Docs/API Reference/Classes/Bone#Transform|Transform]]) in world space.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Bone#Transform|Transform]], a property which partially determines this property's value
- [[30 Official Roblox Docs/API Reference/Classes/Bone#TransformedCFrame|Bone.TransformedCFrame]], a local-space variant of this property

---
*Source: [Bone](https://create.roblox.com/docs/reference/engine/classes/Bone) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
