---
title: "MemoryStoreService"
description: "Exposes methods to access specific primitives within MemoryStore."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MemoryStoreService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Exposes methods to access specific primitives within MemoryStore.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Service`

## Description

A top-level singleton class which exposes methods to access specific primitives within the MemoryStoreService. Use it for any data that rapidly changes that other servers can restore, such as global leaderboards, matchmaking queues, and auction houses.

For a more in-depth look, see [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores|Memory Stores]]. For the limits and quotas of the service, see [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores#Limits and quotas|Limits and Quotas]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreService#GetHashMap\|GetHashMap()]] | [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap\|MemoryStoreHashMap]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap\|MemoryStoreHashMap]] instance for the provided name. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreService#GetQueue\|GetQueue()]] | [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue\|MemoryStoreQueue]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue\|MemoryStoreQueue]] instance for the provided name. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreService#GetSortedMap\|GetSortedMap()]] | [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreSortedMap\|MemoryStoreSortedMap]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreSortedMap\|MemoryStoreSortedMap]] instance for the provided name. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetHashMap

```lua
MemoryStoreService:GetHashMap(name: string): MemoryStoreHashMap
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

Returns a [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap|MemoryStoreHashMap]] instance for the provided name. The name is global within the game, so any place that uses the same name accesses the same hash map.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the hash map. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap\|MemoryStoreHashMap]] | A [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap\|MemoryStoreHashMap]] instance for the provided name. |

### GetQueue

```lua
MemoryStoreService:GetQueue(name: string, invisibilityTimeout: int = 30): MemoryStoreQueue
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

Returns a [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue|MemoryStoreQueue]] instance for the provided name. The name is global within the game, thus any place that uses the same name accesses the same queue.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Name of the queue. |
| `invisibilityTimeout` | int | `30` | **(Optional)** Invisibility timeout, in seconds, for read operations through this queue instance. If not provided, defaults to 30 seconds. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue\|MemoryStoreQueue]] | A [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue\|MemoryStoreQueue]] instance for the provided name. |

### GetSortedMap

```lua
MemoryStoreService:GetSortedMap(name: string): MemoryStoreSortedMap
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

Returns a [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreSortedMap|MemoryStoreSortedMap]] instance for the provided name. The name is global within the game, so any place that uses the same name accesses the same sorted map.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Name of the sorted map. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreSortedMap\|MemoryStoreSortedMap]] | A [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreSortedMap\|MemoryStoreSortedMap]] instance for the provided name. |

---
*Source: [MemoryStoreService](https://create.roblox.com/docs/reference/engine/classes/MemoryStoreService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
