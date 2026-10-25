---
title: "AnalyticsProgressionType"
description: "Specifies the player's progression status in a level-progression event logged by `AnalyticsService:LogProgressionEvent()`."
api_type: enum
aliases: ["Enum.AnalyticsProgressionType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AnalyticsProgressionType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the player's progression status in a level-progression event logged by [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionEvent|AnalyticsService:LogProgressionEvent()]].*

## Description

Passed as the `status` argument to [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionEvent|AnalyticsService:LogProgressionEvent()]] to indicate whether a player is starting, completing, or failing a level attempt. The convenience methods [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionStartEvent|AnalyticsService:LogProgressionStartEvent()]], [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionCompleteEvent|AnalyticsService:LogProgressionCompleteEvent()]], and [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionFailEvent|AnalyticsService:LogProgressionFailEvent()]] set this value automatically; use [[30 Official Roblox Docs/API Reference/Enums/AnalyticsProgressionType|Custom]] for progression events that fall outside the standard lifecycle.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Custom` | 0 | A custom progression status for events outside the standard start/fail/complete lifecycle. |
| `Start` | 1 | The player started the level attempt. |
| `Fail` | 2 | The player failed the level attempt. |
| `Complete` | 3 | The player completed the level successfully. |

---
*Source: [AnalyticsProgressionType](https://create.roblox.com/docs/reference/engine/enums/AnalyticsProgressionType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
