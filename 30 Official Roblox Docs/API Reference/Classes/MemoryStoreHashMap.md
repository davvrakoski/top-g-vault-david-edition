---
title: "MemoryStoreHashMap"
description: "Provides access to a hash map within `MemoryStoreService`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MemoryStoreHashMap"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides access to a hash map within [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreService|MemoryStoreService]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Provides access to a hash map within [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreService|MemoryStoreService]]. A hash map is a collection of items where string keys are associated with arbitrary values (up to the maximum allowed size -- see [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory store hash map|Memory Stores]]). The keys have no ordering guarantees.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#GetAsync\|GetAsync()]] | Variant | Retrieves the value of a key in the hash map. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#ListItemsAsync\|ListItemsAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMapPages\|MemoryStoreHashMapPages]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMapPages\|MemoryStoreHashMapPages]] object for enumerating through items in the hash map. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#RemoveAsync\|RemoveAsync()]] | () | Removes an item from the hash map. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#SetAsync\|SetAsync()]] | boolean | Sets the value of a key in the hash map. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#UpdateAsync\|UpdateAsync()]] | Variant | Retrieves the value of a key from a hash map and lets you update it to a new value. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetAsync

```lua
MemoryStoreHashMap:GetAsync(key: string): Variant
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Retrieves the value of a key in the hash map.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The key whose value you want to retrieve. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The value, or `nil` if the key doesn't exist. |

*Code samples for this member (`getting-data-hash-map-memory-store`) are published on the source page; their code is not part of the open-source repo.*

### ListItemsAsync

```lua
MemoryStoreHashMap:ListItemsAsync(count: int): MemoryStoreHashMapPages
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Returns a [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMapPages|MemoryStoreHashMapPages]] object for enumerating through items in the hash map. The valid range is 1 to 200 inclusive.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | int |  | Maximum possible number of items that can be returned. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMapPages\|MemoryStoreHashMapPages]] | A [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMapPages\|MemoryStoreHashMapPages]] instance that enumerates the items as [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMapPages\|MemoryStoreHashMapPages]] instances. |

*Code samples for this member (`listing-data-hash-map-memory-store`) are published on the source page; their code is not part of the open-source repo.*

### RemoveAsync

```lua
MemoryStoreHashMap:RemoveAsync(key: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Removes an item from the hash map.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The key to remove. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`removing-data-hash-map-memory-store`) are published on the source page; their code is not part of the open-source repo.*

### SetAsync

```lua
MemoryStoreHashMap:SetAsync(key: string, value: Variant, expiration: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Sets the value of a key in the hash map, overwriting any existing value.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The key whose value to set. |
| `value` | Variant |  | The value to set. |
| `expiration` | int64 |  | Item expiration in seconds, after which the item is automatically removed from the hash map. The maximum expiration time is 45 days (3,888,000 seconds). |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the key already had a value that was overwritten, or `false` if the key was newly created. |

*Code samples for this member (`adding-data-hash-map-memory-store`) are published on the source page; their code is not part of the open-source repo.*

### UpdateAsync

```lua
MemoryStoreHashMap:UpdateAsync(key: string, transformFunction: Function, expiration: int64): Variant
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Retrieves the value of a key from a hash map and lets you update it to a new value.

This method accepts a callback function that retrieves the existing key value and passes it to a transform function, which returns the new value for the item, with these exceptions:

- If the key does not exist, the old value passed to the function is `nil`.
- If the function returns `nil`, the update is canceled.

The new value is saved only if the key was not updated (for example, by a different game server) since the moment it was read. If the value changed in that time, the transform function is called again with the most recent item value. This cycle repeats until the value is saved successfully or the transform function returns `nil` to abort the operation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The key whose value you want to update. |
| `transformFunction` | Function |  | The transform function, which you provide. This function takes the old value as an input and returns the new value. |
| `expiration` | int64 |  | Item expiration in seconds, after which the item is automatically removed from the hash map. The maximum expiration time is 45 days (3,888,000 seconds). |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The last value returned by the transform function. |

*Code samples for this member (`updating-hash-map-memory-store`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [MemoryStoreHashMap](https://create.roblox.com/docs/reference/engine/classes/MemoryStoreHashMap) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
