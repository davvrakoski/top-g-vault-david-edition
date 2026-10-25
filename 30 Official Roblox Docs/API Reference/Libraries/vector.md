---
title: "vector"
description: "A library of vector functions."
api_type: library
aliases: ["vector"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/libraries/vector"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/library]
cssclasses: [tg-a30]
---

*A library of vector functions.*

## Description

This library implements functionality for the vector type in addition to the built-in primitive operator support. It uses vectors with three components (`x`, `y`, and `z`).

Individual vector components can be accessed using the fields `x` or `X`, `y` or `Y`, `z` or `Z`. Since vector values are immutable, writing to individual components is not supported.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#zero\|zero]] | vector | Constant vector with all components set to `0`. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#one\|one]] | vector | Constant vector with all components set to `1`. |

### Functions

| Function | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#create\|create()]] | vector | Creates a new vector with the given component values. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#magnitude\|magnitude()]] | number | Calculates the magnitude of a given vector. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#normalize\|normalize()]] | vector | Computes the normalized version (unit vector) of a given vector. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#cross\|cross()]] | vector | Computes the cross product of two vectors. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#dot\|dot()]] | number | Computes the dot product of two vectors. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#angle\|angle()]] | number | Computes the angle between two vectors in radians. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#floor\|floor()]] | vector | Applies [[30 Official Roblox Docs/API Reference/Libraries/math#floor\|math.floor()]] to every component of the input vector. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#ceil\|ceil()]] | vector | Applies [[30 Official Roblox Docs/API Reference/Libraries/math#ceil\|math.ceil()]] to every component of the input vector. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#abs\|abs()]] | vector | Applies [[30 Official Roblox Docs/API Reference/Libraries/math#abs\|math.abs()]] to every component of the input vector. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#sign\|sign()]] | vector | Applies [[30 Official Roblox Docs/API Reference/Libraries/math#sign\|math.sign()]] to every component of the input vector. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#clamp\|clamp()]] | vector | Applies [[30 Official Roblox Docs/API Reference/Libraries/math#clamp\|math.clamp()]] to every component of the input vector. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#lerp\|lerp()]] | vector | Returns a vector linearly interpolated between two vectors by a fractional alpha. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#max\|max()]] | vector | Applies [[30 Official Roblox Docs/API Reference/Libraries/math#max\|math.max()]] to the corresponding components of the input vectors. |
| [[30 Official Roblox Docs/API Reference/Libraries/vector#min\|min()]] | vector | Applies [[30 Official Roblox Docs/API Reference/Libraries/math#min\|math.min()]] to the corresponding components of the input vectors. |

## Properties

### zero

**Type:** vector

A pre-allocated constant equivalent to `vector.create(0, 0, 0)`. Useful as a default value or additive identity in vector arithmetic without allocating a new vector each time.

### one

**Type:** vector

A pre-allocated constant equivalent to `vector.create(1, 1, 1)`. Useful as a multiplicative identity or scale factor in vector arithmetic without allocating a new vector each time.

## Functions

### create

```lua
vector.create(x: number, y: number, z: number): vector
```

Creates a new vector with the given component values. The `z` parameter defaults to `0` when omitted, so `vector.create(1, 2)` is equivalent to `vector.create(1, 2, 0)`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The x component of the new vector. |
| `y` | number |  | The y component of the new vector. |
| `z` | number |  | The z component of the new vector. Defaults to `0` when omitted. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A new vector with the specified x, y, and z component values. |

### magnitude

```lua
vector.magnitude(vec: vector): number
```

Returns the magnitude (Euclidean length) of the vector, computed as `math.sqrt(vec.x^2 + vec.y^2 + vec.z^2)`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec` | vector |  | The vector whose magnitude is computed. |

**Returns**

| Type | Description |
| --- | --- |
| number | The Euclidean length of the vector. |

### normalize

```lua
vector.normalize(vec: vector): vector
```

Returns a unit vector (magnitude of 1) pointing in the same direction as the input. Computed as `vec / vector.magnitude(vec)`. If the input vector has zero magnitude, the result contains `nan` components.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec` | vector |  | The vector to normalize. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A unit vector pointing in the same direction as the input. |

### cross

```lua
vector.cross(vec1: vector, vec2: vector): vector
```

Returns the cross product of two vectors, which is a vector perpendicular to both inputs whose magnitude equals the area of the parallelogram they span. The result is computed as `vector.create(vec1.y*vec2.z - vec1.z*vec2.y, vec1.z*vec2.x - vec1.x*vec2.z, vec1.x*vec2.y - vec1.y*vec2.x)`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec1` | vector |  | The first operand vector. |
| `vec2` | vector |  | The second operand vector. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A vector perpendicular to both inputs whose magnitude equals the area of the parallelogram they span. |

### dot

```lua
vector.dot(vec1: vector, vec2: vector): number
```

Returns the dot product (scalar product) of two vectors, computed as `vec1.x*vec2.x + vec1.y*vec2.y + vec1.z*vec2.z`. The result is a single number equal to the product of the magnitudes of the two vectors times the cosine of the angle between them.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec1` | vector |  | The first operand vector. |
| `vec2` | vector |  | The second operand vector. |

**Returns**

| Type | Description |
| --- | --- |
| number | The scalar dot product of the two vectors. |

### angle

```lua
vector.angle(vec1: vector, vec2: vector, axis: vector?): number
```

Computes the angle between two vectors in radians. The axis, if specified, is used to determine the sign of the angle.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec1` | vector |  | The first vector. |
| `vec2` | vector |  | The second vector. |
| `axis` | vector? |  | An optional reference axis used to determine the sign of the returned angle. |

**Returns**

| Type | Description |
| --- | --- |
| number | The angle between the two vectors in radians, signed if an axis is provided. |

### floor

```lua
vector.floor(vec: vector): vector
```

Returns a new vector with each component rounded down to the nearest integer, equivalent to `vector.create(math.floor(vec.x), math.floor(vec.y), math.floor(vec.z))`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec` | vector |  | The vector whose components are rounded down. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A new vector with each component rounded down to the nearest integer. |

### ceil

```lua
vector.ceil(vec: vector): vector
```

Returns a new vector with each component rounded up to the nearest integer, equivalent to `vector.create(math.ceil(vec.x), math.ceil(vec.y), math.ceil(vec.z))`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec` | vector |  | The vector whose components are rounded up. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A new vector with each component rounded up to the nearest integer. |

### abs

```lua
vector.abs(vec: vector): vector
```

Returns a new vector with each component replaced by its absolute value, equivalent to `vector.create(math.abs(vec.x), math.abs(vec.y), math.abs(vec.z))`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec` | vector |  | The vector whose components are made absolute. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A new vector with each component replaced by its absolute value. |

### sign

```lua
vector.sign(vec: vector): vector
```

Returns a new vector where each component is `1` if the corresponding input component is positive, `-1` if negative, or `0` if zero. Equivalent to `vector.create(math.sign(vec.x), math.sign(vec.y), math.sign(vec.z))`. The behavior for negative zero and `nan` is consistent with `math.sign`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec` | vector |  | The vector whose component signs are extracted. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A new vector where each component is the sign of the corresponding input component. |

### clamp

```lua
vector.clamp(vec: vector, min: vector, max: vector): vector
```

Returns a new vector with each component clamped between the corresponding components of `min` and `max`. Each component of `max` must be greater than or equal to the corresponding component of `min`; otherwise, an error is raised.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec` | vector |  | The vector whose components are clamped. |
| `min` | vector |  | The vector of per-component minimum bounds. |
| `max` | vector |  | The vector of per-component maximum bounds. Each component must be greater than or equal to the corresponding component of `min`. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A new vector with each component clamped between the corresponding components of `min` and `max`. |

### lerp

```lua
vector.lerp(vec1: vector, vec2: vector, alpha: number): vector
```

Returns a vector linearly interpolated between two vectors (`vec1`, `vec2`) by the fraction `alpha`. Note that `alpha` is **not** limited to the range `[0, 1]`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vec1` | vector |  | The starting vector (returned when `alpha` is `0`). |
| `vec2` | vector |  | The ending vector (returned when `alpha` is `1`). |
| `alpha` | number |  | The interpolation fraction. Not clamped to `[0, 1]`. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A vector interpolated component-wise between `vec1` and `vec2`. |

### max

```lua
vector.max(...: vector): vector
```

Returns a new vector where each component is the maximum of the corresponding components across all input vectors. Accepts a variadic number of vectors (at least one). When a component is `nan` in one vector but a valid number in another, the valid number is used.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | vector |  | One or more vectors to compare component-wise. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A new vector where each component is the maximum of the corresponding components across all inputs. |

### min

```lua
vector.min(...: vector): vector
```

Returns a new vector where each component is the minimum of the corresponding components across all input vectors. Accepts a variadic number of vectors (at least one). When a component is `nan` in one vector but a valid number in another, the valid number is used.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | vector |  | One or more vectors to compare component-wise. |

**Returns**

| Type | Description |
| --- | --- |
| vector | A new vector where each component is the minimum of the corresponding components across all inputs. |

---
*Source: [vector](https://create.roblox.com/docs/reference/engine/libraries/vector) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
