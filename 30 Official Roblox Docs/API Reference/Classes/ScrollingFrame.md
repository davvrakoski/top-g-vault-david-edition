---
title: "ScrollingFrame"
description: "`ScrollingFrame` is a special `Frame` type with built-in scrolling interactivity and different ways to customize how the scrolling works."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ScrollingFrame"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*`ScrollingFrame` is a special [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] type with built-in scrolling interactivity and different ways to customize how the scrolling works.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

`ScrollingFrame` is a special [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] type with built-in scrolling interactivity and different ways to customize how the scrolling works.

*(image in the full Top G Vault)*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AbsoluteCanvasSize\|AbsoluteCanvasSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The size of the area that is scrollable, in offsets. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AbsoluteWindowSize\|AbsoluteWindowSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The size of the frame, in offsets, without the scroll bars. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AutomaticCanvasSize\|AutomaticCanvasSize]] | [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize\|AutomaticSize]] | Determines whether [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize\|ScrollingFrame.CanvasSize]] is resized based on child content. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImage\|BottomImage]] | ContentId | Image that displays on the bottom of a vertical scroll bar, or the right of a horizontal scroll bar (rotated 90° counterclockwise for a horizontal scroll bar). |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImageContent\|BottomImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]]-typed equivalent of [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImage\|BottomImage]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasPosition\|CanvasPosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Reflects the **current** positional offset of the canvas within the frame, in pixels, and sets the position of scroll bars accordingly. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize\|CanvasSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Determines the size of the scrollable area. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ElasticBehavior\|ElasticBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/ElasticBehavior\|ElasticBehavior]] | Determines if and when elastic scrolling is allowed on touch‑enabled devices. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#HorizontalScrollBarInset\|HorizontalScrollBarInset]] | [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset\|ScrollBarInset]] | Indicates whether [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize\|CanvasSize]] is inset by [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarThickness\|ScrollBarThickness]] on the horizontal axis. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#MidImage\|MidImage]] | ContentId | Image which spans the area between [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImage\|TopImage]] and [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImage\|BottomImage]] (rotated 90° counterclockwise for a horizontal scroll bar). |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#MidImageContent\|MidImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]]-typed equivalent of [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#MidImage\|MidImage]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarImageColor3\|ScrollBarImageColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines how the rendered scroll bar images are colorized. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarImageTransparency\|ScrollBarImageTransparency]] | float | Determines the opacity of the scroll bar images. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarThickness\|ScrollBarThickness]] | int | Thickness of the scroll bar in pixels; applies to both horizontal and vertical scroll bars. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollingDirection\|ScrollingDirection]] | [[30 Official Roblox Docs/API Reference/Enums/ScrollingDirection\|ScrollingDirection]] | Determines the direction(s) in which scrolling is allowed. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollingEnabled\|ScrollingEnabled]] | boolean | Determines whether scrolling is allowed on the frame. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImage\|TopImage]] | ContentId | Image which displays on the top of a vertical scroll bar, or the left of a horizontal scroll bar (rotated 90° counterclockwise for a horizontal scroll bar). |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImageContent\|TopImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]]-typed equivalent of [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImage\|TopImage]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#VerticalScrollBarInset\|VerticalScrollBarInset]] | [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset\|ScrollBarInset]] | Indicates whether [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize\|CanvasSize]] is inset by [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarThickness\|ScrollBarThickness]] on the vertical axis. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#VerticalScrollBarPosition\|VerticalScrollBarPosition]] | [[30 Official Roblox Docs/API Reference/Enums/VerticalScrollBarPosition\|VerticalScrollBarPosition]] | Indicates whether the vertical scroll bar is positioned to the left or right of the canvas. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#GetScrollVelocity\|GetScrollVelocity()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] representing the current inertial scroll velocity after the user stops their input. |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ResetScrollVelocity\|ResetScrollVelocity()]] | () | Resets the inertial scroll velocity of the `ScrollingFrame` to `0` on both axes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AbsoluteCanvasSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Scrolling · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

The size of the area that is scrollable, in offsets. This property is set to the maximum of the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize|CanvasSize]] property and the size of the children if [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AutomaticCanvasSize|AutomaticCanvasSize]] is set to something other than [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|Enum.AutomaticSize.None]].

### AbsoluteWindowSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Scrolling · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

The size of the frame, in offsets, without the scroll bars. This read-only property represents the visible content area of the `ScrollingFrame`: the frame's [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|AbsoluteSize]] minus the space occupied by any currently visible scroll bar gutters ([[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarThickness|ScrollBarThickness]]). If no scroll bars are visible, this equals the frame's absolute size.

### AutomaticCanvasSize

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|AutomaticSize]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is used to automatically size parent UI objects based on the size of its descendants. You can use this property to dynamically add text and other content to a `ScrollingFrame` at edit or run time and the size will adjust to fit that content.

When this property is set to an [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|Enum.AutomaticSize]] value other than [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|None]], [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AbsoluteCanvasSize|AbsoluteCanvasSize]] may resize depending on its child content.

### BottomImage

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Image that displays on the bottom of a vertical scroll bar, or the right of a horizontal scroll bar (rotated 90° counterclockwise for a horizontal scroll bar).

*(image in the full Top G Vault)*

### BottomImageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Image that displays on the bottom of a vertical scroll bar, or the right of a horizontal scroll bar (rotated 90° counterclockwise for a horizontal scroll bar). Only supports asset URIs as textures.

