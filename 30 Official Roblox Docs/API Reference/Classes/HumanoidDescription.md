---
title: "HumanoidDescription"
description: "Describes the appearance of a Humanoid character including body parts, accessories, colors, scales, animations, and emotes."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Describes the appearance of a Humanoid character including body parts, accessories, colors, scales, animations, and emotes.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

**HumanoidDescription** is an object that stores a description of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] for R6 and [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|R15 rigs]]. It can be [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] in order to set a rig's scaling, clothing ([[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]], [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]], [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic|ShirtGraphic]]), [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessories]], [[30 Official Roblox Docs/API Reference/Classes/Animation|Animations]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors|BodyColors]].

You can get a HumanoidDescription by using the following functions:

- [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromUserIdAsync|Players:GetHumanoidDescriptionFromUserIdAsync()]], for an outfit currently being worn by a user on Roblox.
- [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromOutfitIdAsync|Players:GetHumanoidDescriptionFromOutfitIdAsync()]], for an outfit created by a user on Roblox.
- You can create a Humanoid rig model from a HumanoidDescription through [[30 Official Roblox Docs/API Reference/Classes/Players#CreateHumanoidModelFromDescriptionAsync|Players:CreateHumanoidModelFromDescriptionAsync()]].

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AccessoryBlob\|AccessoryBlob]] | string | A JSON formatted array of Layered clothing where each table in the entry in the array describes an accessory's AssetId, AccessoryType, Order, and (optionally) Puffiness as key-value pairs. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BackAccessory\|BackAccessory]] | string | A comma-separated list of asset IDs that will be added as [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessories]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] rig when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]], usually those attached to its back (such as capes). |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BodyTypeScale\|BodyTypeScale]] | float | Determines the factor by which the shape of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is interpolated from the standard R15 body shape (0) to a taller and more slender body type (1). |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ClimbAnimation\|ClimbAnimation]] | int64 | When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]], this determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId\|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState\|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Climbing]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#DepthScale\|DepthScale]] | float | Determines by what factor the depth (back-to-front distance) of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is scaled. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Face\|Face]] | int64 | Determines the asset ID of the Face to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FaceAccessory\|FaceAccessory]] | string | A comma-separated list of asset IDs that will be added as [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessories]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] rig when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]], usually those attached to the front of its face (such as glasses). |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation\|FallAnimation]] | int64 | When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]], this determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId\|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState\|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Freefall]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FrontAccessory\|FrontAccessory]] | string | A comma-separated list of asset IDs that will be added as [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessories]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] rig when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]], usually those attached to front of its torso (such as medals or ties). |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GraphicTShirt\|GraphicTShirt]] | int64 | Determines the [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic#Graphic\|Graphic]] used by a [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic\|ShirtGraphic]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory\|HairAccessory]] | string | A comma-separated list of asset IDs that will be added as [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessories]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] rig when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]], usually those attached to its head resembling hair. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HatAccessory\|HatAccessory]] | string | A comma-separated list of asset IDs that will be added as [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessories]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] rig when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]], usually those attached to its head. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Head\|Head]] | int64 | Determines the asset ID of the Head to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadColor\|HeadColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#HeadColor3\|BodyColors.HeadColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#HeadColor\|BodyColors.HeadColor]] of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadScale\|HeadScale]] | float | Determines by what factor the **Head** object of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is scaled, as well as any accessories attached to it. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeightScale\|HeightScale]] | float | Determines by what factor the height (top-to-bottom distance) of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is scaled, as well as all accessories not attached to its head. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#IdleAnimation\|IdleAnimation]] | int64 | When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]], this determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId\|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState\|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Running]] at a speed near zero. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#JumpAnimation\|JumpAnimation]] | int64 | When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]], this determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId\|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState\|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Jumping]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArm\|LeftArm]] | int64 | Determines the asset ID of the LeftArm to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArmColor\|LeftArmColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftArmColor3\|BodyColors.LeftArmColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftArmColor\|BodyColors.LeftArmColor]] of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] when applied. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLeg\|LeftLeg]] | int64 | Determines the asset ID of the LeftLeg to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLegColor\|LeftLegColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftLegColor3\|BodyColors.LeftLegColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftLegColor\|BodyColors.LeftLegColor]] of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] when applied. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#MoodAnimation\|MoodAnimation]] | int64 | When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]], this determines the asset ID of the mood animation that gives the character's face its persistent expression. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#NeckAccessory\|NeckAccessory]] | string | A comma-separated list of asset IDs that will be added as [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessories]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] rig when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]], usually those attached to its neck (such as scarves or necklaces). |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Pants\|Pants]] | int64 | Determines the [[30 Official Roblox Docs/API Reference/Classes/Pants#PantsTemplate\|PantsTemplate]] used by a [[30 Official Roblox Docs/API Reference/Classes/Pants\|Pants]] instance. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ProportionScale\|ProportionScale]] | float | Determines how wide (0) or narrow (1) a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] rig is. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArm\|RightArm]] | int64 | Determines the asset ID of the RightArm to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArmColor\|RightArmColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightArmColor3\|BodyColors.RightArmColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightArmColor\|BodyColors.RightArmColor]] of a Humanoid when applied. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLeg\|RightLeg]] | int64 | Determines the asset ID of the RightLeg to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLegColor\|RightLegColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightLegColor3\|BodyColors.RightLegColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightLegColor\|BodyColors.RightLegColor]] of a Humanoid when applied. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RunAnimation\|RunAnimation]] | int64 | When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]], this determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId\|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState\|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Running]] at a moderate speed. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Shirt\|Shirt]] | int64 | Determines the [[30 Official Roblox Docs/API Reference/Classes/Shirt#ShirtTemplate\|ShirtTemplate]] used by a [[30 Official Roblox Docs/API Reference/Classes/Shirt\|Shirt]] instance. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ShouldersAccessory\|ShouldersAccessory]] | string | A comma-separated list of asset IDs that will be added as [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessories]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] rig when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]], usually those attached to its shoulders (such as shoulder-mounted critters). |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#StaticFacialAnimation\|StaticFacialAnimation]] | boolean | When `true`, disables facial animations on a Dynamic Head, displaying a static mood pose instead. Defaults to `false`. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SwimAnimation\|SwimAnimation]] | int64 | When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]], this determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId\|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState\|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Swimming]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Torso\|Torso]] | int64 | Determines the asset ID of the Torso to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor\|TorsoColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#TorsoColor3\|BodyColors.TorsoColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#TorsoColor\|BodyColors.TorsoColor]] of a Humanoid when applied. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#UseAvatarSettings\|UseAvatarSettings]] | boolean | When `true`, applying this description also applies the experience's Avatar Settings to the resulting model. Defaults to `false`. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WaistAccessory\|WaistAccessory]] | string | A comma-separated list of asset IDs that will be added as [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessories]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] rig when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]], usually those attached to its waist (such as belts). |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WalkAnimation\|WalkAnimation]] | int64 | When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]], this determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId\|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState\|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Running]] at a low speed. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WidthScale\|WidthScale]] | float | Determines by what factor the width (left-to-right distance) of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is scaled, as well as all accessories not attached to its head. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote\|AddEmote()]] | () | Adds the emote to the description given a name and its asset ID. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetAccessories\|GetAccessories()]] | List<AccessoriesInfo> | Returns a table of an avatar's current accessories. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetEmotes\|GetEmotes()]] | Dictionary | Returns a dictionary of emotes that have been [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote\|added]] or [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes\|set]] to this description. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetEquippedEmotes\|GetEquippedEmotes()]] | Array | Returns an array of tables describing the equipped emotes that have been [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEquippedEmotes\|set]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RemoveEmote\|RemoveEmote()]] | () | Removes any emotes that have been added under the given name. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetAccessories\|SetAccessories()]] | () | Accepts a table that sets the accessories and related properties for an avatar. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes\|SetEmotes()]] | () | Sets all of the emotes on this description. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEquippedEmotes\|SetEquippedEmotes()]] | () | Sets the currently equipped emotes given an array of emote names. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EmotesChanged\|EmotesChanged]] | `newEmotes` | Fires when emotes are added, removed or set on this description. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EquippedEmotesChanged\|EquippedEmotesChanged]] | `newEquippedEmotes` | Fires when the equipped emotes are [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEquippedEmotes\|set]] on this description. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AccessoryBlob

