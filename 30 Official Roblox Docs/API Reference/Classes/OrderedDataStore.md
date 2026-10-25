---
title: "OrderedDataStore"
description: "A GlobalDataStore that also allows for ordered data store entries."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/OrderedDataStore"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A GlobalDataStore that also allows for ordered data store entries.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

A **OrderedDataStore** is essentially a [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]] with the exception that stored values must be **integers**. It exposes a method [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore#GetSortedAsync|GetSortedAsync()]] which allows inspection of the entries in sorted order using a [[30 Official Roblox Docs/API Reference/Classes/DataStorePages|DataStorePages]] object.

Ordered data stores do not support versioning and metadata, so [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] is always `nil` for keys in an [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]]. If you need versioning and metadata support, use a [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStore]].

Ordered data stores do not support the optional `userIds` parameter for [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|IncrementAsync()]].

See [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data stores]] for an overview on how to use ordered data stores.

*Code samples for this API (`OrderedDataStore-Basics`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/OrderedDataStore); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore#GetSortedAsync\|GetSortedAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/DataStorePages\|DataStorePages]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/DataStorePages\|DataStorePages]] object. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetSortedAsync

```lua
OrderedDataStore:GetSortedAsync(ascending: boolean, pagesize: int, minValue: Variant, maxValue: Variant): DataStorePages
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Returns a [[30 Official Roblox Docs/API Reference/Classes/DataStorePages|DataStorePages]] object. The sort order is determined by **ascending**, the length of each page by **pageSize**, and **minValue**/**maxValue** are optional parameters which filter the results.

See [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store error codes and limits|Error codes and limits]] for request limits and descriptions of the error codes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ascending` | boolean |  | A boolean indicating whether the returned data pages are in ascending order. |
| `pagesize` | int |  | The length of each page. By default is 50. The max allowed value is 100. |
| `minValue` | Variant |  | Optional parameter. If set, data pages with a value less than **minValue** will be excluded. |
| `maxValue` | Variant |  | Optional parameter. If set, data pages with a value greater than **maxValue** will be excluded. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStorePages\|DataStorePages]] | A sorted [[30 Official Roblox Docs/API Reference/Classes/DataStorePages\|DataStorePages]] object based on the provided arguments. |

---
*Source: [OrderedDataStore](https://create.roblox.com/docs/reference/engine/classes/OrderedDataStore) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
