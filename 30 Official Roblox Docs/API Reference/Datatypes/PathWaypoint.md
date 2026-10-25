---
title: "PathWaypoint"
description: "A description of the steps required to reach the next waypoint in a path."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/PathWaypoint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A description of the steps required to reach the next waypoint in a path.*

## Description

The `PathWaypoint` data type is constructed by a [[30 Official Roblox Docs/API Reference/Enums/PathWaypointAction|Enum.PathWaypointAction]] action, [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] position, and [[30 Official Roblox Docs/API Reference/Libraries/string|string]] label which is used by the [[30 Official Roblox Docs/API Reference/Classes/PathfindingService|PathfindingService]] to create points along a generated path.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/PathWaypoint#new\|new()]] | `position`, `action`, `label` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/PathWaypoint\|PathWaypoint]] object from the given [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] position, [[30 Official Roblox Docs/API Reference/Enums/PathWaypointAction\|Enum.PathWaypointAction]] action, and optional string label. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/PathWaypoint#Action\|Action]] | [[30 Official Roblox Docs/API Reference/Enums/PathWaypointAction\|PathWaypointAction]] | The action to perform at this waypoint. |
| [[30 Official Roblox Docs/API Reference/Datatypes/PathWaypoint#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The 3D position of this waypoint. |
| [[30 Official Roblox Docs/API Reference/Datatypes/PathWaypoint#Label\|Label]] | string | The name of the navigation area that generates this waypoint. |

## Constructors

### new

```lua
PathWaypoint.new(position: Vector3, action: PathWaypointAction, label: string): PathWaypoint
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/PathWaypoint|PathWaypoint]] object from the given [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] position, [[30 Official Roblox Docs/API Reference/Enums/PathWaypointAction|Enum.PathWaypointAction]] action, and optional string label.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The 3D position of the waypoint. |
| `action` | [[30 Official Roblox Docs/API Reference/Enums/PathWaypointAction\|PathWaypointAction]] |  | The action to perform at the waypoint. |
| `label` | string |  | The name of the navigation area that generates the waypoint. |

## Properties

### Action

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PathWaypointAction|PathWaypointAction]]

The action to perform at this waypoint as an [[30 Official Roblox Docs/API Reference/Enums/PathWaypointAction|Enum.PathWaypointAction]].

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The 3D position of this waypoint.

### Label

**Type:** string

The name of the navigation area that generates this waypoint. Automatic jump links have `Jump` as their label.

---
*Source: [PathWaypoint](https://create.roblox.com/docs/reference/engine/datatypes/PathWaypoint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