**Type:** string

**Thread safety:** ReadSafe · **Category:** Accessories · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`, `NotScriptable`

A JSON formatted array of Layered clothing where each table in the entry in the array describes an accessory's AssetId, AccessoryType, Order, and (optionally) Puffiness as key-value pairs. This can be edited in the properties windows for the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

To make changes from Luau (which is recommended over editing the JSON directly), use [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetAccessories|HumanoidDescription:SetAccessories()]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetAccessories|HumanoidDescription:GetAccessories()]]. These methods can also be enabled to work with rigid accessories by setting IncludeRigidAccessories parameters to true.

### BackAccessory

**Type:** string

**Thread safety:** ReadSafe · **Category:** Accessories · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**BackAccessory** is a comma-separated list of asset IDs that determine what accessories should be added when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]]. The list cannot contain duplicates.

An error is thrown if you try to apply a new description which shares any assets with the existing description but a different accessory property.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FaceAccessory|FaceAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FrontAccessory|FrontAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory|HairAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HatAccessory|HatAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#NeckAccessory|NeckAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ShouldersAccessory|ShouldersAccessory]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WaistAccessory|WaistAccessory]], which are similar properties that apply accessories like this one

### BodyTypeScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Scale · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**BodyTypeScale** determines the factor by which the shape of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is interpolated from the standard R15 body shape (0) to a taller and more slender body type (1). Values outside the range of 0 to 1 are clamped. When the description is applied through [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]], this value maps to a **BodyTypeScale** [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] within the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

Note that when the value of this property is 0, the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ProportionScale|ProportionScale]] property has no effect.

#### See Also

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ProportionScale|ProportionScale]], which also affects rig proportions when this property is non-zero
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeightScale|WidthScale]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#DepthScale|HeightScale]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#DepthScale|DepthScale]], which provide finer control over the dimensions of a rig
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadScale|HeadScale]], which provides specific control over the scale of the rig's head

### ClimbAnimation

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], **ClimbAnimation** determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Climbing]].

See also:

- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|FallAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#IdleAnimation|IdleAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#JumpAnimation|JumpAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RunAnimation|RunAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SwimAnimation|SwimAnimation]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WalkAnimation|WalkAnimation]], which are similar properties that determine animations to play on the rig

### DepthScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Scale · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**DepthScale** determines by what factor the depth (back-to-front distance) of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is scaled, as well as all accessories not attached to its head. When the description is applied through [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]], this value maps to a **BodyDepthScale** [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] within the Humanoid.

#### See Also

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BodyTypeScale|BodyTypeScale]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ProportionScale|ProportionScale]], which can provide more realistic rig proportions
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeightScale|WidthScale]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#DepthScale|HeightScale]]

### Face

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Body Parts · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**Face** determines the asset ID of the Face to be [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. The type of the asset ID provided **must be for a Face** type asset and not a Decal or Image type asset.

The actual face texture is rendered using a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] in the Head named "face" or "Face".

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GraphicTShirt|GraphicTShirt]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Shirt|Shirt]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Pants|Pants]], which also apply textures to a rig
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Head|Head]], which can change the mesh of the head
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FaceAccessory|FaceAccessory]], which can apply one or more [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects to the face

### FaceAccessory

**Type:** string

**Thread safety:** ReadSafe · **Category:** Accessories · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**FaceAccessory** is a comma-separated list of asset IDs that determine what accessories should be added when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]], usually those attached to the front of its face (such as glasses). The list does not contain duplicates.

An error is thrown if you try to apply a new description which shares any assets with the existing description but a different accessory property.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BackAccessory|BackAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FrontAccessory|FrontAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory|HairAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HatAccessory|HatAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#NeckAccessory|NeckAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ShouldersAccessory|ShouldersAccessory]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WaistAccessory|WaistAccessory]], which are similar properties that apply accessories like this one
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Face|Face]], a property that determines what Face texture is used on the head

### FallAnimation

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], **FallAnimation** determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Freefall]].

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|ClimbAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#IdleAnimation|IdleAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#JumpAnimation|JumpAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RunAnimation|RunAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SwimAnimation|SwimAnimation]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WalkAnimation|WalkAnimation]], which are similar properties that determine animations to play on the rig

### FrontAccessory

**Type:** string

**Thread safety:** ReadSafe · **Category:** Accessories · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**FrontAccessory** is a comma-separated list of asset IDs that determine what accessories should be added when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]], usually those attached to front of its torso (such as medals or ties). The list does not contain duplicates.

An error is thrown if you try to apply a new description which shares any assets with the existing description but a different accessory property.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BackAccessory|BackAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FaceAccessory|FaceAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory|HairAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HatAccessory|HatAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#NeckAccessory|NeckAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ShouldersAccessory|ShouldersAccessory]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WaistAccessory|WaistAccessory]], which are similar properties that apply accessories like this one

### GraphicTShirt

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Clothes · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**GraphicTShirt** determines the [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic#Graphic|Graphic]] used by a [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic|ShirtGraphic]] instance when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]] is called on a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. The asset type must be for a **T‑Shirt**, not a **Decal** or **Image**.

#### See Also

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Shirt|Shirt]], which can provide the same functionality in addition to providing textures for the entire torso and arms
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor|TorsoColor]], which can change the color of the torso underneath the t-shirt texture

### HairAccessory

**Type:** string

**Thread safety:** ReadSafe · **Category:** Accessories · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**HairAccessory** is a comma-separated list of asset IDs that determine what accessories should be added when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]], usually those attached to its head resembling hair. The list does not contain duplicates.

An error is thrown if you try to apply a new description which shares any assets with the existing description but a different accessory property.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BackAccessory|BackAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FaceAccessory|FaceAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FrontAccessory|FrontAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HatAccessory|HatAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#NeckAccessory|NeckAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ShouldersAccessory|ShouldersAccessory]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WaistAccessory|WaistAccessory]], which are similar properties that apply accessories like this one

### HatAccessory

**Type:** string

**Thread safety:** ReadSafe · **Category:** Accessories · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**HatAccessory** is a comma-separated list of asset IDs that determine what accessories should be added when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]], usually those attached to its head. The list does not contain duplicates.

An error is thrown if you try to apply a new description which shares any assets with the existing description but a different accessory property.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BackAccessory|BackAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FaceAccessory|FaceAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FrontAccessory|FrontAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory|HairAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#NeckAccessory|NeckAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ShouldersAccessory|ShouldersAccessory]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WaistAccessory|WaistAccessory]], which are similar properties that apply accessories like this one

### Head

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Body Parts · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**Head** determines the asset ID of the Head to be [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Torso|Torso]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArm|RightArm]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArm|LeftArm]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLeg|RightLeg]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLeg|LeftLeg]], which are similar properties that also control body part
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadColor|HeadColor]], which controls the color of this limb
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HatAccessory|HatAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory|HairAccessory]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FaceAccessory|FaceAccessory]], which all can apply [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects which are joined to the head

### HeadColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Body Colors · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**HeadColor** determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#HeadColor3|BodyColors.HeadColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#HeadColor|BodyColors.HeadColor]] of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]].

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor|TorsoColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArmColor|LeftArmColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArmColor|RightArmColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLegColor|LeftLegColor]], and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLegColor|RightLegColor]], which are similar properties that also control body colors
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Head|Head]], which controls the mesh used for the head
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Face|Face]], which applies a texture to the front of the head

### HeadScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Scale · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**HeadScale** determines by what factor the **Head** object of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is scaled, as well as any accessories attached to it (such as those specified by [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HatAccessory|HatAccessory]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory|HairAccessory]]). When the description is applied through [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]], this value maps to a **HeadScale** [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] within the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

#### See Also

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BodyTypeScale|BodyTypeScale]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ProportionScale|ProportionScale]], which can provide realistic rig proportions
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeightScale|WidthScale]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#DepthScale|HeightScale]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#DepthScale|DepthScale]], which provide finer control over other dimensions of a rig

### HeightScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Scale · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**HeightScale** determines by what factor the height (top-to-bottom distance) of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is scaled, as well as all accessories not attached to its head. When the description is applied through [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]], this value maps to a **BodyHeightScale** [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] within the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

#### See Also

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BodyTypeScale|BodyTypeScale]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ProportionScale|ProportionScale]], which can provide more realistic rig proportions
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeightScale|WidthScale]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#DepthScale|DepthScale]]

### IdleAnimation

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], **IdleAnimation** determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Running]] at a speed near zero.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|ClimbAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|FallAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#JumpAnimation|JumpAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RunAnimation|RunAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SwimAnimation|SwimAnimation]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WalkAnimation|WalkAnimation]], which are similar properties that determine animations to play on the rig

### JumpAnimation

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], **JumpAnimation** determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Jumping]].

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|ClimbAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|FallAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#IdleAnimation|IdleAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RunAnimation|RunAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SwimAnimation|SwimAnimation]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WalkAnimation|WalkAnimation]], which are similar properties that determine animations to play on the rig

### LeftArm

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Body Parts · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**LeftArm** determines the asset ID of the LeftArm to be [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Head|Head]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Torso|Torso]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArm|RightArm]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLeg|RightLeg]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLeg|LeftLeg]], which are similar properties that also control body part
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArmColor|LeftArmColor]], which controls the color of this limb

### LeftArmColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Body Colors · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**LeftArmColor** determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftArmColor3|BodyColors.LeftArmColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftArmColor|BodyColors.LeftArmColor]] of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]]. For R15 and Rthro rigs, this property controls both the upper, lower, and hand parts of the left arm.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadColor|HeadColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor|TorsoColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArmColor|RightArmColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLegColor|LeftLegColor]], and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLegColor|RightLegColor]], which are similar properties that also control body colors
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArm|LeftArm]], which controls the mesh used for this limb
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Shirt|Shirt]], which can apply a texture to this limb

### LeftLeg

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Body Parts · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**LeftLeg** determines the asset ID of the LeftLeg to be [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Head|Head]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Torso|Torso]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArm|RightArm]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArm|LeftArm]], and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLeg|RightLeg]], which are similar properties that also control body part
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLegColor|LeftLegColor]], which controls the color of this limb

### LeftLegColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Body Colors · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**LeftLegColor** determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftLegColor3|BodyColors.LeftLegColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftLegColor|BodyColors.LeftLegColor]] of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]]. For R15 and Rthro rigs, this property controls both the upper, lower, and foot parts of the left leg.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadColor|HeadColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor|TorsoColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArmColor|LeftArmColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArmColor|RightArmColor]], and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLegColor|RightLegColor]], which are similar properties that also control body colors
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLeg|LeftLeg]], which controls the mesh used for this limb
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Pants|Pants]], which can apply a texture to this limb

### MoodAnimation

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], this property sets the asset ID of the mood animation to apply. The asset ID must be for a Mood animation asset. Defaults to `0`, in which case the character's face uses its neutral rest pose.

A mood animation applies a static facial pose to a character with a Dynamic Head, giving the face a characteristic expression (such as a smile) that persists while the head is otherwise idle.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#StaticFacialAnimation|StaticFacialAnimation]], which disables animated facial movement so that a Dynamic Head displays a static mood pose instead

### NeckAccessory

**Type:** string

**Thread safety:** ReadSafe · **Category:** Accessories · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**NeckAccessory** is a comma-separated list of asset IDs that determine what accessories should be added when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]], usually those attached to its neck (such as scarves or necklaces). The list does not contain duplicates.

Any accessory can used in this property, even if it is meant to go in a different accessory spot. For example, an accessory meant to go on your back (such as a cape) could be included in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory|HairAccessory]]. An error is thrown if you try to apply a new description which shares any assets with the existing description but a different accessory property.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BackAccessory|BackAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FaceAccessory|FaceAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FrontAccessory|FrontAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory|HairAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HatAccessory|HatAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ShouldersAccessory|ShouldersAccessory]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WaistAccessory|WaistAccessory]], which are similar properties that apply accessories like this one

### Pants

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Clothes · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**Pants** determines the [[30 Official Roblox Docs/API Reference/Classes/Pants#PantsTemplate|PantsTemplate]] used by a [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]] instance when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]] is called on a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. The asset type must be for **Pants**, not a **Decal** or **Image**.

#### See Also

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Shirt|Shirt]], a similar property which applies to a [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]] object
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor|TorsoColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLegColor|LeftLegColor]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLegColor|RightLegColor]], which can change the color of the body parts underneath the pants texture

### ProportionScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Scale · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**ProportionScale** determines how wide (0) or narrow (1) a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] rig is. Values outside the range of 0 to 1 are clamped. When the description is applied through [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]], this value maps to a **BodyProportionScale** [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] within the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

Note that when the value of [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BodyTypeScale|BodyTypeScale]] is 0, this property has no effect.

#### See Also

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BodyTypeScale|BodyTypeScale]], which also affects rig proportions
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeightScale|WidthScale]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#DepthScale|HeightScale]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#DepthScale|DepthScale]], which provide finer control over the dimensions of a rig
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadScale|HeadScale]], which provides specific control over the scale of the rig's head

### RightArm

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Body Parts · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**RightArm** determines the asset ID of the RightArm to be [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Head|Head]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Torso|Torso]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArm|LeftArm]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLeg|RightLeg]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLeg|LeftLeg]], which are similar properties that also control body part
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArmColor|RightArmColor]], which controls the color of this limb

### RightArmColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Body Colors · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**RightArmColor** determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightArmColor3|BodyColors.RightArmColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightArmColor|BodyColors.RightArmColor]] of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]]. For R15 and Rthro rigs, this property controls both the upper, lower, and hand parts of the right arm.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadColor|HeadColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor|TorsoColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArmColor|LeftArmColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLegColor|LeftLegColor]], and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLegColor|RightLegColor]], which are similar properties that also control body colors
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArm|RightArm]], which controls the mesh used for this limb
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Shirt|Shirt]], which can apply a texture to this limb

### RightLeg

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Body Parts · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**RightLeg** determines the asset ID of the RightLeg to be [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Head|Head]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Torso|Torso]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArm|RightArm]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArm|LeftArm]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLeg|LeftLeg]], which are similar properties that also control body part
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLegColor|RightLegColor]], which controls the color of this limb

### RightLegColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Body Colors · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**RightLegColor** determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightLegColor3|BodyColors.RightLegColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightLegColor|BodyColors.RightLegColor]] of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]]. For R15 and Rthro rigs, this property controls both the upper, lower, and foot parts of the right leg.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadColor|HeadColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor|TorsoColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArmColor|LeftArmColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArmColor|RightArmColor]], and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLegColor|LeftLegColor]], which are similar properties that also control body colors
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLeg|RightLeg]], which controls the mesh used for this limb
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Pants|Pants]], which can apply a texture to this limb

### RunAnimation

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], **RunAnimation** determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Running]] at a moderate speed.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|ClimbAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|FallAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#IdleAnimation|IdleAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#JumpAnimation|JumpAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SwimAnimation|SwimAnimation]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WalkAnimation|WalkAnimation]], which are similar properties that determine animations to play on the rig

### Shirt

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Clothes · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**Shirt** determines the [[30 Official Roblox Docs/API Reference/Classes/Shirt#ShirtTemplate|ShirtTemplate]] used by a [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]] instance when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]] is called on a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. The asset type must be for **Shirt**, not a **Decal** or **Image**.

#### See Also

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Pants|Pants]], a similar property which applies to a [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]] object
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GraphicTShirt|GraphicTShirt]], a similar property which applies to a [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic|ShirtGraphic]] object
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor|TorsoColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArmColor|LeftArmColor]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArmColor|RightArmColor]], which can change the color of the body parts underneath the shirt texture

### ShouldersAccessory

**Type:** string

**Thread safety:** ReadSafe · **Category:** Accessories · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**ShouldersAccessory** is a comma-separated list of asset IDs that determine what accessories should be added when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]], usually those attached to its shoulders (such as shoulder-mounted critters). The list does not contain duplicates.

An error is thrown if you try to apply a new description which shares any assets with the existing description but a different accessory property.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BackAccessory|BackAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FaceAccessory|FaceAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FrontAccessory|FrontAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory|HairAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HatAccessory|HatAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#NeckAccessory|NeckAccessory]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WaistAccessory|WaistAccessory]], which are similar properties that apply accessories like this one

### StaticFacialAnimation

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**StaticFacialAnimation** controls whether facial animations play when this description is applied to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] with a Dynamic Head. When set to `true`, the head displays a static mood pose without any animated facial movement, achieving visual parity with classic face decals.

Even with `StaticFacialAnimation` set to `true`, [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#MoodAnimation|MoodAnimation]] still applies a static pose to give the face its characteristic expression. Setting `StaticFacialAnimation` to `true` is different from setting `MoodAnimation` to `0`, which would result in the Dynamic Head's neutral rest pose.

This is a per-description setting and does not affect other descriptions or the user's avatar globally.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

### SwimAnimation

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], **SwimAnimation** determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Swimming]]

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|ClimbAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|FallAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#IdleAnimation|IdleAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#JumpAnimation|JumpAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RunAnimation|RunAnimation]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WalkAnimation|WalkAnimation]], which are similar properties that determine animations to play on the rig

### Torso

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Body Parts · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**Torso** determines the asset ID of the Torso to be [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Head|Head]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArm|RightArm]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArm|LeftArm]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLeg|RightLeg]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLeg|LeftLeg]], which are similar properties that also control body part
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor|TorsoColor]], which controls the color of this limb

### TorsoColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Body Colors · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**TorsoColor** determines the [[30 Official Roblox Docs/API Reference/Classes/BodyColors#TorsoColor3|BodyColors.TorsoColor3]] and [[30 Official Roblox Docs/API Reference/Classes/BodyColors#TorsoColor|BodyColors.TorsoColor]] of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]]. For R15 and Rthro rigs, this property controls both the upper and lower parts of the torso.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadColor|HeadColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#TorsoColor|TorsoColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArmColor|LeftArmColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArmColor|RightArmColor]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLegColor|LeftLegColor]], and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLegColor|RightLegColor]], which are similar properties that also control body colors
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Torso|Torso]], which controls the mesh used for this body part
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GraphicTShirt|GraphicTShirt]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Shirt|Shirt]], which can apply a texture to this body part

### UseAvatarSettings

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

When true, `Humanoid:ApplyDescriptionAsync` or `Players:CreateHumanoidModelFromDescriptionAsync` will also apply the Avatar Settings set for the universe to the model.

### WaistAccessory

**Type:** string

**Thread safety:** ReadSafe · **Category:** Accessories · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`

