---
title: "InputSink"
description: "Controls how a `GuiObject` or `GuiButton` absorbs pointer and activation input events relative to GUI elements beneath it."
api_type: enum
aliases: ["Enum.InputSink"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/InputSink"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] or [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] absorbs pointer and activation input events relative to GUI elements beneath it.*

## Description

Controls how a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] or [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] absorbs pointer and activation input events relative to GUI elements layered beneath it. Use this enum with the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputSink|GuiObject.InputSink]] property, which defaults to [[30 Official Roblox Docs/API Reference/Enums/InputSink|Enum.InputSink.None]] on [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] and [[30 Official Roblox Docs/API Reference/Enums/InputSink|Enum.InputSink.Activate]] on [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | The element does not sink any input events; pointer and activation events pass through to elements beneath it. |
| `Activate` | 1 | The element sinks activation input (button presses and taps) but allows hover, `MouseEnter`, and `MouseLeave` events to pass through to elements beneath it. |
| `All` | 100 | The element sinks all input events, preventing them from reaching any GUI element beneath it. |

---
*Source: [InputSink](https://create.roblox.com/docs/reference/engine/enums/InputSink) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
