---
title: "MemStorageConnection"
description: "Represents a live binding created by `Bind()` on `MemStorageService` that runs a callback whenever a memory-storage key changes."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MemStorageConnection"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a live binding created by `Bind()` on [MemStorageService](https://create.roblox.com/docs/reference/engine/classes/MemStorageService) that runs a callback whenever a memory-storage key changes.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

A `MemStorageConnection` is the object returned by the `Bind()` and `BindAndFire()` methods of [MemStorageService](https://create.roblox.com/docs/reference/engine/classes/MemStorageService). It wraps the underlying subscription to a memory-storage key: while the connection is retained, the callback supplied at bind time is invoked on each update to that key. The connection is parented to the [MemStorageService](https://create.roblox.com/docs/reference/engine/classes/MemStorageService) that created it. Calling [[30 Official Roblox Docs/API Reference/Classes/MemStorageConnection#Disconnect|MemStorageConnection:Disconnect()]], or allowing the object to be destroyed, detaches it and stops any further callbacks.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MemStorageConnection#Disconnect\|Disconnect()]] | () | Ends the binding so its callback no longer runs when the associated memory-storage key changes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### Disconnect

```lua
MemStorageConnection:Disconnect(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Detaches the connection from its parent [MemStorageService](https://create.roblox.com/docs/reference/engine/classes/MemStorageService) and disconnects the underlying subscription, so the callback supplied when the connection was created is no longer invoked when the key is updated. This is also called automatically when the [[30 Official Roblox Docs/API Reference/Classes/MemStorageConnection|MemStorageConnection]] is destroyed. Once disconnected, a connection cannot be re-established; bind again to resume receiving updates.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [MemStorageConnection](https://create.roblox.com/docs/reference/engine/classes/MemStorageConnection) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
