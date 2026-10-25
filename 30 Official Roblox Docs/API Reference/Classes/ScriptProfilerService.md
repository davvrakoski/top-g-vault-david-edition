---
title: "ScriptProfilerService"
description: "A service that captures sampling-based profiles of Luau script execution on the server or on a client."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ScriptProfilerService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that captures sampling-based profiles of Luau script execution on the server or on a client.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`ScriptProfilerService` provides a scripting interface to Roblox's Luau script profiler, which periodically samples running Luau threads to attribute CPU time to the functions that consume it.

Profiling is controlled independently for the server and for individual clients: [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ServerStart|ServerStart()]] and [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ServerStop|ServerStop()]] govern server-side scripts, while [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ClientStart|ClientStart()]] and [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ClientStop|ClientStop()]] govern a given player's client. Calling [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ServerRequestData|ServerRequestData()]] or [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ClientRequestData|ClientRequestData()]] collects a snapshot of the profiling results, which is delivered asynchronously through the [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#OnNewData|OnNewData]] event as a JSON string. That string can be turned into a structured Luau table with [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#DeserializeJSON|DeserializeJSON()]].

This service powers the Script Profiler in the in-experience Developer Console.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ClientRequestData\|ClientRequestData()]] | () | Requests the current script profiling data from the specified player's client. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ClientStart\|ClientStart()]] | () | Begins Luau script profiling for the specified player's client. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ClientStop\|ClientStop()]] | () | Stops Luau script profiling for the specified player's client. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#DeserializeJSON\|DeserializeJSON()]] | Dictionary | Parses a script-profiling JSON string into a structured Luau table. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ServerRequestData\|ServerRequestData()]] | () | Requests the current script profiling data from the server. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ServerStart\|ServerStart()]] | () | Begins Luau script profiling on the server. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ServerStop\|ServerStop()]] | () | Stops Luau script profiling on the server. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#OnNewData\|OnNewData]] | `player`, `jsonString` | Fires when a new profiling data snapshot becomes available after a data request. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### ClientRequestData

```lua
ScriptProfilerService:ClientRequestData(player: Player): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Requests a snapshot of the profiling data collected for the given player's client. The data is not returned directly; instead it is delivered asynchronously through the [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#OnNewData|OnNewData]] event as a JSON string.

When called on the server this replicates a data request to the target client, and when called on the client it gathers the local player's profiling data directly. On a client the `player` argument must be the local player.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose client should report its profiling data. When called on a client, this must be the local player. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ClientStart

```lua
ScriptProfilerService:ClientStart(player: Player, frequency: int?): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Begins profiling the Luau scripts running on the given player's client. The profiler periodically samples running Luau threads at `frequency` samples per second; if `frequency` is omitted it defaults to `1000`, and a value outside the range `[1, 10000]` raises an error.

When called on the server this replicates a request to the target client to start profiling, and when called on the client it starts sampling the local player's scripts directly. On a client the `player` argument must be the local player.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose client should start profiling. When called on a client, this must be the local player. |
| `frequency` | int? |  | Optional sampling frequency in samples per second. Defaults to `1000` and must be within the range `[1, 10000]`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ClientStop

```lua
ScriptProfilerService:ClientStop(player: Player): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Stops profiling the Luau scripts running on the given player's client.

When called on the server this replicates a request to the target client to stop profiling, and when called on the client it stops sampling the local player's scripts directly. On a client the `player` argument must be the local player.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose client should stop profiling. When called on a client, this must be the local player. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### DeserializeJSON

```lua
ScriptProfilerService:DeserializeJSON(jsonString: string?): Dictionary
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `CustomLuaState`

Converts the raw JSON produced by the profiler into a Luau table so the results can be inspected programmatically rather than parsed by hand. The returned table mirrors the profiling session, exposing entries such as its version, session start and end times, categories, call nodes, and function metadata.

An empty or non-object input yields no data.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `jsonString` | string? |  | The profiling data encoded as a JSON string, such as the value delivered by [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#OnNewData\|OnNewData]]. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary representing the parsed profiling data, including the session's categories, call nodes, and function metadata. |

### ServerRequestData

```lua
ScriptProfilerService:ServerRequestData(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Requests a snapshot of the profiling data collected on the server. The data is not returned directly; instead it is delivered asynchronously through the [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#OnNewData|OnNewData]] event as a JSON string, with no associated player.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ServerStart

```lua
ScriptProfilerService:ServerStart(frequency: int?): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Begins profiling the Luau scripts running on the server. The profiler periodically samples running Luau threads at `frequency` samples per second; if `frequency` is omitted it defaults to `1000`, and a value outside the range `[1, 10000]` raises an error.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `frequency` | int? |  | Optional sampling frequency in samples per second. Defaults to `1000` and must be within the range `[1, 10000]`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ServerStop

```lua
ScriptProfilerService:ServerStop(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Stops profiling the Luau scripts running on the server.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### OnNewData

```lua
ScriptProfilerService.OnNewData(player: Player, jsonString: string)
```

**Security:** PluginSecurity

Fires when a new profiling snapshot becomes available, in response to [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ClientRequestData|ClientRequestData()]] or [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#ServerRequestData|ServerRequestData()]]. The data is delivered as a JSON string in `jsonString`; pass it to [[30 Official Roblox Docs/API Reference/Classes/ScriptProfilerService#DeserializeJSON|DeserializeJSON()]] to obtain a structured table. `player` identifies the client the data came from, or is `nil` when the data was collected on the server.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose client produced the data, or `nil` for data collected on the server. |
| `jsonString` | string |  | The profiling data encoded as a JSON string. |

---
*Source: [ScriptProfilerService](https://create.roblox.com/docs/reference/engine/classes/ScriptProfilerService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
