---
title: "Path"
description: "Stores the result of paths created by `PathfindingService:CreatePath()`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Path"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Stores the result of paths created by [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#CreatePath|PathfindingService:CreatePath()]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

`Path` objects store the result of paths created by [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#CreatePath|PathfindingService:CreatePath()]].

Once a `Path` object is created, you can call [[30 Official Roblox Docs/API Reference/Classes/Path#ComputeAsync|ComputeAsync()]] with a starting point and ending point. This will attempt to compute a valid path for a character to move along, based on default or custom parameters passed to [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#CreatePath|CreatePath()]]. If [[30 Official Roblox Docs/API Reference/Classes/Path#ComputeAsync|ComputeAsync()]] successfully finds a path, the `Path` object will have a [[30 Official Roblox Docs/API Reference/Classes/Path#Status|Status]] value of [[30 Official Roblox Docs/API Reference/Enums/PathStatus|Enum.PathStatus.Success]]. Otherwise the status will be [[30 Official Roblox Docs/API Reference/Enums/PathStatus|Enum.PathStatus.NoPath]] which can occur if there are obstacles between the two points (and no way around) or if the points are inside of solid objects.

In addition to [[30 Official Roblox Docs/API Reference/Classes/Path#ComputeAsync|ComputeAsync()]], `Path` objects have the [[30 Official Roblox Docs/API Reference/Classes/Path#GetWaypoints|GetWaypoints()]] method which returns a list of waypoints representing the points a character should follow in sequence to get from the beginning to the end of the path.

Finally, `Path` objects can be **connected** to the [[30 Official Roblox Docs/API Reference/Classes/Path#Blocked|Blocked]] event which will fire if, at any time during the path's existence, the path is blocked. Note that this can occur **behind** a character moving along the path, not just in front of it.

See [[30 Official Roblox Docs/Characters/Pathfinding|Pathfinding]] for details on implementing character pathfinding.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path#Status\|Status]] | [[30 Official Roblox Docs/API Reference/Enums/PathStatus\|PathStatus]] | The [[30 Official Roblox Docs/API Reference/Enums/PathStatus\|Enum.PathStatus]] of the generated `Path`. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path#CheckOcclusionAsync\|CheckOcclusionAsync()]] | int | **Deprecated.** Checks if a path is blocked starting at a specific waypoint. |
| [[30 Official Roblox Docs/API Reference/Classes/Path#ComputeAsync\|ComputeAsync()]] | () | Computes a `Path` from a start position to an end position. |
| [[30 Official Roblox Docs/API Reference/Classes/Path#GetPointCoordinates\|GetPointCoordinates()]] | Array | **Deprecated.** Returns a table of `Path` instances. |
| [[30 Official Roblox Docs/API Reference/Classes/Path#GetWaypoints\|GetWaypoints()]] | Array | Returns an array of points in the path. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path#Blocked\|Blocked]] | `blockedWaypointIdx` | Fires when the computed path becomes blocked. |
| [[30 Official Roblox Docs/API Reference/Classes/Path#Unblocked\|Unblocked]] | `unblockedWaypointIdx` | Fires when a computed path that was blocked becomes unblocked. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Status

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PathStatus|PathStatus]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Enums/PathStatus|Enum.PathStatus]] of the generated `Path`.

## Methods

### CheckOcclusionAsync

> [!warning] Deprecated
> This function has been superseded by the `Class.Path.Blocked|Blocked`
> event which you can connect to a `Path` object and should be used instead.
> This lets you detect if the path becomes blocked at any time during its
> existence.

```lua
Path:CheckOcclusionAsync(start: int): int
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function checks if a path is blocked starting at the waypoint indicated by **start**.

It returns the first waypoint of occlusion if blocked, -1 if not. it returns an error if **start** is less than 0 or greater than the number of waypoints in the `Path`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | int |  | The 1-based index of the waypoint from which to begin checking for occlusion. |

**Returns**

| Type | Description |
| --- | --- |
| int | The 1-based index of the first blocked waypoint starting from `start`, or `-1` if the path is not blocked. |

### ComputeAsync

```lua
Path:ComputeAsync(start: Vector3, finish: Vector3): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function computes a `Path` from a start position to an end position. This function is not automatically called when a path is created and must be invoked each time the path needs to be updated.

Once the path is computed, it will have a series of waypoints that, when followed, can lead a character along the path. These points are gathered with the [[30 Official Roblox Docs/API Reference/Classes/Path#GetWaypoints|GetWaypoints()]] function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world position where the computed path begins. |
| `finish` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world position where the computed path finishes. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetPointCoordinates

> [!warning] Deprecated
> This item has been superseded by
> `Class.Path:GetWaypoints()|GetWaypoints()` which should be used in all new
> work instead.

```lua
Path:GetPointCoordinates(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This function returns a table of `Path` instances.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] positions for each waypoint in the path. |

### GetWaypoints

```lua
Path:GetWaypoints(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method returns an array of all the [[30 Official Roblox Docs/API Reference/Datatypes/PathWaypoint|PathWaypoints]] in a `Path` as computed by [[30 Official Roblox Docs/API Reference/Classes/Path#ComputeAsync|ComputeAsync()]].

Each waypoint in the array specifies a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] position and [[30 Official Roblox Docs/API Reference/Enums/PathWaypointAction|Enum.PathWaypointAction]] to take when the waypoint is reached. The array is arranged in the order of waypoints from the path start to path end.

If a path could not be computed, this function will return an empty array.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of [[30 Official Roblox Docs/API Reference/Datatypes/PathWaypoint\|PathWaypoints]] ordered from path start to path end. |

*Code samples for this member (`Path-GetWaypoints1`) are published on the source page; their code is not part of the open-source repo.*

## Events

### Blocked

```lua
Path.Blocked(blockedWaypointIdx: int)
```

**Capabilities:** Basic

Fires when the computed path becomes blocked. Note that paths may become blocked somewhere **behind** the agent, such as a pile of rubble falling on a path as the agent runs away. See [[30 Official Roblox Docs/Characters/Pathfinding#Blocked paths|blocked paths]] for details on checking the forward waypoint progress of an agent along a path.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `blockedWaypointIdx` | int |  | The 1-based index of the waypoint at which the path became blocked. |

### Unblocked

```lua
Path.Unblocked(unblockedWaypointIdx: int)
```

**Capabilities:** Basic

Fires when a computed path that was blocked becomes unblocked. Note that a blocked path may become unblocked somewhere **behind** the agent, effectively making reaction to this event unnecessary. See [[30 Official Roblox Docs/Characters/Pathfinding#Blocked paths|blocked paths]] for details on checking the forward waypoint progress of an agent along a path.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `unblockedWaypointIdx` | int |  | The 1-based index of the waypoint at which the path became unblocked. |

---
*Source: [Path](https://create.roblox.com/docs/reference/engine/classes/Path) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
