---
title: "Pages"
description: "An abstract class for pages objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Pages"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract class for pages objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/AudioPages|AudioPages]], [[30 Official Roblox Docs/API Reference/Classes/BanHistoryPages|BanHistoryPages]], [[30 Official Roblox Docs/API Reference/Classes/CapturesPages|CapturesPages]], [[30 Official Roblox Docs/API Reference/Classes/CatalogPages|CatalogPages]], [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyPages|DataStoreKeyPages]], [[30 Official Roblox Docs/API Reference/Classes/DataStoreListingPages|DataStoreListingPages]], [[30 Official Roblox Docs/API Reference/Classes/DataStorePages|DataStorePages]], [[30 Official Roblox Docs/API Reference/Classes/DataStoreVersionPages|DataStoreVersionPages]], [[30 Official Roblox Docs/API Reference/Classes/FriendPages|FriendPages]], [[30 Official Roblox Docs/API Reference/Classes/InventoryPages|InventoryPages]], [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMapPages|MemoryStoreHashMapPages]], [[30 Official Roblox Docs/API Reference/Classes/OutfitPages|OutfitPages]], [[30 Official Roblox Docs/API Reference/Classes/RecommendationPages|RecommendationPages]], [[30 Official Roblox Docs/API Reference/Classes/StandardPages|StandardPages]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

An object which is essentially a table of pages, each of which is a sorted list of the key/value pairs.

*Code samples for this API (`pages-iterator`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Pages); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Pages#IsFinished\|IsFinished]] | boolean | Whether or not the current page is the last page available. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Pages#AdvanceToNextPageAsync\|AdvanceToNextPageAsync()]] | () | Iterates to the next page in the pages object, if possible. |
| [[30 Official Roblox Docs/API Reference/Classes/Pages#GetCurrentPage\|GetCurrentPage()]] | Array | Returns the items on the current page. The keys in the item are determined by the source of this object. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### IsFinished

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

Whether or not the current page is the last page available.

## Methods

### AdvanceToNextPageAsync

```lua
Pages:AdvanceToNextPageAsync(): ()
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Iterates to the next page in the pages object, if possible. The request limit is the same of the endpoint originally called.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetCurrentPage

```lua
Pages:GetCurrentPage(): Array
```

**Thread safety:** Unsafe

Returns the items on the current page. The keys in the item are determined by the source of this object.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of entries on the current page, where the keys in each entry are determined by the service that originally provided this Pages object. |

---
*Source: [Pages](https://create.roblox.com/docs/reference/engine/classes/Pages) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
