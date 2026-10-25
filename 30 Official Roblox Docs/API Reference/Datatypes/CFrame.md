---
title: "CFrame"
description: "A data type that represents both a 3D position and orientation."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/CFrame"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A data type that represents both a 3D position and orientation.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] data type, short for **coordinate frame**, describes a 3D position and orientation. It is made up of a **positional** component and a **rotational** component and includes essential arithmetic operations for working with 3D data on Roblox.

```lua
-- Create a CFrame at a certain position and Euler rotation
local cf = CFrame.new(0, 5, 0) * CFrame.fromEulerAngles(math.rad(45), 0, 0)
```

For an introduction to the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] data type, see [[30 Official Roblox Docs/Workspace/CFrames|CFrames]].

#### Positional Component

The positional component is available as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. In addition, the components of a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's position are also available in the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#X|X]], [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Y|Y]] and [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Z|Z]] properties like a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]].

#### Rotational Component

[[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] stores 3D rotation data in a 3×3 **rotation matrix**. These values are returned by the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#GetComponents|CFrame:GetComponents()]] function after the `x`, `y` and `z` positional values. This matrix is used internally when doing calculations involving rotations, using **radians** as their unit (for conversion from one to the other, use [[30 Official Roblox Docs/API Reference/Libraries/math#rad|math.rad()]] or [[30 Official Roblox Docs/API Reference/Libraries/math#deg|math.deg()]]). For more information on how the Roblox Engine performs rotations, see [[30 Official Roblox Docs/API Reference/Enums/RotationOrder|Enum.RotationOrder]].

The table below represents the components of a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's rotation matrix and their relationship with the available vector properties such as [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|LookVector]] and [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#RightVector|RightVector]]. Although the individual components of the rotation matrix are rarely useful by themselves, the vector properties which derive from them are much more useful.

| XVector, RightVector | YVector, UpVector | ZVector, -LookVector<sup>†</sup> |
| --- | --- | --- |
| R00 | R01 | R02 |
| R10 | R11 | R12 |
| R20 | R21 | R22 |

*<sup>†</sup> Unlike the others, [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|LookVector]] represents the negated column components. The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|LookVector]] is useful because many [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] such as the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] treat that vector as the direction the instance is pointing.*

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#new\|new()]] |  | Returns a blank identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#new\|new()]] | `pos` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] with no rotation with the position of the provided [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#new\|new()]] | `pos`, `lookAt` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] with the position of the first [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] and an orientation pointed toward the second. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#new\|new()]] | `x`, `y`, `z` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] with a position comprised of the provided `x`, `y`, and `z` components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#new\|new()]] | `x`, `y`, `z`, `qX`, `qY`, `qZ`, `qW` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] from position (`x`, `y`, `z`) and quaternion (`qX`, `qY`, `qZ`, `qW`). |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#new\|new()]] | `x`, `y`, `z`, `R00`, `R01`, `R02`, `R10`, `R11`, `R12`, `R20`, `R21`, `R22` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] from position (`x`, `y`, `z`) with an orientation specified by the rotation matrix. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#lookAt\|lookAt()]] | `at`, `lookAt`, `up` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] with the position of the first [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] and an orientation pointed toward the second. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#lookAlong\|lookAlong()]] | `at`, `direction`, `up` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] with the position of the first [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] and an orientation directed along the second. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromRotationBetweenVectors\|fromRotationBetweenVectors()]] | `from`, `to` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] representing the orientation needed to rotate from the first [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to the second, with the position set to zero. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromEulerAngles\|fromEulerAngles()]] | `rx`, `ry`, `rz`, `order` | Returns a rotated [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] from angles `rx`, `ry`, and `rz` in radians. Rotations are applied in the optional [[30 Official Roblox Docs/API Reference/Enums/RotationOrder\|Enum.RotationOrder]] with a default of `XYZ`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromEulerAnglesXYZ\|fromEulerAnglesXYZ()]] | `rx`, `ry`, `rz` | Returns a rotated [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] from angles `rx`, `ry`, and `rz` in radians using [[30 Official Roblox Docs/API Reference/Enums/RotationOrder\|Enum.RotationOrder.XYZ]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromEulerAnglesYXZ\|fromEulerAnglesYXZ()]] | `rx`, `ry`, `rz` | Returns a rotated [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] from angles `rx`, `ry`, and `rz` in radians using [[30 Official Roblox Docs/API Reference/Enums/RotationOrder\|Enum.RotationOrder.YXZ]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Angles\|Angles()]] | `rx`, `ry`, `rz` | Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromEulerAnglesXYZ\|fromEulerAnglesXYZ()]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromOrientation\|fromOrientation()]] | `rx`, `ry`, `rz` | Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromEulerAnglesYXZ\|fromEulerAnglesYXZ()]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromAxisAngle\|fromAxisAngle()]] | `v`, `r` | Returns a rotated [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] from a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] and a rotation in radians. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromMatrix\|fromMatrix()]] | `pos`, `vX`, `vY`, `vZ` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] from a translation and the columns of a rotation matrix. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#identity\|identity]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | An identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] with no translation or rotation. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The 3D position of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Rotation\|Rotation]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | A copy of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] with no translation. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#X\|X]] | number | The **X** coordinate of the position. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Y\|Y]] | number | The **Y** coordinate of the position. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Z\|Z]] | number | The **Z** coordinate of the position. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector\|LookVector]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The forward-direction component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] object's orientation, equivalent to the negated form of [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ZVector\|ZVector]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#RightVector\|RightVector]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The right-direction component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] object's orientation. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#UpVector\|UpVector]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The up-direction component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] object's orientation. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#XVector\|XVector]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#RightVector\|RightVector]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#YVector\|YVector]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#UpVector\|UpVector]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ZVector\|ZVector]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The Z component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] object's orientation. Equivalent to the third column of the rotation matrix. |

