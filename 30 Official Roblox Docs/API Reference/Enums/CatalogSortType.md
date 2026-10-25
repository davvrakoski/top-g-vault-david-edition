---
title: "CatalogSortType"
description: "Specifies the sort order for catalog search results returned by `AvatarEditorService:SearchCatalogAsync()`."
api_type: enum
aliases: ["Enum.CatalogSortType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CatalogSortType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the sort order for catalog search results returned by [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService:SearchCatalogAsync()]].*

## Description

[[30 Official Roblox Docs/API Reference/Enums/CatalogSortType|Enum.CatalogSortType]] specifies how catalog search results are ordered when using [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService:SearchCatalogAsync()]]. Set this on a [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams|CatalogSearchParams]] object via its `SortType` property, which defaults to [[30 Official Roblox Docs/API Reference/Enums/CatalogSortType|Enum.CatalogSortType.Relevance]].

For [[30 Official Roblox Docs/API Reference/Enums/CatalogSortType|Enum.CatalogSortType.Bestselling]] and [[30 Official Roblox Docs/API Reference/Enums/CatalogSortType|Enum.CatalogSortType.MostFavorited]], the time window used to aggregate the sort metric is controlled by [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#SortAggregation|CatalogSearchParams.SortAggregation]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Relevance` | 1 | Sorts catalog results by relevance to the search keyword or other query parameters. |
| `PriceHighToLow` | 2 | Sorts catalog results from the highest price to the lowest price. |
| `PriceLowToHigh` | 3 | Sorts catalog results from the lowest price to the highest price. |
| `MostFavorited` | 5 | Sorts catalog results by the number of times items have been favorited, with most-favorited items listed first. |
| `RecentlyCreated` | 6 | Sorts catalog results by creation date, with the most recently created items listed first. |
| `Bestselling` | 7 | Sorts catalog results by total sales, with best-selling items listed first. |

---
*Source: [CatalogSortType](https://create.roblox.com/docs/reference/engine/enums/CatalogSortType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
