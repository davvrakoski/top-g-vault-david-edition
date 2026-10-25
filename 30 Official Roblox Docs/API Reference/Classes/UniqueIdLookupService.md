---
title: "UniqueIdLookupService"
description: "Team Create service that maps `UniqueId` to and from RFC-4122 strings; not for experience scripts."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UniqueIdLookupService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Team Create service that maps [[30 Official Roblox Docs/API Reference/Classes/Instance#UniqueId|UniqueId]] to and from RFC-4122 strings; not for experience scripts.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

Not intended for experience scripts. Used by Team Create and Studio collaboration to map between an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]'s [[30 Official Roblox Docs/API Reference/Classes/Instance#UniqueId|UniqueId]] (a 128-bit identifier) and its canonical RFC-4122 string form, and to resolve the live instance from that string.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UniqueIdLookupService#GetOrCreateUniqueIdRemoteCommand\|GetOrCreateUniqueIdRemoteCommand()]] | string | Returns the RFC-4122 string form of the instance's [[30 Official Roblox Docs/API Reference/Classes/Instance#UniqueId\|UniqueId]], creating one if the instance does not already have it. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetOrCreateUniqueIdRemoteCommand

```lua
UniqueIdLookupService:GetOrCreateUniqueIdRemoteCommand(instance: Instance): string
```

**Thread safety:** Unsafe · **Capabilities:** Unknown

Returns the RFC-4122 string representation of the given [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]'s [[30 Official Roblox Docs/API Reference/Classes/Instance#UniqueId|UniqueId]]. If the instance does not yet have one, a [[30 Official Roblox Docs/API Reference/Classes/Instance#UniqueId|UniqueId]] is generated for it (and for any descendants that lack one) before the string is returned.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance whose [[30 Official Roblox Docs/API Reference/Classes/Instance#UniqueId\|UniqueId]] to read or create. |

**Returns**

| Type | Description |
| --- | --- |
| string | The instance's [[30 Official Roblox Docs/API Reference/Classes/Instance#UniqueId\|UniqueId]] as an RFC-4122 string. |

---
*Source: [UniqueIdLookupService](https://create.roblox.com/docs/reference/engine/classes/UniqueIdLookupService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
