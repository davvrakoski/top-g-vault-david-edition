---
title: "CatalogSortAggregation"
description: "Specifies the time window over which catalog items are aggregated when sorting `CatalogSearchParams` results."
api_type: enum
aliases: ["Enum.CatalogSortAggregation"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CatalogSortAggregation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the time window over which catalog items are aggregated when sorting [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams|CatalogSearchParams]] results.*

## Description

Specifies the time window used to aggregate catalog item data when sorting search results via [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#SortAggregation|CatalogSearchParams.SortAggregation]]. The selected period determines which sales, popularity, or relevance signals are counted toward the sort order. [[30 Official Roblox Docs/API Reference/Enums/CatalogSortAggregation|Enum.CatalogSortAggregation.AllTime]] is the default.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Past12Hours` | 1 | Aggregates catalog data from the past 12 hours when sorting search results. |
| `PastDay` | 2 | Aggregates catalog data from the past day when sorting search results. |
| `Past3Days` | 3 | Aggregates catalog data from the past 3 days when sorting search results. |
| `PastWeek` | 4 | Aggregates catalog data from the past week when sorting search results. |
| `PastMonth` | 5 | Aggregates catalog data from the past month when sorting search results. |
| `AllTime` | 6 | Aggregates catalog data across all time when sorting search results. |

---
*Source: [CatalogSortAggregation](https://create.roblox.com/docs/reference/engine/enums/CatalogSortAggregation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