*(image in the full Top G Vault)*

### CanvasPosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Reflects the **current** positional offset of the canvas within the frame, in pixels, and sets the position of scroll bars accordingly. Note that this property doesn't do anything if scroll bars aren't visible.

### CanvasSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the size of the scrollable area. For an adaptive alternative based on the overall size of children within the `ScrollingFrame`, consider using [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AutomaticCanvasSize|AutomaticCanvasSize]].

### ElasticBehavior

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ElasticBehavior|ElasticBehavior]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines if and when elastic scrolling is allowed on touch‑enabled devices. Defaults to [[30 Official Roblox Docs/API Reference/Enums/ElasticBehavior|WhenScrollable]].

### HorizontalScrollBarInset

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|ScrollBarInset]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Indicates whether the scrollable canvas is inset by [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarThickness|ScrollBarThickness]] to account for the horizontal scroll bar. Because the horizontal scroll bar occupies space along the bottom edge, this inset reduces the canvas height. Defaults to [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|Enum.ScrollBarInset.None]].

- [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|None]] — the canvas is never inset; content may be obscured behind the horizontal scroll bar when it is visible.
- [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|ScrollBar]] — the canvas is inset only while the horizontal scroll bar is visible.
- [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|Always]] — the canvas is always inset regardless of whether the horizontal scroll bar is visible.

### MidImage

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Image which spans the area between [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImage|TopImage]] and [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImage|BottomImage]] (rotated 90° counterclockwise for a horizontal scroll bar). This image automatically scales to fill the space between the cap segments.

*(image in the full Top G Vault)*

### MidImageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Image which spans the area between [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImageContent|TopImageContent]] and [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImageContent|BottomImageContent]] (rotated 90° counterclockwise for a horizontal scroll bar). This image automatically scales to fill the space between the cap segments. Only supports asset URIs as textures.

*(image in the full Top G Vault)*

### ScrollBarImageColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines how the scroll bar images ([[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImage|TopImage]], [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#MidImage|MidImage]], [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImage|BottomImage]]) are colorized. When set to white, no colorization occurs. This property is useful for reusing image assets; if the source images are completely white with transparency, you can set the color of the entire scroll bar at once.

### ScrollBarImageTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the opacity of the scroll bar images ([[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImage|TopImage]], [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#MidImage|MidImage]], [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImage|BottomImage]]). A value of `0` is completely opaque and a value of `1` is completely transparent (invisible).

### ScrollBarThickness

**Type:** int

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Thickness of the scroll bar in pixels; applies to both horizontal and vertical scroll bars. If set to `0`, no scroll bars are rendered.

### ScrollingDirection

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ScrollingDirection|ScrollingDirection]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the direction(s) in which scrolling is allowed. If scrolling is disallowed in a direction, the associated scroll bar will not appear. Defaults to [[30 Official Roblox Docs/API Reference/Enums/ScrollingDirection|Enum.ScrollingDirection.XY]].

### ScrollingEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines whether scrolling is allowed on the frame. If `false`, no scroll bars will be rendered.

### TopImage

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Image which displays on the top of a vertical scroll bar, or the left of a horizontal scroll bar (rotated 90° counterclockwise for a horizontal scroll bar).

*(image in the full Top G Vault)*

### TopImageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Image which displays on the top of a vertical scroll bar, or the left of a horizontal scroll bar (rotated 90° counterclockwise for a horizontal scroll bar). Only supports asset URIs as textures. Defaults to the built-in scroll bar top cap texture (`rbxasset://textures/ui/Scroll/scroll-top.png`).

*(image in the full Top G Vault)*

### VerticalScrollBarInset

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|ScrollBarInset]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Indicates whether the scrollable canvas is inset by [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarThickness|ScrollBarThickness]] to account for the vertical scroll bar. Because the vertical scroll bar occupies space along a side edge, this inset reduces the canvas width. Defaults to [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|Enum.ScrollBarInset.None]].

- [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|None]] — the canvas is never inset; content may be obscured behind the vertical scroll bar when it is visible.
- [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|ScrollBar]] — the canvas is inset only while the vertical scroll bar is visible.
- [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|Always]] — the canvas is always inset regardless of whether the vertical scroll bar is visible.

### VerticalScrollBarPosition

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VerticalScrollBarPosition|VerticalScrollBarPosition]]

**Thread safety:** ReadSafe · **Category:** Scrolling · **Loaded/Saved:** true/true · **Capabilities:** UI

Indicates whether the vertical scroll bar is positioned to the left or right of the canvas. Defaults to [[30 Official Roblox Docs/API Reference/Enums/VerticalScrollBarPosition|Enum.VerticalScrollBarPosition.Right]].

## Methods

### GetScrollVelocity

```lua
ScrollingFrame:GetScrollVelocity(): Vector2
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] representing the current inertial scroll velocity after the user stops their input, for example lifts their finger off the `ScrollingFrame` on a touch-enabled device.

Note that this method may only produce noticable data on an actual device or in an emulated scenario from Studio's **Device Emulator**.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The current inertial scroll velocity in pixels per second on each axis, or `(0, 0)` if the frame is not coasting. |

### ResetScrollVelocity

```lua
ScrollingFrame:ResetScrollVelocity(): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Resets the inertial scroll velocity of the `ScrollingFrame` to `0` on both axes.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [ScrollingFrame](https://create.roblox.com/docs/reference/engine/classes/ScrollingFrame) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
