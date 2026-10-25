---
title: "InitialDockState"
description: "Describes the initial docking state of a `DockWidgetPluginGui`."
api_type: enum
aliases: ["Enum.InitialDockState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/InitialDockState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the initial docking state of a [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGui]].*

## Description

Specifies where a [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGui]] is initially positioned in Roblox Studio when it is created for the first time. The value is supplied as the `initialDockState` field of [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]], which is passed to [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateDockWidgetPluginGuiAsync|Plugin:CreateDockWidgetPluginGuiAsync()]]. If Roblox Studio has a saved layout entry for the plugin widget, that saved layout takes precedence and this value is ignored; [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui#HostWidgetWasRestored|DockWidgetPluginGui.HostWidgetWasRestored]] is `true` in that case.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Top` | 0 | The widget will appear docked above the game screen. |
| `Bottom` | 1 | The widget will appear docked below the game screen. |
| `Left` | 2 | The widget will appear docked to the left of the game screen. |
| `Right` | 3 | The widget will appear docked to the right of the game screen. |
| `Float` | 4 | The widget will not be docked to any side of the game screen, and instead can be freely dragged around. |

---
*Source: [InitialDockState](https://create.roblox.com/docs/reference/engine/enums/InitialDockState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
