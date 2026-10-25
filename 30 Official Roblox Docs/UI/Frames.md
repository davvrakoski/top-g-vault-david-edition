---
title: "Frames"
description: "Frames are basic containers for UI objects."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/frames"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Frames are basic containers for UI objects.*

Basic [[30 Official Roblox Docs/API Reference/Classes/Frame|Frames]] act as containers for other [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] such as [[30 Official Roblox Docs/UI/Text & image labels|labels]] and [[30 Official Roblox Docs/UI/Text & image buttons|buttons]]. You can apply frames to display on a user's [[30 Official Roblox Docs/UI/On-screen UI containers|screen]] or on a [[30 Official Roblox Docs/UI/In-game UI containers|surface]] within the game.

*(image in the full Top G Vault)*

Frames are ideal containers for responsive layouts such as [[30 Official Roblox Docs/UI/List and flex layouts|list and flex layouts]], allowing you to change the size of the frame and dynamically adjust how layout items fit within it. [[30 Official Roblox Docs/API Reference/Classes/Frame|Frames]] are also core [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]], so you can customize properties such as [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Transparency|Transparency]], apply a [[30 Official Roblox Docs/UI/UI appearance modifiers#Gradient|background gradient]] or [[30 Official Roblox Docs/UI/UI appearance modifiers#Stroke|border]], and more.

Aside from their common use as containers, you can also use [[30 Official Roblox Docs/API Reference/Classes/Frame|Frames]] for UI design. For example, as a visual separator between other UI elements, you can scale a frame to be thin and long until it becomes a line.

> [!success]
> See also [[30 Official Roblox Docs/UI/Scrolling frames|scrolling frames]], [[30 Official Roblox Docs/UI/Viewport frames|viewport frames]], and [[30 Official Roblox Docs/UI/Video frames|video frames]] as specialty frame types with unique built‑in capabilities.

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

## Automatic sizing

Frames can be set to [[30 Official Roblox Docs/UI/Size modifiers and constraints#Automatic sizing|automatically size]] depending on their content. To achieve this, set the frame's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] to the **minimum** width and/or height, then set its [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] property to either [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|X]], [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|Y]], or [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|XY]] depending on which axes automatic sizing should apply to. Once set, the frame will automatically resize based on the size of [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] and layouts within it.

---
*Source: [Frames](https://create.roblox.com/docs/ui/frames) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
