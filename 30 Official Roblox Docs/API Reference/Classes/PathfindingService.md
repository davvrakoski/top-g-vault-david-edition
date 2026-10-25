---
title: "PathfindingService"
description: "Used to find logical paths between two points."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PathfindingService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Used to find logical paths between two points.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`PathfindingService` is used to find logical paths between two points, ensuring that characters can move between the points without running into walls or other obstacles. By default, the shortest path is calculated, but you can implement pathfinding modifiers to compute smarter paths across various materials, around defined regions, or through obstacles.

See [[30 Official Roblox Docs/Characters/Pathfinding|Pathfinding]] for details on implementing character pathfinding.

*Code samples for this API (`using-the-pathfinding-service`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/PathfindingService); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#EmptyCutoff\|EmptyCutoff]] | float | **Deprecated.** Sets the percent of a voxel has to be occupied to be considered empty. Defaults to 0.16. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#ComputeRawPathAsync\|ComputeRawPathAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] | **Deprecated.** Computes and returns a [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] between two [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3s]]. If the given MaxDistance is greater than 512, an error will be thrown. (MaxDistance is too large). |
| [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#ComputeSmoothPathAsync\|ComputeSmoothPathAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] | **Deprecated.** Computes and returns a smooth [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] between two [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3s]]. |
| [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#CreatePath\|CreatePath()]] | [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] | Creates a [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] object based on the given agent parameters. |
| [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#FindPathAsync\|FindPathAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] | **Deprecated.** Finds a [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] between the two provided points. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### EmptyCutoff

> [!warning] Deprecated
> This property is deprecated, since the legacy pathfinding system using it
> has since been removed. Do not use it for new work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`, `Deprecated`

This function worked with the legacy pathfinding system. The pathfinding system currently uses a navigation grid and the EmptyCutoff is unused.

When the [[30 Official Roblox Docs/API Reference/Classes/PathfindingService|PathfindingService]] computes a path using [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#ComputeRawPathAsync|PathfindingService:ComputeRawPathAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#ComputeRawPathAsync|PathfindingService:ComputeRawPathAsync()]] it uses the voxel representation of the world. A voxel is one cube in a grid overlaid on the world. In this case the voxels being used are 4x4x4. This property sets the percent of a voxel has to be occupied to be considered empty. Defaults to 0.16.

## Methods

### ComputeRawPathAsync

> [!warning] Deprecated
> This item has been superseded by
> `Class.PathfindingService:FindPathAsync()` which should be used in all new
> work instead.

```lua
PathfindingService:ComputeRawPathAsync(start: Vector3, finish: Vector3, maxDistance: float): Path
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`, `Deprecated`

This function computes and returns a [[30 Official Roblox Docs/API Reference/Classes/Path|Path]] between two [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3s]]. If the given MaxDistance is greater than 512, an error will be thrown. (MaxDistance is too large).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |  |
| `finish` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |  |
| `maxDistance` | float |  |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] | A [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] object. |

### ComputeSmoothPathAsync

> [!warning] Deprecated
> This item has been superseded by
> `Class.PathfindingService:FindPathAsync()` which should be used in all new
> work instead.

```lua
PathfindingService:ComputeSmoothPathAsync(start: Vector3, finish: Vector3, maxDistance: float): Path
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`, `Deprecated`

This function computes and returns a smooth [[30 Official Roblox Docs/API Reference/Classes/Path|Path]] between two [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3s]]. This function fulfills the same purpose as [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#ComputeRawPathAsync|PathfindingService:ComputeRawPathAsync()]], but creates a much smoother path for an NPC to follow in comparison.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |  |
| `finish` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |  |
| `maxDistance` | float |  |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] |  |

### CreatePath

```lua
PathfindingService:CreatePath(agentParameters: Dictionary = nil): Path
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Creates a [[30 Official Roblox Docs/API Reference/Classes/Path|Path]] object based on various agent parameters. Valid keys and values in the `agentParameters` table are as follows:

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `AgentRadius` | integer | `2` | Determines the minimum amount of horizontal space required for empty space to be considered traversable. |
| `AgentHeight` | integer | `5` | Determines the minimum amount of vertical space required for empty space to be considered traversable. |
| `AgentCanJump` | boolean | `true` | Determines whether jumping during pathfinding is allowed. |
| `AgentCanClimb` | boolean | `false` | Determines whether climbing [[30 Official Roblox Docs/API Reference/Classes/TrussPart\|TrussParts]] during pathfinding is allowed. |
| `WaypointSpacing` | number | 4 | Determines the spacing between intermediate waypoints in path. |
| `Costs` | table |  | Table of materials or defined [[30 Official Roblox Docs/API Reference/Classes/PathfindingModifier\|PathfindingModifiers]] and their "cost" for traversal. Useful for making the agent prefer certain materials/regions over others. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `agentParameters` | Dictionary | `nil` | Lua table which lets you fine-tune the path based on various agent parameters. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] | A [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] object. |

*Code samples for this member (`pathfinding---creating-path-with-params`) are published on the source page; their code is not part of the open-source repo.*

### FindPathAsync

> [!warning] Deprecated
> This function has been superseded by the sequential method of calling
> `Class.PathfindingService:CreatePath()` followed by
> `Class.Path:ComputeAsync()|Path`. This lets you create a `Class.Path`
> object using various custom parameters and then compute or re-compute a
> path on the same object if any dynamic changes within the place block the
> path.

```lua
PathfindingService:FindPathAsync(start: Vector3, finish: Vector3): Path
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function is used to find a [[30 Official Roblox Docs/API Reference/Classes/Path|Path]] between two provided points. This path uses the navigation grid created by [[30 Official Roblox Docs/API Reference/Classes/PathfindingService|PathfindingService]] and makes sure that the path can be followed by a regular-sized Roblox character.

This function returns a [[30 Official Roblox Docs/API Reference/Classes/Path|Path]] object which contains the coordinates of the path. If no path is found between the two points, this function will still return a [[30 Official Roblox Docs/API Reference/Classes/Path|Path]] object, but that object's [[30 Official Roblox Docs/API Reference/Classes/Path#Status|Path.Status]] will be [[30 Official Roblox Docs/API Reference/Enums/PathStatus|Enum.PathStatus.NoPath]].

To get the waypoints of a [[30 Official Roblox Docs/API Reference/Classes/Path|Path]] object, you can use the [[30 Official Roblox Docs/API Reference/Classes/Path#GetWaypoints|Path:GetWaypoints()]] function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Path start coordinates. |
| `finish` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Path finish coordinates. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] | A [[30 Official Roblox Docs/API Reference/Classes/Path\|Path]] object. |

---
*Source: [PathfindingService](https://create.roblox.com/docs/reference/engine/classes/PathfindingService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
