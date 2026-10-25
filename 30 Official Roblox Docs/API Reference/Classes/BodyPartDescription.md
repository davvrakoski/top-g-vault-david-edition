---
title: "BodyPartDescription"
description: "Describes the appearance of an avatar body part for the `HumanoidDescription`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BodyPartDescription"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Describes the appearance of an avatar body part for the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

**BodyPartDescription** is an object that stores the description for an avatar's body parts, such as the [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#Color|Color]]. It is meant to be placed underneath a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] in order to work with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#AssetId\|AssetId]] | int64 | The asset ID that should be applied when applying this [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription\|BodyPartDescription]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#BodyPart\|BodyPart]] | [[30 Official Roblox Docs/API Reference/Enums/BodyPart\|BodyPart]] | The type of body part. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] for this body part. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#HeadShape\|HeadShape]] | string | Specifies the head shape identifier to apply to a Dynamic Head when this [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription\|BodyPartDescription]] is applied. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#Instance\|Instance]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | A reference to the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] that should be applied when applying this [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription\|BodyPartDescription]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AssetId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The asset ID that should be applied when applying this [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription|BodyPartDescription]].

### BodyPart

**Type:** [[30 Official Roblox Docs/API Reference/Enums/BodyPart|BodyPart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The type of body part.

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] for this body part.

### HeadShape

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**HeadShape** specifies a Classic Head shape identifier to apply to a compatible Dynamic Head. This property is only relevant when [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#BodyPart|BodyPart]] is set to [[30 Official Roblox Docs/API Reference/Enums/BodyPart|Head]] and [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#AssetId|AssetId]] references a Dynamic Head that supports head shapes.

#### Example

```lua
local AvatarEditorService = game:GetService("AvatarEditorService")

-- Get available head shapes for the user
local headShapes = AvatarEditorService:GetHeadShapesAsync(userId)

-- Create a BodyPartDescription for a Dynamic Head with a Classic shape
local bodyPartDescription = Instance.new("BodyPartDescription")
bodyPartDescription.BodyPart = Enum.BodyPart.Head
bodyPartDescription.AssetId = dynamicHeadAssetId
bodyPartDescription.HeadShape = headShapes[1] -- Apply the first owned head shape
bodyPartDescription.Parent = humanoidDescription

-- Apply the description
humanoid:ApplyDescriptionAsync(humanoidDescription)
```

See also:

- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetHeadShapesAsync|AvatarEditorService:GetHeadShapesAsync()]], which returns head shape identifiers that can be used with this property
- [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#AssetId|AssetId]], which specifies the Dynamic Head asset to apply the shape to
- [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#BodyPart|BodyPart]], which must be set to [[30 Official Roblox Docs/API Reference/Enums/BodyPart|Head]] for this property to have effect
- [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]], which applies the description containing this [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription|BodyPartDescription]]

### Instance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

A reference to the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that should be applied when applying this [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription|BodyPartDescription]]. This property can be used instead of [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#AssetId|AssetId]] to apply accessories without uploading them to the platform. This can reference either a body part with R15, **R15ArtistIntent** and **R6** folders, or only reference a single subfolder.

---
*Source: [BodyPartDescription](https://create.roblox.com/docs/reference/engine/classes/BodyPartDescription) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
