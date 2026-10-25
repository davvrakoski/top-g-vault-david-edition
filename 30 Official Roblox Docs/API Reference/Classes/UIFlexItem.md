---
title: "UIFlexItem"
description: "Defines flex behavior for a `GuiObject` within a `UIListLayout`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIFlexItem"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Defines flex behavior for a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] within a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem|UIFlexItem]] object defines flex behavior for its parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] under the control of a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]]. The defined flex behavior overrides that of the controlling [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]], letting you configure flex behavior on a per‑object basis where necessary.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#FlexMode\|FlexMode]] | [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode\|UIFlexMode]] | How the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] grows or shrinks with available space in the flex layout container. |
| [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#GrowRatio\|GrowRatio]] | float | Determines the amount the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] grows relative to other items in the line. Applies only if [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#FlexMode\|FlexMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode\|Enum.UIFlexMode.Custom]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#ItemLineAlignment\|ItemLineAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment\|ItemLineAlignment]] | Cross-axis alignment of the specific parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] within the flex line. |
| [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#ShrinkRatio\|ShrinkRatio]] | float | Determines the amount the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] shrinks relative to other items in the line. Applies only if [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#FlexMode\|FlexMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode\|Enum.UIFlexMode.Custom]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### FlexMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|UIFlexMode]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Enum.UIFlexMode]] value which defines how the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] grows or shrinks with available space in the [[30 Official Roblox Docs/UI/List and flex layouts#Flex layouts|flex layout]] container.

When the container's size is **larger** than the flex line's combined basis size, a value of [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Enum.UIFlexMode.Grow]] sets an effective `1:0` grow‑shrink ratio on the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. Objects set to [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Enum.UIFlexMode.Grow]] never shrink below their basis size, so overflow may occur if the container becomes smaller than the line's combined basis size.

*(image in the full Top G Vault)*

When the container's size is **smaller** than the flex line's combined basis size and the controlling [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] is **not** set to wrap (resulting in overflow), a value of [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Enum.UIFlexMode.Shrink]] sets an effective `0:1` grow‑shrink ratio on the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. Objects set to [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Enum.UIFlexMode.Shrink]] never grow above their basis size, so underflow may occur if the container becomes larger than the line's combined basis size.

*(image in the full Top G Vault)*

When the container's size is either larger or smaller than the flex line's combined basis size, a value of [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Enum.UIFlexMode.Fill]] sets an effective `1:1` grow‑shrink ratio on the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. This setting ensures the flex line always fills the container, even if the container size changes.

*(image in the full Top G Vault)*

For fine-tuned layouts, a value of [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Enum.UIFlexMode.Custom]] enables the [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#GrowRatio|GrowRatio]] and [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#ShrinkRatio|ShrinkRatio]] properties, allowing for relative growth or shrinking of the object in a ratio compared to other flex objects also under control of a [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem|UIFlexItem]].

### GrowRatio

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

If there is free space in the flex line, this property determines the amount the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] grows relative to other flex items in the line. Applies only if [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#FlexMode|FlexMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Enum.UIFlexMode.Custom]].

### ItemLineAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment|ItemLineAlignment]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Cross-axis alignment of the specific parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] within the flex line. See [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#ItemLineAlignment|UIListLayout.ItemLineAlignment]] for details.

### ShrinkRatio

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

If there is overflow in the flex line, this property determines the amount the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] shrinks relative to other flex items in the line. Applies only if [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#FlexMode|FlexMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Enum.UIFlexMode.Custom]].

---
*Source: [UIFlexItem](https://create.roblox.com/docs/reference/engine/classes/UIFlexItem) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