**WaistAccessory** is a comma-separated list of asset IDs that determine what accessories should be added when the description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]], usually those attached to its waist (such as belts). The list does not contain duplicates.

An error is thrown if you try to apply a new description which shares any assets with the existing description but a different accessory property.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BackAccessory|BackAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FaceAccessory|FaceAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FrontAccessory|FrontAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HairAccessory|HairAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HatAccessory|HatAccessory]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#NeckAccessory|NeckAccessory]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ShouldersAccessory|ShouldersAccessory]], which are similar properties that apply accessories like this one

### WalkAnimation

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

When this description is [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|applied]] to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], **WalkAnimation** determines the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] to play when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|state]] is [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Running]] at a low speed

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|ClimbAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#FallAnimation|FallAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#IdleAnimation|IdleAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#JumpAnimation|JumpAnimation]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RunAnimation|RunAnimation]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SwimAnimation|SwimAnimation]], which are similar properties that determine animations to play on the rig

### WidthScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Scale · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**WidthScale** determines by what factor the width (left-to-right distance) of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is scaled, as well as all accessories not attached to its head. When the description is applied through [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]], this value maps to a **BodyWidthScale** [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] within the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

#### See Also

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BodyTypeScale|BodyTypeScale]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ProportionScale|ProportionScale]], which can provide more realistic rig proportions
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeightScale|HeightScale]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#DepthScale|DepthScale]]

