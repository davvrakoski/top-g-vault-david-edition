---
title: "Vector2int16"
description: "Represents a Vector2 with signed 16-bit integers for components."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Vector2int16"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents a Vector2 with signed 16-bit integers for components.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]] data type represents a vector in 2D space with a **signed 16-bit integer** for its components. It is similar to [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] in that it allows for the same arithmetic operations, but it lacks commonly used vector functions.

[[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]] should **not** be confused with:

- [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]], a **more precise** and complete implementation for 2D vectors.
- [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]], a similar implementation for 3D vectors.

For each component:

- The **lower** bound is -2<sup>15</sup>, or **-32,768**.
- The **upper** bound is 2<sup>15</sup> − 1, or **32,767**.

#### Converting to Vector2

To convert a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]] to a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]], construct a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] by passing each **component** of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]] to [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#new|Vector2.new()]]:

```lua
local vector2int16 = Vector2int16.new(1, 2)
local vector2 = Vector2.new(vector2int16.X, vector2int16.Y)
print(vector2)  --> 1, 2
```

Do **not** pass an entire [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]] to [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#new|Vector2.new()]], as the constructor interprets a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]] as a `0` within its parameters **without producing an error**. This can lead to silent logic errors if you do something like:

```lua
local vector2int16 = Vector2int16.new(1, 2)
local vector2 = Vector2.new(vector2int16)
print(vector2)  --> 0, 0
```

#### Math Operations

The following math operations are valid for the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]] data type. For all operations, be mindful of the bounds associated with signed 16-bit integers, described earlier.

| Operation | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] `+` [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the sum of the operands' respective components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] `-` [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the difference of the operands' respective components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] `*` [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the product of the operands' respective components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] `/` [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the quotient of the operands' respective components. The results of the division are rounded down. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] `*` `number` | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the product of the respective [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] components and the number (factor). This operation is commutative. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] `/` `number` | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the quotient of the respective [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] components and the number (divisor). The results of the division are rounded toward zero. |

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16#new\|new()]] | `x`, `y` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] from the given x and y components. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16#X\|X]] | number | The x-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16#Y\|Y]] | number | The y-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]]. |

## Math operations

| Operation | Type A | Type B | Returns | Summary |
| --- | --- | --- | --- | --- |
| `+` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the sum of the operands' respective components. |
| `-` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the difference of the operands' respective components. |
| `*` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the product of the operands' respective components. |
| `/` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the quotient of the operands' respective components. |
| `*` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | number | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the product of the respective [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] components and the number (factor). |
| `/` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | number | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] whose components are the quotient of the respective [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16\|Vector2int16]] components and the number (divisor). |

## Constructors

### new

```lua
Vector2int16.new(x: number, y: number): Vector2int16
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]] given the x and y components. Non-integer components are rounded down.

The components must fall within the range [-2<sup>15</sup>, 2<sup>15</sup>). If outside this range, integer overflow may occur. For example, providing 32,768 (equal to 2<sup>15</sup>) as a component overflows the 16-bit integer, and so the component is -32,768 (equal to -2<sup>15</sup>) instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The x-component of the vector, rounded down to a signed 16-bit integer. |
| `y` | number |  | The y-component of the vector, rounded down to a signed 16-bit integer. |

## Properties

### X

**Type:** number

The x-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]], also accessible in its lower-case variant.

### Y

**Type:** number

The y-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]], also accessible in its lower-case variant.

---
*Source: [Vector2int16](https://create.roblox.com/docs/reference/engine/datatypes/Vector2int16) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
