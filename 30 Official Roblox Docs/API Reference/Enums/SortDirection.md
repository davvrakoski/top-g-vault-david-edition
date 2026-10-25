---
title: "SortDirection"
description: "Controls whether results are ordered from lowest to highest or from highest to lowest."
api_type: enum
aliases: ["Enum.SortDirection"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SortDirection"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether results are ordered from lowest to highest or from highest to lowest.*

## Description

Controls the ordering direction of results returned by APIs that support sorted retrieval, such as [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListVersionsAsync|DataStore:ListVersionsAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreSortedMap#GetRangeAsync|MemoryStoreSortedMap:GetRangeAsync()]]. Pass [[30 Official Roblox Docs/API Reference/Enums/SortDirection|Enum.SortDirection.Ascending]] to receive items ordered from lowest to highest (or oldest to newest), and [[30 Official Roblox Docs/API Reference/Enums/SortDirection|Enum.SortDirection.Descending]] to receive them from highest to lowest (or newest to oldest).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Ascending` | 0 | Orders results from lowest to highest value, or from oldest to newest entry. |
| `Descending` | 1 | Orders results from highest to lowest value, or from newest to oldest entry. |

---
*Source: [SortDirection](https://create.roblox.com/docs/reference/engine/enums/SortDirection) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
