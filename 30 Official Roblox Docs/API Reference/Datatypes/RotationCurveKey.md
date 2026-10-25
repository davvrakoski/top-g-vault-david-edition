---
title: "RotationCurveKey"
description: "A time-value pair used with `RotationCurve` instances."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/RotationCurveKey"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A time-value pair used with [[30 Official Roblox Docs/API Reference/Classes/RotationCurve|RotationCurve]] instances.*

## Description

A time-value pair used with [[30 Official Roblox Docs/API Reference/Classes/RotationCurve|RotationCurve]] instances.

The [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#Interpolation|Interpolation]] property dictates the interpolation mode for the segment started by this key and ended by the next key on the curve. Each segment may use a different interpolation mode.

The [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#LeftTangent|LeftTangent]] and [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#RightTangent|RightTangent]] properties apply to the cubic interpolation mode and define the desired tangent (slope) at the key. Different left and right values can be used to encode discontinuities in slope at the key. Attempting to set a [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#RightTangent|RightTangent]] value on a key that doesn't use the cubic interpolation mode will result in a runtime error. It is possible to set the [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#LeftTangent|LeftTangent]] property on any key, as it will be used should the preceding segment use cubic interpolation.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#new\|new()]] | `time`, `cframe`, `Interpolation` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]] at a given time with a given [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#Interpolation\|Interpolation]] | [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|KeyInterpolationMode]] | The key interpolation mode for the segment started by this [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#Time\|Time]] | number | The time position of this [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#Value\|Value]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] value of this [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#RightTangent\|RightTangent]] | number | The tangent to the right of this [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#LeftTangent\|LeftTangent]] | number | The tangent to the left of this [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]]. |

## Constructors

### new

```lua
RotationCurveKey.new(time: number, cframe: CFrame, Interpolation: KeyInterpolationMode): RotationCurveKey
```

Creates a new [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey|RotationCurveKey]] at a given time with a given [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#LeftTangent|LeftTangent]] and [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#RightTangent|RightTangent]] are left uninitialized and, if not initialized, tangent values of 0 will be used when evaluating the curve.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | number |  | Time at which to create the new [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]]. |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the new [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]]. |
| `Interpolation` | [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|KeyInterpolationMode]] |  | The interpolation mode for the segment started by this key. Defaults to [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|Enum.KeyInterpolationMode.Cubic]]. |

## Properties

### Interpolation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|KeyInterpolationMode]]

Defines the interpolation mode used for the curve segment that begins at this key and ends at the next key. Possible values are [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode.Constant]] (holds the key's value until the next key), [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode.Linear]] (linearly interpolates between this key and the next using spherical linear interpolation), and [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode.Cubic]] (uses a cubic hermite spline shaped by [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#RightTangent|RightTangent]] and the next key's [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#LeftTangent|LeftTangent]]). Defaults to [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode.Cubic]].

Setting this property to a non-cubic mode automatically clears [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#RightTangent|RightTangent]] (because tangent slope is only meaningful in cubic segments).

### Time

**Type:** number

The time position of this [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey|RotationCurveKey]] along the curve's timeline, in seconds. Keys within a [[30 Official Roblox Docs/API Reference/Classes/RotationCurve|RotationCurve]] are kept sorted by ascending time; inserting a key at the same time as an existing key replaces the existing key. Defaults to `0`.

### Value

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

The rotation stored at this key, represented as a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. Only the rotational component of the CFrame is used; the positional component is ignored. Defaults to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#identity|CFrame.identity]].

### RightTangent

**Type:** number

The outgoing tangent (slope) at this key, controlling the shape of the cubic segment that extends toward the next key. Defaults to `0`. This property can only be set when [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#Interpolation|Interpolation]] is [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode.Cubic]]; attempting to set it on a key with a different interpolation mode raises a runtime error. Returns `nil` if the tangent has not been explicitly assigned.

### LeftTangent

**Type:** number

The incoming tangent (slope) at this key, controlling the shape of the cubic segment arriving from the previous key. Defaults to `0`. Unlike [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#RightTangent|RightTangent]], this property can be set on a key regardless of its own interpolation mode, because the preceding segment may use cubic interpolation and needs a defined slope at its endpoint. Returns `nil` if the tangent has not been explicitly assigned.

---
*Source: [RotationCurveKey](https://create.roblox.com/docs/reference/engine/datatypes/RotationCurveKey) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