### Constants

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#identity\|identity]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | An identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] with no translation or rotation. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Inverse\|Inverse()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns the inverse of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Lerp\|Lerp()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] interpolated between itself and `goal` by the fraction `alpha`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Orthonormalize\|Orthonormalize()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns an orthonormalized copy of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ToWorldSpace\|ToWorldSpace()]] | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]> | Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] objects and returns them transformed from object to world space. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ToObjectSpace\|ToObjectSpace()]] | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]> | Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] objects and returns them transformed from world to object space. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#PointToWorldSpace\|PointToWorldSpace()]] | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> | Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] objects and returns them transformed from object to world space. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#PointToObjectSpace\|PointToObjectSpace()]] | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> | Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] objects and returns them transformed from world to object space. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#VectorToWorldSpace\|VectorToWorldSpace()]] | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> | Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] objects and returns them rotated from object to world space. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#VectorToObjectSpace\|VectorToObjectSpace()]] | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> | Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] objects and returns them rotated from world to object space. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#GetComponents\|GetComponents()]] | Tuple | Returns the values `x`, `y`, `z`, `R00`, `R01`, `R02`, `R10`, `R11`, `R12`, `R20`, `R21`, and `R22`, where `x` `y` `z` represent the position of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] and `R00`‑`R22` represent its 3×3 rotation matrix. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ToEulerAngles\|ToEulerAngles()]] | number, number, number | Returns approximate angles that could be used to generate the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] using the optional [[30 Official Roblox Docs/API Reference/Enums/RotationOrder\|Enum.RotationOrder]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ToEulerAnglesXYZ\|ToEulerAnglesXYZ()]] | number, number, number | Returns the approximate angles (in radians) that could be used to generate the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] using [[30 Official Roblox Docs/API Reference/Enums/RotationOrder\|Enum.RotationOrder.XYZ]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ToEulerAnglesYXZ\|ToEulerAnglesYXZ()]] | number, number, number | Returns the approximate angles (in radians) that could be used to generate the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] using [[30 Official Roblox Docs/API Reference/Enums/RotationOrder\|Enum.RotationOrder.YXZ]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ToOrientation\|ToOrientation()]] | number, number, number | Returns the approximate angles (in radians) that could be used to generate the CFrame using the YXZ rotation order. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ToAxisAngle\|ToAxisAngle()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]], number | Returns a tuple containing a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] axis and a rotation angle in radians. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#components\|components()]] | Tuple | Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#GetComponents\|CFrame:GetComponents()]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#FuzzyEq\|FuzzyEq()]] | bool | Returns `true` if the other [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] is sufficiently close to this [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] in both position and rotation. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#AngleBetween\|AngleBetween()]] | number | Returns the angle, in radians, between the orientation of one [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] and another. |

