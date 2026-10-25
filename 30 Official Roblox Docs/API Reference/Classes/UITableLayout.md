---
title: "UITableLayout"
description: "Lays out sibling UI elements and their child UI elements as rows/columns and cells in a table."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UITableLayout"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Lays out sibling UI elements and their child UI elements as rows/columns and cells in a table.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]] → [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]] → [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A UITableLayout lays out sibling UI elements as rows in a table. Child UI elements (the table cells) of these rows are then arranged in columns (within rows). Each cell within a row has the same height, and each cell within a column has the same width.

By changing the [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|UIGridStyleLayout.FillDirection]], sibling UI elements can act as columns instead.

When applied, a UITableLayout will take control of sibling and cell elements' [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|GuiObject.Size]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|GuiObject.Position]]. Changing these in the Properties window is still possible will not produce any effect.

Dimensions of the cells in the resulting table are controlled by the parent UI element's dimensions. Unless [[30 Official Roblox Docs/API Reference/Classes/UITableLayout#FillEmptySpaceColumns|UITableLayout.FillEmptySpaceColumns]] or [[30 Official Roblox Docs/API Reference/Classes/UITableLayout#FillEmptySpaceRows|UITableLayout.FillEmptySpaceRows]] is enabled, the cell dimensions will be that of the parent UI element (and thus tables with more than one cell extend outside of their parent).

Cells will continue to respect [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] objects within them. In other words, setting [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize|UISizeConstraint.MinSize]] on [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraints]] within the header cells can determine the size of the rest of the cells. If [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize|UISizeConstraint.MaxSize]] restricts a cell's size from filling the allotted space (i.e. another row/column is wider than it), it will align to the top-left.

*Code samples for this API (`Build-UI-Table`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/UITableLayout); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UITableLayout#FillEmptySpaceColumns\|FillEmptySpaceColumns]] | boolean | Determines whether cells are sized such that they occupy the horizontal space of the parent UI element. |
| [[30 Official Roblox Docs/API Reference/Classes/UITableLayout#FillEmptySpaceRows\|FillEmptySpaceRows]] | boolean | Determines whether cells are sized such that they occupy the vertical space of the parent UI element. |
| [[30 Official Roblox Docs/API Reference/Classes/UITableLayout#MajorAxis\|MajorAxis]] | [[30 Official Roblox Docs/API Reference/Enums/TableMajorAxis\|TableMajorAxis]] | Determines whether sibling UI elements are treated as rows or columns. |
| [[30 Official Roblox Docs/API Reference/Classes/UITableLayout#Padding\|Padding]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Determines the empty space between cells. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]], [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]], [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### FillEmptySpaceColumns

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

FillEmptySpaceColumns determines whether cells' X size are set such that the entire horizontal space of the parent UI element is used. Enabling this is useful for making sure your table takes up a more easily predictable amount of horizontal space (the X-axis size of the parent UI element). It is still possible that a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] applied to cells will cause underflow/overflow.

When enabling this property, the column widths will be approximately equal to the parent's [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]].X component divided by the number of columns (not accounting for padding or other factors).

*Code samples for this member (`Build-UI-Table`) are published on the source page; their code is not part of the open-source repo.*

### FillEmptySpaceRows

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

FillEmptySpaceRows determines whether cells' Y size are set such that the entire vertical space of the parent UI element is used. Enabling this is useful for making sure your table takes up a more easily predictable amount of vertical space (the Y-axis size of the parent UI element). It is still possible that a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] applied to cells will cause underflow/overflow.

When enabling this property, the row heights will be approximately equal to the parent's [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]].Y component divided by the number of rows (not accounting for padding or other factors).

*Code samples for this member (`Build-UI-Table`) are published on the source page; their code is not part of the open-source repo.*

### MajorAxis

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TableMajorAxis|TableMajorAxis]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

MajorAxis determines whether sibling UI elements are treated as rows or columns.

*Code samples for this member (`Build-UI-Table`) are published on the source page; their code is not part of the open-source repo.*

### Padding

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Padding will position elements with extra space between them. This can be done using Scale or Offset components of UDim2. Negative values can bring elements closer together. When non-zero, the sibling UI elements may be visible between the cells contained within them.

*Code samples for this member (`Build-UI-Table`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [UITableLayout](https://create.roblox.com/docs/reference/engine/classes/UITableLayout) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
