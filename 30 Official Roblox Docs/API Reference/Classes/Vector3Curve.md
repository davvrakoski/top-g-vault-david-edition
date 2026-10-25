---
title: "Vector3Curve"
description: "Represents a 3D vector curve, grouping three `FloatCurve` instances."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Vector3Curve"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a 3D vector curve, grouping three [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] instances.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Represents a 3D vector curve, grouping three [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] instances. Each child [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] can be accessed via the [[30 Official Roblox Docs/API Reference/Classes/Vector3Curve#X|Vector3Curve:X()]], [[30 Official Roblox Docs/API Reference/Classes/Vector3Curve#Y|Vector3Curve:Y()]], and [[30 Official Roblox Docs/API Reference/Classes/Vector3Curve#Z|Vector3Curve:Z()]] methods. The three axes can be sampled simultaneously via the method [[30 Official Roblox Docs/API Reference/Classes/Vector3Curve#GetValueAtTime|Vector3Curve:GetValueAtTime()]].

*Code samples for this API (`creating-a-vector3curve`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Vector3Curve); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Vector3Curve#GetValueAtTime\|GetValueAtTime()]] | Array | Returns the three [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurves]] (X, Y, Z) at the passed time argument. |
| [[30 Official Roblox Docs/API Reference/Classes/Vector3Curve#X\|X()]] | [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the X channel (the first child instance of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `X`). |
| [[30 Official Roblox Docs/API Reference/Classes/Vector3Curve#Y\|Y()]] | [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the Y channel (the first child instance of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `Y`). |
| [[30 Official Roblox Docs/API Reference/Classes/Vector3Curve#Z\|Z()]] | [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the Z channel (the first child instance of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `Z`). |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetValueAtTime

```lua
Vector3Curve:GetValueAtTime(time: float): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns the three [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurves]] (X, Y, Z) at the passed time argument as an array of three numbers. If a channel curve is missing or no key is found in the curve, the channel is evaluated as `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | Time at which to get the value. |

**Returns**

| Type | Description |
| --- | --- |
| Array | The three [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurves]] (X, Y, Z) at the passed time argument. |

### X

```lua
Vector3Curve:X(): FloatCurve
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] controlling the X channel (the first child instance of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] named `X`). If none is found, an empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] is created.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | The [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the X channel, or a newly created empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] if none exists yet. |

### Y

```lua
Vector3Curve:Y(): FloatCurve
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] controlling the Y channel (the first child instance of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] named `Y`). If none is found, an empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] is created.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | The [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the Y channel, or a newly created empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] if none exists yet. |

### Z

```lua
Vector3Curve:Z(): FloatCurve
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns the [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] controlling the Z channel (the first child instance of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] named `Z`). If none is found, an empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] is created.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] | The [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] controlling the Z channel, or a newly created empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] if none exists yet. |

---
*Source: [Vector3Curve](https://create.roblox.com/docs/reference/engine/classes/Vector3Curve) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
