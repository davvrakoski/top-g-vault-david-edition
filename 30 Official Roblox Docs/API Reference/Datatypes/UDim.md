---
title: "UDim"
description: "Represents a one-dimensional value with two components, a relative scale and an absolute offset."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/UDim"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents a one-dimensional value with two components, a relative scale and an absolute offset.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] data type represents a one-dimensional value with two components: a relative scale and an absolute offset in logical pixels. At evaluation time, the engine computes the final pixel value as `Scale * referenceMeasurement + Offset`, where the reference measurement is typically the size of a parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] along the corresponding axis.

UDim values appear individually in properties such as [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|UICorner.CornerRadius]], [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingTop|UIPadding.PaddingTop]], and [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness|UIStroke.Thickness]], or paired as a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] for two-dimensional sizing and positioning.

```lua
-- 50% of the parent plus 10 extra logical pixels
local dimension = UDim.new(0.5, 10)
```

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim#new\|new()]] | `Scale`, `Offset` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] from the given components. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]] | number | The relative scale component of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] | number | The absolute offset component of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]]. |

## Math operations

| Operation | Type A | Type B | Returns | Summary |
| --- | --- | --- | --- | --- |
| `+` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] representing the sum of the two [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] values. |
| `-` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] representing the difference between the two [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] values. |

## Constructors

### new

```lua
UDim.new(Scale: number, Offset: number): UDim
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] from the given `Scale` and `Offset` components. Both parameters are optional and default to `0` when omitted; calling `UDim.new()` with no arguments produces a UDim equivalent to `UDim.new(0, 0)`.

```lua
local fullScale = UDim.new(1, 0)    -- 100% of parent, no pixel offset
local fixedPixels = UDim.new(0, 200) -- 0% scale, 200 pixel offset
local mixed = UDim.new(0.5, 20)      -- 50% of parent plus 20 pixels
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Scale` | number |  | The relative scale component, expressed as a fraction of the reference measurement (for example, `0.5` for 50% of the parent size along the corresponding axis). Defaults to `0`. |
| `Offset` | number |  | The absolute pixel offset added after the scale is applied. Stored as an integer. Defaults to `0`. |

## Properties

### Scale

**Type:** number

The relative scale component of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]], expressed as a fraction of a reference measurement (typically the corresponding axis of a parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]). A value of `1` represents the full reference measurement, `0.5` represents half, and `0` means the scale contributes nothing to the resolved pixel value. Defaults to `0` when not specified in the constructor. This property is read-only.

### Offset

**Type:** number

The absolute offset component of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] in pixels. This value is added to the resolved scale portion (`Scale * referenceMeasurement`) to produce the final pixel measurement. The offset is stored as an integer. Defaults to `0` when not specified in the constructor. This property is read-only.

---
*Source: [UDim](https://create.roblox.com/docs/reference/engine/datatypes/UDim) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
