---
title: "HeapProfilerService"
description: "Generates and retrieves Luau heap memory profiles from the client and server Luau virtual machines for memory debugging."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HeapProfilerService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Generates and retrieves Luau heap memory profiles from the client and server Luau virtual machines for memory debugging.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`HeapProfilerService` captures snapshots of the Luau heap so that memory-profiling tools can analyze script memory usage. Requesting a profile runs a full garbage-collection cycle and then walks the heap of the target Luau virtual machine, producing a JSON report that breaks memory down by value type, memory category, and userdata class, together with an aggregated ownership graph and a list of unique and unparented instance references.

Profiles can be requested for either the server or a specific client. [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#ServerRequestDataAsync|HeapProfilerService:ServerRequestDataAsync()]] returns the server's profile and [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#ClientRequestDataAsync|HeapProfilerService:ClientRequestDataAsync()]] returns a given player's client profile. When the profiled machine differs from the caller, the data is generated remotely, compressed, and replicated back through the [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#OnNewData|HeapProfilerService.OnNewData]] event before the yielding call resolves.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#ClientRequestDataAsync\|ClientRequestDataAsync()]] | string | Yields until the Luau heap profile of the specified player's client is available, then returns it as a JSON string. |
| [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#ServerRequestDataAsync\|ServerRequestDataAsync()]] | string | Yields until the server's Luau heap profile is available, then returns it as a JSON string. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#OnNewData\|OnNewData]] | `player`, `jsonString`, `id`, `compressedLength`, `uncompressedLength` | Fires on the requesting machine with the compressed Luau heap profile produced for an earlier request. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### ClientRequestDataAsync

```lua
HeapProfilerService:ClientRequestDataAsync(player: Player): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Requests a Luau heap profile from the client belonging to `player`. When called on that client itself, the profile is generated locally and returned immediately. When called from the server, a request is sent to the client and this function yields until the compressed profile is replicated back through [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#OnNewData|HeapProfilerService.OnNewData]], decompressed, and returned. If the client does not respond within 10 seconds, the request fails.

The returned string is JSON containing a `Report` section (heap memory broken down by value type, memory category, and userdata class, plus an aggregated size graph) and a `Refs` section (unique and unparented instance references).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose client Luau heap should be profiled. |

**Returns**

| Type | Description |
| --- | --- |
| string | A JSON-encoded string containing the client's Luau heap profile. |

### ServerRequestDataAsync

```lua
HeapProfilerService:ServerRequestDataAsync(): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Requests a Luau heap profile from the server. When called on the server, the profile is generated locally and returned immediately. When called from a client, a request is sent to the server and this function yields until the compressed profile is replicated back through [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#OnNewData|HeapProfilerService.OnNewData]], decompressed, and returned. If the server does not respond within 10 seconds, the request fails.

The returned string has the same JSON structure as [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#ClientRequestDataAsync|HeapProfilerService:ClientRequestDataAsync()]].

**Returns**

| Type | Description |
| --- | --- |
| string | A JSON-encoded string containing the server's Luau heap profile. |

## Events

### OnNewData

```lua
HeapProfilerService.OnNewData(player: Player, jsonString: buffer, id: int, compressedLength: int, uncompressedLength: int)
```

**Security:** PluginSecurity

Delivers a Luau heap profile that was generated on a remote machine in response to a [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#ClientRequestDataAsync|HeapProfilerService:ClientRequestDataAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/HeapProfilerService#ServerRequestDataAsync|HeapProfilerService:ServerRequestDataAsync()]] call. The profile JSON is zstd-compressed and carried in `jsonString`; the receiving service decompresses it, matches it to the pending request by `id`, and resolves the yielding call. The `compressedLength` and `uncompressedLength` arguments report the buffer's size before and after decompression.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] the profile is being delivered to, or `nil` when the data is replicated to the server. |
| `jsonString` | buffer |  | A buffer holding the zstd-compressed JSON heap profile. |
| `id` | int |  | The identifier of the request this data corresponds to. |
| `compressedLength` | int |  | The size, in bytes, of the compressed profile buffer. |
| `uncompressedLength` | int |  | The size, in bytes, of the heap profile JSON after decompression. |

---
*Source: [HeapProfilerService](https://create.roblox.com/docs/reference/engine/classes/HeapProfilerService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
