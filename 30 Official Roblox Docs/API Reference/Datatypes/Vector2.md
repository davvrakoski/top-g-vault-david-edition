---
title: "Vector2"
description: "Represents a 2D value with direction and magnitude."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Vector2"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents a 2D value with direction and magnitude.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] data type represents a 2D value with direction and magnitude. Some applications include GUI elements and 2D mouse positions.

#### Math Operations

The following math operations are valid for the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] data type:

| Operation | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] `+` [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component of the second added to the corresponding component of the first. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] `-` [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component of the second subtracted from the corresponding component of the first. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] `*` [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component of the second multiplied by the corresponding component of the first. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] `/` [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component of the first divided by the corresponding component of the second. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] `*` `number` | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component multiplied by the number. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] `/` `number` | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component divided by the number. |

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#new\|new()]] | `x`, `y` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] from the given x and y components. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#X\|X]] | number | The x-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Y\|Y]] | number | The y-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Magnitude\|Magnitude]] | number | The length of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Unit\|Unit]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A normalized copy of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]. |

### Constants

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#zero\|zero]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with a magnitude of zero. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#one\|one]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with a value of 1 on every axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#xAxis\|xAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with a value of 1 on the X axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#yAxis\|yAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with a value of 1 on the Y axis. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Cross\|Cross()]] | number | Returns the cross product of the two vectors. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Abs\|Abs()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns a new vector from the absolute values of the original's components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Ceil\|Ceil()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns a new vector from the ceiling of the original's components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Floor\|Floor()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns a new vector from the floor of the original's components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Sign\|Sign()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns a new vector from the sign (-1, 0, or 1) of the original's components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Angle\|Angle()]] | number | Returns the angle in radians between the two vectors. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Dot\|Dot()]] | number | Returns a scalar dot product of the two vectors. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Lerp\|Lerp()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] linearly interpolated between this [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] and the given goal by the given alpha. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Max\|Max()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component as the highest among the respective components of the provided [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] objects. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Min\|Min()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component as the lowest among the respective components of the provided [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] objects. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#FuzzyEq\|FuzzyEq()]] | bool | Returns `true` if the X and Y components of the other [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] are within epsilon units of each corresponding component of this [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]. |

## Math operations

| Operation | Type A | Type B | Returns | Summary |
| --- | --- | --- | --- | --- |
| `+` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component of the second added to the corresponding component of the first. |
| `-` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component of the second subtracted from the corresponding component of the first. |
| `*` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component of the second multiplied by the corresponding component of the first. |
| `/` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component of the first divided by the corresponding component of the second. |
| `*` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | number | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component multiplied by the number. |
| `/` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | number | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with each component divided by the number. |

## Constructors

### new

```lua
Vector2.new(x: number, y: number): Vector2
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] from the given x and y components. Both parameters default to `0` if not provided.

```lua
local a = Vector2.new(3, 4)
print(a.X, a.Y)  --> 3  4

-- Omitted arguments default to 0
local b = Vector2.new()
print(b.X, b.Y)  --> 0  0
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The x-coordinate of the new vector (defaults to 0). |
| `y` | number |  | The y-coordinate of the new vector (defaults to 0). |

## Properties

### X

**Type:** number

The x-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]], corresponding to the first argument passed to [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#new|Vector2.new()]]. This property is read-only.

```lua
local v = Vector2.new(3, 4)
print(v.X)  --> 3
```

### Y

**Type:** number

The y-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]], corresponding to the second argument passed to [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#new|Vector2.new()]]. This property is read-only.

```lua
local v = Vector2.new(3, 4)
print(v.Y)  --> 4
```

### Magnitude

**Type:** number

The length (magnitude) of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]], computed as `math.sqrt(X^2 + Y^2)`. This property is read-only.

```lua
local v = Vector2.new(3, 4)
print(v.Magnitude)  --> 5
```

### Unit

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

A normalized copy of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] — one that has the same direction as the original but a magnitude of 1. If the vector has zero magnitude the result is undefined (contains `nan` values). This property is read-only.

```lua
local v = Vector2.new(3, 4)
print(v.Unit)             --> 0.6, 0.8
print(v.Unit.Magnitude)   --> 1
```

## Constants

### zero

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] with a magnitude of zero.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] object.

```lua
print(Vector2.zero)  --> 0, 0
```

### one

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] with a value of 1 on every axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] object.

```lua
print(Vector2.one)  --> 1, 1
```

### xAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] with a value of 1 on the X axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] object.

```lua
print(Vector2.xAxis)  --> 1, 0
```

### yAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] with a value of 1 on the Y axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] object.

```lua
print(Vector2.yAxis)  --> 0, 1
```

## Methods

### Cross

```lua
Vector2:Cross(other: Vector2): number
```

Returns the 2D cross product of this vector with `other`, computed as `self.X * other.Y - self.Y * other.X`. Unlike [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Cross|Vector3:Cross()]] which returns a vector, the 2D cross product returns a scalar representing the signed magnitude of the perpendicular (Z) component. The result is positive when `other` is counter-clockwise from `self`, negative when clockwise, and zero when the vectors are parallel.

