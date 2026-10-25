---
title: "Vector3"
description: "Represents a 3D value with a direction and magnitude."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Vector3"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents a 3D value with a direction and magnitude.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] data type represents a vector in 3D space, typically used as a point in 3D space or the dimensions of a rectangular prism. [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] supports basic component-based arithmetic operations (sum, difference, product, and quotient) and these operations can be applied on the left or right hand side to either another [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] or a number. It also features methods for common vector operations, such as [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Cross|Cross()]] and [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Dot|Dot()]].

Alternatively to [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], consider using the methods and properties of the [[30 Official Roblox Docs/API Reference/Libraries/vector|vector]] library.

Some example usages of [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] are the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Rotation|Rotation]], and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|Size]] of parts, for example:

```lua
local part = Instance.new("Part")
part.Position = part.Position + Vector3.new(5, 2, 10) -- Move part by (5, 2, 10)
print(part.Position) --> 5, 2, 10
```

[[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] is also commonly used when constructing more complex 3D data types such as [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. Many of these data types' methods will use a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] within their parameters, such as [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#PointToObjectSpace|CFrame:PointToObjectSpace()]].

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#new\|new()]] | `x`, `y`, `z` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] from the given `x`, `y`, and `z` components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#FromNormalId\|FromNormalId()]] | `normal` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] in the given direction. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#FromAxis\|FromAxis()]] | `axis` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] for the given axis. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#zero\|zero]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a magnitude of `0`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#one\|one]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a value of `1` on every axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#xAxis\|xAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a value of `1` on the **X** axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#yAxis\|yAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a value of `1 `on the **Y** axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#zAxis\|zAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a value of `1` on the **Z** axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#X\|X]] | number | The **X** coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Y\|Y]] | number | The **Y** coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Z\|Z]] | number | The **Z** coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Magnitude\|Magnitude]] | number | The length of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Unit\|Unit]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A normalized copy of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] - one that has the same direction as the original but a magnitude of `1`. |

### Constants

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#zero\|zero]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a magnitude of `0`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#one\|one]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a value of `1` on every axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#xAxis\|xAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a value of `1` on the **X** axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#yAxis\|yAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a value of `1` on the **Y** axis. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#zAxis\|zAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a value of `1` on the **Z** axis. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Abs\|Abs()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a new vector from the absolute values of the original's components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Ceil\|Ceil()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a new vector from the ceiling of the original's components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Floor\|Floor()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a new vector from the floor of the original's components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Sign\|Sign()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a new vector from the sign (-1, 0, or 1) of the original's components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Cross\|Cross()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the cross product of the two vectors. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Angle\|Angle()]] | number | Returns the angle in radians between the two vectors. If you provide an axis, it determines the sign of the angle. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Dot\|Dot()]] | number | Returns a scalar dot product of the two vectors. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#FuzzyEq\|FuzzyEq()]] | bool | Returns `true` if the difference between the squared magnitude of the two vectors is within `epsilon`. `epsilon` is scaled relative to the magnitude, rather than an absolute epsilon. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Lerp\|Lerp()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] linearly interpolated between this [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] and the given goal by the given alpha. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Max\|Max()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with each component as the highest among the respective components of both provided [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] objects. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Min\|Min()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with each component as the lowest among the respective components of both provided [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] objects. |

## Math operations

| Operation | Type A | Type B | Returns | Summary |
| --- | --- | --- | --- | --- |
| `+` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] by adding each component of the first vector to the corresponding component of the second. |
| `-` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] by subtracting each component of the second vector from the corresponding component of the first. |
| `*` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] by multiplying each component of the first vector by the corresponding component of the second. |
| `/` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] by dividing each component of the first vector by the corresponding component of the second. |
| `//` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] by **floor dividing** each component of the first vector by the corresponding component of the second. |
| `*` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | number | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] by multiplying each component of the provided vector by the number. |
| `/` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | number | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] by dividing each component of the provided vector by the number. |
| `//` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | number | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] by **floor dividing** each component of the provided vector by the number. |

## Constructors

### new

```lua
Vector3.new(x: number = 0, y: number = 0, z: number = 0): Vector3
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] using the given `x`, `y`, and `z` components.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number | `0` | The x-axis component of the vector. |
| `y` | number | `0` | The y-axis component of the vector. |
| `z` | number | `0` | The z-axis component of the vector. |

### FromNormalId

```lua
Vector3.FromNormalId(normal: NormalId): Vector3
```

Returns a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] pointing in the direction of the given [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]]. For example, [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Top]] returns `(0, 1, 0)` and [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId.Front]] returns `(0, 0, -1)`.

```lua
print(Vector3.FromNormalId(Enum.NormalId.Right)) --> 1, 0, 0
print(Vector3.FromNormalId(Enum.NormalId.Left))  --> -1, 0, 0
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] |  | The [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] specifying the face direction to convert into a unit vector. |

