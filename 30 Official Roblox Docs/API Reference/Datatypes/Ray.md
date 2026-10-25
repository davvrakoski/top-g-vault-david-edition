---
title: "Ray"
description: "Represents a line with a starting point that casts infinitely in a specific direction."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Ray"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents a line with a starting point that casts infinitely in a specific direction.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] data type represents a half-line, finite in one direction but infinite in the other. It can be defined by a 3D point, where the line originates from, and a direction vector, which is the direction it goes in.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Ray#new\|new()]] | `Origin`, `Direction` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] with the given `Origin` and `Direction`. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Ray#Unit\|Unit]] | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] with a normalized direction (the direction has a magnitude of `1`). |
| [[30 Official Roblox Docs/API Reference/Datatypes/Ray#Origin\|Origin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The position of the origin. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Ray#Direction\|Direction]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The direction vector of the [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Ray#ClosestPoint\|ClosestPoint()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] projected onto the ray so that it is within the [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] line of sight. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Ray#Distance\|Distance()]] | number | Returns the distance between the given point and the closest point on the [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]]. |

## Constructors

### new

```lua
Ray.new(Origin: Vector3, Direction: Vector3): Ray
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] with given `Origin` and `Direction`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Origin` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The starting point of the ray in 3D space. |
| `Direction` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The direction vector of the ray. Does not need to be a unit vector. |

## Properties

### Unit

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]]

The [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] with a normalized direction (the direction has a magnitude of `1`).

### Origin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The position of the origin.

### Direction

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The direction vector of the [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]].

## Methods

### ClosestPoint

```lua
Ray:ClosestPoint(point: Vector3): Vector3
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] projected onto the ray so that it is within the [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] line of sight.

**Note:** the [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] **must** be a unit ray for this method to behave as expected!

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The point in 3D space to project onto the ray. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The point on the ray closest to the given point, or the ray origin if the projection falls behind it. |

### Distance

```lua
Ray:Distance(point: Vector3): number
```

Returns the distance between the given point and the point on the ray nearest to the given point (`Datatype.Ray.ClosestPoint(point)`).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The point in 3D space to measure distance from. |

**Returns**

| Type | Description |
| --- | --- |
| number | The shortest distance between the given point and the closest point on the ray. |

---
*Source: [Ray](https://create.roblox.com/docs/reference/engine/datatypes/Ray) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
