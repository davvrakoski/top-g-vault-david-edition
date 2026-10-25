---
title: "MemoryStoreQueue"
description: "Provides access to a queue within MemoryStore."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MemoryStoreQueue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides access to a queue within MemoryStore.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Provides access to a queue within MemoryStore. A queue is a data structure that provides temporary storage for arbitrary items (up to the maximum item size -- see [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores#Limits and quotas|MemoryStore Limits]]). Each queue item has a numeric priority: MemoryStore retrieves items with higher priority from the queue first, and it retrieves Items with the same priority in order of addition.

Items in the queue can optionally be set to expire after a certain amount of time. Expired items simply disappear from the queue as if they were never added.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue#AddAsync\|AddAsync()]] | () | Adds an item to the queue. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue#GetSizeAsync\|GetSizeAsync()]] | int | Gets the size of the queue. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue#ReadAsync\|ReadAsync()]] | Tuple | Reads one or more items from the queue. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue#RemoveAsync\|RemoveAsync()]] | () | Removes an item or items previously read from the queue. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### AddAsync

```lua
MemoryStoreQueue:AddAsync(value: Variant, expiration: int64, priority: double = 0): ()
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Adds an item to the queue with the given priority and expiration. Items with a higher `priority` are retrieved from the queue before items with a lower priority, and items with the same priority are retrieved in the order they were added; `priority` defaults to 0. The `expiration` value, in seconds, sets how long the item remains in the queue before it is automatically removed. This method yields until the item has been added.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | Variant |  | The value of the item to add to the queue. |
| `expiration` | int64 |  | Item expiration time, in seconds, after which the item will be automatically removed from the queue. |
| `priority` | double | `0` | Item priority. Items with higher priority are retrieved from the queue before items with lower priority. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetSizeAsync

```lua
MemoryStoreQueue:GetSizeAsync(excludeInvisible: boolean = False): int
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Returns the number of items currently in the queue. By default the returned count includes invisible items -- items that have been read with [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue#ReadAsync|MemoryStoreQueue:ReadAsync()]] but not yet removed and whose invisibility timeout has not expired. Set the `excludeInvisible` parameter to `true` to omit these items from the count; it defaults to `false`. This method yields until the size is retrieved.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `excludeInvisible` | boolean | `False` | Determines whether to exclude invisible items from the size count. |

**Returns**

| Type | Description |
| --- | --- |
| int | The number of items currently in the queue. Items that have been read but not yet removed (invisible items) are included in the count unless `excludeInvisible` is `true`. |

### ReadAsync

```lua
MemoryStoreQueue:ReadAsync(count: int, allOrNothing: boolean = False, waitTimeout: double = -1): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Reads one or more items from the queue as a single atomic operation.

This method does not automatically delete the returned items from the queue but makes them invisible to other ReadAsync calls for the period of the invisibility timeout. The items must be explicitly removed from the queue with [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue#RemoveAsync|MemoryStoreQueue:RemoveAsync()]] before the invisibility timeout expires. The invisibility timeout defaults to 30 seconds unless a different value was provided in [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreService#GetQueue|MemoryStoreService:GetQueue()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | int |  | Number of items to read. The maximum allowed value of this parameter is 100. |
| `allOrNothing` | boolean | `False` | Controls the behavior of the method in the case the queue has fewer than `count` items: if set to false the method returns all available items; if set to true, it returns no items. The default value is false. |
| `waitTimeout` | double | `-1` | The duration, in seconds, for which the method will wait if the required number of items is not immediately available in the queue. Reads are attempted every two seconds during this period. This parameter can be set to zero to indicate no wait. If this parameter is not provided or set to -1, the method will wait indefinitely. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple of two elements. The first element is an array of item values read from the queue. The second element is a string identifier that should be passed to [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue#RemoveAsync\|MemoryStoreQueue:RemoveAsync()]] to permanently remove these items from the queue. |

*Code samples for this member (`using-a-memorystorequeue`) are published on the source page; their code is not part of the open-source repo.*

### RemoveAsync

```lua
MemoryStoreQueue:RemoveAsync(id: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Removes an item or items previously read from the queue. This method uses the identifier returned by [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue#ReadAsync|MemoryStoreQueue:ReadAsync()]] to identify the items to remove. If called after the invisibility timeout has expired, the call has no effect.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | string |  | Identifies the items to delete. Use the value returned by [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue#ReadAsync\|MemoryStoreQueue:ReadAsync()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`using-a-memorystorequeue`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [MemoryStoreQueue](https://create.roblox.com/docs/reference/engine/classes/MemoryStoreQueue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
