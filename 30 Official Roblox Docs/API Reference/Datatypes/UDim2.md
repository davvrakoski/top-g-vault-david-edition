---
title: "UDim2"
description: "Represents a two-dimensional value where each dimension is composed of a relative scale and an absolute offset."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/UDim2"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents a two-dimensional value where each dimension is composed of a relative scale and an absolute offset.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] data type represents a two-dimensional value where each dimension is composed of a relative scale and an absolute offset in logical pixels. It is a combination of two [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] data types representing the **X** and **Y** dimensions. The most common usages for [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] are setting the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] of [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]].

```lua
local guiObject = Instance.new("Frame")
guiObject.Size = UDim2.new(0, 300, 1, 0)  -- 300 logical pixels wide; full height of parent
guiObject.Position = UDim2.new(0, 50, 0, 0)  -- 50 logical pixels from the left
print(guiObject.Size) --> {0, 300}, {1, 0}
```

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#new\|new()]] |  | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] with the coordinates of two zero [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] components representing each axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#new\|new()]] | `xScale`, `xOffset`, `yScale`, `yOffset` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] given the coordinates of the two [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] components representing each axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#new\|new()]] | `x`, `y` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] from the given [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] objects representing the **X** and **Y** dimensions, respectively. |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#fromScale\|fromScale()]] | `xScale`, `yScale` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] with the given scale components and no offsets. |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#fromOffset\|fromOffset()]] | `xOffset`, `yOffset` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] with the given offset components and no scaling. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#X\|X]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | The **X** dimension scale and offset of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#Y\|Y]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | The **Y** dimension scale and offset of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#Width\|Width]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | The **X** dimension scale and offset of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#Height\|Height]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | The **Y** dimension scale and offset of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#Lerp\|Lerp()]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] interpolated linearly between the value and the given goal. |

## Math operations

| Operation | Type A | Type B | Returns | Summary |
| --- | --- | --- | --- | --- |
| `+` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] with components that are the sum of the respective components of the two [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] objects. |
| `-` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] with components that are the difference of the respective components of the two [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] objects. |

## Constructors

### new

```lua
UDim2.new(): UDim2
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] with both dimensions set to zero — equivalent to `UDim2.new(0, 0, 0, 0)`. All four components (X scale, X offset, Y scale, Y offset) default to `0`.

### new

```lua
UDim2.new(xScale: number = 0, xOffset: number = 0, yScale: number = 0, yOffset: number = 0): UDim2
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] from four numbers that define both axes. Each pair of arguments defines one dimension: `xScale` and `xOffset` for the horizontal (**X**) axis, then `yScale` and `yOffset` for the vertical (**Y**) axis. Scale is a relative fraction of the parent container's size (typically between `0` and `1`), while offset is an absolute logical pixel value added after scaling. All parameters default to `0`.

```lua
-- 50% width + 20 logical pixels padding, full height
local size = UDim2.new(0.5, 20, 1, 0)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `xScale` | number | `0` | The **X** dimension scale. |
| `xOffset` | number | `0` | The **X** dimension offset. |
| `yScale` | number | `0` | The **Y** dimension scale. |
| `yOffset` | number | `0` | The **Y** dimension offset. |

### new

```lua
UDim2.new(x: UDim, y: UDim): UDim2
```

Constructs a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] by composing two [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] values directly. The first argument becomes the horizontal dimension (accessible via `.X` or `.Width`) and the second becomes the vertical dimension (accessible via `.Y` or `.Height`).

```lua
local x = UDim.new(0.5, 10)
local y = UDim.new(1, 0)
local size = UDim2.new(x, y)  -- equivalent to UDim2.new(0.5, 10, 1, 0)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] for the horizontal (**X**) axis. |
| `y` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] for the vertical (**Y**) axis. |

### fromScale

```lua
UDim2.fromScale(xScale: number = 0, yScale: number = 0): UDim2
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] with the given scalar coordinates and no offsets. Equivalent to:

```lua
local xScale, yScale = 0.5, 0.25
print(UDim2.fromScale(xScale, yScale) == UDim2.new(xScale, 0, yScale, 0)) --> true
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `xScale` | number | `0` | The relative scale for the horizontal (**X**) axis. |
| `yScale` | number | `0` | The relative scale for the vertical (**Y**) axis. |

### fromOffset

```lua
UDim2.fromOffset(xOffset: number = 0, yOffset: number = 0): UDim2
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] with the given offset coordinates and no scaling. Equivalent to:

```lua
local xOffset, yOffset = 100, 50
print(UDim2.fromOffset(xOffset, yOffset) == UDim2.new(0, xOffset, 0, yOffset)) --> true
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `xOffset` | number | `0` | The absolute logical pixel offset for the horizontal (**X**) axis. |
| `yOffset` | number | `0` | The absolute logical pixel offset for the vertical (**Y**) axis. |

## Properties

### X

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

The [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] component for the horizontal axis. The returned [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] has a `.Scale` (relative fraction) and `.Offset` (absolute logical pixels). This property is equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#Width|UDim2.Width]].

```lua
local pos = UDim2.new(0.5, 10, 1, 0)
print(pos.X.Scale)   -- 0.5
print(pos.X.Offset)  -- 10
```

### Y

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

The [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] component for the vertical axis. The returned [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] has a `.Scale` (relative fraction) and `.Offset` (absolute logical pixels). This property is equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#Height|UDim2.Height]].

```lua
local pos = UDim2.new(0.5, 10, 1, 0)
print(pos.Y.Scale)   -- 1
print(pos.Y.Offset)  -- 0
```

### Width

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

A synonym for [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#X|UDim2.X]]. Returns the [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] component for the horizontal axis, containing both `.Scale` and `.Offset`.

### Height

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

A synonym for [[30 Official Roblox Docs/API Reference/Datatypes/UDim2#Y|UDim2.Y]]. Returns the [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] component for the vertical axis, containing both `.Scale` and `.Offset`.

## Methods

### Lerp

```lua
UDim2:Lerp(goal: UDim2, alpha: number): UDim2
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] interpolated linearly between this [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] and the given `goal`. The `alpha` value should be a number between `0` and `1`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `goal` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | The target [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] to interpolate toward. |
| `alpha` | number |  | A value between `0` (returns this UDim2) and `1` (returns `goal`) controlling the interpolation. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | A [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] where each axis is independently interpolated between this value and `goal` by the fraction `alpha`. |

---
*Source: [UDim2](https://create.roblox.com/docs/reference/engine/datatypes/UDim2) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
