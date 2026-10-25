---
title: "KeyCodeStringFormat"
description: "Determines the string format returned by `UserInputService:GetStringForKeyCode()`."
api_type: enum
aliases: ["Enum.KeyCodeStringFormat"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/KeyCodeStringFormat"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the string format returned by [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetStringForKeyCode|UserInputService:GetStringForKeyCode()]].*

## Description

This enum is used with [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetStringForKeyCode|UserInputService:GetStringForKeyCode()]] to control how the returned key string is formatted. The `Abbreviated` option provides shortened labels suitable for compact UI elements such as keybind hints, tooltips, or on-screen button prompts where space is limited.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Default behavior which returns the full key string, for example `"LeftControl"`, `"Backspace"`, or `"Escape"`. |
| `Abbreviated` | 1 | Returns a shortened key string when available, for example `"LCtrl"`, `"Bksp"`, or `"Esc"`. |

---
*Source: [KeyCodeStringFormat](https://create.roblox.com/docs/reference/engine/enums/KeyCodeStringFormat) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
