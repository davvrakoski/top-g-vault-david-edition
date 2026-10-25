---
title: "ProximityPromptInputType"
description: "Identifies the input method a player is using when a `ProximityPrompt` is shown."
api_type: enum
aliases: ["Enum.ProximityPromptInputType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ProximityPromptInputType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies the input method a player is using when a [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] is shown.*

## Description

[[30 Official Roblox Docs/API Reference/Enums/ProximityPromptInputType|Enum.ProximityPromptInputType]] is passed to [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#PromptShown|ProximityPrompt.PromptShown]] and [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptShown|ProximityPromptService.PromptShown]] to indicate which input device the player is using. [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService|ProximityPromptService]] switches shown prompts when the active input type changes so button hints match the device (keyboard, gamepad, or touch).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Keyboard` | 0 | The player is using keyboard and mouse input. |
| `Gamepad` | 1 | The player is using a gamepad controller. |
| `Touch` | 2 | The player is using a touch screen. |

---
*Source: [ProximityPromptInputType](https://create.roblox.com/docs/reference/engine/enums/ProximityPromptInputType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
