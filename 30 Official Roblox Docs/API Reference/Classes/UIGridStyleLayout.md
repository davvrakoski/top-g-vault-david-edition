---
title: "UIGridStyleLayout"
description: "The base class for grid style UI layouts."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIGridStyleLayout"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The base class for grid style UI layouts.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]] → [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]], [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]], [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout|UIPageLayout]], [[30 Official Roblox Docs/API Reference/Classes/UITableLayout|UITableLayout]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

The base class for grid style UI layouts.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#AbsoluteContentSize\|AbsoluteContentSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The absolute size of space being taken up by the grid layout. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection\|FillDirection]] | [[30 Official Roblox Docs/API Reference/Enums/FillDirection\|FillDirection]] | Determines the axis in which UI objects are laid out. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#HorizontalAlignment\|HorizontalAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/HorizontalAlignment\|HorizontalAlignment]] | Determines the horizontal alignment of UI elements within the parent element. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder\|SortOrder]] | [[30 Official Roblox Docs/API Reference/Enums/SortOrder\|SortOrder]] | Determines the order in which child UI objects are placed in a layout. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#VerticalAlignment\|VerticalAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment\|VerticalAlignment]] | Determines the vertical alignment of UI elements within the parent element. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#ApplyLayout\|ApplyLayout()]] | () | **Deprecated.** Force re-layout of sibling UI elements. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SetCustomSortFunction\|SetCustomSortFunction()]] | () | **Deprecated.** Sets the function used to determine the order of elements when SortOrder is set to Custom. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]], [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AbsoluteContentSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

The **AbsoluteContentSize** property of a [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]] reveals how much space the elements of the grid are taking up, including any padding created by the grid. This property is particularly useful to size containers of grids such as [[30 Official Roblox Docs/API Reference/Classes/Frame|Frames]] to make sure they aren't any larger than the grid itself.

This property updates as soon as it's read. It will not fire a [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Object.Changed]] event immediately after the UI has changed, but if the value is read, it will become current and a [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Object.Changed]] event will fire on the next render step.

### FillDirection

**Type:** [[30 Official Roblox Docs/API Reference/Enums/FillDirection|FillDirection]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

The **FillDirection** property determines the axis in which UI elements are laid out. [[30 Official Roblox Docs/API Reference/Enums/FillDirection|Enum.FillDirection.Horizontal]] arranges objects from left to right, while [[30 Official Roblox Docs/API Reference/Enums/FillDirection|Enum.FillDirection.Vertical]] arranges objects from top to bottom. To reverse elements, such as to arrange right to left, you'll need to reverse the sorting; for example by negating the child UI objects' [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|GuiObject.LayoutOrder]] values when [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder|UIGridStyleLayout.SortOrder]] is set to [[30 Official Roblox Docs/API Reference/Enums/SortOrder|Enum.SortOrder.LayoutOrder]].

*(image in the full Top G Vault)*

### HorizontalAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/HorizontalAlignment|HorizontalAlignment]]

**Thread safety:** ReadSafe · **Category:** Alignment · **Loaded/Saved:** true/true · **Capabilities:** UI

The **HorizontalAlignment** property determines the **X** axis alignment of the grid of UI elements, much like [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextXAlignment|TextLabel.TextXAlignment]] does with [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Text|TextLabel.Text]].

### SortOrder

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SortOrder|SortOrder]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

The **SortOrder** property determines the order in which child UI objects are placed in a layout.

For [[30 Official Roblox Docs/API Reference/Enums/SortOrder|Enum.SortOrder.LayoutOrder]], an ascending sort is used on the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]] property of child UI objects. If two children share the same [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]], whichever was added sooner to the parent object takes precedence.

For [[30 Official Roblox Docs/API Reference/Enums/SortOrder|Enum.SortOrder.Name]], an alphanumeric sort is used on the [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]] of the child UI objects.

*(image in the full Top G Vault)*

### VerticalAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment|VerticalAlignment]]

**Thread safety:** ReadSafe · **Category:** Alignment · **Loaded/Saved:** true/true · **Capabilities:** UI

The **VerticalAlignment** property determines the **Y** axis alignment of the grid of UI elements, much like [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextYAlignment|TextLabel.TextYAlignment]] does with [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Text|TextLabel.Text]].

## Methods

### ApplyLayout

> [!warning] Deprecated
> This member is deprecated.

```lua
UIGridStyleLayout:ApplyLayout(): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

The ApplyLayout method forces sibling UI elements to be re-laid out in case the sorting criteria may have changed (such as when [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder|UIGridStyleLayout.SortOrder]] is set to Custom, and the [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SetCustomSortFunction|UIGridStyleLayout:SetCustomSortFunction()]] behavior changed). Re-layouts automatically happen when UI elements are added/removed, or their [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]] or [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|GuiObject.LayoutOrder]] change.

The manner in which sibling UI elements are laid out is dependent on the implementation of this abstract class. In other words, a concrete class like [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] or [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]] is responsible for the actual element positioning.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`UI-Sort-Order`) are published on the source page; their code is not part of the open-source repo.*

### SetCustomSortFunction

> [!warning] Deprecated
> This method is deprecated in favor of using other SortOrder means, such as
> by Name or LayoutOrder.

```lua
UIGridStyleLayout:SetCustomSortFunction(function: Function = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

This method is deprecated. Use [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder|UIGridStyleLayout.SortOrder]] instead.

The function should take two arguments (each will be an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] child to compare), and return true if a comes before b, otherwise return false. In other words, use this function the same way you would use a ' function. The sorting should be deterministic, otherwise sort will fail and fall back to name order.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `function` | Function | `nil` |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [UIGridStyleLayout](https://create.roblox.com/docs/reference/engine/classes/UIGridStyleLayout) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
