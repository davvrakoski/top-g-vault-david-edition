---
title: "Grid and table layouts"
description: "How to use grid and table layouts for highly structured user interfaces."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/grid-table-layouts"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*How to use grid and table layouts for highly structured user interfaces.*

In comparison to [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]], [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]] and [[30 Official Roblox Docs/API Reference/Classes/UITableLayout|UITableLayout]] allow for more structured and organized layouts. These are most appropriate for interfaces like a shop inventory where each item can be presented in a grid of equally‑sized tiles, or items can be sorted into related rows/columns.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UITableLayout|UITableLayout]]*

## Grid layout

[[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]] positions sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] in a grid of uniform cells of the same size within their parent container. Cells are added by row or column based on the layout's [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]] until the next cell doesn't fit, then a new row or column begins. For further control, you can use the [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#FillDirectionMaxCells|FillDirectionMaxCells]] property to set the maximum number of cells per row or column.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

By default, [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]] positions sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] in order of their [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]] where lower values go before higher values, and equal values sort depending on the order in which you added them. If you change the layout's [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder|SortOrder]] to [[30 Official Roblox Docs/API Reference/Enums/SortOrder|Enum.SortOrder.Name]], siblings sort in alphabetical order.

> [!warning]
> Once you insert a [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]], it either overrides or influences the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] and/or [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] of all sibling UI objects, so changes to those properties within the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window or within a script will not have the normal effect.

> [!info]
> [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]] respects any [[30 Official Roblox Docs/UI/Size modifiers and constraints|constraints]] you place on objects within the grid. For example, if an object has a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] with a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize|MinSize]] property that is higher than the grid's [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#CellSize|CellSize]] property, the object will span multiple cells.

## Table layout

[[30 Official Roblox Docs/API Reference/Classes/UITableLayout|UITableLayout]] positions sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] and their children into table format. The default [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]] of [[30 Official Roblox Docs/API Reference/Enums/FillDirection|Vertical]] means that siblings are first positioned into rows, and children of those siblings are positioned horizontally to form columns, such that each cell within a row has the same height and each cell within a column has the same width.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

This pattern mimics the standard HTML row/column structure:

```html
<table>
	<tbody>
		<tr> <!-- Row1 -->
			<td>Label 1</td> <!-- TextLabel1 -->
			<td>Label 2</td> <!-- TextLabel2 -->
			<td>Label 3</td> <!-- TextLabel3 -->
		</tr>
		<tr> <!-- Row2 -->
			<td>Label 4</td> <!-- TextLabel4 -->
			<td>Label 5</td> <!-- TextLabel5 -->
			<td>Label 6</td> <!-- TextLabel6 -->
		</tr>
		<tr> <!-- Row3 -->
			<td>Label 7</td> <!-- TextLabel7 -->
			<td>Label 8</td> <!-- TextLabel8 -->
			<td>Label 9</td> <!-- TextLabel9 -->
		</tr>
	</tbody>
</table>
```

Unless you enable the layout's [[30 Official Roblox Docs/API Reference/Classes/UITableLayout#FillEmptySpaceColumns|FillEmptySpaceColumns]] or [[30 Official Roblox Docs/API Reference/Classes/UITableLayout#FillEmptySpaceRows|FillEmptySpaceRows]] properties, the size of the sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] determines the dimensions of the cells. For example, a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] of size `Datatype.UDim2.new(0.25, 0, 0.1, 0)` will create a table cell of 25% width and 10% height inside the parent container.

> [!warning]
> Once you insert a [[30 Official Roblox Docs/API Reference/Classes/UITableLayout|UITableLayout]], it either overrides or influences the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] and/or [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] of all sibling UI objects, so changes to those properties within the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window or within a script will not have the normal effect.

> [!info]
> [[30 Official Roblox Docs/API Reference/Classes/UITableLayout|UITableLayout]] respects and is responsive to any [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] you place on objects within the table. For example, if an object has a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] with a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize|MinSize]] property within a header cell, the rest of the cells within the column will be the same size as the header cell.
>
> Note that if the [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize|MaxSize]] property restricts a cell's size from filling the allotted space of a row or column that is wider than the cell, the object aligns to the top‑left of the cell.

---
*Source: [Grid and table layouts](https://create.roblox.com/docs/ui/grid-table-layouts) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
