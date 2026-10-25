---
title: "AnalyticsLogLevel"
description: "Specifies the severity level of an analytics log event passed to `AnalyticsService:FireLogEvent()`."
api_type: enum
aliases: ["Enum.AnalyticsLogLevel"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AnalyticsLogLevel"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the severity level of an analytics log event passed to [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#FireLogEvent|AnalyticsService:FireLogEvent()]].*

## Description

This enum is used as an argument in [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#FireLogEvent|AnalyticsService:FireLogEvent()]] to describe the error severity level.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Trace` | 0 | Trace is the noisiest level, rarely (if ever) enabled for a production app. |
| `Debug` | 1 | Used for debugging. |
| `Information` | 2 | Used for general informational messages that highlight progress or state changes during normal operation. |
| `Warning` | 3 | Used for warning. |
| `Error` | 4 | When functionality is unavailable or expectations broken. |
| `Fatal` | 5 | The most critical level, Fatal events demand immediate attention. |

---
*Source: [AnalyticsLogLevel](https://create.roblox.com/docs/reference/engine/enums/AnalyticsLogLevel) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