```lua
local a = Vector2.new(1, 0)
local b = Vector2.new(0, 1)
print(a:Cross(b))  -->  1
print(b:Cross(a))  --> -1
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The vector to compute the cross product against. |

**Returns**

| Type | Description |
| --- | --- |
| number | The signed scalar magnitude of the perpendicular component, computed as `self.X * other.Y - self.Y * other.X`. |

### Abs

```lua
Vector2:Abs(): Vector2
```

Returns a new vector from the absolute values of the original's components. For example, a vector of `(-2, 4)` returns a vector of `(2, 4)`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A new vector whose components are the absolute values of the original's components. |

### Ceil

```lua
Vector2:Ceil(): Vector2
```

Returns a new vector from the ceiling of the original's components. For example, a vector of `(-2.6, 5.1)` returns a vector of `(-2, 6)`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A new vector whose components are the ceiling (rounded up) of the original's components. |

### Floor

```lua
Vector2:Floor(): Vector2
```

Returns a new vector from the floor of the original's components. For example, a vector of `(-2.6, 5.1)` returns a vector of `(-3, 5)`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A new vector whose components are the floor (rounded down) of the original's components. |

### Sign

```lua
Vector2:Sign(): Vector2
```

Returns a new vector from the sign (-1, 0, or 1) of the original's components. For example, a vector of `(-2.6, 5.1)` returns a vector of `(-1, 1)`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A new vector whose components are the sign (-1, 0, or 1) of the original's components. |

### Angle

```lua
Vector2:Angle(other: Vector2, isSigned: boolean = False): number
```

Returns the angle in radians between the two vectors. Specify `true` for the optional `isSigned` boolean if you want a signed angle. By default, the method returns the absolute value. Signed angles are a negative when going clockwise. Values are in the range `[0, pi]` for absolute angles and `[-pi, pi]` for signed angles.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The vector to measure the angle to. |
| `isSigned` | boolean | `False` | Whether to return a signed angle (negative when clockwise) instead of the absolute value. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### Dot

```lua
Vector2:Dot(v: Vector2): number
```

Returns the scalar dot product of this vector and `v`, computed as `self.X * v.X + self.Y * v.Y`. The result equals the product of the two magnitudes multiplied by the cosine of the angle between them. A positive value means the vectors point in roughly the same direction; zero means they are perpendicular; negative means they point in roughly opposite directions.

```lua
local a = Vector2.new(1, 0)
local b = Vector2.new(0, 1)
print(a:Dot(b))  --> 0  (perpendicular)
print(a:Dot(a))  --> 1  (parallel, equal to Magnitude^2)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The vector to compute the dot product with. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### Lerp

```lua
Vector2:Lerp(v: Vector2, alpha: number): Vector2
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] linearly interpolated between this [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] and the given goal `v` by the fraction `alpha`, using the formula `self + (v - self) * alpha`. An `alpha` of 0 returns `self`, an `alpha` of 1 returns `v`, and values between 0 and 1 return a point in between. Note that `alpha` is **not** clamped to `[0, 1]` — values outside that range extrapolate beyond the two endpoints.

```lua
local a = Vector2.new(0, 0)
local b = Vector2.new(4, 8)
print(a:Lerp(b, 0.5))  --> 2, 4
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The goal vector to interpolate toward. |
| `alpha` | number |  | The interpolation fraction, where 0 returns this vector and 1 returns `v`. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  |

### Max

```lua
Vector2:Max(others...: Tuple): Vector2
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] with each component as the highest among the respective components of the provided [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] objects.

```lua
local a = Vector2.new(1, 2)
local b = Vector2.new(2, 1)

print(a:Max(b)) -- Vector2.new(2, 2)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `others...` | Tuple |  | One or more [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] objects to compare against. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  |

### Min

```lua
Vector2:Min(others...: Tuple): Vector2
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] with each component as the lowest among the respective components of the provided [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] objects.

```lua
local a = Vector2.new(1, 2)
local b = Vector2.new(2, 1)

print(a:Min(b)) -- Vector2.new(1, 1)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `others...` | Tuple |  | One or more [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] objects to compare against. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  |

### FuzzyEq

```lua
Vector2:FuzzyEq(other: Vector2, epsilon: number = 0.00001 (1e-5)): bool
```

Returns `true` if the X and Y components of the other [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] are within `epsilon` units of each corresponding component of this [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]. The comparison is per-component: both `math.abs(self.X - other.X)` and `math.abs(self.Y - other.Y)` must be less than or equal to `epsilon`. The optional `epsilon` parameter defaults to `1e-5` (0.00001) and must be a positive value no greater than `0.1`.

```lua
local a = Vector2.new(1, 2)
local b = Vector2.new(1.000009, 2.000009)
print(a:FuzzyEq(b))           --> true  (within default 1e-5)
print(a:FuzzyEq(b, 0.000001)) --> false (tighter epsilon)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The vector to compare against. |
| `epsilon` | number | `0.00001 (1e-5)` | The maximum difference allowed for each component to still be considered equal. |

**Returns**

| Type | Description |
| --- | --- |
| bool |  |

---
*Source: [Vector2](https://create.roblox.com/docs/reference/engine/datatypes/Vector2) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
