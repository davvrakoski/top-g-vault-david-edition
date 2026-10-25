---
title: "CatalogCategoryFilter"
description: "Filters Avatar Shop catalog search results by a predefined category such as Featured, Premium, or Recommended."
api_type: enum
aliases: ["Enum.CatalogCategoryFilter"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CatalogCategoryFilter"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Filters Avatar Shop catalog search results by a predefined category such as Featured, Premium, or Recommended.*

## Description

Used with [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CategoryFilter|CatalogSearchParams.CategoryFilter]] to narrow Avatar Shop catalog search results by category when calling [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService:SearchCatalogAsync()]]. Defaults to [[30 Official Roblox Docs/API Reference/Enums/CatalogCategoryFilter|Enum.CatalogCategoryFilter.None]], which applies no category filter and returns items from all categories.

To filter by collectible items (Limited and Limited Unique), use [[30 Official Roblox Docs/API Reference/Enums/SalesTypeFilter|Enum.SalesTypeFilter.Collectibles]] via [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#SalesTypeFilter|CatalogSearchParams.SalesTypeFilter]] instead of the deprecated [[30 Official Roblox Docs/API Reference/Enums/CatalogCategoryFilter|Enum.CatalogCategoryFilter.Collectibles]] value.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 1 | No category filter is applied; returns items from all categories. This is the default value of [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CategoryFilter\|CatalogSearchParams.CategoryFilter]]. |
| `Featured` | 2 | Returns only items editorially featured in the Avatar Shop catalog. |
| `Collectibles` | 3 | **Deprecated.** Deprecated. Previously filtered for collectible items; use [[30 Official Roblox Docs/API Reference/Enums/SalesTypeFilter\|Enum.SalesTypeFilter.Collectibles]] via [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#SalesTypeFilter\|CatalogSearchParams.SalesTypeFilter]] instead. |
| `CommunityCreations` | 4 | Returns only items created by community developers. |
| `Premium` | 5 | Returns only items available to Roblox Premium subscribers. |
| `Recommended` | 6 | Returns only items recommended by the catalog for the current user. |

---
*Source: [CatalogCategoryFilter](https://create.roblox.com/docs/reference/engine/enums/CatalogCategoryFilter) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
