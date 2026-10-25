---
title: "UIPageLayout"
description: "Positions sibling UI elements as full-size pages in a single row or column that users can scroll or animate through one page at a time."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIPageLayout"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Positions sibling UI elements as full-size pages in a single row or column that users can scroll or animate through one page at a time.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]] → [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]] → [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Creates a paged viewing window, like the home screen of a mobile device. You can use a UIPageLayout by parenting it to a GuiObject. The UIPageLayout will then apply itself to all of its GuiObject siblings.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Animated\|Animated]] | boolean | Whether or not to animate transitions between pages. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Circular\|Circular]] | boolean | Whether or not the page layout wraps around at the ends. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#CurrentPage\|CurrentPage]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] | The page that is either currently being displayed or is the target of the current animation. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#EasingDirection\|EasingDirection]] | [[30 Official Roblox Docs/API Reference/Enums/EasingDirection\|EasingDirection]] | The easing direction to use when performing an animation. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#EasingStyle\|EasingStyle]] | [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|EasingStyle]] | The easing style to use when performing an animation. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#GamepadInputEnabled\|GamepadInputEnabled]] | boolean | Controls the overrides of `NextSelection{Up, Down, Left, Right}`. Defaults to true. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Padding\|Padding]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Determines the amount that pages are separated from each other by. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#ScrollWheelInputEnabled\|ScrollWheelInputEnabled]] | boolean | Controls the use of scroll wheel, in case that it is intended for something else. Defaults to true. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#TouchInputEnabled\|TouchInputEnabled]] | boolean | Controls touch scrolling, in case this is a non-interactive layout. Defaults to true. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#TweenTime\|TweenTime]] | float | The length of the animation. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#JumpTo\|JumpTo()]] | () | If the `page` is in the UIPageLayout, then it sets [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#CurrentPage\|UIPageLayout.CurrentPage]] to it and animates to it. If the circular layout is enabled, it will take the shortest path to this page. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#JumpToIndex\|JumpToIndex()]] | () | If the index is `>= 0` and less than the size of the layout, this method acts like [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#JumpTo\|UIPageLayout:JumpTo()]]. Out-of-bounds indices are wrapped modulo the page count to determine the target page. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Next\|Next()]] | () | Sets [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#CurrentPage\|UIPageLayout.CurrentPage]] to the page after the current page and animates to it, or does nothing if there isn't a next page. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Previous\|Previous()]] | () | Sets [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#CurrentPage\|UIPageLayout.CurrentPage]] to the page before the current page and animates to it, or does nothing if there isn't a previous page. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#PageEnter\|PageEnter]] | `page` | Fires when a page comes into view, and is going to be rendered. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#PageLeave\|PageLeave]] | `page` | Fires when a page leaves view, and will not be rendered. |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Stopped\|Stopped]] | `currentPage` | Fires when an animation to [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#CurrentPage\|UIPageLayout.CurrentPage]] is completed without being canceled, and the view stops scrolling. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]], [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]], [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Animated

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to true, page transitions use the configured [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#EasingStyle|UIPageLayout.EasingStyle]], [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#EasingDirection|UIPageLayout.EasingDirection]], and [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#TweenTime|UIPageLayout.TweenTime]] to animate the movement between pages. When set to false, page transitions are instantaneous. Defaults to `true`.

### Circular

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to true, navigating past the last page wraps around to the first page, and navigating before the first page wraps to the last. Animated transitions take the shortest rotational path around the wrap boundary. When set to false, navigation stops at the first and last pages. Defaults to `false`.

### CurrentPage

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

A read-only reference to the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] sibling that is currently displayed or is the target of an in-progress animation. The layout updates this property when pages change via [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Next|UIPageLayout:Next()]], [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Previous|UIPageLayout:Previous()]], [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#JumpTo|UIPageLayout:JumpTo()]], [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#JumpToIndex|UIPageLayout:JumpToIndex()]], or through user input (touch swipe, scroll wheel, or gamepad). If no page has been explicitly navigated to, it defaults to the first visible [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] sibling in layout order.

### EasingDirection

**Type:** [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|EasingDirection]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the direction component of the easing function applied during animated page transitions. Combined with [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#EasingStyle|UIPageLayout.EasingStyle]] to form the full tween curve. Only takes effect when [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Animated|UIPageLayout.Animated]] is true. Defaults to [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|Enum.EasingDirection.Out]].

### EasingStyle

**Type:** [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|EasingStyle]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the easing curve applied during animated page transitions. Combined with [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#EasingDirection|UIPageLayout.EasingDirection]] to form the full tween curve. Only takes effect when [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Animated|UIPageLayout.Animated]] is true. Defaults to [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Back]]. Assigning [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Bezier]] or [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Spring]] emits a warning and leaves this property unchanged.

### GamepadInputEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Input · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to true, the layout overrides sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionLeft|GuiObject.NextSelectionLeft]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionRight|GuiObject.NextSelectionRight]] (for horizontal fill direction) or [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionUp|GuiObject.NextSelectionUp]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionDown|GuiObject.NextSelectionDown]] (for vertical fill direction) so that gamepad directional navigation moves between pages. Additionally, the L1 and R1 bumper buttons advance to the previous and next page respectively. When false, gamepad input does not interact with the layout. Defaults to `true`.

### Padding

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the amount that pages are separated from each other by. Can be set either using scale (Percentage of parent's size in the current direction) or offset (a static spacing value, similar to pixel size).

### ScrollWheelInputEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Input · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to true, mouse scroll wheel input navigates between pages. Scrolling up moves to the previous page and scrolling down moves to the next page. Set this to false when the scroll wheel is intended for other interactions in the UI. Defaults to `true`.

### TouchInputEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Input · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to true, touch-based swipe gestures navigate between pages. Set this to false for layouts where touch input should not trigger page transitions, such as non-interactive displays. Defaults to `true`.

### TweenTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

The duration, in seconds, of the animated transition when navigating between pages. The value is clamped to a minimum of 0.01. Only takes effect when [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Animated|UIPageLayout.Animated]] is true. Defaults to `1`.

## Methods

### JumpTo

```lua
UIPageLayout:JumpTo(page: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Navigates to a specific page within the layout. The `page` argument must be a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that is a visible sibling managed by this layout; passing `nil` or an instance that is not part of the layout throws an error. Sets [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#CurrentPage|UIPageLayout.CurrentPage]] to the target and animates the transition (or jumps instantly if [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Animated|UIPageLayout.Animated]] is false). When [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Circular|UIPageLayout.Circular]] is true, the animation takes the shortest rotational path to the target page.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `page` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] sibling to navigate to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### JumpToIndex

```lua
UIPageLayout:JumpToIndex(index: int): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Navigates to the page at the given zero-based `index` in layout order. If the index is within the valid range (0 to page count minus 1), this method behaves like [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#JumpTo|UIPageLayout:JumpTo()]]. Out-of-bounds indices are wrapped modulo the page count to determine the final page.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | The zero-based position of the target page in layout order. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Next

```lua
UIPageLayout:Next(): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Advances [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#CurrentPage|UIPageLayout.CurrentPage]] to the next page in layout order and animates the transition (or jumps instantly if [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Animated|UIPageLayout.Animated]] is false). If the current page is already the last page and [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Circular|UIPageLayout.Circular]] is false, this method does nothing. If [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Circular|UIPageLayout.Circular]] is true, it wraps from the last page to the first.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Previous

```lua
UIPageLayout:Previous(): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Moves [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#CurrentPage|UIPageLayout.CurrentPage]] to the previous page in layout order and animates the transition (or jumps instantly if [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Animated|UIPageLayout.Animated]] is false). If the current page is already the first page and [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Circular|UIPageLayout.Circular]] is false, this method does nothing. If [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Circular|UIPageLayout.Circular]] is true, it wraps from the first page to the last.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### PageEnter

```lua
UIPageLayout.PageEnter(page: Instance)
```

**Capabilities:** UI

Fires when a sibling page's bounding rect begins intersecting the parent's clip region, causing it to become visible and rendered. The `page` parameter is the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that entered view. This event fires on the frame the page's visibility flips from hidden to shown, whether due to an animated transition, a programmatic jump, or user input scrolling.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `page` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] that entered view. |

### PageLeave

```lua
UIPageLayout.PageLeave(page: Instance)
```

**Capabilities:** UI

Fires when a sibling page's bounding rect stops intersecting the parent's clip region, causing it to become hidden and no longer rendered. The `page` parameter is the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that left view. This event fires on the frame the page's visibility flips from shown to hidden, whether due to an animated transition, a programmatic jump, or user input scrolling.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `page` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] that left view. |

### Stopped

```lua
UIPageLayout.Stopped(currentPage: Instance)
```

**Capabilities:** UI

Fires when a page-navigation animation reaches its target without being interrupted by new input, and the view comes to rest. The `currentPage` parameter is the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] now displayed. This event does not fire for programmatic transitions made while [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Animated|UIPageLayout.Animated]] is false, since those snap to the target page instantly.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `currentPage` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] now displayed after the transition completed. |

---
*Source: [UIPageLayout](https://create.roblox.com/docs/reference/engine/classes/UIPageLayout) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
