---
title: "ValueCurveKey"
description: "A time-value pair used with `ValueCurve` instances."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/ValueCurveKey"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A time-value pair used with [[30 Official Roblox Docs/API Reference/Classes/ValueCurve|ValueCurve]] instances.*

## Description

A time-value pair used with [[30 Official Roblox Docs/API Reference/Classes/ValueCurve|ValueCurve]] instances.

The [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#Interpolation|Interpolation]] property dictates the interpolation mode for the segment started by this key and ended by the next key on the curve. Each segment may use a different interpolation mode.

The [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#LeftTangent|LeftTangent]] and [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#RightTangent|RightTangent]] properties apply to the cubic interpolation mode and define the desired tangent (slope) at the key. Different left and right values can be used to encode discontinuities in slope at the key. Attempting to set a [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#RightTangent|RightTangent]] value on a key that doesn't use the cubic interpolation mode will result in a runtime error. It is possible to set the [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#LeftTangent|LeftTangent]] property on any key, as it will be used should the preceding segment use cubic interpolation.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#new\|new()]] | `time`, `value`, `Interpolation` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]] from the given time and value. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#Interpolation\|Interpolation]] | [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|KeyInterpolationMode]] | The key interpolation mode for the segment started by this [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#Time\|Time]] | number | The time position of this [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#Value\|Value]] | any | The value of this [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#RightTangent\|RightTangent]] | number | The tangent to the right of this [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#LeftTangent\|LeftTangent]] | number | The tangent to the left of this [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]]. |

## Constructors

### new

```lua
ValueCurveKey.new(time: number, value: any, Interpolation: KeyInterpolationMode): ValueCurveKey
```

Creates a new [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey|ValueCurveKey]] at a given time and value. [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#LeftTangent|LeftTangent]] and [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#RightTangent|RightTangent]] are left uninitialized and, if not initialized, tangent values of '0' will be used when evaluating the curve.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | number |  | Time at which to create the new [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]]. |
| `value` | any |  | Value of the new [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]]. |
| `Interpolation` | [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|KeyInterpolationMode]] |  | The interpolation mode for the curve segment starting at this key. Defaults to [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|Enum.KeyInterpolationMode.Constant]] if omitted. |

## Properties

### Interpolation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|KeyInterpolationMode]]

Specifies the interpolation mode used for the curve segment that begins at this key and ends at the next key on the [[30 Official Roblox Docs/API Reference/Classes/ValueCurve|ValueCurve]]. Each segment of the curve can use a different interpolation mode. The default value is [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode.Constant]].

The available modes are:

- **Constant** — the segment holds the value of this key until the next key.
- **Linear** — the segment linearly interpolates between this key's value and the next key's value.
- **Cubic** — the segment uses a cubic Hermite spline defined by this key's [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#RightTangent|RightTangent]] and the next key's [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#LeftTangent|LeftTangent]].

Not all value types support Linear or Cubic interpolation. Non-numerical types such as strings, booleans, and enums revert to Constant interpolation regardless of this setting.

Changing this property to a non-cubic mode automatically clears the [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#RightTangent|RightTangent]] of this key, because only cubic segments use a right tangent.

### Time

**Type:** number

The time position of this [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey|ValueCurveKey]] along the curve. Defaults to `0`. Keys within a [[30 Official Roblox Docs/API Reference/Classes/ValueCurve|ValueCurve]] are stored sorted by their time values; the time determines where in the animation timeline this key's value applies.

### Value

**Type:** any

The value stored in this [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey|ValueCurveKey]]. Defaults to `nil`. Can hold any supported Luau type, including numbers, booleans, strings, [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]], [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]], [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]], [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]], [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]], [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]], and enums. All keys on a single [[30 Official Roblox Docs/API Reference/Classes/ValueCurve|ValueCurve]] must hold values of the same type; attempting to insert a key whose value type differs from existing keys produces an error.

### RightTangent

**Type:** number

The outgoing tangent (slope) at this key, used when the [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#Interpolation|Interpolation]] is [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode.Cubic]]. Defaults to `nil` (unset); when unset, an effective tangent of `0` is used during curve evaluation. Attempting to set this property on a key whose interpolation mode is not Cubic throws a runtime error. This property is automatically cleared when [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#Interpolation|Interpolation]] is changed to a non-cubic mode.

### LeftTangent

**Type:** number

The incoming tangent (slope) at this key, used when the preceding segment uses [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode.Cubic]] interpolation. Defaults to `nil` (unset); when unset, an effective tangent of `0` is used during curve evaluation. Unlike [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#RightTangent|RightTangent]], this property can be set on any key regardless of its own interpolation mode, because it defines the slope at the endpoint of the preceding cubic segment.

---
*Source: [ValueCurveKey](https://create.roblox.com/docs/reference/engine/datatypes/ValueCurveKey) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
