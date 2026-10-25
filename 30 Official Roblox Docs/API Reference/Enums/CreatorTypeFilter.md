---
title: "CreatorTypeFilter"
description: "Specifies which creator type to include when filtering catalog search results in `CatalogSearchParams`."
api_type: enum
aliases: ["Enum.CreatorTypeFilter"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CreatorTypeFilter"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies which creator type to include when filtering catalog search results in [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams|CatalogSearchParams]].*

## Description

Specifies which creator type to include when filtering catalog search results. Used with the [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CreatorType|CatalogSearchParams.CreatorType]] property to narrow results to items made by individual users, groups, or any creator. The default value of [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CreatorType|CatalogSearchParams.CreatorType]] is [[30 Official Roblox Docs/API Reference/Enums/CreatorTypeFilter|Enum.CreatorTypeFilter.All]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `User` | 0 | Limits catalog search results to items created by individual users. |
| `Group` | 1 | Limits catalog search results to items created by groups. |
| `All` | 2 | Includes items from all creator types; no filtering by creator is applied. |

---
*Source: [CreatorTypeFilter](https://create.roblox.com/docs/reference/engine/enums/CreatorTypeFilter) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