## Methods

### AddEmote

```lua
HumanoidDescription:AddEmote(name: string, assetId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

**AddEmote** will add an Emote asset to the description given a name and its asset ID. The asset ID must be for an "Emote" asset (see [Featured emotes](https://www.roblox.com/catalog?Category=0&Subcategory=39) in the Catalog).

You can add multiple emotes of the same name. All emotes of the same name can be removed using [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RemoveEmote|RemoveEmote]]. If an emote with the same ID is added under the same name, [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EmotesChanged|EmotesChanged]] fires.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetEmotes|GetEmotes]], which can be used to retrieve the emotes that have been added by this function
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes|SetEmotes]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RemoveEmote|RemoveEmote]], which also manipulate what emotes have been added
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EmotesChanged|EmotesChanged]], which fires after this function is called

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | A string that identifies what emote is being added. Example: `"Salute"`. |
| `assetId` | int64 |  | An emote asset ID. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetAccessories

```lua
HumanoidDescription:GetAccessories(includeRigidAccessories: boolean): List<AccessoriesInfo>
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

Returns a table of an avatar's current accessories. If the second parameter (includeRigidAccessories) is true then the returned table will also include entries for rigid accessories from the rigid accessory properties.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `includeRigidAccessories` | boolean |  | Set to true if rigid accessories from the rigid accessory properties should also be included in the return array. False means only include layered clothing accessories from the AccessoryBlob. |

