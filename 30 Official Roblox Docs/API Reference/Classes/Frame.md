---
title: "Frame"
description: "A `GuiObject` that renders as a plain rectangle, generally used as a container."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Frame"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that renders as a plain rectangle, generally used as a container.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

[[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] is a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that acts as a container for other [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]]. You can use it for UI that either displays on a user's [[30 Official Roblox Docs/UI/On-screen UI containers|screen]] or on a [[30 Official Roblox Docs/UI/In-game UI containers|surface]] within the experience.

*(image in the full Top G Vault)*

[[30 Official Roblox Docs/API Reference/Classes/Frame|Frames]] are ideal containers for responsive layouts such as [[30 Official Roblox Docs/UI/List and flex layouts|list and flex layouts]], allowing you to change the size of the frame and dynamically adjust how layout items fit within it. [[30 Official Roblox Docs/API Reference/Classes/Frame|Frames]] are also core [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]], so you can customize properties such as [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Transparency|Transparency]], apply a [[30 Official Roblox Docs/UI/UI appearance modifiers#Gradient|background gradient]] or [[30 Official Roblox Docs/UI/UI appearance modifiers#Stroke|border]], and more.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Frame#Style\|Style]] | [[30 Official Roblox Docs/API Reference/Enums/FrameStyle\|FrameStyle]] | Sets what the frame looks like from a selection of pre-determined styles. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Style

**Type:** [[30 Official Roblox Docs/API Reference/Enums/FrameStyle|FrameStyle]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets what the frame looks like from a selection of pre-determined styles. See [[30 Official Roblox Docs/API Reference/Enums/FrameStyle|Enum.FrameStyle]] for a description of each style.

---
*Source: [Frame](https://create.roblox.com/docs/reference/engine/classes/Frame) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
