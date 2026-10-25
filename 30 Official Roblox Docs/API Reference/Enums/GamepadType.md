---
title: "GamepadType"
description: "Identifies the hardware type of a connected gamepad controller."
api_type: enum
aliases: ["Enum.GamepadType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/GamepadType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies the hardware type of a connected gamepad controller.*

## Description

Identifies the hardware type of a connected gamepad (for example PlayStation or Xbox). Detected when a gamepad connects. On console platforms the value is fixed to the platform's native controller type; elsewhere it reflects the most recently connected gamepad, defaulting to [[30 Official Roblox Docs/API Reference/Enums/GamepadType|Enum.GamepadType.Unknown]] when none has connected or the type cannot be determined.

Use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetImageForKeyCode|UserInputService:GetImageForKeyCode()]] to get an image representation of a KeyCode for a given gamepad.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | A gamepad whose hardware type could not be determined, or no gamepad has connected yet. |
| `PS4` | 1 | A Sony PlayStation 4 DualShock controller. |
| `PS5` | 2 | A Sony PlayStation 5 DualSense controller. |
| `XboxOne` | 3 | A Microsoft Xbox One controller. |

---
*Source: [GamepadType](https://create.roblox.com/docs/reference/engine/enums/GamepadType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
