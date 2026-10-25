---
title: "UIListLayout"
description: "Positions sibling UI elements in rows or columns within the parent UI container."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIListLayout"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Positions sibling UI elements in rows or columns within the parent UI container.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]] → [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]] → [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] positions sibling UI elements in rows or columns within the parent UI container, based on the [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]]. The [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]] properties of each sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] are either ignored or overridden by the list layout, while each sibling retains its defined [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] unless the layout is configured to utilize a flex layout. See [[30 Official Roblox Docs/UI/List and flex layouts|List and Flex Layouts]] for further information.

*(image in the full Top G Vault)*

To control the layout order of siblings, set [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder|SortOrder]] to either [[30 Official Roblox Docs/API Reference/Enums/SortOrder|Enum.SortOrder.Name]] or [[30 Official Roblox Docs/API Reference/Enums/SortOrder|Enum.SortOrder.LayoutOrder]], then rename siblings in alphanumerical order or set their [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]] value, respectively. [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] will automatically re‑layout elements when elements are added/removed, or if a sibling's [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]] or [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]] changes.

*(image in the full Top G Vault)*

Padding between siblings is controlled through the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#Padding|Padding]] property, and wrapping within the parent container's bounds through the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#Wraps|Wraps]] boolean. Alignment of siblings within the parent container is controlled through [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#HorizontalAlignment|HorizontalAlignment]] and [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#VerticalAlignment|VerticalAlignment]] unless the layout is configured to utilize a [[30 Official Roblox Docs/UI/List and flex layouts#Flex layouts|flex layout]].

Note that there are performance implications of using a [[30 Official Roblox Docs/UI/List and flex layouts#Flex layouts|flex‑enabled]] list layout, since extra calculations are needed to calculate flex basis sizes, flexed sizes, and line wrapping. Flex is enabled on a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] when the following properties are set, or if any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] sibling has a [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem|UIFlexItem]] parented to it:

- [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex|HorizontalFlex]] and/or [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#VerticalFlex|VerticalFlex]] are **not** set to [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment|Enum.UIFlexAlignment.None]].
- [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#ItemLineAlignment|ItemLineAlignment]] is **not** set to [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment|Enum.ItemLineAlignment.Automatic]].
- [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#Wraps|Wraps]] is `true`.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex\|HorizontalFlex]] | [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|UIFlexAlignment]] | Controls how to distribute extra horizontal space. |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#ItemLineAlignment\|ItemLineAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment\|ItemLineAlignment]] | In a flex layout, defines the **cross-directional** alignment of siblings within a line. |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#Padding\|Padding]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Amount of free space between each element. |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#VerticalFlex\|VerticalFlex]] | [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|UIFlexAlignment]] | Controls how to distribute extra vertical space. |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#Wraps\|Wraps]] | boolean | Controls whether siblings within the parent container wrap. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]], [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]], [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### HorizontalFlex

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment|UIFlexAlignment]]

**Thread safety:** ReadSafe · **Category:** Alignment · **Loaded/Saved:** true/true · **Capabilities:** UI

When the list layout's [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]] is set to [[30 Official Roblox Docs/API Reference/Enums/FillDirection|Enum.FillDirection.Horizontal]], the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex|HorizontalFlex]] property specifies how to distribute extra horizontal space in the parent container.

| Setting | Sibling Behavior |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|None]] | No flex behavior; siblings maintain their defined width. |
| [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|Fill]] | Siblings resize horizontally to fill the entire parent container, overriding their defined width. The number of siblings in a row remain unchanged; for example, if three siblings fit horizontally within the container's width under the [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|None]] setting, those three siblings will resize to fill the entire width. |
| [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|SpaceAround]] | Siblings maintain their defined width. Equal spacing is added on both sides of each sibling. |
| [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|SpaceBetween]] | Siblings maintain their defined width. Equal spacing is added **between** siblings, but no additional space is added **around** siblings. |
| [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|SpaceEvenly]] | Siblings maintain their defined width. Equal spacing is added both **between** and **around** siblings. |

*(image in the full Top G Vault)*

##### Cross-Direction Behavior

In **vertical** list layouts ([[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]] set to [[30 Official Roblox Docs/API Reference/Enums/FillDirection|Enum.FillDirection.Vertical]]), the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex|HorizontalFlex]] property specifies how to distribute the siblings across the **horizontal cross‑direction**. In such layouts, a setting of [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment|Enum.UIFlexAlignment.Fill]] makes the siblings fill the entire horizontal space while vertical spacing adheres to [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#VerticalFlex|VerticalFlex]].

*(image in the full Top G Vault)*

##### AutomaticSize Interaction

If [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|GuiObject.AutomaticSize]] is enabled for a child of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] in the [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]], it is interpreted as "automatic flex basis" and it defines the size of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] from which it can grow or shrink.

