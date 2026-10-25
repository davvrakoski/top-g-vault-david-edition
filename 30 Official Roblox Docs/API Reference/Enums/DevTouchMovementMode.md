---
title: "DevTouchMovementMode"
description: "Overrides the movement mode of players who are playing on touch-enabled devices."
api_type: enum
aliases: ["Enum.DevTouchMovementMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DevTouchMovementMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Overrides the movement mode of players who are playing on touch-enabled devices.*

## Description

Overrides the movement mode of players who are playing on touch-enabled devices.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `UserChoice` | 0 | Allows players to choose their desired control scheme from the in-experience menu. This is the default movement mode. |
| `Thumbstick` | 1 | **Deprecated.**  |
| `DPad` | 2 | **Deprecated.**  |
| `Thumbpad` | 3 | **Deprecated.**  |
| `ClickToMove` | 4 | The player's character will attempt to move to a location in the world when the player taps a location. |
| `Scriptable` | 5 | The player's character will not respond to default controls; any character movement must be defined in custom scripts. |
| `DynamicThumbstick` | 6 | The player's character is controlled with a virtual thumbstick that appears when they touch the lower portion of the screen. Jumping is controlled with a separate button. |

---
*Source: [DevTouchMovementMode](https://create.roblox.com/docs/reference/engine/enums/DevTouchMovementMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