**Returns**

| Type | Description |
| --- | --- |
| List<AccessoriesInfo> | Returns an array where each entry specifies for an individual accessory the AccessoryType, AssetId, IsLayered, Order and Puffiness. |

*Code samples for this member (`get-accessories`) are published on the source page; their code is not part of the open-source repo.*

### GetEmotes

```lua
HumanoidDescription:GetEmotes(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

**GetEmotes** returns a dictionary of emotes that have been [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote|added]] or [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes|set]] to this description. The keys of this dictionary are the names of the emotes, and the values are a non-empty array of emote IDs for that name.

#### Example

```lua
local hd = Instance.new("HumanoidDescription")
hd:AddEmote("Salute", 3360689775)
local emotes = hd:GetEmotes()
for name, ids in emotes do
    print(("The emote %s has %d ids:"):format(name, #ids))
    for _, id in ids do
        print(id)
    end
end
```

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes|SetEmotes]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote|AddEmote]], which can add emotes that may be returned by this function
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EmotesChanged|EmotesChanged]], which fires with the value returned this function after it may have changed

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary of emotes where the key is the emote name and the value is an array of emote asset IDs. Example:<br><br>`{`<br>`    Salute = {3360689775},`<br>`    Agree = {4849487550},`<br>`    Disagree = {4849495710}`<br>`}`<br><br>. |

### GetEquippedEmotes

```lua
HumanoidDescription:GetEquippedEmotes(): Array
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

**GetEquippedEmotes** returns an array of tables which indicate the `Name` and `Slot` of each equipped emote as it was set by [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEquippedEmotes|SetEquippedEmotes]].

#### Example

```lua
local hd = Instance.new("HumanoidDescription")
hd:SetEmotes({Salute = {3360689775}, Agree = {4849487550}})
hd:SetEquippedEmotes({"Salute", "Agree"})
-- Iterate over the equipped emotes:
for _, t in hd:GetEquippedEmotes() do
    print(("In slot %d: emote %s is equipped"):format(t.Slot, t.Name))
end
```

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEquippedEmotes|SetEquippedEmotes]], which sets the currently equipped emotes and changes what this function returns
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EquippedEmotesChanged|EquippedEmotesChanged]], which fires when the function returned by this value may have changed

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of tables describing the name and slot which each emote is equipped. Example:<br><br>`{`<br>`    {Slot = 3, Name = "Salute"},`<br>`    {Slot = 2, Name = "Agree"},`<br>`    {Slot = 1, Name = "Disagree"},`<br>`}`<br><br>. |

