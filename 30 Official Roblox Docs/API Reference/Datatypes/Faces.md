---
title: "Faces"
description: "A data type containing six booleans, each representing a face of a `BasePart`."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Faces"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A data type containing six booleans, each representing a face of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Faces|Faces]] data type contains six booleans representing whether a feature is enabled for each face ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]]) of a Part. In other words, this contains a boolean for each axes (X/Y/Z) in both directions (positive/negative). The [[30 Official Roblox Docs/API Reference/Classes/Handles|Handles]] object uses this data type to enable whether a direction has a visible handle on a Part's face.

```lua
local handles = Instance.new("Handles")
handles.Faces = Faces.new(Enum.NormalId.Front, Enum.NormalId.Left)
```

Like most data types on Roblox, the `Faces` data type is immutable and you cannot assign to its properties once created.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Faces#new\|new()]] | `normalIds...` | Returns a `Faces` with the corresponding face of each passed [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] as `true`. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Faces#Top\|Top]] | bool | Whether the top face is included. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Faces#Bottom\|Bottom]] | bool | Whether the bottom face is included. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Faces#Left\|Left]] | bool | Whether the left face is included. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Faces#Right\|Right]] | bool | Whether the right face is included. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Faces#Back\|Back]] | bool | Whether the back face is included. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Faces#Front\|Front]] | bool | Whether the front face is included. |

## Constructors

### new

```lua
Faces.new(normalIds...: Tuple): Faces
```

Creates a new `Faces` given some number of [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]] as arguments. Each [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]] provided indicates the property of the same name in the new `Faces` will be `true`.

- The [[30 Official Roblox Docs/API Reference/Libraries/table#unpack|table.unpack()]] function can be used to unpack a table of NormalId to be included.
- Passing values that are not a [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]] will do nothing; they are ignored silently.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `normalIds...` | Tuple |  | Any number of [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] values indicating which faces to enable in the new `Faces`. |

## Properties

### Top

**Type:** bool

Whether the top face (positive **Y** direction, corresponding to [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Top]]) is included in this [[30 Official Roblox Docs/API Reference/Datatypes/Faces|Faces]] value. Defaults to `false` when [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Top]] is not passed to the [[30 Official Roblox Docs/API Reference/Datatypes/Faces#new|Faces.new()]] constructor.

### Bottom

**Type:** bool

Whether the bottom face (negative **Y** direction, corresponding to [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Bottom]]) is included in this [[30 Official Roblox Docs/API Reference/Datatypes/Faces|Faces]] value. Defaults to `false` when [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Bottom]] is not passed to the [[30 Official Roblox Docs/API Reference/Datatypes/Faces#new|Faces.new()]] constructor.

### Left

**Type:** bool

Whether the left face (negative **X** direction, corresponding to [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Left]]) is included in this [[30 Official Roblox Docs/API Reference/Datatypes/Faces|Faces]] value. Defaults to `false` when [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Left]] is not passed to the [[30 Official Roblox Docs/API Reference/Datatypes/Faces#new|Faces.new()]] constructor.

### Right

**Type:** bool

Whether the right face (positive **X** direction, corresponding to [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Right]]) is included in this [[30 Official Roblox Docs/API Reference/Datatypes/Faces|Faces]] value. Defaults to `false` when [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Right]] is not passed to the [[30 Official Roblox Docs/API Reference/Datatypes/Faces#new|Faces.new()]] constructor.

### Back

**Type:** bool

Whether the back face (positive **Z** direction, corresponding to [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Back]]) is included in this [[30 Official Roblox Docs/API Reference/Datatypes/Faces|Faces]] value. Defaults to `false` when [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Back]] is not passed to the [[30 Official Roblox Docs/API Reference/Datatypes/Faces#new|Faces.new()]] constructor.

### Front

**Type:** bool

Whether the front face (negative **Z** direction, corresponding to [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Front]]) is included in this [[30 Official Roblox Docs/API Reference/Datatypes/Faces|Faces]] value. Defaults to `false` when [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Front]] is not passed to the [[30 Official Roblox Docs/API Reference/Datatypes/Faces#new|Faces.new()]] constructor.

---
*Source: [Faces](https://create.roblox.com/docs/reference/engine/datatypes/Faces) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
