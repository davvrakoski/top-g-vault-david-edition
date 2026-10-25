---
title: "UICorner"
description: "UI modifier which applies deformation to corners of its parent `GuiObject`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UICorner"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*UI modifier which applies deformation to corners of its parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`UICorner` is a modifier which applies deformation to corners of its parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. Input, but not descendants, will be clipped to the round corner area. See [[30 Official Roblox Docs/UI/UI appearance modifiers#Corners|UI appearance modifiers]] for examples.

In order to keep the circular shape of round corners, each corner radius ([[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]) is internally calculated as follows:

- The radius of the **X** axis is always the same as the radius of **Y** axis.
- [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] rounding will always apply to the **minimum** width or height.
- Rounded rectangles will always be in a "pill" shape if [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] is set to a value that leads to a calculated result greater than half of the rectangle's minimum width or height.

Alternatively to `UICorner`, rounded corners can be accomplished using **slices** which are suitable for decorative borders that are not simply rounded. See [[30 Official Roblox Docs/UI/UI 9-slice design|9‑Slice Design]] for details.

Note that `UICorner` can not be applied to a [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]].

#### Individual Corners

Each corner has its own radius property ([[30 Official Roblox Docs/API Reference/Classes/UICorner#TopLeftRadius|TopLeftRadius]], [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopRightRadius|TopRightRadius]], [[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomRightRadius|BottomRightRadius]], [[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomLeftRadius|BottomLeftRadius]]). The [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] property is a convenience shorthand that sets all four corners at once and reads from [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopLeftRadius|TopLeftRadius]].

When using [[30 Official Roblox Docs/UI/Styling/UI styling|styling]] with `UICorner`, avoid configuring both [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] and the individual corner radii in style rules at the same time, as this may produce unexpected results.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomLeftRadius\|BottomLeftRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Determines the radius of the bottom-left corner. |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomRightRadius\|BottomRightRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Determines the radius of the bottom-right corner. |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius\|CornerRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Sets all four corner radii at once and reads from [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopLeftRadius\|TopLeftRadius]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopLeftRadius\|TopLeftRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Determines the radius of the top-left corner. |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopRightRadius\|TopRightRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Determines the radius of the top-right corner. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BottomLeftRadius

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

**Thread safety:** ReadSafe · **Category:** Individual Corners · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is currently in beta. To use it, enable **New UI Capabilities** in Studio's beta features window.

A [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] property that determines the radius of the bottom-left corner independently. Setting [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] overwrites all four individual corner radii to the same value.

### BottomRightRadius

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

**Thread safety:** ReadSafe · **Category:** Individual Corners · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is currently in beta. To use it, enable **New UI Capabilities** in Studio's beta features window.

A [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] property that determines the radius of the bottom-right corner independently. Setting [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] overwrites all four individual corner radii to the same value.

### CornerRadius

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `NotReplicated`

A convenience [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] property that acts as a shorthand for the four individual corner radius properties. Writing to this property sets [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopLeftRadius|TopLeftRadius]], [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopRightRadius|TopRightRadius]], [[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomRightRadius|BottomRightRadius]], and [[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomLeftRadius|BottomLeftRadius]] to the same value. Reading this property returns the value of [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopLeftRadius|TopLeftRadius]].

### TopLeftRadius

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

**Thread safety:** ReadSafe · **Category:** Individual Corners · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is currently in beta. To use it, enable **New UI Capabilities** in Studio's beta features window.

A [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] property that determines the radius of the top-left corner independently. Setting [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] overwrites all four individual corner radii to the same value.

### TopRightRadius

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

**Thread safety:** ReadSafe · **Category:** Individual Corners · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is currently in beta. To use it, enable **New UI Capabilities** in Studio's beta features window.

A [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] property that determines the radius of the top-right corner independently. Setting [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] overwrites all four individual corner radii to the same value.

---
*Source: [UICorner](https://create.roblox.com/docs/reference/engine/classes/UICorner) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