## Math operations

| Operation | Type A | Type B | Returns | Summary |
| --- | --- | --- | --- | --- |
| `*` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Produces a new [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] representing the composition of the two [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrames]]. |
| `*` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] transformed from object to world coordinates. |
| `+` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] translated in world space by the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |
| `-` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Produces a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] translated in world space by the negative [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |

## Constructors

### new

```lua
CFrame.new(): CFrame
```

Creates an identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] with position `(0, 0, 0)` and no rotation (identity rotation matrix). This is equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#identity|CFrame.identity]].

### new

```lua
CFrame.new(pos: Vector3): CFrame
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] positioned at `pos` with no rotation (identity rotation matrix). The orientation defaults to the identity, meaning the local axes align with the world axes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pos` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The 3D position for the new CFrame. |

### new

```lua
CFrame.new(pos: Vector3, lookAt: Vector3): CFrame
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] located at `pos` and facing towards `lookAt`, assuming that `(0, 1, 0)` is considered "up" in world space.

This constructor overload has been replaced by [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#lookAt|CFrame.lookAt()]], which accomplishes a similar goal. It remains for the sake of backward compatibility.

At high pitch angles (around 82 degrees), you may experience numerical instability. If this is an issue, or if you require a different "up" vector, use [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromMatrix|CFrame.fromMatrix()]] to more accurately construct the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. Additionally, if `lookAt` is directly above `pos` (pitch angle of 90 degrees), the "up" vector switches to the X axis.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pos` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world-space position of the CFrame. |
| `lookAt` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world-space point the CFrame should face toward. |

### new

```lua
CFrame.new(x: number, y: number, z: number): CFrame
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] positioned at `(x, y, z)` with no rotation (identity rotation matrix). This is equivalent to `CFrame.new(Vector3.new(x, y, z))`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The X component of the position. |
| `y` | number |  | The Y component of the position. |
| `z` | number |  | The Z component of the position. |

### new

```lua
CFrame.new(x: number, y: number, z: number, qX: number, qY: number, qZ: number, qW: number): CFrame
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] from position (`x`, `y`, `z`) and quaternion (`qX`, `qY`, `qZ`, `qW`). The quaternion is expected to be of unit length to represent a valid rotation. If this isn't the case, the quaternion will be normalized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The X component of the position. |
| `y` | number |  | The Y component of the position. |
| `z` | number |  | The Z component of the position. |
| `qX` | number |  | The X component of the quaternion rotation. |
| `qY` | number |  | The Y component of the quaternion rotation. |
| `qZ` | number |  | The Z component of the quaternion rotation. |
| `qW` | number |  | The W (scalar) component of the quaternion rotation. |

### new

```lua
CFrame.new(x: number, y: number, z: number, R00: number, R01: number, R02: number, R10: number, R11: number, R12: number, R20: number, R21: number, R22: number): CFrame
```

Creates a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] from position (`x`, `y`, `z`) with an orientation specified by the rotation matrix.

`[[R00 R01 R02] [R10 R11 R12] [R20 R21 R22]]`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The X component of the position. |
| `y` | number |  | The Y component of the position. |
| `z` | number |  | The Z component of the position. |
| `R00` | number |  | The row 1, column 1 element of the rotation matrix. |
| `R01` | number |  | The row 1, column 2 element of the rotation matrix. |
| `R02` | number |  | The row 1, column 3 element of the rotation matrix. |
| `R10` | number |  | The row 2, column 1 element of the rotation matrix. |
| `R11` | number |  | The row 2, column 2 element of the rotation matrix. |
| `R12` | number |  | The row 2, column 3 element of the rotation matrix. |
| `R20` | number |  | The row 3, column 1 element of the rotation matrix. |
| `R21` | number |  | The row 3, column 2 element of the rotation matrix. |
| `R22` | number |  | The row 3, column 3 element of the rotation matrix. |