If [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|GuiObject.AutomaticSize]] is enabled for a child of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] in the **cross‑direction**, it is interpreted as "automatic cross size" and it defines the minimum size needed to contain all the child's content in the cross‑direction.

### ItemLineAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment|ItemLineAlignment]]

**Thread safety:** ReadSafe · **Category:** Alignment · **Loaded/Saved:** true/true · **Capabilities:** UI

In a [[30 Official Roblox Docs/UI/List and flex layouts#Flex layouts|flex layout]], defines the **cross-directional** alignment of siblings within a line. See [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment|Enum.ItemLineAlignment]] for visual examples.

| Setting | Sibling Behavior |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment\|Automatic]] | Aligns the layout's siblings or the specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]] parent to the layout's [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#HorizontalAlignment\|HorizontalAlignment]] or [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#VerticalAlignment\|VerticalAlignment]], depending on its [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection\|FillDirection]]. |
| [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment\|Start]] | Aligns the layout's siblings or the specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]] parent to the line's **top** in a horizontal fill or the line's **left** in a vertical fill. |
| [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment\|Center]] | Aligns the layout's siblings or the specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]] parent to the line's **center** in either a horizontal or vertical fill. |
| [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment\|End]] | Aligns the layout's siblings or the specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]] parent to the line's **bottom** in a horizontal fill or the line's **right** in a vertical fill. |
| [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment\|Stretch]] | Stretches the layout's siblings or the specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]] parent to fill the entire cross‑direction of the line in either a horizontal or vertical fill. |

*(image in the full Top G Vault)*

### Padding

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the amount of free space between each element, set to either a scale (percentage of the parent's size in the current direction) or an offset (static spacing value similar to pixel size).

### VerticalFlex

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment|UIFlexAlignment]]

**Thread safety:** ReadSafe · **Category:** Alignment · **Loaded/Saved:** true/true · **Capabilities:** UI

When the list layout's [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]] is set to [[30 Official Roblox Docs/API Reference/Enums/FillDirection|Enum.FillDirection.Vertical]], the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#VerticalFlex|VerticalFlex]] property specifies how to distribute extra vertical space in the parent container.

| Setting | Sibling Behavior |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|None]] | No flex behavior; siblings maintain their defined height. |
| [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|Fill]] | Siblings resize vertically to fill the entire parent container, overriding their defined height. The number of siblings in a column remain unchanged; for example, if three siblings fit vertically within the container's height under the [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|None]] setting, those three siblings will resize to fill the entire height. |
| [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|SpaceAround]] | Siblings maintain their defined height. Equal spacing is added on both sides of each sibling. |
| [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|SpaceBetween]] | Siblings maintain their defined height. Equal spacing is added **between** siblings, but no additional space is added **around** siblings. |
| [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|SpaceEvenly]] | Siblings maintain their defined height. Equal spacing is added both **between** and **around** siblings. |

*(image in the full Top G Vault)*

##### Cross-Direction Behavior

In **horizontal** list layouts ([[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]] set to [[30 Official Roblox Docs/API Reference/Enums/FillDirection|Enum.FillDirection.Horizontal]]), the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#VerticalFlex|VerticalFlex]] property specifies how to distribute the siblings across the **vertical cross direction**. In such layouts, a setting of [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment|Enum.UIFlexAlignment.Fill]] makes the siblings fill the entire vertical space while horizontal spacing adheres to [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex|HorizontalFlex]].

*(image in the full Top G Vault)*

##### AutomaticSize Interaction

If [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|GuiObject.AutomaticSize]] is enabled for a child of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] in the [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]], it is interpreted as "automatic flex basis" and it defines the size of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] from which it can grow or shrink.

If [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|GuiObject.AutomaticSize]] is enabled for a child of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] in the **cross‑direction**, it is interpreted as "automatic cross size" and it defines the minimum size needed to contain all the child's content in the cross‑direction.

### Wraps

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls whether siblings within the parent container wrap to another line when their default size exceeds the width/height of the container's bounds.

*(image in the full Top G Vault)*

---
*Source: [UIListLayout](https://create.roblox.com/docs/reference/engine/classes/UIListLayout) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
