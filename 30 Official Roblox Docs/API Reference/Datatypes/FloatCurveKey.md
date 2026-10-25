---
title: "FloatCurveKey"
description: "A time-value pair used with `FloatCurve` instances."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/FloatCurveKey"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A time-value pair used with [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] instances.*

## Description

A time-value pair used with [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] instances.

The [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#Interpolation|Interpolation]] property dictates the interpolation mode for the segment started by this key and ended by the next key on the curve. Each segment may use a different interpolation mode.

The [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#LeftTangent|LeftTangent]] and [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#RightTangent|RightTangent]] properties apply to the cubic interpolation mode and define the desired tangent (slope) at the key. Different left and right values can be used to encode discontinuities in slope at the key. Attempting to set a [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#RightTangent|RightTangent]] value on a key that doesn't use the cubic interpolation mode will result in a runtime error. It is possible to set the [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#LeftTangent|LeftTangent]] property on any key, as it will be used should the preceding segment use cubic interpolation.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#new\|new()]] | `time`, `value`, `Interpolation` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]] from the given time and value. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#Interpolation\|Interpolation]] | [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|KeyInterpolationMode]] | The key interpolation mode for the segment started by this [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#Time\|Time]] | number | The time position of this [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#Value\|Value]] | number | The value of this [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#RightTangent\|RightTangent]] | number | The tangent to the right of this [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#LeftTangent\|LeftTangent]] | number | The tangent to the left of this [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]]. |

## Constructors

### new

```lua
FloatCurveKey.new(time: number, value: number, Interpolation: KeyInterpolationMode): FloatCurveKey
```

Creates a new [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey|FloatCurveKey]] at a given time and value. [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#LeftTangent|LeftTangent]] and [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#RightTangent|RightTangent]] are left uninitialized and, if not initialized, tangent values of 0 will be used when evaluating the curve.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | number |  | Time at which to create the new [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]]. |
| `value` | number |  | Value of the new [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]]. |
| `Interpolation` | [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|KeyInterpolationMode]] |  | The interpolation mode for the curve segment starting at this key. Defaults to [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|Cubic]] when omitted. |

## Properties

### Interpolation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|KeyInterpolationMode]]

Specifies the interpolation mode used for the curve segment that begins at this key and ends at the next key on the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]]. Each segment of the curve can use a different interpolation mode. The default value is [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode.Cubic]].

The available modes are:

- **Constant** — the segment holds the value of this key until the next key.
- **Linear** — the segment linearly interpolates between this key's value and the next key's value.
- **Cubic** — the segment uses a cubic Hermite spline defined by this key's [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#RightTangent|RightTangent]] and the next key's [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#LeftTangent|LeftTangent]].

Changing this property to a non-cubic mode automatically clears the [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#RightTangent|RightTangent]] of this key, because only cubic segments use a right tangent.

### Time

**Type:** number

The time position of this [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey|FloatCurveKey]] along the curve's timeline. The default value is `0`. Keys within a [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] are kept sorted in ascending time order; if you insert a key at a time that already exists on the curve, the existing key at that time is replaced.

### Value

**Type:** number

The numerical output value at this key's position on the curve. The default value is `0`. When a [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] is sampled at this key's [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#Time|Time]], the curve evaluates to this value (subject to any interpolation with neighboring keys depending on the sampling time).

### RightTangent

**Type:** number

The slope of the curve leaving this key toward the next key. The default value is `nil`, which means the tangent is automatically computed (an effective value of `0` is used during evaluation). This property can only be set when [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#Interpolation|Interpolation]] is [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode.Cubic]]; attempting to set it on a key with Constant or Linear interpolation raises a runtime error. Pairing a different RightTangent value on this key with a different [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#LeftTangent|LeftTangent]] value on the next key creates a discontinuity in slope (a "corner") at the next key.

### LeftTangent

**Type:** number

The slope of the curve arriving at this key from the previous key. The default value is `nil`, which means the tangent is automatically computed (an effective value of `0` is used during evaluation). Unlike [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#RightTangent|RightTangent]], this property can be set on a key with any interpolation mode, because the preceding segment may itself use cubic interpolation and therefore needs a defined left tangent at this endpoint.

---
*Source: [FloatCurveKey](https://create.roblox.com/docs/reference/engine/datatypes/FloatCurveKey) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
