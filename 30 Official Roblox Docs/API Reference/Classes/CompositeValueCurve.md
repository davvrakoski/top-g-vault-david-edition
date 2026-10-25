---
title: "CompositeValueCurve"
description: "An animation curve that groups child `FloatCurves` which each animate a different component of a non-unary value."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CompositeValueCurve"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An animation curve that groups child [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurves]] which each animate a different component of a non-unary value.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An animation curve that groups child [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurves]] which each animate a different component of a non-unary value. The [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#CurveType|CurveType]] property specifies the type of value to be animated and, depending on this value, differently named children are used to drive the animation of the components of the value.

As follows are the names of the child curves that drive the animation for each possible [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|Enum.CompositeValueCurveType]] value for [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#CurveType|CurveType]]:

- [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|ColorRGB]]:
- [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|ColorHSV]]:
- [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|NumberRange]]:
- [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|Rect]]:
- [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|UDim]]:
- [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|UDim2]]:
- [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|Vector2]]:
- [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|Vector3]]:

The children that drive the animation can be accessed via the [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetComponentCurves|GetComponentCurves()]] method which returns an array of curves in the order specified above. The value of the curve at a given time in the animation may be sampled by the [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetValueAtTime|GetValueAtTime()]] method.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#CurveType\|CurveType]] | [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType\|CompositeValueCurveType]] | The type of value animated by this [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve\|CompositeValueCurve]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetComponentCurves\|GetComponentCurves()]] | List<[[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]]> | Returns the child curves with the given names for the [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#CurveType\|CurveType]] of this [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve\|CompositeValueCurve]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetValueAtTime\|GetValueAtTime()]] | Variant | Returns the sampled animated value at the passed `time` argument. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CurveType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|CompositeValueCurveType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The type of value animated by this [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve|CompositeValueCurve]]. See [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|Enum.CompositeValueCurveType]] for options.

## Methods

### GetComponentCurves

```lua
CompositeValueCurve:GetComponentCurves(): List<FloatCurve>
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method returns the child curves with the given names for the [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#CurveType|CurveType]] of this [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve|CompositeValueCurve]], in the order given by the list of child curves outlined at the top of this page. Any curve that does not exist prior to calling this method will be created and added as a child with the appropriate name. That new curve will be an empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]].

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]]> | An array of the child [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] instances that drive the components of the animated value, in the order listed at the top of this page. Any expected child curve that does not yet exist is created as an empty [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] and included in the result. |

### GetValueAtTime

```lua
CompositeValueCurve:GetValueAtTime(time: float): Variant
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method returns the sampled animated value at the passed `time` argument. The type of the returned value will match that specified by the [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#CurveType|CurveType]] property.

If any child curve is missing from the children of the curve, the corresponding value in the returned property will be `0`. For example, if a curve has a [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#CurveType|CurveType]] of [[30 Official Roblox Docs/API Reference/Enums/CompositeValueCurveType|Enum.CompositeValueCurveType.ColorRGB]] but only one [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] child named `"G"`, then the returned [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] will have values of `0` for `"R"` and `"B"`, but the `"G"` value will be sampled from the child curve.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | Time at which to get the value. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The value of the curve at the passed time. |

---
*Source: [CompositeValueCurve](https://create.roblox.com/docs/reference/engine/classes/CompositeValueCurve) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
