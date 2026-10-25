---
title: "DataStoreIncrementOptions"
description: "Specifies additional parameters for a `GlobalDataStore:IncrementAsync()` call."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStoreIncrementOptions"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Specifies additional parameters for a [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|GlobalDataStore:IncrementAsync()]] call.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotReplicated`

## Description

An object that specifies additional parameters for a [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|GlobalDataStore:IncrementAsync()]] call.

See also:

- [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data Stores]], an in-depth guide on data structure, management, error handling, etc.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreIncrementOptions#GetMetadata\|GetMetadata()]] | Dictionary | Gets the custom metadata set with this [[30 Official Roblox Docs/API Reference/Classes/DataStoreIncrementOptions\|DataStoreIncrementOptions]] instance. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreIncrementOptions#SetMetadata\|SetMetadata()]] | () | Sets custom metadata to be associated with the key. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetMetadata

```lua
DataStoreIncrementOptions:GetMetadata(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

This function gets custom metadata associated with this [[30 Official Roblox Docs/API Reference/Classes/DataStoreIncrementOptions|DataStoreIncrementOptions]] instance.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | Metadata associated with this [[30 Official Roblox Docs/API Reference/Classes/DataStoreIncrementOptions\|DataStoreIncrementOptions]] instance. |

### SetMetadata

```lua
DataStoreIncrementOptions:SetMetadata(attributes: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

This function sets custom metadata used by [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|GlobalDataStore:IncrementAsync()]] to associate metadata with a key. Metadata should be in key-value pair form.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `attributes` | Dictionary |  | Metadata values to set for the key. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [DataStoreIncrementOptions](https://create.roblox.com/docs/reference/engine/classes/DataStoreIncrementOptions) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
