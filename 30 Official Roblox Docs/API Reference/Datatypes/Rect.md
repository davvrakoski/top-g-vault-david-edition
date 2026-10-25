---
title: "Rect"
description: "A value that represents a two-dimensional rectangle."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Rect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A value that represents a two-dimensional rectangle.*

## Description

**Rect** describes a rectangle on a 2D plane. It is constructed using two corners, either two [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] positions or four numbers:

```lua
local rect1 = Rect.new(Vector2.new(10, 10), Vector2.new(80, 80))
local rect2 = Rect.new(10, 10, 80, 80)
```

This data type is used in the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceCenter|ImageLabel.SliceCenter]] property which determines the center area of a scaled image.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Rect#new\|new()]] |  | Returns a new **Rect** with zero [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] positions. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Rect#new\|new()]] | `min`, `max` | Returns a new **Rect** from the given [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] positions. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Rect#new\|new()]] | `minX`, `minY`, `maxX`, `maxY` | Returns a new **Rect** using the first and last two arguments as coordinates for corners. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Rect#Width\|Width]] | number | The width of the **Rect**. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Rect#Height\|Height]] | number | The height of the **Rect**. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Rect#Min\|Min]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The coordinates of the top-left corner. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Rect#Max\|Max]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The coordinates of the bottom-right corner. |

## Constructors

### new

```lua
Rect.new(): Rect
```

Constructs a new **Rect** with two zero [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] positions.

### new

```lua
Rect.new(min: Vector2, max: Vector2): Rect
```

Constructs a new **Rect** given two [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] positions: `min` as the top-left corner and `max` as the bottom-right corner.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `min` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | One corner of the rectangle as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]. The constructor computes the component-wise minimum of `min` and `max` to determine the top-left corner. |
| `max` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The other corner of the rectangle as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]. The constructor computes the component-wise maximum of `min` and `max` to determine the bottom-right corner. |

### new

```lua
Rect.new(minX: number, minY: number, maxX: number, maxY: number): Rect
```

Constructs a new **Rect** using `minX` and `minY` as coordinates for the top-left corner, and `maxX` and `maxY` as coordinates for the bottom-right corner.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `minX` | number |  | The X coordinate of the top-left corner of the rectangle. |
| `minY` | number |  | The Y coordinate of the top-left corner of the rectangle. |
| `maxX` | number |  | The X coordinate of the bottom-right corner of the rectangle. |
| `maxY` | number |  | The Y coordinate of the bottom-right corner of the rectangle. |

## Properties

### Width

**Type:** number

The horizontal span of the rectangle, equal to `Max.X - Min.X`. This value is always non-negative because the constructor normalizes the input coordinates so that [[30 Official Roblox Docs/API Reference/Datatypes/Rect#Min|Min]] is component-wise less than or equal to [[30 Official Roblox Docs/API Reference/Datatypes/Rect#Max|Max]]. Defaults to `0` for a [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]] created with no arguments.

### Height

**Type:** number

The vertical span of the rectangle, equal to `Max.Y - Min.Y`. This value is always non-negative because the constructor normalizes the input coordinates so that [[30 Official Roblox Docs/API Reference/Datatypes/Rect#Min|Min]] is component-wise less than or equal to [[30 Official Roblox Docs/API Reference/Datatypes/Rect#Max|Max]]. Defaults to `0` for a [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]] created with no arguments.

### Min

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

The top-left corner of the rectangle as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]. When you construct a [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]] with two positions, this property returns the component-wise minimum of those positions regardless of the order they were passed in. Defaults to `(0, 0)` for a [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]] created with no arguments.

### Max

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

The bottom-right corner of the rectangle as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]. When you construct a [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]] with two positions, this property returns the component-wise maximum of those positions regardless of the order they were passed in. Defaults to `(0, 0)` for a [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]] created with no arguments.

---
*Source: [Rect](https://create.roblox.com/docs/reference/engine/datatypes/Rect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