### FromAxis

```lua
Vector3.FromAxis(axis: Axis): Vector3
```

Returns a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] for the given [[30 Official Roblox Docs/API Reference/Enums/Axis|Enum.Axis]]. The mapping is [[30 Official Roblox Docs/API Reference/Enums/Axis|Enum.Axis.X]] to `(1, 0, 0)`, [[30 Official Roblox Docs/API Reference/Enums/Axis|Enum.Axis.Y]] to `(0, 1, 0)`, and [[30 Official Roblox Docs/API Reference/Enums/Axis|Enum.Axis.Z]] to `(0, 0, 1)`.

```lua
print(Vector3.FromAxis(Enum.Axis.X)) --> 1, 0, 0
print(Vector3.FromAxis(Enum.Axis.Z)) --> 0, 0, 1
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | [[30 Official Roblox Docs/API Reference/Enums/Axis\|Axis]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Axis\|Enum.Axis]] specifying which coordinate axis to convert into a unit vector. |

## Properties

### zero

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a magnitude of `0`.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] object.

```lua
print(Vector3.zero) --> 0, 0, 0
```

### one

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a value of `1` on every axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] object.

```lua
print(Vector3.one)  --> 1, 1, 1
```

### xAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a value of `1` on the **X** axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] object.

```lua
print(Vector3.xAxis)  --> 1, 0, 0
```

### yAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a value of `1` on the **Y** axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] object.

```lua
print(Vector3.yAxis)  --> 0, 1, 0
```

### zAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a value of `1` on the **Z** axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] object.

```lua
print(Vector3.zAxis)  --> 0, 0, 1
```

### X

**Type:** number

The **X** coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. In world space, this axis corresponds to the left-right (east-west) direction.

### Y

**Type:** number

The **Y** coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. In world space, this axis corresponds to the up-down (vertical) direction.

### Z

**Type:** number

The **Z** coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. In world space, this axis corresponds to the north-south (forward-back) direction.

### Magnitude

**Type:** number

The length (magnitude) of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], computed as `math.sqrt(X^2 + Y^2 + Z^2)`. This is useful for comparing distances or determining how far a point is from the origin.

```lua
local v = Vector3.new(3, 4, 0)
print(v.Magnitude) --> 5
```

### Unit

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A normalized copy of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] — one that has the same direction as the original but a magnitude of `1`. This is useful when you need only the direction of a vector without its length, for example to get a movement direction regardless of speed.

If the vector has a magnitude of `0` (i.e. all components are zero), the resulting `Unit` vector will have `NaN` components. Check [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Magnitude|Magnitude]] before using `Unit` when the vector may be zero-length.

```lua
local v = Vector3.new(3, 4, 0)
print(v.Unit)      --> 0.6, 0.8, 0
print(v.Unit.Magnitude) --> 1
```

## Constants

### zero

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a magnitude of `0`.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] object.

```lua
print(Vector3.zero)  --> 0, 0, 0
```

### one

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a value of `1` on every axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] object.

```lua
print(Vector3.one)  --> 1, 1, 1
```

### xAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a value of `1` on the **X** axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] object.

```lua
print(Vector3.xAxis)  --> 1, 0, 0
```

### yAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a value of `1` on the **Y** axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] object.

```lua
print(Vector3.yAxis)  --> 0, 1, 0
```

### zAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a value of `1` on the **Z** axis.

This API member is a **constant**, and must be accessed through the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] global as opposed to an individual [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] object.

```lua
print(Vector3.zAxis)  --> 0, 0, 1
```

## Methods

### Abs

```lua
Vector3:Abs(): Vector3
```

Returns a new vector from the absolute values of the original's components. For example, a vector of `(-2, 4, -6)` returns a vector of `(2, 4, 6)`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

### Ceil

```lua
Vector3:Ceil(): Vector3
```

Returns a new vector from the ceiling of the original's components. For example, a vector of `(-2.6, 5.1, 8.8)` returns a vector of `(-2, 6, 9)`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

### Floor

```lua
Vector3:Floor(): Vector3
```

Returns a new vector from the floor of the original's components. For example, a vector of `(-2.6, 5.1, 8.8)` returns a vector of `(-3, 5, 8)`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

### Sign

```lua
Vector3:Sign(): Vector3
```

Returns a new vector from the sign (-1, 0, or 1) of the original's components. For example, a vector of `(-2.6, 5.1, 0)` returns a vector of `(-1, 1, 0)`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

### Cross

```lua
Vector3:Cross(other: Vector3): Vector3
```

Returns the cross product of this vector and `other`. The resulting vector is perpendicular to both input vectors and has a magnitude equal to the area of the parallelogram they span. The direction follows the right-hand rule: if you curl the fingers of your right hand from `self` toward `other`, your thumb points in the direction of the result.

The cross product is commonly used to find normals to surfaces, determine the axis of rotation between two directions, and test whether two vectors are parallel (cross product of parallel vectors is the zero vector).

```lua
local a = Vector3.new(1, 0, 0)
local b = Vector3.new(0, 1, 0)
print(a:Cross(b)) --> 0, 0, 1
print(b:Cross(a)) --> 0, 0, -1
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The other [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to compute the cross product with. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

### Angle

```lua
Vector3:Angle(other: Vector3, axis: Vector3 = nil): number
```

Returns the angle in radians between this vector and `other`. The input vectors do not need to be unit vectors. Without an `axis` argument, the returned angle is always in the range `[0, math.pi]` (unsigned).

If you provide an `axis` [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], the returned angle is signed: positive when the rotation from `self` to `other` follows the right-hand rule around `axis`, and negative otherwise. The signed result is in the range `[-math.pi, math.pi]`. The `axis` is used only to determine the sign; the plane of rotation is still defined by `self` and `other`.

```lua
local a = Vector3.new(1, 0, 0)
local b = Vector3.new(0, 1, 0)
print(a:Angle(b))                         --> 1.5707963... (pi/2)
print(a:Angle(b, Vector3.new(0, 0, 1)))   --> 1.5707963... (positive, CCW about +Z)
print(b:Angle(a, Vector3.new(0, 0, 1)))   --> -1.5707963... (negative, CW about +Z)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to measure the angle to. |
| `axis` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | `nil` | An optional [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] used to determine the sign of the angle via the right-hand rule. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### Dot

```lua
Vector3:Dot(other: Vector3): number
```

Returns the scalar dot product of this vector and `other`, computed as `self.X * other.X + self.Y * other.Y + self.Z * other.Z`.

The dot product is useful for determining the relationship between two directions: it equals the product of their magnitudes multiplied by the cosine of the angle between them. For unit vectors, a result of `1` means they point in the same direction, `0` means they are perpendicular, and `-1` means they point in opposite directions.

```lua
local a = Vector3.new(1, 0, 0)
local b = Vector3.new(0, 1, 0)
print(a:Dot(b)) --> 0

local c = Vector3.new(1, 2, 3)
local d = Vector3.new(4, 5, 6)
print(c:Dot(d)) --> 32
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to compute the dot product with. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### FuzzyEq

```lua
Vector3:FuzzyEq(other: Vector3, epsilon: number = 0.00001 aka 1e-5): bool
```

Returns `true` if the two vectors are approximately equal within the tolerance defined by `epsilon`. The comparison is performed per-component using a hybrid epsilon that scales relative to the magnitude of each component, making it suitable for both small and large values. The default `epsilon` of `0.00001` (1e-5) works well for most cases.

```lua
local a = Vector3.new(1, 2, 3)
local b = Vector3.new(1.000001, 2, 3)
print(a:FuzzyEq(b))        --> true  (within default epsilon)
print(a:FuzzyEq(b, 1e-8))  --> false (tighter tolerance)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to compare against. |
| `epsilon` | number | `0.00001 aka 1e-5` | The tolerance threshold for the comparison, scaled relative to the component magnitudes. |

**Returns**

| Type | Description |
| --- | --- |
| bool |  |

### Lerp

```lua
Vector3:Lerp(goal: Vector3, alpha: number): Vector3
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] linearly interpolated between this [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] and the given `goal` [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] by the fraction `alpha`. Note that `alpha` is **not** limited to the range `[0, 1]`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `goal` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The target [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to interpolate toward. |
| `alpha` | number |  | The interpolation fraction, typically between 0 (returns self) and 1 (returns goal), but not clamped. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

### Max

```lua
Vector3:Max(vector: Vector3): Vector3
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with each component as the highest among the respective components of both provided [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] objects.

```lua
local a = Vector3.new(1, 2, 1)
local b = Vector3.new(2, 1, 2)

print(a:Max(b))  --> Vector3.new(2, 2, 2)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to compare component-wise against. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

### Min

```lua
Vector3:Min(vector: Vector3): Vector3
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with each component as the lowest among the respective components of both provided [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] objects.

```lua
local a = Vector3.new(1, 2, 1)
local b = Vector3.new(2, 1, 2)

print(a:Min(b))  --> Vector3.new(1, 1, 1)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to compare component-wise against. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

---
*Source: [Vector3](https://create.roblox.com/docs/reference/engine/datatypes/Vector3) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
