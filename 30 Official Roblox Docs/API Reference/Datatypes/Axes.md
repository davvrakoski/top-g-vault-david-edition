---
title: "Axes"
description: "The `Axes` data type is for the `ArcHandles` class to control which rotation axes are currently enabled."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Axes"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*The `Axes` data type is for the [[30 Official Roblox Docs/API Reference/Classes/ArcHandles|ArcHandles]] class to control which rotation axes are currently enabled.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Axes|Axes]] data type contains a set of enabled 3D axes, represented as a bitmask. It is used by the [[30 Official Roblox Docs/API Reference/Classes/ArcHandles|ArcHandles]] class through its [[30 Official Roblox Docs/API Reference/Classes/ArcHandles#Axes|Axes]] property to control which rotation arc handles are visible.

[[30 Official Roblox Docs/API Reference/Datatypes/Axes|Axes]] exposes three axis properties (`X`, `Y`, `Z`) and six face properties (`Top`, `Bottom`, `Left`, `Right`, `Front`, `Back`). Because faces map to their corresponding axis, face pairs always share the same value: `Top` and `Bottom` both reflect the Y axis, `Left` and `Right` both reflect the X axis, and `Front` and `Back` both reflect the Z axis.

```lua
-- Enable arc handles for the X and Y axes only
local arcHandles = Instance.new("ArcHandles")
arcHandles.Axes = Axes.new(Enum.Axis.X, Enum.Axis.Y)
```

Like most data types on Roblox, the [[30 Official Roblox Docs/API Reference/Datatypes/Axes|Axes]] data type is immutable: you cannot assign to its properties once created.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Axes#new\|new()]] | `axes` | Creates a new Axes using list of axes and/or faces. NormalIds (faces) are converted to the corresponding axes. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Axes#X\|X]] | bool | Whether the X axis is enabled. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Axes#Y\|Y]] | bool | Whether the Y axis is enabled. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Axes#Z\|Z]] | bool | Whether the Z axis is enabled. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Axes#Top\|Top]] | bool | Whether the top face is included. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Axes#Bottom\|Bottom]] | bool | Whether the bottom face is included. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Axes#Left\|Left]] | bool | Whether the left face is included. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Axes#Right\|Right]] | bool | Whether the right face is included. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Axes#Back\|Back]] | bool | Whether the back face is included. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Axes#Front\|Front]] | bool | Whether the front face is included. |

## Constructors

### new

```lua
Axes.new(axes: Tuple): Axes
```

Creates a new [[30 Official Roblox Docs/API Reference/Datatypes/Axes|Axes]] from up to 6 [[30 Official Roblox Docs/API Reference/Enums/Axis|Enum.Axis]] or [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]] values. Each [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]] is converted to its corresponding axis (for example, [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Top]] and [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Bottom]] both enable the Y axis). Calling `Axes.new()` with no arguments returns an Axes with all properties set to `false`.

```lua
-- Using Enum.Axis values
local axes = Axes.new(Enum.Axis.X, Enum.Axis.Z)
print(axes.X) -- true
print(axes.Y) -- false

-- Using Enum.NormalId values (converted to axes)
local axes2 = Axes.new(Enum.NormalId.Top, Enum.NormalId.Right)
print(axes2.Y) -- true (Top -> Y axis)
print(axes2.X) -- true (Right -> X axis)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axes` | Tuple |  | Any combination of [[30 Official Roblox Docs/API Reference/Enums/Axis\|Enum.Axis]] and/or [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] values (up to 6) specifying which axes to enable. |

## Properties

### X

**Type:** bool

Whether the X axis is enabled. Defaults to `false` when constructed via `Axes.new()` with no arguments. This property is equivalent to both `Left` and `Right`, which also reflect the X axis state.

### Y

**Type:** bool

Whether the Y axis is enabled. Defaults to `false` when constructed via `Axes.new()` with no arguments. This property is equivalent to both `Top` and `Bottom`, which also reflect the Y axis state.

### Z

**Type:** bool

Whether the Z axis is enabled. Defaults to `false` when constructed via `Axes.new()` with no arguments. This property is equivalent to both `Front` and `Back`, which also reflect the Z axis state.

### Top

**Type:** bool

Whether the top face is included. This corresponds to the positive Y direction ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Top]]) and is always equal to the `Y` property. Defaults to `false`.

### Bottom

**Type:** bool

Whether the bottom face is included. This corresponds to the negative Y direction ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Bottom]]) and is always equal to the `Y` property. Defaults to `false`.

### Left

**Type:** bool

Whether the left face is included. This corresponds to the negative X direction ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Left]]) and is always equal to the `X` property. Defaults to `false`.

### Right

**Type:** bool

Whether the right face is included. This corresponds to the positive X direction ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Right]]) and is always equal to the `X` property. Defaults to `false`.

### Back

**Type:** bool

Whether the back face is included. This corresponds to the positive Z direction ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Back]]) and is always equal to the `Z` property. Defaults to `false`.

### Front

**Type:** bool

Whether the front face is included. This corresponds to the negative Z direction ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Front]]) and is always equal to the `Z` property. Defaults to `false`.

---
*Source: [Axes](https://create.roblox.com/docs/reference/engine/datatypes/Axes) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
