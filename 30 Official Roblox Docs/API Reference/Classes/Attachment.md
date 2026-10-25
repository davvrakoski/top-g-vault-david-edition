---
title: "Attachment"
description: "Defines a point and orientation relative to an ancestor `PVInstance`, `Bone`, or another `Attachment`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Attachment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Defines a point and orientation relative to an ancestor [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]], or another [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]]
- **Memory category:** Instances

## Description

An `Attachment` defines a point and orientation relative to an ancestor [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]], or another `Attachment`. The offset is stored in the [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame|CFrame]] property. The offset can also be set through other properties, such as [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldCFrame|WorldCFrame]].

If no ancestral [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] exists, then [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame|CFrame]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldCFrame|WorldCFrame]] are the same.

Attachments are used by several kinds of [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] and are also valid alternatives to [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] as a parent for objects such as:

- [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitters]] which will emit particles from the attachment's specific position/orientation instead of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] bounds.

- Light-emitting objects like [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]] and [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]] which will shine from the attachment's position/orientation instead of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] center.

- [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] which will use the attachment's position as the audio's point of emission.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis\|Axis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Direction of the **X** axis of the attachment, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] offset of the attachment. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#Orientation\|Orientation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Orientation of the attachment relative to the orientation of its parent. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Positional offset of the attachment, relative to the position and orientation of its parent. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#Rotation\|Rotation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Rotation of the attachment relative to the rotation of its parent. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis\|SecondaryAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Direction of the **Y** axis of the attachment, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#Visible\|Visible]] | boolean | Toggles the in-experience visibility of the attachment. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldAxis\|WorldAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Direction of the **X** axis of the attachment relative to the world, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a length of 1. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldCFrame\|WorldCFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The exact [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the attachment in world space coordinates. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldOrientation\|WorldOrientation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Orientation of the attachment relative to the world rather than its own parent. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldPosition\|WorldPosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Position of the attachment relative to the world rather than its own parent. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldRotation\|WorldRotation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Rotation of the attachment relative to the world rather than its own parent. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldSecondaryAxis\|WorldSecondaryAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Direction of the **Y** axis of the attachment relative to the world, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with a length of 1. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#GetAxis\|GetAxis()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Returns the value of the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis\|Axis]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#GetConstraints\|GetConstraints()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraint]]> | Returns a list of [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraints]] connected to the attachment. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#GetSecondaryAxis\|GetSecondaryAxis()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Returns the value of the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis\|SecondaryAxis]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#SetAxis\|SetAxis()]] | () | **Deprecated.** Sets the value of the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis\|Axis]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Attachment#SetSecondaryAxis\|SetSecondaryAxis()]] | () | **Deprecated.** Sets the value of the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis\|SecondaryAxis]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Axis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Derived Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

Direction of the **X** axis of the attachment, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. Together with [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]], this property defines the orientation of the attachment. Setting `Axis` automatically re-projects `SecondaryAxis` onto the plane perpendicular to the new axis so the two always remain orthogonal.

The default value is `(1, 0, 0)`.

### CFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** true/true · **Capabilities:** Basic

The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] offset of the attachment. Changes to this property will reflect onto the [[30 Official Roblox Docs/API Reference/Classes/Attachment#Position|Position]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment#Rotation|Rotation]] properties of this object. Similarly, a change to either of those properties will reflect onto this property.

### Orientation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`

Orientation of the attachment relative to the orientation of its parent. Rotations are in **Z**, **X**, **Y** order.

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`

Positional offset of the attachment, relative to the position and orientation of its parent. This value corresponds to the translational component of [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame|CFrame]]; changing either property updates the other. The offset is expressed in the local coordinate space of the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]], or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]].

The default value is `(0, 0, 0)`.

### Rotation

> [!warning] Deprecated
> This property is deprecated and should not be used in new work. See
> `Class.Attachment.Orientation|Orientation` instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

Rotation of the attachment relative to the rotation of its parent. Rotations are in **Z**, **Y**, **X** order.

### SecondaryAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Derived Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

Direction of the **Y** axis of the attachment, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. Together with [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]], this property defines the orientation of the attachment. When set, the value is projected onto the plane perpendicular to `Axis` so the two axes always remain orthogonal; the resulting stored value may therefore differ from the value you assign.

The default value is `(0, 1, 0)`.

### Visible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Toggles the in-experience visibility of the attachment. When set to `true`, the attachment renders as a small green sphere at its world position during gameplay. This is useful for debugging constraint setups or verifying attachment placement without needing Studio's constraint detail overlays.

The default value is `false`.

### WorldAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Derived World Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

Direction of the **X** axis of the attachment relative to the world, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a length of 1. This is the world-space equivalent of [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]], computed by transforming the local axis through the parent's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. Setting this property converts the supplied direction into the parent's local space and updates `Axis` accordingly.

### WorldCFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Derived World Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

The exact [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the attachment in world space coordinates, independent of its parent. The value of this property is equivalent to multiplying the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the attachment's parent by its own [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].

### WorldOrientation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Derived World Data · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`

Orientation of the attachment relative to the world rather than its own parent. Rotations are in **Z**, **X**, **Y** order.

### WorldPosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Derived World Data · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`

Position of the attachment relative to the world rather than its own parent. This is the world-space equivalent of [[30 Official Roblox Docs/API Reference/Classes/Attachment#Position|Position]], computed by transforming the local offset through the parent's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. Setting this property converts the supplied position into the parent's local space and updates `Position` accordingly.

### WorldRotation

> [!warning] Deprecated
> This item has been superseded by
> `Class.Attachment.WorldOrientation|WorldOrientation` which should be used
> in new work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Derived World Data · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`, `Deprecated`

Rotation of the attachment relative to the world rather than its own parent.

### WorldSecondaryAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Derived World Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

Direction of the **Y** axis of the attachment relative to the world, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with a length of 1. This is the world-space equivalent of [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]], computed by transforming the local secondary axis through the parent's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. Setting this property converts the supplied direction into the parent's local space and updates `SecondaryAxis` accordingly.

## Methods

### GetAxis

> [!warning] Deprecated
> This method is deprecated and should not be used in new work.

```lua
Attachment:GetAxis(): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

Returns the value of the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]].

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The direction of the X axis as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] in the attachment's local space. |

### GetConstraints

```lua
Attachment:GetConstraints(): List<Constraint>
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns a list of [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] that use this attachment as either [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] or [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]]. The returned array is a snapshot at the time of the call; subsequent changes to constraint connections are not reflected in a previously returned array.

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraint]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraint]] objects that are connected to this attachment. |

### GetSecondaryAxis

> [!warning] Deprecated
> This method is deprecated and should not be used in new work.

```lua
Attachment:GetSecondaryAxis(): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

Returns the value of the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]].

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The direction of the Y axis as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] in the attachment's local space. |

### SetAxis

> [!warning] Deprecated
> This method is deprecated and should not be used in new work.

```lua
Attachment:SetAxis(axis: Vector3): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

Sets the value of the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to set as the X-axis direction of the attachment. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetSecondaryAxis

> [!warning] Deprecated
> This method is deprecated and should not be used in new work.

```lua
Attachment:SetSecondaryAxis(axis: Vector3): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

Sets the value of the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to set as the Y-axis direction of the attachment. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [Attachment](https://create.roblox.com/docs/reference/engine/classes/Attachment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
