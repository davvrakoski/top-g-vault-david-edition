---
title: "Region3int16"
description: "Represents a Region3 stored as two boundaries as opposed to position and size components."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Region3int16"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents a Region3 stored as two boundaries as opposed to position and size components.*

## Description

Not to be confused with [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]], a separate class that fulfills a different purpose.

The [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16|Region3int16]] data type represents a volume in 3D space similar to an **axis-aligned rectangular prism**. It uses two [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]] to store the volume's bounds in the `Min` and `Max` properties. It is constructed using `Region3int16.new(Min, Max)`, given the two [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]] bounds. This data type features no functions or operations.

## Calculating Center and Size

This data type differs from [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] in that it stores its bounds directly, rather than through a center and size combination. Nonetheless, it is possible to calculate these dimensions using `Min` and `Max`:

```lua
local region = Region3int16.new(Vector3int16.new(0, 0, -3), Vector3int16.new(4, 4, 4))
local size = region.Max - region.Min
local center = (region.Max + region.Min) / 2
```

## Conversion to Region3

The following function can be used to convert a Region3int16 into a similar [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]]. It does this by converting the `Min` and `Max` properties, which are Vector3int16, into [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] used with [[30 Official Roblox Docs/API Reference/Datatypes/Region3#new|Region3.new()]].

```lua
local function Region3int16toRegion3(region16)
	return Region3.new(
		Vector3.new(region16.Min.X, region16.Min.Y, region16.Min.Z),
		Vector3.new(region16.Max.X, region16.Max.Y, region16.Max.Z)
	)
end
```

See also:

- [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]], a similar data type

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16#new\|new()]] | `min`, `max` | Returns a new Region3int16 from the provided boundaries. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16#Min\|Min]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | The lower bound of the [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16\|Region3int16]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16#Max\|Max]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | The upper bound of the [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16\|Region3int16]]. |

## Constructors

### new

```lua
Region3int16.new(min: Vector3int16, max: Vector3int16): Region3int16
```

Returns a new Region3int16 from the provided boundaries.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `min` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] |  | The lower bound of the region. |
| `max` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] |  | The upper bound of the region. |

## Properties

### Min

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]]

The lower bound of the [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16|Region3int16]], as passed to [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16#new|Region3int16.new()]].

### Max

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]]

The upper bound of the [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16|Region3int16]], as passed to [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16#new|Region3int16.new()]].

---
*Source: [Region3int16](https://create.roblox.com/docs/reference/engine/datatypes/Region3int16) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
