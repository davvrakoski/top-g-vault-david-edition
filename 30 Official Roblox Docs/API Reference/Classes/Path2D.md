---
title: "Path2D"
description: "Represents a 2D cubic spline path that renders a stroked curve under any `GuiObject`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Path2D"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a 2D cubic spline path that renders a stroked curve under any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`Path2D` is a UI instance that represents a 2D spline. It can be placed under any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] and be edited directly in the viewport using built‑in tooling. `Path2D` stores control points and exposes methods to sample positions along the curve, enabling curved UI layouts, path‑based animations, and interactive tools like graph editors and visual effects.

See the [[30 Official Roblox Docs/UI/2D paths|2D paths]] guide for more information and usage examples.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Closed\|Closed]] | boolean | Connects the first and last control points when enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Color3\|Color3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of the [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#SelectedControlPoint\|SelectedControlPoint]] | int | Index of the currently selected [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#SelectedControlPointData\|SelectedControlPointData]] | [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]] | [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]] data type representing the currently selected control point. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Thickness\|Thickness]] | float | Determines how thick the [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]] path is. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Visible\|Visible]] | boolean | Determines if the [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]] path is rendered or not. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#ZIndex\|ZIndex]] | int | Determines the order in which a [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]] path renders relative to other GUIs. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetBoundingRect\|GetBoundingRect()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] | Returns the bounding size for the [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetControlPoint\|GetControlPoint()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]] | Returns the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]] for a given index. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetControlPoints\|GetControlPoints()]] | Array | Returns all the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoints]] for the [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetLength\|GetLength()]] | float | Returns the length of the [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetMaxControlPoints\|GetMaxControlPoints()]] | int | Returns the maximum allowed number of control points. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetPositionOnCurve\|GetPositionOnCurve()]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Returns the position at a given value in parameter space. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetPositionOnCurveArcLength\|GetPositionOnCurveArcLength()]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Returns the position at a given value in arc length space. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetTangentOnCurve\|GetTangentOnCurve()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns the tangent at a given value in parameter space. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetTangentOnCurveArcLength\|GetTangentOnCurveArcLength()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns the tangent at a given value in arc length space. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#InsertControlPoint\|InsertControlPoint()]] | () | Inserts a new control point at a given index. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#RemoveControlPoint\|RemoveControlPoint()]] | () | Removes a control at the given index. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#SetControlPoints\|SetControlPoints()]] | () | Sets all the control points to the specified array, replacing all existing points with new ones. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#UpdateControlPoint\|UpdateControlPoint()]] | () | Updates a control point at the given index. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#ControlPointChanged\|ControlPointChanged]] |  | Fires any time control points change. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Closed

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to `true`, the path forms a closed loop by connecting the last control point back to the first. The closure only takes effect when the path has at least 3 control points. Defaults to `false`.

### Color3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the stroke color used to render the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]]. Defaults to `[0, 0, 0]` (black). A child [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] can override the solid color with a gradient fill.

### SelectedControlPoint

**Type:** int

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Control Points · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `NotReplicated`

The 1-based index of the currently selected control point. Defaults to `1` and is clamped to the range [1, number of control points]. Changing this value updates [[30 Official Roblox Docs/API Reference/Classes/Path2D#SelectedControlPointData|Path2D.SelectedControlPointData]] to reflect the control point at the new index.

### SelectedControlPointData

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Control Points · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `NotReplicated`

A read-only computed property that returns the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]] at the index specified by [[30 Official Roblox Docs/API Reference/Classes/Path2D#SelectedControlPoint|Path2D.SelectedControlPoint]]. If the path has no control points, returns a default-constructed [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]] (position and tangents all at `{0, 0, 0, 0}`).

### Thickness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the stroke width of the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] in pixels. Defaults to `1` and is clamped to the range [0, 100].

### Visible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines if the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] path is rendered or not. When `false`, the path will not render. However, any modifications to the control points will update correctly, ensuring that querying data will have the correct info.

### ZIndex

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the order in which a [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] path renders relative to other GUIs. Works the same as [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|GuiObject.ZIndex]] but does not interact with layout order in any way.

## Methods

### GetBoundingRect

```lua
Path2D:GetBoundingRect(): Rect
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]] bounding size for the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]]. This is computed based on the control points and is not modifiable outside of changing the control point data.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] bounding box that encloses the path, expanded by its rendered thickness. |

### GetControlPoint

```lua
Path2D:GetControlPoint(index: int): Path2DControlPoint
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]] for a given index. If the index is out of bounds, this method will throw an error.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | The 1-based index of the control point to return. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]] | The control point at the given index. |

### GetControlPoints

