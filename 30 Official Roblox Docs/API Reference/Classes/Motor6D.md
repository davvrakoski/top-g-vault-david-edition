---
title: "Motor6D"
description: "Creates an animatable joint between two `BaseParts`. Superseded by `AnimationConstraint` for avatar/character rigs. Motor6D is no longer used by default for player characters when `AvatarJointUpgrade` is enabled."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Motor6D"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Creates an animatable joint between two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]]. Superseded by [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]] for avatar/character rigs. Motor6D is no longer used by default for player characters when [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#AvatarJointUpgrade|AvatarJointUpgrade]] is enabled.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Motor|Motor]] → [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

#### Description

**Motor6D** joins two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] ([[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|Part0]] and [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1|Part1]]) together in an animatable way. The [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Transform]] property determines the offset between these parts. This can be set manually using [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|RunService.PreSimulation]] or through an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]].

Models whose parts are joined by [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] are usually referred to as **rigs**, typically for [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]]. Motor6D remains appropriate for non-avatar mechanical rigs (doors, turrets, vehicles) where physical simulation is not needed.

#### Transitioning to AnimationConstraint for Avatar rigs

As of the [Avatar Joint Upgrade](https://devforum.roblox.com/t/avatar-joint-upgrade-for-physically-simulated-character-movement-is-now-live/4298561), R15 player characters spawn with [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraints]] instead of Motor6Ds when [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#AvatarJointUpgrade|AvatarJointUpgrade]] is enabled (the default for new experiences). Code that assumes character joints are Motor6Ds — such as `character:FindFirstChildOfClass("Motor6D")` or `joint:IsA("Motor6D")` — will not find joints on upgraded characters. Use [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]] for new avatar rig code. See the migration notes on the [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]] page.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Motor6D#ChildName\|ChildName]] | string | Read-only name of the joint's child part, mirroring the [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Name]] of [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1\|Part1]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Motor6D#ParentName\|ParentName]] | string | Read-only name of the joint's parent part, mirroring the [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Name]] of [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0\|Part0]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform\|Transform]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Describes the current animation offset of the [[30 Official Roblox Docs/API Reference/Classes/Motor6D\|Motor6D]] joint. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Motor|Motor]], [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ChildName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Animatable · **Loaded/Saved:** false/false · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

A read-only string that reflects the [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]] of the part assigned to [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1|Part1]] (the joint's child). The value is derived from `Part1`, so writing to it has no effect. When [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1|Part1]] is not set, this property is an empty string.

The animation system uses this name to match the joint against the corresponding pose channel in an animation, so a rig's part names must line up with the names authored in its animations.

### ParentName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Animatable · **Loaded/Saved:** false/false · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

A read-only string that reflects the [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]] of the part assigned to [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|Part0]] (the joint's parent). The value is derived from `Part0`, so writing to it has no effect. When [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|Part0]] is not set, this property is an empty string.

The animation system uses this name to match the joint against the corresponding pose channel in an animation, so a rig's part names must line up with the names authored in its animations.

### Transform

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Physics · **Tags:** `Hidden`, `NotReplicated`

The internal [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] that is manipulated when a [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] is being animated. It is recommended to use this property for custom animations rather than [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|JointInstance.C0]] and [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|JointInstance.C1]].

##### Timing

[[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] transforms are not applied immediately, unlike updating [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]] and [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]], but rather as a batch in a parallel job after [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|RunService.PreSimulation]], immediately before physics steps. The deferred batch update is much more efficient than many immediate updates.

If the [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] is part of an animated model with an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]], then [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Motor6D.Transform]] will usually be overwritten every frame by the [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] after [[30 Official Roblox Docs/API Reference/Classes/RunService#PreAnimation|RunService.PreAnimation]] and before [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|RunService.PreSimulation]].

---
*Source: [Motor6D](https://create.roblox.com/docs/reference/engine/classes/Motor6D) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
