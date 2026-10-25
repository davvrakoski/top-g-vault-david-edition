---
title: "UIGridLayout"
description: "Positions sibling UI elements by filling rows using the space of the parent UI element."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIGridLayout"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Positions sibling UI elements by filling rows using the space of the parent UI element.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]] → [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]] → [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A UIGridLayout (not to be confused with the abstract [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]] from which this class inherits) lays out sibling UI elements in multiple rows within the parent UI element, adding elements to a row one-by-one until the next element would not fit. It then continues adding elements in the next row. A UIGridLayout will take UI elements' [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|GuiObject.Size]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|GuiObject.Position]] under control. While under control, these UI elements' properties will not be editable in the Properties window.

By default, it lays out elements in **ascending** order where lower values take more priority over higher values, but this can be changed to use elements' names by changing [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder|UIListLayout.SortOrder]] to **Name**. A UIListLayout will automatically re-layout elements when elements are added/removed, or if a relevant property changes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|GuiObject.LayoutOrder]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]]. This can be triggered manually by calling [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#ApplyLayout|UIGridStyleLayout:ApplyLayout()]], though this is typically not necessary.

The actual cell sizes are the same for all cells. A UIGridLayout will respect UI constraints placed with it, such as [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] and [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]]. Elements in the layout can span multiple cells if they have a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] with a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize|MinSize]] set higher than the [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#CellSize|CellSize]]. It is possible to limit the number of elements per row using [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#FillDirectionMaxCells|UIGridLayout.FillDirectionMaxCells]]. If set to 1, it is possible to create a single row of elements (as each element would be positioned in its own row).

This layout is appropriate when line breaks are OK after arbitrary cells. For example, a set of inventory spaces is a good use of this layout. If building a table of values in which a line break is not appropriate in the middle of tabular data, it might be a better idea to use a [[30 Official Roblox Docs/API Reference/Classes/UITableLayout|UITableLayout]] instead.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#AbsoluteCellCount\|AbsoluteCellCount]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The number of elements in the grid. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#AbsoluteCellSize\|AbsoluteCellSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The absolute size of each element in the grid. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#CellPadding\|CellPadding]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Determines how much space there is between elements in the grid. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#CellSize\|CellSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Determines the size of each element in the grid. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#FillDirectionMaxCells\|FillDirectionMaxCells]] | int | Determines the maximum number of cells that may be used in a row or column before the next one is started. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#StartCorner\|StartCorner]] | [[30 Official Roblox Docs/API Reference/Enums/StartCorner\|StartCorner]] | Determines from which corner the grid starts laying out UI elements. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]], [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]], [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AbsoluteCellCount

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Measures the maximum number of elements in each direction. Read-only.

### AbsoluteCellSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Provides the size of each element of the grid in offsets. Read-only. Not affected by any [[30 Official Roblox Docs/API Reference/Classes/UIScale|UIScale]], [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] or [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]] applied to any individual element in the grid.

### CellPadding

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

(default ,) Determines how much space there is between elements in the grid. As with all UDim2s, this space can be both in a percentage of the parent container's size and raw pixel offset.

### CellSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

(default ,) Determines the size of each element in the grid. As with all UDim2s, this size can be both in a percentage of the parent container's size and raw pixel offset. If the element being size has a [[30 Official Roblox Docs/API Reference/Classes/UIConstraint|UIConstraint]] then the size will be determined by the constraint, not the grid.

### FillDirectionMaxCells

**Type:** int

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

FillDirectionMaxCells determines the number of cells in the grid that can be used before continuing on the next row/column (whether this is a row or column is dependent on [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|UIGridStyleLayout.FillDirection]]). This value must be non-negative.

- If set to zero, there is no maximum number of cells that may appear in one row/column except for how many can fit within the parent UI element.
- If set to one, this creates a list similar to those created by [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]].

### StartCorner

**Type:** [[30 Official Roblox Docs/API Reference/Enums/StartCorner|StartCorner]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

StartCorner ([[30 Official Roblox Docs/API Reference/Enums/StartCorner|Enum.StartCorner]]) determines from which corner the grid starts laying out UI elements. The grid continues in the [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|UIGridStyleLayout.FillDirection]], filling elements one by one until [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#FillDirectionMaxCells|UIGridLayout.FIllDirectionMaxCells]] cells have been laid out in that row/column or if all the parent UI element's space has been occupied by previous cells.

Above, the potion is the first [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]], followed by the gem and the sword. The UIGridLayout is using a [[30 Official Roblox Docs/API Reference/Enums/StartCorner|Enum.StartCorner]] of BottomRight. The [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|UIGridStyleLayout.FillDirection]] is Horizontal.

---
*Source: [UIGridLayout](https://create.roblox.com/docs/reference/engine/classes/UIGridLayout) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