```lua
Path2D:GetControlPoints(): Array
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns a table of all the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoints]] for the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]].

**Returns**

| Type | Description |
| --- | --- |
| Array | Table of all the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoints]]. |

### GetLength

```lua
Path2D:GetLength(): float
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the length of the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]]. This function can be expensive if called too frequently.

**Returns**

| Type | Description |
| --- | --- |
| float | The total length of the path. |

### GetMaxControlPoints

```lua
Path2D:GetMaxControlPoints(): int
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns `100`, the hard upper limit on the number of control points a [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] can contain. Attempting to add points beyond this limit via [[30 Official Roblox Docs/API Reference/Classes/Path2D#InsertControlPoint|Path2D:InsertControlPoint()]] or [[30 Official Roblox Docs/API Reference/Classes/Path2D#SetControlPoints|Path2D:SetControlPoints()]] throws an error.

**Returns**

| Type | Description |
| --- | --- |
| int | The maximum number of control points a [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]] supports. |

### GetPositionOnCurve

```lua
Path2D:GetPositionOnCurve(t: float): UDim2
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the 2D [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] position at a given `t` value between `0` and `1` (inclusive), representing the parameter space result of querying the spline. The values will be more tightly packed near bends and wider apart in straighter segments; see [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetPositionOnCurveArcLength|GetPositionOnCurveArcLength()]] for even spacing results.

Throws an error if the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] has less than two control points.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `t` | float |  | The value to query the [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]] at. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | The position in parameter space. |

### GetPositionOnCurveArcLength

```lua
Path2D:GetPositionOnCurveArcLength(t: float): UDim2
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the 2D [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] position at a given `t` value between `0` and `1` (inclusive), representing the arc length space result of querying the spline. The values will be evenly spaced along the spline; see [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetPositionOnCurve|GetPositionOnCurve()]] for parameter spacing results.

Throws an error if the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] has less than two control points.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `t` | float |  | The value to query the Path2D at. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | The position in arc length space. |

### GetTangentOnCurve

```lua
Path2D:GetTangentOnCurve(t: float): Vector2
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the tangent at a given `t` value in parameter space where `t` is a value between `0` and `1` (inclusive). Throws an error if the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] has less than two control points.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `t` | float |  | The value to query the [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]] at. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The tangent in parameter space. |

### GetTangentOnCurveArcLength

```lua
Path2D:GetTangentOnCurveArcLength(t: float): Vector2
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the tangent at a given `t` value in arc length space where `t` is a value between `0` and `1` (inclusive). Throws an error if the [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] has less than two control points.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `t` | float |  | The value to query the [[30 Official Roblox Docs/API Reference/Classes/Path2D\|Path2D]] at. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The tangent in arc length space. |

### InsertControlPoint

```lua
Path2D:InsertControlPoint(index: int, point: Path2DControlPoint): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Inserts a new [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoint]] at a given index. Throws a warning if the index is out of bounds or if you're trying to add control points past the limit of 50.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | The index to insert at. |
| `point` | [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]] |  | The control point to insert. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RemoveControlPoint

```lua
Path2D:RemoveControlPoint(index: int): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Removes a control point at the given index. Throws a warning if the index is out of bounds.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | The index to remove at. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetControlPoints

```lua
Path2D:SetControlPoints(controlPoints: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Sets all the control points to the specified array, replacing all existing points with new ones. Throws a warning if there are more than 50 points in the `controlPoints` array.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `controlPoints` | Array |  | The new list of control points to set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### UpdateControlPoint

```lua
Path2D:UpdateControlPoint(index: int, point: Path2DControlPoint): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Updates the control point at the given index. Throws a warning if the index is out of range.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | The control point index to update. |
| `point` | [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]] |  | The new [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint\|Path2DControlPoint]] value to store at the index. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### ControlPointChanged

```lua
Path2D.ControlPointChanged()
```

**Capabilities:** UI

Fires whenever the path's control-point data is mutated. This includes calls to [[30 Official Roblox Docs/API Reference/Classes/Path2D#SetControlPoints|Path2D:SetControlPoints()]], [[30 Official Roblox Docs/API Reference/Classes/Path2D#InsertControlPoint|Path2D:InsertControlPoint()]], [[30 Official Roblox Docs/API Reference/Classes/Path2D#UpdateControlPoint|Path2D:UpdateControlPoint()]], and [[30 Official Roblox Docs/API Reference/Classes/Path2D#RemoveControlPoint|Path2D:RemoveControlPoint()]]. Does not fire for changes to visual properties such as [[30 Official Roblox Docs/API Reference/Classes/Path2D#Color3|Path2D.Color3]] or [[30 Official Roblox Docs/API Reference/Classes/Path2D#Thickness|Path2D.Thickness]].

---
*Source: [Path2D](https://create.roblox.com/docs/reference/engine/classes/Path2D) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
