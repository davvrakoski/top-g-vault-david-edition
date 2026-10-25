---
title: "ModifierKey"
description: "Identifies a keyboard modifier key for use with `InputObject:IsModifierKeyDown()`."
api_type: enum
aliases: ["Enum.ModifierKey"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ModifierKey"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies a keyboard modifier key for use with [[30 Official Roblox Docs/API Reference/Classes/InputObject#IsModifierKeyDown|InputObject:IsModifierKeyDown()]].*

## Description

Identifies keyboard modifier keys. Pass a value to [[30 Official Roblox Docs/API Reference/Classes/InputObject#IsModifierKeyDown|InputObject:IsModifierKeyDown()]] to test whether that modifier is held during an input event. Left and right physical variants map to the same value (for example, both Shift keys report as [[30 Official Roblox Docs/API Reference/Enums/ModifierKey|Enum.ModifierKey.Shift]]).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Shift` | 0 | The Shift key (left or right Shift key). |
| `Ctrl` | 1 | The Control key (left or right Ctrl key). |
| `Alt` | 2 | The Alt key (left or right Alt/Option key). |
| `Meta` | 3 | The Meta key (the Windows key on Windows, or the Command key on macOS). |

---
*Source: [ModifierKey](https://create.roblox.com/docs/reference/engine/enums/ModifierKey) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
