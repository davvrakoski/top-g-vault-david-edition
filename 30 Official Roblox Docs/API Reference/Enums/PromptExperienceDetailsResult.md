---
title: "PromptExperienceDetailsResult"
description: "Indicates how the player dismissed the experience details prompt shown by `TeleportService:PromptExperienceDetailsAsync()`."
api_type: enum
aliases: ["Enum.PromptExperienceDetailsResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PromptExperienceDetailsResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates how the player dismissed the experience details prompt shown by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#PromptExperienceDetailsAsync|TeleportService:PromptExperienceDetailsAsync()]].*

## Description

Indicates how the player dismissed the experience details prompt displayed by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#PromptExperienceDetailsAsync|TeleportService:PromptExperienceDetailsAsync()]]. The returned value lets scripts distinguish between a player who closed the prompt without acting and a player who initiated a teleport to the advertised experience.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PromptClosed` | 0 | The player dismissed the experience details prompt without choosing to teleport (value `0`). |
| `TeleportAttempted` | 1 | The player clicked the **Join** button in the experience details prompt, initiating a teleport to the advertised experience (value `1`). |

---
*Source: [PromptExperienceDetailsResult](https://create.roblox.com/docs/reference/engine/enums/PromptExperienceDetailsResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
