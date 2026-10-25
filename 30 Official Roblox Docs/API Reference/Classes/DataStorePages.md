---
title: "DataStorePages"
description: "A `Pages` object that allows iteration through `OrderedDataStore` key/value pairs."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStorePages"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] object that allows iteration through [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]] key/value pairs.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

A special type of [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] object whose pages contain key/value pairs from an [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]]. For this object, [[30 Official Roblox Docs/API Reference/Classes/Pages#GetCurrentPage|GetCurrentPage()]] returns an array of tables, each containing keys named **key** and **value**; these reflect the key/value pair data.

*Code samples for this API (`OrderedDataStore-Basics`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/DataStorePages); their code is not part of the open-source repo.*

---
*Source: [DataStorePages](https://create.roblox.com/docs/reference/engine/classes/DataStorePages) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
