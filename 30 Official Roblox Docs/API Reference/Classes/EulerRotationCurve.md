---
title: "EulerRotationCurve"
description: "Represents a 3D rotation curve through a group of three `FloatCurves`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/EulerRotationCurve"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a 3D rotation curve through a group of three [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurves]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A **EulerRotationCurve** represents a 3D rotation curve through a group of three [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurves]]. The rotation is decomposed in three Euler angles channels that can be accessed via [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#X|EulerRotationCurve:X()]], [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#Y|EulerRotationCurve:Y()]], and [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#Z|EulerRotationCurve:Z()]]. The three axes can be sampled simultaneously via [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#GetAnglesAtTime|EulerRotationCurve:GetAnglesAtTime()]], returning the three Euler angles as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. Similarly, [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#GetRotationAtTime|EulerRotationCurve:GetRotationAtTime()]] samples all channels simultaneously but returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] rotated by `X`, `Y`, and `Z` according to the specified rotation order.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#RotationOrder\|RotationOrder]] | [[30 Official Roblox Docs/API Reference/Enums/RotationOrder\|RotationOrder]] | Euler angles rotation order. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#GetAnglesAtTime\|GetAnglesAtTime()]] | Array | Samples the three [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurves]] (`X`, `Y`, `Z`) at the passed `time` argument and returns the result as three Euler angles. |
| [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#GetRotationAtTime\|GetRotationAtTime()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Samples the [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve\|EulerRotationCurve]] at a given `time` and returns the corresponding rotation. |
| [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#X\|X()]] | [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the `X` Euler angle channel. |
| [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#Y\|Y()]] | [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the `Y` Euler angle channel. |
| [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#Z\|Z()]] | [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the `Z` Euler angle channel. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### RotationOrder

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RotationOrder|RotationOrder]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Euler angles rotation order

## Methods

### GetAnglesAtTime

```lua
EulerRotationCurve:GetAnglesAtTime(time: float): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Samples the three [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurves]] (`X`, `Y`, `Z`) at the passed `time` argument and returns the result as three Euler angles. If a channel curve is missing or no key is found in the curve, the channel is evaluated as `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | The time, in seconds, at which to sample the three channel curves. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of three values holding the sampled `X`, `Y`, and `Z` Euler angles; any channel whose curve is missing or has no key at `time` is returned as `nil`. |

### GetRotationAtTime

```lua
EulerRotationCurve:GetRotationAtTime(time: float): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Samples the [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve|EulerRotationCurve]] at a given `time` and returns the corresponding rotation. Empty Euler angles channels are interpreted as zero.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | The time, in seconds, at which to sample the curve. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | A [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] whose rotation is composed from the `X`, `Y`, and `Z` Euler angles sampled at `time`, applied in the order given by [[30 Official Roblox Docs/API Reference/Classes/EulerRotationCurve#RotationOrder\|EulerRotationCurve.RotationOrder]]; empty channels are treated as zero. |

### X

```lua
EulerRotationCurve:X(): FloatCurve
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] controlling the `X` Euler angle channel. It is the first child instance of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] named `X`. If none is found, an empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] is created.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | The [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the `X` Euler angle channel. |

### Y

```lua
EulerRotationCurve:Y(): FloatCurve
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] controlling the `Y` Euler angle channel. It is the first child instance of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] named `Y`. If none is found, an empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] is created.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | The [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the `Y` Euler angle channel. |

### Z

```lua
EulerRotationCurve:Z(): FloatCurve
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] controlling the `Z` Euler angle channel. It is the first child instance of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] named `Z`. If none is found, an empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] is created.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | The [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the `Z` Euler angle channel. |

---
*Source: [EulerRotationCurve](https://create.roblox.com/docs/reference/engine/classes/EulerRotationCurve) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
