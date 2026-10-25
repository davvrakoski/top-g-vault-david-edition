---
title: "GuiState"
description: "Describes the current interaction state of a `GuiObject`."
api_type: enum
aliases: ["Enum.GuiState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/GuiState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the current interaction state of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].*

## Description

Describes the current input state of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], as reported by its read-only [[30 Official Roblox Docs/API Reference/Classes/GuiObject#GuiState|GuiObject.GuiState]] property. The engine sets this value automatically based on user input; it cannot be set from scripts. The value defaults to [[30 Official Roblox Docs/API Reference/Enums/GuiState|Enum.GuiState.Idle]] when the object is not being interacted with.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Idle` | 0 | The GuiObject is idle — neither hovered nor pressed. |
| `Hover` | 1 | The GUI is being hovered over by the user. |
| `Press` | 2 | The GUI is being pressed/held down by the user. |
| `NonInteractable` | 3 | The GUI cannot be interacted with and therefore has no states. |

---
*Source: [GuiState](https://create.roblox.com/docs/reference/engine/enums/GuiState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