### RemoveEmote

```lua
HumanoidDescription:RemoveEmote(name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

**RemoveEmote** removes all emotes from the description that have been [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote|added]] or [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes|set]] under the given name. If there are no added emotes with the given name, no error is thrown and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EmotesChanged|EmotesChanged]] **does not** fire.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes|SetEmotes]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote|AddEmote]], which can add emotes that may be removed
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetEmotes|GetEmotes]], which can retrieve a dictionary of emotes that may be removed

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the emote as it was [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes\|set]] or [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote\|added]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetAccessories

```lua
HumanoidDescription:SetAccessories(accessories: Array, includeRigidAccessories: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

Accepts a table that sets the accessories and related properties for an avatar. If the second parameter (includeRigidAccessories) is true, then this function can also be used to set the rigid accessories in the rigid accessory properties. In this case any table entry that does not have an Order will be considered a rigid accessory and put in the appropriate property according to the AccessoryType.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `accessories` | Array |  | Each entry specifies for an individual accessory the AccessoryType, AssetId, IsLayered, Order and Puffiness. |
| `includeRigidAccessories` | boolean |  | Set to true if rigid accessories are also included in the passed in array (they would have to not specify Order). |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`set-accessories`) are published on the source page; their code is not part of the open-source repo.*

### SetEmotes

