---
title: "AccessoryDescription"
description: "Describes the appearance of an `Accessory` for the `HumanoidDescription`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AccessoryDescription"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Describes the appearance of an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] for the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

**AccessoryDescription** is an object that stores the description for an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]]. It is meant to be placed underneath a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] in order to work with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#AccessoryType\|AccessoryType]] | [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|AccessoryType]] | The [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|Enum.AccessoryType]] of the [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] referred to by this description. |
| [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#AssetId\|AssetId]] | int64 | The asset ID that should be applied when applying this [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription\|AccessoryDescription]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#Instance\|Instance]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | A reference to the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] that should be applied when applying this [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription\|AccessoryDescription]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#IsLayered\|IsLayered]] | boolean | Whether the [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] is layered or rigid. |
| [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#Order\|Order]] | int | The layered clothing sort order, if the [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] is layered. |
| [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The accessory adjustment position offset, if the [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] is rigid. |
| [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#Puffiness\|Puffiness]] | float | **Deprecated.** The layered clothing puffiness, if the [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] is layered. |
| [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#Rotation\|Rotation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The accessory adjustment rotation offset, if the [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] is rigid. |
| [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#Scale\|Scale]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The accessory adjustment scale, if the [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] is rigid. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#GetAppliedInstance\|GetAppliedInstance()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns the applied [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AccessoryType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|AccessoryType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType]] of the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] referred to by this description.

### AssetId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The asset ID that should be applied when applying this [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription|AccessoryDescription]].

### Instance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

A reference to the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that should be applied when applying this [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription|AccessoryDescription]]. This property can be used instead of [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#AssetId|AssetId]] to apply accessories without uploading them to the platform.

### IsLayered

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Whether the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] is layered or rigid. This is intended to be read-only. It will be corrected after calling [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]] if this property doesn't match the actual [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] contents.

### Order

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Order|WrapLayer.Order]] value when applying the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]], if it is layered.

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The accessory adjustment position offset. Only applies if the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] is rigid.

### Puffiness

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance · **Tags:** `Deprecated`

The [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Puffiness|WrapLayer.Puffiness]] value when applying the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]], if it is layered.

### Rotation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The accessory adjustment rotation offset. Only applies if the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] is rigid.

### Scale

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The accessory adjustment scale. Only applies if the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] is rigid.

## Methods

### GetAppliedInstance

```lua
AccessoryDescription:GetAppliedInstance(): Instance
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

Returns the applied [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] if this [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription|AccessoryDescription]] is the child of an applied [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] parented to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. Throws an error if this [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription|AccessoryDescription]] is not a child of a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] that has been applied to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], or if no matching applied instance is found.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The applied [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]]. |

---
*Source: [AccessoryDescription](https://create.roblox.com/docs/reference/engine/classes/AccessoryDescription) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
