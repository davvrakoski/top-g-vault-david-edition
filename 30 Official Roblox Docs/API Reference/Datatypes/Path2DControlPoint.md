---
title: "Path2DControlPoint"
description: "Stores the info for a single control point used with the `Path2D` instance."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Path2DControlPoint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Stores the info for a single control point used with the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] instance.*

## Description

The `Path2DControlPoint` data type represents a single control point used with the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] instance.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint#new\|new()]] |  | Returns an empty [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint#new\|new()]] | `Position` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]] with only the position set. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint#new\|new()]] | `Position`, `Left Tangent`, `Right Tangent` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]] with the position, left tangent, and right tangent set. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | The position of the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint#LeftTangent\|LeftTangent]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | The left tangent of the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint#RightTangent\|RightTangent]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | The right tangent of the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]]. |

## Constructors

### new

```lua
Path2DControlPoint.new(): Path2DControlPoint
```

Returns an empty [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]].

### new

```lua
Path2DControlPoint.new(Position: UDim2): Path2DControlPoint
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]] with the position set. This constructor will set the tangents to default [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] values.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Position` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] position of the control point. |

### new

```lua
Path2DControlPoint.new(Position: UDim2, Left Tangent: UDim2, Right Tangent: UDim2): Path2DControlPoint
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]] with the position, left tangent, and right tangent set.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Position` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] position of the control point. |
| `Left Tangent` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] left tangent of the control point. |
| `Right Tangent` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] right tangent of the control point. |

## Properties

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

The position of the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]] relative to the path's container.

### LeftTangent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

The left tangent of the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]].

### RightTangent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

The right tangent of the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]].

---
*Source: [Path2DControlPoint](https://create.roblox.com/docs/reference/engine/datatypes/Path2DControlPoint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
