---
title: "RotationType"
description: "Controls how a player character's body rotation is determined — relative to the camera direction or relative to the movement direction."
api_type: enum
aliases: ["Enum.RotationType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RotationType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how a player character's body rotation is determined — relative to the camera direction or relative to the movement direction.*

## Description

`RotationType` is used by [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#RotationType|UserGameSettings.RotationType]] to specify how the local player's character orients its body. With [[30 Official Roblox Docs/API Reference/Enums/RotationType|Enum.RotationType.MovementRelative]] (the default), the character turns to face whichever direction it is moving. With [[30 Official Roblox Docs/API Reference/Enums/RotationType|Enum.RotationType.CameraRelative]], the character's body continuously aligns with the camera's look direction, enabling first-person-style aiming where the character faces wherever the player is looking regardless of movement direction.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `MovementRelative` | 0 | The character's body rotation follows the direction of movement. |
| `CameraRelative` | 1 | The character's body rotation continuously follows the camera's look direction. |

---
*Source: [RotationType](https://create.roblox.com/docs/reference/engine/enums/RotationType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