### lookAt

```lua
CFrame.lookAt(at: Vector3, lookAt: Vector3, up: Vector3 = Vector3.yAxis): CFrame
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] with the position of `at` and facing towards `lookAt`, optionally specifying the upward direction (`up`) with a default of `(0, 1, 0)`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `at` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world-space position of the CFrame. |
| `lookAt` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world-space point the CFrame should face toward. |
| `up` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | `Vector3.yAxis` | The unit vector specifying the upward direction. Defaults to `(0, 1, 0)`. |

### lookAlong

```lua
CFrame.lookAlong(at: Vector3, direction: Vector3, up: Vector3 = Vector3.yAxis): CFrame
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] with the position of `at` and facing along `direction`, optionally specifying the upward direction (`up`) with a default of `(0, 1, 0)`.

This constructor is equivalent to `CFrame.lookAt(at, at + direction)`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `at` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world-space position of the CFrame. |
| `direction` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The direction the CFrame should face along. |
| `up` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | `Vector3.yAxis` | The unit vector specifying the upward direction. Defaults to `(0, 1, 0)`. |

### fromRotationBetweenVectors

```lua
CFrame.fromRotationBetweenVectors(from: Vector3, to: Vector3): CFrame
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] whose rotation represents the shortest-arc rotation that aligns vector `from` with vector `to`. The input vectors do not need to be unit length; they are normalized internally. The resulting [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] has its position set to `(0, 0, 0)`.

```lua
-- Rotate a direction to face another direction
local from = Vector3.new(0, 1, 0)
local to = Vector3.new(1, 0, 0)
local cf = CFrame.fromRotationBetweenVectors(from, to)
print(cf * from) --> approximately (1, 0, 0)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `from` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Vector representing the "from" direction. |
| `to` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Vector representing the "to" direction. |

### fromEulerAngles

```lua
CFrame.fromEulerAngles(rx: number, ry: number, rz: number, order: RotationOrder = Enum.RotationOrder.XYZ): CFrame
```

Returns a rotated [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] from angles `rx`, `ry`, and `rz` in radians. Rotations are applied in the optional [[30 Official Roblox Docs/API Reference/Enums/RotationOrder|Enum.RotationOrder]] with a default of `XYZ`, equivalent to:

```lua
local rx, ry, rz = math.rad(30), math.rad(45), math.rad(60)
local cframe = CFrame.fromEulerAngles(rx, 0, 0) -- X
               * CFrame.fromEulerAngles(0, ry, 0) -- Y
               * CFrame.fromEulerAngles(0, 0, rz) -- Z
local rx_out, ry_out, rz_out = cframe:ToEulerAnglesXYZ()
print(string.format("rx: %.2f, ry: %.2f, rz: %.2f", math.deg(rx_out), math.deg(ry_out), math.deg(rz_out))) --> rx: 30.00, ry: 45.00, rz: 60.00
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rx` | number |  | Rotation angle around the X axis in radians. |
| `ry` | number |  | Rotation angle around the Y axis in radians. |
| `rz` | number |  | Rotation angle around the Z axis in radians. |
| `order` | [[30 Official Roblox Docs/API Reference/Enums/RotationOrder\|RotationOrder]] | `Enum.RotationOrder.XYZ` | The order in which rotations are applied. |

### fromEulerAnglesXYZ

```lua
CFrame.fromEulerAnglesXYZ(rx: number, ry: number, rz: number): CFrame
```

Returns a rotated [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] from angles `rx`, `ry`, and `rz` in radians using [[30 Official Roblox Docs/API Reference/Enums/RotationOrder|Enum.RotationOrder.XYZ]], equivalent to:

```lua
local rx, ry, rz = math.rad(30), math.rad(45), math.rad(60)
local cframe = CFrame.fromEulerAngles(rx, 0, 0) -- X
               * CFrame.fromEulerAngles(0, ry, 0) -- Y
               * CFrame.fromEulerAngles(0, 0, rz) -- Z
local rx_out, ry_out, rz_out = cframe:ToEulerAnglesXYZ()
print(string.format("rx: %.2f, ry: %.2f, rz: %.2f", math.deg(rx_out), math.deg(ry_out), math.deg(rz_out))) --> rx: 30.00, ry: 45.00, rz: 60.00
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rx` | number |  | Rotation angle around the X axis in radians. |
| `ry` | number |  | Rotation angle around the Y axis in radians. |
| `rz` | number |  | Rotation angle around the Z axis in radians. |

### fromEulerAnglesYXZ

```lua
CFrame.fromEulerAnglesYXZ(rx: number, ry: number, rz: number): CFrame
```

Returns a rotated [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] from angles `rx`, `ry`, and `rz` in radians using [[30 Official Roblox Docs/API Reference/Enums/RotationOrder|Enum.RotationOrder.YXZ]], equivalent to:

```lua
local rx, ry, rz = math.rad(30), math.rad(45), math.rad(60)
local cframe = CFrame.fromEulerAngles(0, ry, 0) -- Y
               * CFrame.fromEulerAngles(rx, 0, 0) -- X
               * CFrame.fromEulerAngles(0, 0, rz) -- Z
local rx_out, ry_out, rz_out = cframe:ToEulerAnglesYXZ()
print(string.format("rx: %.2f, ry: %.2f, rz: %.2f", math.deg(rx_out), math.deg(ry_out), math.deg(rz_out))) --> rx: 30.00, ry: 45.00, rz: 60.00
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rx` | number |  | Rotation angle around the X axis in radians. |
| `ry` | number |  | Rotation angle around the Y axis in radians. |
| `rz` | number |  | Rotation angle around the Z axis in radians. |

### Angles

```lua
CFrame.Angles(rx: number, ry: number, rz: number): CFrame
```

Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromEulerAnglesXYZ|fromEulerAnglesXYZ()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rx` | number |  | Rotation angle around the X axis in radians. |
| `ry` | number |  | Rotation angle around the Y axis in radians. |
| `rz` | number |  | Rotation angle around the Z axis in radians. |

### fromOrientation

```lua
CFrame.fromOrientation(rx: number, ry: number, rz: number): CFrame
```

Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromEulerAnglesYXZ|fromEulerAnglesYXZ()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rx` | number |  | Rotation angle around the X axis in radians. |
| `ry` | number |  | Rotation angle around the Y axis in radians. |
| `rz` | number |  | Rotation angle around the Z axis in radians. |

### fromAxisAngle

```lua
CFrame.fromAxisAngle(v: Vector3, r: number): CFrame
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] rotated `r` radians around the axis `v`. The axis vector is normalized internally, so it does not need to be unit length. The resulting [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] has no translation (position is `(0, 0, 0)`). A positive angle represents a counter-clockwise rotation when looking from the tip of the axis vector toward the origin (right-hand rule).

```lua
-- Rotate 90 degrees around the Y axis
local cf = CFrame.fromAxisAngle(Vector3.yAxis, math.rad(90))
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The axis of rotation (normalized internally). |
| `r` | number |  | The rotation angle in radians. |

### fromMatrix

```lua
CFrame.fromMatrix(pos: Vector3, vX: Vector3, vY: Vector3, vZ: Vector3): CFrame
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] from a translation and the columns of a rotation matrix. If `vZ` is excluded, the third column is calculated as `vX:Cross(vY).Unit`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pos` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The 3D position of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| `vX` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#RightVector\|RightVector]]. |
| `vY` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#UpVector\|UpVector]]. |
| `vZ` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Equivalent to -[[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector\|LookVector]]. |

## Properties

### identity

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

An identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] with no translation or rotation. This property is a **constant** and must be accessed globally as opposed to through an individual [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object.

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The positional component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. Equivalent to `Vector3.new(cf.X, cf.Y, cf.Z)`.

### Rotation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

A copy of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] with the positional component set to `(0, 0, 0)`, retaining only the rotational component. Useful for isolating a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's orientation independent of its position.

### X

**Type:** number

The X component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's world-space position. Equivalent to `CFrame.Position.X`.

### Y

**Type:** number

The Y component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's world-space position. Equivalent to `CFrame.Position.Y`.

### Z

**Type:** number

The Z component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's world-space position. Equivalent to `CFrame.Position.Z`.

### LookVector

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The forward-direction component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's orientation, equivalent to the negated [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ZVector|ZVector]] or the negated third column of the rotation matrix.

```lua
local cf = CFrame.new(0, 0, 0)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()

print(cf.LookVector)     --> (-0, -0, -1)
print(-cf.ZVector)       --> (-0, -0, -1)
print(-R02, -R12, -R22)  --> (-0 -0 -1)
```

Adding a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|LookVector]] to itself produces a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] moved forward in whichever direction it's facing by 1 unit.

### RightVector

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The right-direction component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's orientation. Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#XVector|XVector]] or the first column of the rotation matrix.

```lua
local cf = CFrame.new(0, 0, 0)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()

print(cf.RightVector)  --> (1, 0, 0)
print(cf.XVector)      --> (1, 0, 0)
print(R00, R10, R20)   --> (1 0 0)
```

### UpVector

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The up-direction component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's orientation. Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#YVector|YVector]] or the second column of the rotation matrix.

```lua
local cf = CFrame.new(0, 0, 0)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()

print(cf.UpVector)    --> (0, 1, 0)
print(cf.YVector)     --> (0, 1, 0)
print(R01, R11, R21)  --> (0 1 0)
```

### XVector

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The X component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's orientation. Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#RightVector|RightVector]] or the first column of the rotation matrix.

```lua
local cf = CFrame.new(0, 0, 0)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()

print(cf.XVector)      --> (1, 0, 0)
print(cf.RightVector)  --> (1, 0, 0)
print(R00, R10, R20)   --> (1 0 0)
```

### YVector

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The Y component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's orientation. Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#UpVector|UpVector]] or the second column of the rotation matrix.

```lua
local cf = CFrame.new(0, 0, 0)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()

print(cf.YVector)     --> (0, 1, 0)
print(cf.UpVector)    --> (0, 1, 0)
print(R01, R11, R21)  --> (0 1 0)
```

### ZVector

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The Z component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object's orientation. Equivalent to the negated [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|LookVector]] or the third column of the rotation matrix.

```lua
local cf = CFrame.new(0, 0, 0)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()

print(cf.ZVector)      --> (0, 0, 1)
print(-cf.LookVector)  --> (0, 0, 1)
print(R02, R12, R22)   --> (0 0 1)
```

## Constants

### identity

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

An identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] with no translation or rotation. This property is a **constant** and must be accessed globally as opposed to through an individual [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] object.

## Methods

### Inverse

```lua
CFrame:Inverse(): CFrame
```

Returns the inverse of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], representing the transformation that undoes the original. For any [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] `cf`, the expression `cf * cf:Inverse()` produces the identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. The inverse reverses both the rotation (transposing the rotation matrix) and the translation.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The inverse CFrame that reverses this transformation. |

### Lerp

```lua
CFrame:Lerp(goal: CFrame, alpha: number): CFrame
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] interpolated between itself and `goal` by the fraction `alpha`. The positional component is interpolated linearly while the rotational component is interpolated using spherical linear interpolation (slerp), producing a constant-speed rotation along the shortest arc. An `alpha` of 0 returns the original [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] and an `alpha` of 1 returns `goal`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `goal` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The target CFrame to interpolate toward. |
| `alpha` | number |  | The interpolation fraction, where 0 is the original and 1 is `goal`. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The interpolated CFrame between the original and `goal`. |

### Orthonormalize

```lua
CFrame:Orthonormalize(): CFrame
```

Returns an orthonormalized copy of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. The [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|BasePart.CFrame]] property automatically applies orthonormalization, but other APIs which take [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] do not, so this method is occasionally necessary when incrementally updating a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] and using it with them.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | A copy of this CFrame with its rotation matrix orthonormalized. |

### ToWorldSpace

```lua
CFrame:ToWorldSpace(...: Tuple<CFrame>): Tuple<CFrame>
```

Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] objects and returns them transformed from object to world space. Equivalent to:

`CFrame * cf`

```lua
local cf = CFrame.new(5, 10, 0)

