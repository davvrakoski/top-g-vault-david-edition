---
title: "AgeCheckStatus"
description: "Indicates whether a player has completed age verification."
api_type: enum
aliases: ["Enum.AgeCheckStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AgeCheckStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates whether a player has completed age verification.*

## Description

Result of a player's age verification check. Used by [[30 Official Roblox Docs/API Reference/Classes/Player#AgeChecked|Player.AgeChecked]], which defaults to [[30 Official Roblox Docs/API Reference/Enums/AgeCheckStatus|Enum.AgeCheckStatus.Unchecked]] and transitions to [[30 Official Roblox Docs/API Reference/Enums/AgeCheckStatus|Enum.AgeCheckStatus.Checked]] when the player completes the age verification flow from [[30 Official Roblox Docs/API Reference/Classes/Player#PromptAgeCheck|Player:PromptAgeCheck()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unchecked` | 0 | The player has not yet completed age verification. |
| `Checked` | 1 | The player has successfully completed age verification. |

---
*Source: [AgeCheckStatus](https://create.roblox.com/docs/reference/engine/enums/AgeCheckStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
