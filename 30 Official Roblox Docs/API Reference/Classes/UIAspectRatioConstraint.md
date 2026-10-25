---
title: "UIAspectRatioConstraint"
description: "Ensures the parent UI element maintains a particular aspect ratio."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIAspectRatioConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Ensures the parent UI element maintains a particular aspect ratio.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIConstraint|UIConstraint]] → [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]] enforces a **width‑to‑height** aspect ratio on a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] regardless of its core size, even if that size is set as a percentage of its parent. For example, inserting this constraint as a child of a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] and setting the constraint's [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectRatio|AspectRatio]] property to `2` (`2:1`) keeps the frame's width at twice that of its height. Similarly, setting this constraint's [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectRatio|AspectRatio]] property to `0.5` (`0.5:1`) keeps the frame's width at half that of its height.

Setting this constraint's [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectRatio|AspectRatio]] to the default of `1` (`1:1`) is a convenient way to prevent non‑proportional scaling/stretching of an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] with a square image asset.

Note that when a UI object is under control of both a layout structure such as [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] and a [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]], the constraint will **override** the layout and control the object's size.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectRatio\|AspectRatio]] | float | Determines the width-to-height ratio to maintain. |
| [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectType\|AspectType]] | [[30 Official Roblox Docs/API Reference/Enums/AspectType\|AspectType]] | Determines how the maximum size of the object is limited. |
| [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#DominantAxis\|DominantAxis]] | [[30 Official Roblox Docs/API Reference/Enums/DominantAxis\|DominantAxis]] | Determines the axis to use when setting the new size of the object. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIConstraint|UIConstraint]], [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AspectRatio

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the width‑to‑height ratio to maintain. To flip the ratio to height‑to‑width, take the inverse (divide `1` by the number or raise to the -1st power). This value must be greater than `0`.

### AspectType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AspectType|AspectType]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how the maximum size of the object is limited.

- When set to [[30 Official Roblox Docs/API Reference/Enums/AspectType|FitWithinMaxSize]], the object will be the maximum size possible within its own [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|AbsoluteSize]].

- When set to [[30 Official Roblox Docs/API Reference/Enums/AspectType|ScaleWithParentSize]], the object's maximum size will be the size of the parent while still maintaining the aspect ratio.

### DominantAxis

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DominantAxis|DominantAxis]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines which axis to use when setting the new size of the object, assuming it would otherwise exceed the size of the parent.

---
*Source: [UIAspectRatioConstraint](https://create.roblox.com/docs/reference/engine/classes/UIAspectRatioConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
