---
title: "Stats"
description: "Performance metrics for a game."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Stats"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Performance metrics for a game.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

[[30 Official Roblox Docs/API Reference/Classes/Stats|Stats]] is a service that provides real-time performance information about the current running game instance. Its primary purpose is to provide an end point to measure where resources are being consumed, as well as how much memory is being consumed overall.

The service also stores a tree of [[30 Official Roblox Docs/API Reference/Classes/StatsItem|StatsItem]] objects which can have their values read by plugins.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#ContactsCount\|ContactsCount]] | int | A measurement of how many parts are currently in contact with one another. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#DataReceiveKbps\|DataReceiveKbps]] | float | In a networked game, this describes roughly how many kilobytes of data are being received by the current instance, per second. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#DataSendKbps\|DataSendKbps]] | float | In a networked game, this describes roughly how many kilobytes of data are being sent by the current instance, per second. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#FrameTime\|FrameTime]] | float | A measurement of how long it takes for the engine to process all tasks required to render a frame. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#HeartbeatTime\|HeartbeatTime]] | float | A measurement of the total amount of time it takes for the server to update its task scheduler jobs in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#HeartbeatTimeMs\|HeartbeatTimeMs]] | float | **Deprecated.** A measurement of the total amount of time it takes long it takes for Roblox to update all of its task scheduler jobs, in milliseconds. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#InstanceCount\|InstanceCount]] | int | A measurement of how many [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] are currently in memory. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#MemoryTrackingEnabled\|MemoryTrackingEnabled]] | boolean | An indication of whether memory tracking is enabled. This is guaranteed to be unchanged until the next time the Client is started. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#MovingPrimitivesCount\|MovingPrimitivesCount]] | int | A measurement of how many physically simulated components are currently moving in the game world. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#PhysicsReceiveKbps\|PhysicsReceiveKbps]] | float | In a networked game, this describes roughly how many kilobytes of physics data are being received by the current instance, per second. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#PhysicsSendKbps\|PhysicsSendKbps]] | float | In a networked game, this describes roughly how many kilobytes of physics data are being sent by the current instance, per second. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#PhysicsStepTime\|PhysicsStepTime]] | float | A measurement of how long it takes for the physics engine to update its current state. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#PhysicsStepTimeMs\|PhysicsStepTimeMs]] | float | **Deprecated.** A measurement of how long it takes for the physics engine to update its current state, in milliseconds. If this value is high, then it means the game instance is under stress from the physics simulations taking place. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#PrimitivesCount\|PrimitivesCount]] | int | A measurement of how many physically simulated components currently exist in the game world. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#RenderCPUFrameTime\|RenderCPUFrameTime]] | float | A measurement of how long it takes for the CPU to process all of its rendering tasks for a frame. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#RenderGPUFrameTime\|RenderGPUFrameTime]] | float | A measurement of how long it takes for the GPU to process all of its tasks required to render a frame. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#SceneDrawcallCount\|SceneDrawcallCount]] | int | A measurement of the number of draw calls made by the game's current scene. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#SceneTriangleCount\|SceneTriangleCount]] | int | A measurement of the number of triangles rendered by the game's current scene. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#ShadowsDrawcallCount\|ShadowsDrawcallCount]] | int | A measurement of the number of draw calls being made for shadows by the game's current scene. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#ShadowsTriangleCount\|ShadowsTriangleCount]] | int | A measurement of the number of triangles rendered as shadows in the game's current scene. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#UI2DDrawcallCount\|UI2DDrawcallCount]] | int | A measurement of the number of 2D draw calls made for UI elements in the game's current scene. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#UI2DTriangleCount\|UI2DTriangleCount]] | int | A measurement of the number of triangles that are being rendered for 2D UI elements in the game's current scene. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#UI3DDrawcallCount\|UI3DDrawcallCount]] | int | A measurement of the number of 3D draw calls made for UI elements in the game's current scene. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#UI3DTriangleCount\|UI3DTriangleCount]] | int | A measurement of the number of triangles being rendered for 3D UI elements in the game's current scene. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#GetHarmonyQualityLevel\|GetHarmonyQualityLevel()]] | int | Internal-only. Returns the engine's current dynamic-quality level as a score normalized from `0` to `100`. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#GetMemoryCategoryNames\|GetMemoryCategoryNames()]] | Array | Internal-only. Returns an array of the names of every developer memory category the engine tracks. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#GetMemoryUsageMbAllCategories\|GetMemoryUsageMbAllCategories()]] | Array | Returns the number of megabytes that are being consumed by all available categories, or an empty array if [[30 Official Roblox Docs/API Reference/Classes/Stats#MemoryTrackingEnabled\|MemoryTrackingEnabled]] is `false`. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#GetMemoryUsageMbForTag\|GetMemoryUsageMbForTag()]] | float | Returns the number of megabytes that are being consumed in the specified [[30 Official Roblox Docs/API Reference/Enums/DeveloperMemoryTag\|Enum.DeveloperMemoryTag]] category, or `0` if [[30 Official Roblox Docs/API Reference/Classes/Stats#MemoryTrackingEnabled\|MemoryTrackingEnabled]] is `false`. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#GetTotalMemoryUsageMb\|GetTotalMemoryUsageMb()]] | float | Returns the total amount of memory being consumed by the current game session, in megabytes. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#ResetHarmonyMemoryTarget\|ResetHarmonyMemoryTarget()]] | () | Internal-only. Restores the performance-control system's memory budget to the values in effect before [[30 Official Roblox Docs/API Reference/Classes/Stats#SetHarmonyMemoryTarget\|Stats:SetHarmonyMemoryTarget()]] was called. |
| [[30 Official Roblox Docs/API Reference/Classes/Stats#SetHarmonyMemoryTarget\|SetHarmonyMemoryTarget()]] | () | Internal-only. Overrides the performance-control system's memory budget with a target value, in megabytes, for testing. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ContactsCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property describes how many parts are currently in contact with each other, such that one of the two parts are being physically simulated, and thus can be recognized by the [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetTouchingParts|BasePart:GetTouchingParts()]] method.

### DataReceiveKbps

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

In a networked game, this property describes roughly how many kilobytes of data are being received by the current instance, per second. If from the server's perspective, this represents the total amount of data being received from the clients connected to the server. If from a client's perspective, this represents the total amount of data being received from the server.

### DataSendKbps

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

In a networked game, this property describes roughly how many kilobytes of data are being sent by the current instance, per second. If from the server's perspective, this represents the total amount of data being sent to the clients connected to the server. If from a client's perspective, this represents the total amount of data being sent to the server.

### FrameTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is only available in client scripts and is a measurement of how long it took to render the most-recent frame in seconds. Divide `1` by this value to calculate an FPS value for the frame time. High frame times are indicative of performance problems on the device. Consider using the [MicroProfiler](https://create.roblox.com/docs/studio/microprofiler) to troubleshoot.

### HeartbeatTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of the total amount of time it takes for the server to update its task scheduler jobs in seconds. If this value is high, examine [server compute](https://create.roblox.com/docs/performance-optimization/identifying#server-compute).

### HeartbeatTimeMs

> [!warning] Deprecated
> Use `Class.Stats.HeartbeatTime` instead.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

The `HeartbeatTimeMs` property is a measurement of the total amount of time it takes long it takes for Roblox to update all of its task scheduler jobs, in milliseconds. If this value is high, then it means one of the tasks are hogging up a lot of resources.

### InstanceCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

`InstanceCount` is a read-only measurement of how many [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] are currently in memory. This includes the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], its descendants, as well as any object created with [[30 Official Roblox Docs/API Reference/Datatypes/Instance#new|Instance.new()]] which is still present in memory.

### MemoryTrackingEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

If `MemoryTrackingEnabled` returns `false`, any API that returns category-based memory usage such as [[30 Official Roblox Docs/API Reference/Classes/Stats#GetMemoryUsageMbForTag|Stats:GetMemoryUsageMbForTag()]] or [[30 Official Roblox Docs/API Reference/Classes/Stats#GetMemoryUsageMbAllCategories|Stats:GetMemoryUsageMbAllCategories()]] will return `0` and emit a warning. Therefore, usage of category-based memory usage API should be conditional on `MemoryTrackingEnabled` returning `true`. The value of `MemoryTrackingEnabled` will not change from one experience to the next; it will only potentially change after restarting the Roblox client application.

### MovingPrimitivesCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

A measurement of how many physically simulated components are currently moving in the game world.

### PhysicsReceiveKbps

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

PhysicsReceiveKbps is a measurement of roughly how many kilobytes of physics data are being received by the current instance, per second.If from the server's perspective, this represents the total amount of physics data being received from the clients connected to the server.If from a client's perspective, this represents the total amount of physics data being received from the server.

### PhysicsSendKbps

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

`PhysicsSendKbps` describes roughly how many kilobytes of physics data are being sent by the current instance, per second. If from the server's perspective, this represents the total amount of physics data being sent to the clients connected to the server. If from a client's perspective, this represents the total amount of physics data being sent to the server.

### PhysicsStepTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of how long it takes for the physics engine to update its current state. If this value is high, it means the game instance is under stress from the physics simulations taking place.

### PhysicsStepTimeMs

> [!warning] Deprecated
> Use `Class.Stats.PhysicsStepTime` instead.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

A measurement of how long it takes for the physics engine to update its current state, in milliseconds. If this value is high, then it means the game instance is under stress from the physics simulations taking place.

### PrimitivesCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

A measurement of how many physically simulated components currently exist in the game world.

### RenderCPUFrameTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of how long it takes for the CPU to process all of its rendering tasks for a frame.

### RenderGPUFrameTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of how long it takes for the GPU to process all of its tasks required to render a frame.

### SceneDrawcallCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of the number of draw calls made by the game's current scene. A draw call is a single rendering operation, such as drawing a mesh. A high draw call count could mean a scene is too complex or unoptimized, which can lead to performance issues.

### SceneTriangleCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of the number of triangles rendered by the game's current scene. A count of triangles rendered is useful when trying to estimate the complexity and performance of a scene.

### ShadowsDrawcallCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of the number of draw calls being made for shadows by the game's current scene. A high count means more shadows are being created by the amount of rendered objects in a scene.

### ShadowsTriangleCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of the number of triangles rendered as shadows in the game's current scene. A high count means there are a lot of triangles used to cast shadows, which can hinder performance.

### UI2DDrawcallCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of the number of 2D draw calls made for UI elements in the game's current scene. A high count can mean there are a lot of 2D UI elements being used.

### UI2DTriangleCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of the number of triangles that are being rendered for 2D UI elements in the game's current scene. A high count can mean there are many or complex 2D UI elements used, which can contribute to performance loss in regards to rendering.

### UI3DDrawcallCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of the number of 3D draw calls made for UI elements in the game's current scene. A high count could indicate a high amount of 3D objects being used within UI, potentially hurting performance; however, it is very unlikely you would see a significant count since UI elements are typically 2D.

### UI3DTriangleCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a measurement of the number of triangles being rendered for 3D UI elements in the game's current scene; however, it is very unlikely you would see a significant count since UI elements are typically 2D.

## Methods

### GetHarmonyQualityLevel

```lua
Stats:GetHarmonyQualityLevel(): int
```

**Thread safety:** Unsafe · **Capabilities:** InternalTest

Requires the `InternalTest` security capability; not callable from ordinary scripts. Returns the current quality level selected by the engine's dynamic performance-control system, expressed as a score normalized between `0` (the lowest-quality configuration) and `100` (the highest). The score reflects how the system is currently balancing visual quality against resource usage such as memory and frame time.

**Returns**

| Type | Description |
| --- | --- |
| int | The current dynamic-quality level, normalized from `0` (lowest quality) to `100` (highest quality). |

### GetMemoryCategoryNames

```lua
Stats:GetMemoryCategoryNames(): Array
```

**Thread safety:** Unsafe · **Capabilities:** InternalTest

Requires the `InternalTest` security capability; not callable from ordinary scripts. Returns an array of strings containing the name of every memory category the engine tracks, in category-index order. The entries correspond one-to-one with the measurements returned by [[30 Official Roblox Docs/API Reference/Classes/Stats#GetMemoryUsageMbAllCategories|Stats:GetMemoryUsageMbAllCategories()]], so the two arrays can be read together to label each per-category memory value.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings, one per tracked memory category, ordered to match the values returned by [[30 Official Roblox Docs/API Reference/Classes/Stats#GetMemoryUsageMbAllCategories\|Stats:GetMemoryUsageMbAllCategories()]]. |

### GetMemoryUsageMbAllCategories

```lua
Stats:GetMemoryUsageMbAllCategories(): Array
```

**Thread safety:** Unsafe · **Capabilities:** InternalTest

Returns the number of megabytes that are being consumed by all available categories. If [[30 Official Roblox Docs/API Reference/Classes/Stats#MemoryTrackingEnabled|MemoryTrackingEnabled]] is `false`, calling `GetMemoryUsageMbAllCategories()` will return an empty array and emit a warning to the console.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of numbers in which each entry is the memory, in megabytes, consumed by one memory category, ordered to match the categories returned by [[30 Official Roblox Docs/API Reference/Classes/Stats#GetMemoryCategoryNames\|Stats:GetMemoryCategoryNames()]]. Returns an empty array if [[30 Official Roblox Docs/API Reference/Classes/Stats#MemoryTrackingEnabled\|MemoryTrackingEnabled]] is `false`. |

### GetMemoryUsageMbForTag

```lua
Stats:GetMemoryUsageMbForTag(tag: DeveloperMemoryTag): float
```

**Thread safety:** Unsafe

Returns the number of megabytes that are being consumed in the specified [[30 Official Roblox Docs/API Reference/Enums/DeveloperMemoryTag|Enum.DeveloperMemoryTag]] category. If [[30 Official Roblox Docs/API Reference/Classes/Stats#MemoryTrackingEnabled|MemoryTrackingEnabled]] is `false`, calling `GetMemoryUsageMbForTag()` will return `0` and emit a warning to the console.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | [[30 Official Roblox Docs/API Reference/Enums/DeveloperMemoryTag\|DeveloperMemoryTag]] |  | The [[30 Official Roblox Docs/API Reference/Enums/DeveloperMemoryTag\|Enum.DeveloperMemoryTag]] memory category to measure. |

**Returns**

| Type | Description |
| --- | --- |
| float | The memory, in megabytes, consumed by the given [[30 Official Roblox Docs/API Reference/Enums/DeveloperMemoryTag\|Enum.DeveloperMemoryTag]] category, or `0` if [[30 Official Roblox Docs/API Reference/Classes/Stats#MemoryTrackingEnabled\|MemoryTrackingEnabled]] is `false`. |

### GetTotalMemoryUsageMb

```lua
Stats:GetTotalMemoryUsageMb(): float
```

**Thread safety:** Unsafe

Returns the total amount of memory being consumed by the current game session, in megabytes.

This method gets memory usage from the operating system, which may exclude memory that has been paged out to disk. As such, the return value tends to differ significantly from the sum of usage for all [[30 Official Roblox Docs/API Reference/Enums/DeveloperMemoryTag|DeveloperMemoryTags]]. The return value should be very similar to memory usage for Roblox in the Windows Task Manager or macOS Activity Monitor.

**Returns**

| Type | Description |
| --- | --- |
| float | The total memory, in megabytes, used by the current game session, as reported by the operating system. |

### ResetHarmonyMemoryTarget

```lua
Stats:ResetHarmonyMemoryTarget(): ()
```

**Thread safety:** Unsafe · **Capabilities:** InternalTest

Requires the `InternalTest` security capability; not callable from ordinary scripts. Reverts the artificial memory budget applied by [[30 Official Roblox Docs/API Reference/Classes/Stats#SetHarmonyMemoryTarget|Stats:SetHarmonyMemoryTarget()]], restoring the memory-override enable state and limit that were captured before the first call to `SetHarmonyMemoryTarget()`. After this call, the performance-control system resumes using the device's real available memory when making dynamic-quality decisions.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetHarmonyMemoryTarget

```lua
Stats:SetHarmonyMemoryTarget(targetMB: int): ()
```

**Thread safety:** Unsafe · **Capabilities:** InternalTest

Requires the `InternalTest` security capability; not callable from ordinary scripts. Forces the engine's dynamic performance-control system to operate against an artificial memory budget of `targetMB` megabytes instead of the device's real available memory, making it behave as though only that much memory is available. This lets you test how dynamic quality and memory reclamation respond under a chosen level of memory pressure. The first call records the pre-override settings so that a later call to [[30 Official Roblox Docs/API Reference/Classes/Stats#ResetHarmonyMemoryTarget|Stats:ResetHarmonyMemoryTarget()]] can restore them.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `targetMB` | int |  | The memory budget to impose on the performance-control system, in megabytes. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [Stats](https://create.roblox.com/docs/reference/engine/classes/Stats) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
