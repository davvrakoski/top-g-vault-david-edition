---
title: "AvatarSettingsJumpMode"
description: "Determines whether the avatar jump setting for an experience is configured using jump height (studs) or jump power (force)."
api_type: enum
aliases: ["Enum.AvatarSettingsJumpMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsJumpMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether the avatar jump setting for an experience is configured using jump height (studs) or jump power (force).*

## Description

Determines whether the avatar jump setting for an experience is configured using jump height (in studs) or jump power (as an upward force). Maps to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UseJumpPower|Humanoid.UseJumpPower]]: [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsJumpMode|Enum.AvatarSettingsJumpMode.JumpHeight]] sets `UseJumpPower` to false so that [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpHeight|Humanoid.JumpHeight]] is used, while [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsJumpMode|Enum.AvatarSettingsJumpMode.JumpPower]] sets `UseJumpPower` to true so that [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpPower|Humanoid.JumpPower]] is used.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `JumpHeight` | 0 | The avatar jump is configured using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpHeight\|Humanoid.JumpHeight]], which specifies the target jump height in studs. Corresponds to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UseJumpPower\|Humanoid.UseJumpPower]] being false. |
| `JumpPower` | 1 | The avatar jump is configured using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpPower\|Humanoid.JumpPower]], which applies an upward force to the character. Corresponds to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UseJumpPower\|Humanoid.UseJumpPower]] being true. |

---
*Source: [AvatarSettingsJumpMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsJumpMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
