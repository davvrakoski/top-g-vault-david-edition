---
title: "ActivePayerStatus"
description: "Describes a player's payer status bucket for the current experience."
api_type: enum
aliases: ["Enum.ActivePayerStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ActivePayerStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes a player's payer status bucket for the current experience.*

## Description

The `ActivePayerStatus` enum describes a player's payer status bucket for the current experience.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | Segment data is unavailable. |
| `Never` | 1 | The player has not made a qualifying purchase in the experience. |
| `Lapsed` | 2 | The player has previously spent in the experience but is not currently an active payer. |
| `Casual50Percent` | 3 | The player is in the casual payer bucket for the experience. |
| `Intermediate35Percent` | 4 | The player is in the intermediate payer bucket for the experience. |
| `Top15Percent` | 5 | The player is in the top payer bucket for the experience. |

---
*Source: [ActivePayerStatus](https://create.roblox.com/docs/reference/engine/enums/ActivePayerStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
