---
title: "BodyGyro"
description: "Applies a torque to maintain a constant orientation."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BodyGyro"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a torque to maintain a constant orientation.*

> [!warning] Deprecated
> This object is deprecated and should not be used for new work. Use
> `Class.AlignOrientation` instead, and see the
> [legacy conversion notes](30%20Official%20Roblox%20Docs/Physics/Mover%20constraints.md#legacy-mover-conversion).

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

The `BodyGyro` object applies a torque (rotational force) on an assembly such that it maintains a constant angular displacement, or orientation. This allows for the creation of assemblies that point in a certain direction, as if a real gyroscope were acting upon it. Essentially, it's the rotational counterpart to a [[30 Official Roblox Docs/API Reference/Classes/BodyPosition|BodyPosition]].

If you would like to maintain a constant angular velocity, use a [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity|BodyAngularVelocity]] instead.

The [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#CFrame|CFrame]] property controls the goal orientation. Only the angular components of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] are used; position will make no difference. [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#MaxTorque|MaxTorque]] limits the amount of angular force that may be applied, [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#P|P]] controls the power used in achieving the goal orientation, and [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#D|D]] controls dampening behavior.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Determines the target orientation (translational component ignored). |
| [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#CFrame\|cframe]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#D\|D]] | float | Determines the amount of dampening to use in reaching the goal [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#MaxTorque\|MaxTorque]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the limit on how much torque that may be applied to each axis. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#maxTorque\|maxTorque]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#P\|P]] | float | Determines how aggressive of a torque is applied in reaching the goal orientation. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property (not to be confused with [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|BasePart.CFrame]]) determines the target orientation towards which torque will be exerted. Since [[30 Official Roblox Docs/API Reference/Classes/BodyGyro|BodyGyro]] does not apply translational force, the translational/positional component of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] is ignored. Consider using one of the following CFrame constructors in setting this property: [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromAxisAngle|CFrame.fromAxisAngle()]], [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromEulerAnglesXYZ|CFrame.fromEulerAnglesXYZ()]], or [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#fromEulerAnglesYXZ|CFrame.fromEulerAnglesYXZ()]].

### cframe

> [!warning] Deprecated
> This property is a deprecated variant of `Class.BodyGyro.CFrame` which
> should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

### D

**Type:** float

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property defines how much dampening will be applied to the torque used to reach the goal [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#CFrame|CFrame]]. When the assembly approaches the goal orientation, it needs to decelerate, otherwise it will rotate past the goal and have to stop and re-accelerate back toward the goal. This often creates an undesirable "rubber‑banding" effect, avoided by applying dampening. The higher this value is set, the greater the dampening curve becomes, or the slower the assembly will approach the goal orientation.

### MaxTorque

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the limit on the amount of torque that may be applied on each axis in reaching the goal orientation ([[30 Official Roblox Docs/API Reference/Classes/BodyGyro#CFrame|CFrame]]). If an assembly isn't moving, consider increasing this value and also check that it is not [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] or attached to any anchored assemblies.

### maxTorque

> [!warning] Deprecated
> This property is a deprecated variant of `Class.BodyGyro.MaxTorque` which
> should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

### P

**Type:** float

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines how much power is used while applying torque in order to reach the goal [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#CFrame|CFrame]]. The higher this value, the more power will be used and the faster it will be used.

---
*Source: [BodyGyro](https://create.roblox.com/docs/reference/engine/classes/BodyGyro) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
