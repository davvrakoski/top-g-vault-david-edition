---
title: "Scrolling frames"
description: "ScrollingFrames feature built-in scrolling interactivity and are ideal for displaying a lot of information in a confined space."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/scrolling-frames"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*ScrollingFrames feature built-in scrolling interactivity and are ideal for displaying a lot of information in a confined space.*

A [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]] consists of a customizable **canvas** and **scroll bars** with built‑in scrolling interactivity and different ways to customize how the scrolling works. [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]] is ideal for displaying a lot of information in a confined space and it works well with [[30 Official Roblox Docs/UI/List and flex layouts|list]] and [[30 Official Roblox Docs/UI/Grid and table layouts|grid]] layouts.

*(image in the full Top G Vault)*

## Canvas

The **canvas** is the primary area of a [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]] that can contain other [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]]. Scrolling behavior automatically adapts in the following scenarios:

| Frame Setup | Result |
| --- | --- |
| The frame's [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize\|CanvasSize]] is taller than its overall height; specifically the total [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize\|CanvasSize.Y]] exceeds the total [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size\|Size.Y]]. | Vertical scrolling is enabled and a vertical scroll bar appears. |
| The frame's [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize\|CanvasSize]] is wider than its overall width; specifically the total [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize\|CanvasSize.X]] exceeds the total [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size\|Size.X]]. | Horizontal scrolling is enabled and a horizontal scroll bar appears. |
| The frame's [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AutomaticCanvasSize\|AutomaticCanvasSize]] is set to [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize\|Y]] or [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize\|XY]] and the total height of its contents (child [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]]) exceed its total [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size\|Size.Y]]. | Vertical scrolling is enabled and a vertical scroll bar appears. |
| The frame's [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AutomaticCanvasSize\|AutomaticCanvasSize]] is set to [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize\|X]] or [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize\|XY]] and the total width of its contents (child [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]]) exceed its total [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size\|Size.X]]. | Horizontal scrolling is enabled and a horizontal scroll bar appears. |

The [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasPosition|CanvasPosition]] property reflects the **current** positional offset of the canvas within the frame, in pixels, and it sets the position of scroll bars accordingly. Note that this property doesn't do anything if scroll bars aren't visible.

## Insets

A scrolling frame's [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize|CanvasSize]] may be affected by the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#VerticalScrollBarInset|VerticalScrollBarInset]] and/or [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#HorizontalScrollBarInset|HorizontalScrollBarInset]] properties. In the following example diagram, a vertically scrolling frame uses a canvas width of 100%. With [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#VerticalScrollBarInset|VerticalScrollBarInset]] set to [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|None]] (default), the canvas extends to the full width of the scrolling frame, obscuring a slight amount of content under the scroll bar. In contrast, a [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#VerticalScrollBarInset|VerticalScrollBarInset]] setting of either [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|Always]] or [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset|ScrollBar]] insets the canvas by the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarThickness|ScrollBarThickness]] amount so that the canvas meets edge‑to‑edge with the scroll bar.

### None (Default)

*(image in the full Top G Vault)*

### Always / ScrollBar

*(image in the full Top G Vault)*

## Scroll bars

The frame's **scroll bars** reflect the current canvas position and provide automatic drag‑to‑scroll interactivity. For vertical scroll bars, the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#VerticalScrollBarPosition|VerticalScrollBarPosition]] property switches the bar's position to either the left or right of the canvas, but horizontal scroll bars can only be positioned below the canvas.

Scroll bar construction consists of three asset properties:

- [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImage|TopImage]] — Displays on the top of a vertical scroll bar, or the left of a horizontal scroll bar (rotated 90° counterclockwise for a horizontal scroll bar).
- [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#MidImage|MidImage]] — Spans the area between [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImage|TopImage]] and [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImage|BottomImage]] (rotated 90° counterclockwise for a horizontal scroll bar).
- [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImage|BottomImage]] — Displays on the bottom of a vertical scroll bar, or the right of a horizontal scroll bar (rotated 90° counterclockwise for a horizontal scroll bar).

*(image in the full Top G Vault)*

Each image scales based on the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarThickness|ScrollBarThickness]] property which changes the width of a vertical scroll bar or the height of a horizontal scroll bar.

Additional visual modifications can be made through the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarImageColor3|ScrollBarImageColor3]] and [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarImageTransparency|ScrollBarImageTransparency]] properties which tint the bar's image assets and modify its opacity, respectively.

## Clipping

By default, [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] containers **clip** their content (descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]]) through the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants|ClipsDescendants]] boolean. If you want descendants to appear outside of a container's bounds, simply set [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants|ClipsDescendants]] to `false`.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants|ClipsDescendants]] = `true`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants|ClipsDescendants]] = `false`*

Importantly, [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ClipsDescendantsSupportsRotation|StarterGui.ClipsDescendantsSupportsRotation]] must be `true` for clipping to work on **rotated** descendants (non‑zero [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]]) within the container. However, clipping **by** a rotated container (clipping container itself is rotated) or by rounded corners ([[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]]) is not supported. If you need clipping on rotated or rounded containers, consider [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup|CanvasGroup]].

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants|ClipsDescendants]] = `true`<br>[[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]] = `0`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants|ClipsDescendants]] = `true`<br>[[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]] = `10`*

## Elasticity

By default, [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrames]] exhibit elastic scrolling behavior on touch‑enabled devices, meaning that users can drag the canvas slightly further than its bounds and, upon release, the canvas will spring back to its minimum or maximum limit. If you want to remove the elastic behavior completely and ensure the canvas never scrolls past its limits, set the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ElasticBehavior|ElasticBehavior]] property to [[30 Official Roblox Docs/API Reference/Enums/ElasticBehavior|Never]].

---
*Source: [Scrolling frames](https://create.roblox.com/docs/ui/scrolling-frames) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