```lua
HumanoidDescription:SetEmotes(emotes: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

**SetEmotes** sets all of the emotes on this description given a table similar to that returned by [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetEmotes|GetEmotes]]. It fires [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EmotesChanged|EmotesChanged]]

#### Example

```lua
local emotes = {
    Salute = {3360689775}, -- Syntax note: can also use ["Salute"] = ...
    Agree = {4849487550},
    Disagree = {4849495710}
}
local hd = Instance.new("HumanoidDescription")
hd:SetEmotes(emotes)
```

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote|AddEmote]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RemoveEmote|RemoveEmote]] which can modify the added emotes on an individual level
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EmotesChanged|EmotesChanged]], which fires when this function is called

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `emotes` | Dictionary |  | A dictionary of emotes where the key is the emote name and the value is an array of emote asset IDs. Example:<br><br>`{`<br>`    Salute = {3360689775},`<br>`    Agree = {4849487550},`<br>`    Disagree = {4849495710}`<br>`}`<br><br>. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetEquippedEmotes

```lua
HumanoidDescription:SetEquippedEmotes(equippedEmotes: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

**SetEquippedEmotes** sets the currently equipped emotes given an array of emote names as they were passed to [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote|AddEmote]] or [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes|SetEmotes]]. It can also take an array of tables similar to that returned by [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetEquippedEmotes|GetEquippedEmotes]]. Calling this function fires [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EquippedEmotesChanged|EquippedEmotesChanged]].

