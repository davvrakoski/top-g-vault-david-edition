---
title: "CatalogSearchParams"
description: "Stores parameters used in catalog searches via `AvatarEditorService:SearchCatalogAsync()`."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/CatalogSearchParams"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Stores parameters used in catalog searches via [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService:SearchCatalogAsync()]].*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams|CatalogSearchParams]] data type stores the parameters of a catalog search via [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService:SearchCatalogAsync()]].

When accessing the value of the [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#BundleTypes|CatalogSearchParams.BundleTypes]] or [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#AssetTypes|CatalogSearchParams.AssetTypes]] property the returned table will be read-only to avoid confusion when not directly accessing the [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams|CatalogSearchParams]] instance.

For example, you can use these properties as follows:

```lua
local params = CatalogSearchParams.new()
params.SearchKeyword = "Test"
params.MinPrice = 5000
params.MaxPrice = 10000
params.BundleTypes = {Enum.BundleType.Animations, Enum.BundleType.BodyParts}

local types = params.BundleTypes
for _, val in types do
  print(val)
end
-- table.insert(types, Enum.BundleType.Animations) -- This would not work because the table is read only
```

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#SearchKeyword\|SearchKeyword]] | string | The keyword to search for catalog results with. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#MinPrice\|MinPrice]] | number | The minimum item price to search for. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#MaxPrice\|MaxPrice]] | number | The maximum item price to search for. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#SortType\|SortType]] | [[30 Official Roblox Docs/API Reference/Enums/CatalogSortType\|CatalogSortType]] | The order in which to sort the results. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#SortAggregation\|SortAggregation]] | [[30 Official Roblox Docs/API Reference/Enums/CatalogSortAggregation\|Enum.CatalogSortAggregation]] | The time period to use to aggregate the sort results. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CategoryFilter\|CategoryFilter]] | [[30 Official Roblox Docs/API Reference/Enums/CatalogCategoryFilter\|CatalogCategoryFilter]] | The category to filter the search by. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#SalesTypeFilter\|SalesTypeFilter]] | [[30 Official Roblox Docs/API Reference/Enums/SalesTypeFilter\|Enum.SalesTypeFilter]] | The sales type filter the search by. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#BundleTypes\|BundleTypes]] | Array<[[30 Official Roblox Docs/API Reference/Enums/BundleType\|BundleType]]> | An array containing [[30 Official Roblox Docs/API Reference/Enums/BundleType\|Enum.BundleType]] values to filter the search by. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#AssetTypes\|AssetTypes]] | Array<[[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|AvatarAssetType]]> | An array containing [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]] values to filter the search by. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#IncludeOffSale\|IncludeOffSale]] | bool | Whether off sale items should be included in the results. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CreatorName\|CreatorName]] | string | Search for items with the given creator name. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CreatorType\|CreatorType]] | [[30 Official Roblox Docs/API Reference/Enums/CreatorTypeFilter\|Enum.CreatorTypeFilter]] | Search for items created by the given creator type. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CreatorId\|CreatorId]] | number | Search for items created by the given creator ID. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#Limit\|Limit]] | number | Specifies the number of items to return. Accepts `10`, `28`, `30`, `60`, and `120`. Defaults to `30`. |

## Properties

### SearchKeyword

**Type:** string

The keyword to search for catalog results with.

### MinPrice

**Type:** number

The minimum item price to search for.

### MaxPrice

**Type:** number

The maximum item price to search for.

### SortType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CatalogSortType|CatalogSortType]]

The order in which to sort the results, represented by a [[30 Official Roblox Docs/API Reference/Enums/CatalogSortType|Enum.CatalogSortType]].

### SortAggregation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CatalogSortAggregation|Enum.CatalogSortAggregation]]

The time period to use to aggregate the sort results by, represented by a [[30 Official Roblox Docs/API Reference/Enums/CatalogSortAggregation|Enum.CatalogSortAggregation]]. This only applies when the sort type is [[30 Official Roblox Docs/API Reference/Enums/CatalogSortType|Enum.CatalogSortType.MostFavorited]] or [[30 Official Roblox Docs/API Reference/Enums/CatalogSortType|Enum.CatalogSortType.BestSelling]]. It does not apply for other sort types.

### CategoryFilter

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CatalogCategoryFilter|CatalogCategoryFilter]]

The category to filter the search by, represented by a [[30 Official Roblox Docs/API Reference/Enums/CatalogCategoryFilter|Enum.CatalogCategoryFilter]].

### SalesTypeFilter

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SalesTypeFilter|Enum.SalesTypeFilter]]

The sales type to filter the search by, represented by a [[30 Official Roblox Docs/API Reference/Enums/SalesTypeFilter|Enum.SalesTypeFilter]]. Use [[30 Official Roblox Docs/API Reference/Enums/SalesTypeFilter|Enum.SalesTypeFilter.TimedOptions]] to return only items that have timed options available.

### BundleTypes

**Type:** Array<[[30 Official Roblox Docs/API Reference/Enums/BundleType|BundleType]]>

An array containing [[30 Official Roblox Docs/API Reference/Enums/BundleType|Enum.BundleType]] values to filter the search by.

### AssetTypes

**Type:** Array<[[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|AvatarAssetType]]>

An array containing [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|Enum.AvatarAssetType]] values to filter the search by.

### IncludeOffSale

**Type:** bool

Whether off sale items should be included in the results.

### CreatorName

**Type:** string

Search for items with the given creator name. Specify whether to search users, groups, or both with [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CreatorType|CatalogSearchParams.CreatorType]].

### CreatorType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CreatorTypeFilter|Enum.CreatorTypeFilter]]

Search for items created by the given creator type. When unspecified, it defaults to returning creations from both [[30 Official Roblox Docs/API Reference/Enums/CreatorTypeFilter|Enum.CreatorTypeFilter.User]] and [[30 Official Roblox Docs/API Reference/Enums/CreatorTypeFilter|Enum.CreatorTypeFilter.Group]]. Searching by [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CreatorId|CatalogSearchParams.CreatorId]] with [[30 Official Roblox Docs/API Reference/Enums/CreatorTypeFilter|Enum.CreatorTypeFilter.All]] results in a HTTP 400 Bad Request error.

### CreatorId

**Type:** number

Search for items created by the single creator ID. Specify user or group with [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams#CreatorType|CatalogSearchParams.CreatorType]]. Searching by creator ID **and** creator name is not supported; specify one, not both.

### Limit

**Type:** number

Specifies the number of items to return. Accepts `10`, `28`, `30`, `60`, and `120`. Defaults to `30`.

---
*Source: [CatalogSearchParams](https://create.roblox.com/docs/reference/engine/datatypes/CatalogSearchParams) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
