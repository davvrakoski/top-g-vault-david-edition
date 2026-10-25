---
title: "Region3"
description: "Describes a rectangular volume in 3D space."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Region3"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Describes a rectangular volume in 3D space.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] data type describes a volume in 3D space similar to an **axis-aligned rectangular prism**. It is commonly used with [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] functions and functions that detect parts within a volume, such as [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3|WorldRoot:FindPartsInRegion3()]].

The prism's center is accessible using the [[30 Official Roblox Docs/API Reference/Datatypes/Region3#CFrame|Region3.CFrame]] property and the prism's size is accessible through the [[30 Official Roblox Docs/API Reference/Datatypes/Region3#Size|Region3.Size]] property. Note that the components of this property may be **negative**.

The [[30 Official Roblox Docs/API Reference/Datatypes/Region3#ExpandToGrid|Region3:ExpandToGrid()]] method returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] whose bounds comply with a provided resolution value. The resulting volume may be equal to or greater than the original volume, but never smaller.

See also:

- [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16|Region3int16]]

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Region3#new\|new()]] | `min`, `max` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] using the provided vectors as boundaries. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Region3#CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The center location and rotation of the [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Region3#Size\|Size]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The 3D size of the [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Region3#ExpandToGrid\|ExpandToGrid()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] | Expands the [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] to fit a grid based on the provided resolution. |

## Constructors

### new

```lua
Region3.new(min: Vector3, max: Vector3): Region3
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] given the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] bounds of the rectangular prism volume.

Note that the order of the provided bounds matters: by switching them, the polarity of the size components will switch. It is possible to create a [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] with a **negative volume**.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `min` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The lower corner of the rectangular volume. |
| `max` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The upper corner of the rectangular volume. |

## Properties

### CFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] representing the center position and orientation of the [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]]. The position component is the midpoint of the `min` and `max` vectors passed to [[30 Official Roblox Docs/API Reference/Datatypes/Region3#new|Region3.new()]], computed as `(min + max) / 2`. Because a [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] is always axis-aligned, the rotation component of the returned [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] is always the identity (no rotation). This property is read-only.

### Size

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The size of the [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], equal to `max - min` from the constructor arguments. Individual components may be **negative** if the corresponding component of `min` is greater than `max` in the call to [[30 Official Roblox Docs/API Reference/Datatypes/Region3#new|Region3.new()]]. This property is read-only.

## Methods

### ExpandToGrid

```lua
Region3:ExpandToGrid(resolution: number): Region3
```

Expands the [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] based on the provided resolution and returns the expanded [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] aligned to the [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] voxel grid.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `resolution` | number |  | The grid resolution to align the region bounds to, in studs. Must be a positive number. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] | A new Region3 whose minimum bounds are floored and maximum bounds are ceiled to the nearest multiple of `resolution`. |

---
*Source: [Region3](https://create.roblox.com/docs/reference/engine/datatypes/Region3) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
