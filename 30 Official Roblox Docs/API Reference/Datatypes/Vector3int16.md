---
title: "Vector3int16"
description: "A Vector3 with signed 16-bit integers for components."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Vector3int16"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A Vector3 with signed 16-bit integers for components.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]] data type represents a vector in 3D space with a **signed 16-bit integer** for its components. It is similar to [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] in that it allows for the same arithmetic operations, but it lacks commonly used vector functions.

[[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]] should **not** be confused with:

- [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], a **more precise** and complete implementation for 3D vectors.
- [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]], a similar implementation for 2D vectors.

For each component:

- The **lower** bound is -2<sup>15</sup>, or **-32,768**.
- The **upper** bound is 2<sup>15</sup> − 1, or **32,767**.

#### Converting to Vector3

To convert a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]] to a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], construct a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] by passing each **component** of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]] to [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#new|Vector3.new()]]:

```lua
local vector3int16 = Vector3int16.new(1, 2, 3)
local vector3 = Vector3.new(vector3int16.X, vector3int16.Y, vector3int16.Z)
print(vector3)  --> 1, 2, 3
```

Do **not** pass an entire [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]] to [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#new|Vector3.new()]], as the constructor interprets a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]] as a `0` within its parameters **without producing an error**. This can lead to silent logic errors if you do something like:

```lua
local vector3int16 = Vector3int16.new(1, 2, 3)
local vector3 = Vector3.new(vector3int16)
print(vector3)  --> 0, 0, 0
```

#### Math Operations

The following math operations are valid for the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]] data type. For all operations, be mindful of the bounds associated with signed 16-bit integers, described earlier.

| Operation | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] `+` [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the sum of the operands' respective components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] `-` [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the difference of the operands' respective components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] `*` [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the product of the operands' respective components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] `/` [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the quotient of the operands' respective components. The results of the division are rounded down. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] `*` `number` | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the product of the respective [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] components and the number (factor). This operation is commutative. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] `/` `number` | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the quotient of the respective [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] components and the number (divisor). The results of the division are rounded toward zero. |

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16#new\|new()]] | `x`, `y`, `z` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] from the given x, y, and z components. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16#X\|X]] | number | The x-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16#Y\|Y]] | number | The y-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16#Z\|Z]] | number | The z-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]]. |

## Math operations

| Operation | Type A | Type B | Returns | Summary |
| --- | --- | --- | --- | --- |
| `+` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the sum of the operands' respective components. |
| `-` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the difference of the operands' respective components. |
| `*` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the product of the operands' respective components. |
| `/` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the quotient of the operands' respective components. The results of the division are rounded down. |
| `*` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | number | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the product of the respective [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] components and the number (factor). This operation is commutative. |
| `/` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | number | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] whose components are the quotient of the respective [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] components and the number (divisor). The results of the division are rounded toward zero. |

## Constructors

### new

```lua
Vector3int16.new(x: number, y: number, z: number): Vector3int16
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]] from the given x, y and z components. Non-integer components are rounded down.

The components must fall within the range [-2<sup>15</sup>, 2<sup>15</sup>). If outside this range, integer overflow may occur. For example, providing 32,768 (equal to 2<sup>15</sup>) as a component overflows the 16-bit integer, and so the component will be -32,768 (equal to -2<sup>15</sup>) instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The x-coordinate of the vector, rounded down to a signed 16-bit integer. |
| `y` | number |  | The y-coordinate of the vector, rounded down to a signed 16-bit integer. |
| `z` | number |  | The z-coordinate of the vector, rounded down to a signed 16-bit integer. |

## Properties

### X

**Type:** number

The x-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]], also accessible in its lower-case variant.

### Y

**Type:** number

The y-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]], also accessible in its lower-case variant.

### Z

**Type:** number

The z-coordinate of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16|Vector3int16]], also accessible in its lower-case variant.

---
*Source: [Vector3int16](https://create.roblox.com/docs/reference/engine/datatypes/Vector3int16) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
