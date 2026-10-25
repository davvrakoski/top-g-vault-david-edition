---
title: "ExperienceActivationStatus"
description: "Describes whether a player is new, active, lapsed, or reactivated in the current experience."
api_type: enum
aliases: ["Enum.ExperienceActivationStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ExperienceActivationStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes whether a player is new, active, lapsed, or reactivated in the current experience.*

## Description

The `ExperienceActivationStatus` enum describes a player's activity status in the current experience, based on the last 30 days.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | Segment data is unavailable. |
| `New` | 1 | The player first played the experience within the last 30 days. |
| `Active` | 2 | The player played the experience in the last 30 days and is not `New` or `Reactivated`. |
| `Lapsed` | 3 | The player has not played the experience in the last 30 days. |
| `Reactivated` | 4 | The player returned to the experience within the last 30 days after being `Lapsed`. |

---
*Source: [ExperienceActivationStatus](https://create.roblox.com/docs/reference/engine/enums/ExperienceActivationStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