#### Example

```lua
local hd = Instance.new("HumanoidDescription")
hd:SetEmotes({Salute = {3360689775}, Agree = {4849487550}})
-- Can provide either an array of strings... (index is slot number)
hd:SetEquippedEmotes({"Salute", "Agree"})
-- ...or an array of tables as returned by GetEquippedEmotes (Slot and Name keys set)
hd:SetEquippedEmotes({{Slot = 1, Name = "Salute"}, {Slot = 2, Name = "Agree"}})
```

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetEquippedEmotes|GetEquippedEmotes]], which returns a value describing the equipped emotes set by this function
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#EquippedEmotesChanged|EquippedEmotesChanged]], which fires when this function is called

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `equippedEmotes` | Array |  | An array of emote names. Example:<br><br>`{ "Disagree", "Agree", "Salute" }`<br><br>– OR – An array of tables describing the name and slot which each emote is equipped. Example:<br><br>`{`<br>`    {Slot = 3, Name = "Salute"},`<br>`    {Slot = 2, Name = "Agree"},`<br>`    {Slot = 1, Name = "Disagree"},`<br>`}`<br><br>. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### EmotesChanged

```lua
HumanoidDescription.EmotesChanged(newEmotes: Dictionary)
```

**Capabilities:** AvatarAppearance

**EmotesChanged** fires when emotes are [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote|added]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RemoveEmote|removed]] or [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes|set]] on the description. The event fires with the new emote table as returned by [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetEmotes|GetEmotes]].

If [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote|AddEmote]] is called with the same name and ID as an existing emote, this event fires.

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#AddEmote|AddEmote]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RemoveEmote|RemoveEmote]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEmotes|HumanoidDescription:SetEmotes()]], which can cause this event to be fired

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `newEmotes` | Dictionary |  | A dictionary of emotes where the key is the emote name and the value is an array of emote asset IDs. Example:<br><br>`{`<br>`    Salute = {3360689775},`<br>`    Agree = {4849487550},`<br>`    Disagree = {4849495710}`<br>`}`<br><br>. |

### EquippedEmotesChanged

```lua
HumanoidDescription.EquippedEmotesChanged(newEquippedEmotes: Array)
```

**Capabilities:** AvatarAppearance

**EquippedEmotesChanged** fires when the equipped emotes are set on this description using [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEquippedEmotes|SetEquippedEmotes]]. It provides the new equipped emotes in a table like that returned by [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetEquippedEmotes|GetEquippedEmotes]].

#### Example

```lua
local hd = Instance.new("HumanoidDescription")
hd.EquippedEmotesChanged:Connect(function(equippedEmotes)
    print(("We have %d emotes equipped"):format(#equippedEmotes))
    for _, t in equippedEmotes do
        print(("In slot %d: emote %s is equipped"):format(t.Slot, t.Name))
    end
end)
hd:SetEquippedEmotes({"Salute", "Agree"}) --> We have 2 emotes equipped
```

See also:

- [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], for more information on [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetEquippedEmotes|SetEquippedEmotes]], which fires this event
- [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#GetEquippedEmotes|GetEquippedEmotes]], which can be used to query the currently equipped emotes without this event firing

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `newEquippedEmotes` | Array |  | An array of tables describing the name and slot which each emote is equipped. Example:<br><br>`{`<br>`    {Slot = 3, Name = "Salute"},`<br>`    {Slot = 2, Name = "Agree"},`<br>`    {Slot = 1, Name = "Disagree"},`<br>`}`<br><br>. |

---
*Source: [HumanoidDescription](https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
