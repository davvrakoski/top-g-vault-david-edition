---
title: "MakeupDescription"
description: "Describes the appearance of a makeup item for the `HumanoidDescription`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MakeupDescription"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Describes the appearance of a makeup item for the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`MakeupDescription` is an object that stores the description for a makeup item. It is meant to be placed underneath a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] in order to work with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription#AssetId\|AssetId]] | int64 | The asset ID that should be applied when applying this [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription\|MakeupDescription]]. |
| [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription#Instance\|Instance]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | A reference to the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] that should be used when applying this [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription\|MakeupDescription]]. |
| [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription#MakeupType\|MakeupType]] | [[30 Official Roblox Docs/API Reference/Enums/MakeupType\|MakeupType]] | The [[30 Official Roblox Docs/API Reference/Enums/MakeupType\|Enum.MakeupType]] of the makeup item referred to by this description. |
| [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription#Order\|Order]] | int | The layering sort order for the makeup item. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription#GetAppliedInstance\|GetAppliedInstance()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns the applied makeup [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AssetId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The asset ID that should be applied when applying this [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription|MakeupDescription]].

### Instance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

A reference to the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that should be used when applying this [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription|MakeupDescription]]. This property can be used instead of [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription#AssetId|AssetId]] to apply makeup without uploading it to the platform.

### MakeupType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/MakeupType|MakeupType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The [[30 Official Roblox Docs/API Reference/Enums/MakeupType|Enum.MakeupType]] of the makeup item referred to by this description.

### Order

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The sort order used when layering this makeup item relative to other makeup items. Lower values are applied first, with higher values rendered on top. If the same ordered values is used, the tie breaker will be the AssetID.

## Methods

### GetAppliedInstance

```lua
MakeupDescription:GetAppliedInstance(): Instance
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

Returns the applied makeup [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] if this [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription|MakeupDescription]] is the child of an applied [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] parented to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. However, if multiple [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription|MakeupDescription]] exist in the parented [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription|MakeupDescription]], they will be composed into a single makeup [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]].

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The single composed makeup [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]] parented under the character's head. |

---
*Source: [MakeupDescription](https://create.roblox.com/docs/reference/engine/classes/MakeupDescription) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