local offset = CFrame.new(0, 2, 0)

-- Output world space of offset CFrame relative to calling CFrame
print(cf:ToWorldSpace(offset))  --> 5, 12, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]> |  | One or more CFrames specified in object (local) space. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]> | The CFrames transformed into world space. |

### ToObjectSpace

```lua
CFrame:ToObjectSpace(...: Tuple<CFrame>): Tuple<CFrame>
```

Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] objects and returns them transformed from world to object space. Equivalent to:

`CFrame:Inverse() * cf`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]> |  | One or more CFrames specified in world space. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]> | The CFrames transformed into object (local) space. |

### PointToWorldSpace

```lua
CFrame:PointToWorldSpace(...: Tuple<Vector3>): Tuple<Vector3>
```

Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] objects and returns them transformed from object to world space. Equivalent to:

`CFrame * v3`

```lua
local cf = CFrame.new(5, 10, 0)

-- Output core world space of the CFrame
print(cf:PointToWorldSpace())  --> 5, 10, 0
-- Output world space of a Vector3 (0, 4, 0) relative to the CFrame (object space)
print(cf:PointToWorldSpace(Vector3.new(0, 4, 0)))  --> 5, 14, 0
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> |  | One or more points specified in object (local) space. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> | The points transformed into world space. |

### PointToObjectSpace

```lua
CFrame:PointToObjectSpace(...: Tuple<Vector3>): Tuple<Vector3>
```

Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] objects and returns them transformed from world to object space. Equivalent to:

`CFrame:Inverse() * v3`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> |  | One or more points specified in world space. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> | The points transformed into object (local) space. |

### VectorToWorldSpace

```lua
CFrame:VectorToWorldSpace(...: Tuple<Vector3>): Tuple<Vector3>
```

Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] objects and returns them rotated from object to world space. Equivalent to:

`(CFrame - CFrame.Position) * v3`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> |  | One or more direction vectors specified in object (local) space. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> | The vectors rotated into world space (translation ignored). |

### VectorToObjectSpace

```lua
CFrame:VectorToObjectSpace(...: Tuple<Vector3>): Tuple<Vector3>
```

Receives one or more [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] objects and returns them rotated from world to object space. Equivalent to:

`(CFrame:Inverse() - CFrame:Inverse().Position) * v3`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> |  | One or more direction vectors specified in world space. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple<[[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]> | The vectors rotated into object (local) space (translation ignored). |

### GetComponents

```lua
CFrame:GetComponents(): Tuple
```

Returns the 12 numeric components of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] as a tuple: `x`, `y`, `z` (position), followed by `R00`, `R01`, `R02`, `R10`, `R11`, `R12`, `R20`, `R21`, `R22` (the 3×3 rotation matrix in row-major order). This is the reverse of the 12-argument [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#new|CFrame.new()]] constructor.

```lua
local cf = CFrame.new(1, 2, 3) * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()
```

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The 12 numeric values: x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22. |

### ToEulerAngles

```lua
CFrame:ToEulerAngles(order: RotationOrder = Enum.RotationOrder.XYZ): (number, number, number)
```

Returns approximate angles that could be used to generate the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] using the optional [[30 Official Roblox Docs/API Reference/Enums/RotationOrder|Enum.RotationOrder]]. If you don't provide `order`, the method uses [[30 Official Roblox Docs/API Reference/Enums/RotationOrder|Enum.RotationOrder.XYZ]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `order` | [[30 Official Roblox Docs/API Reference/Enums/RotationOrder\|RotationOrder]] | `Enum.RotationOrder.XYZ` | The rotation order used for decomposition. |

**Returns**

| Type | Description |
| --- | --- |
| number | The X-axis rotation angle in radians. |
| number | The Y-axis rotation angle in radians. |
| number | The Z-axis rotation angle in radians. |

### ToEulerAnglesXYZ

```lua
CFrame:ToEulerAnglesXYZ(): (number, number, number)
```

Returns the approximate angles, in radians, that could be used to generate the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] using [[30 Official Roblox Docs/API Reference/Enums/RotationOrder|Enum.RotationOrder.XYZ]]. The three returned values represent rotations around the X, Y, and Z axes respectively. Due to the nature of Euler angle decomposition, the angles are approximate and subject to gimbal lock near pitch angles of ±90 degrees.

**Returns**

| Type | Description |
| --- | --- |
| number | The X-axis rotation angle in radians. |
| number | The Y-axis rotation angle in radians. |
| number | The Z-axis rotation angle in radians. |

### ToEulerAnglesYXZ

```lua
CFrame:ToEulerAnglesYXZ(): (number, number, number)
```

Returns the approximate angles, in radians, that could be used to generate the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] using [[30 Official Roblox Docs/API Reference/Enums/RotationOrder|Enum.RotationOrder.YXZ]]. The three returned values represent rotations around the X, Y, and Z axes respectively. Due to the nature of Euler angle decomposition, the angles are approximate and subject to gimbal lock near pitch angles of ±90 degrees.

**Returns**

| Type | Description |
| --- | --- |
| number | The X-axis rotation angle in radians. |
| number | The Y-axis rotation angle in radians. |
| number | The Z-axis rotation angle in radians. |

### ToOrientation

```lua
CFrame:ToOrientation(): (number, number, number)
```

Returns the approximate angles, in radians, that could be used to generate the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] using [[30 Official Roblox Docs/API Reference/Enums/RotationOrder|Enum.RotationOrder.YXZ]]. Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#ToEulerAnglesYXZ|CFrame:ToEulerAnglesYXZ()]].

**Returns**

| Type | Description |
| --- | --- |
| number | The X-axis rotation angle in radians. |
| number | The Y-axis rotation angle in radians. |
| number | The Z-axis rotation angle in radians. |

### ToAxisAngle

```lua
CFrame:ToAxisAngle(): (Vector3, number)
```

Returns a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] representing the axis of rotation and a number representing the angle of rotation in radians. A positive angle represents counter-clockwise rotation when looking from the tip of the axis vector toward the origin (right-hand rule). This is the inverse of [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromAxisAngle|CFrame.fromAxisAngle()]].

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A unit vector representing the axis of rotation. |
| number | The rotation angle in radians. |

### components

```lua
CFrame:components(): Tuple
```

Equivalent to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#GetComponents|CFrame:GetComponents()]].

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The 12 numeric values: x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22. |

### FuzzyEq

```lua
CFrame:FuzzyEq(other: CFrame, epsilon: number = 0.00001 (1e-5)): bool
```

Returns `true` if the other [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] is sufficiently close to this [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in both position and rotation. The `epsilon` value is used to control the tolerance for this similarity; this value is optional and should be a small positive value if provided. The similarity for position is component-wise while rotation uses a fast approximation of the angle difference.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The CFrame to compare against. |
| `epsilon` | number | `0.00001 (1e-5)` | The tolerance for comparing position and rotation components. |

**Returns**

| Type | Description |
| --- | --- |
| bool | True if the two CFrames are within `epsilon` of each other. |

### AngleBetween

```lua
CFrame:AngleBetween(other: CFrame): number
```

Returns the angle, in radians, between the orientation of one [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] and another. This function does not take the position of either [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] into account and only looks at the relative orientation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The CFrame whose orientation is compared against this CFrame. |

**Returns**

| Type | Description |
| --- | --- |
| number | The angle in radians between the two orientations, in the range [0, pi]. |

---
*Source: [CFrame](https://create.roblox.com/docs/reference/engine/datatypes/CFrame) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
