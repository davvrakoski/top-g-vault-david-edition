---
title: "BodyAngularVelocity"
description: "Applies a torque to maintain a constant angular velocity."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BodyAngularVelocity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a torque to maintain a constant angular velocity.*

> [!warning] Deprecated
> This object is deprecated and should not be used for new work. Use
> `Class.AngularVelocity` instead, and see the
> [legacy conversion notes](30%20Official%20Roblox%20Docs/Physics/Mover%20constraints.md#legacy-mover-conversion).

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

The `BodyAngularVelocity` object applies a torque (rotational force) on an assembly such that it maintains a constant angular velocity as determined by its [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity#AngularVelocity|AngularVelocity]] property. This allows for the creation of assemblies that continually rotate. It is the rotational counterpart to a [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity|BodyVelocity]]. If you would like to maintain a constant angular displacement, use a [[30 Official Roblox Docs/API Reference/Classes/BodyGyro|BodyGyro]] instead.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity#AngularVelocity\|AngularVelocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the axis of rotation (direction) and the rotational velocity (magnitude) in radians/s. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity#AngularVelocity\|angularvelocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity#MaxTorque\|MaxTorque]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the limit of torque that may be exerted on each world axis. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity#maxTorque\|maxTorque]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Determines how much force can be applied to each axis. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity#P\|P]] | float | Determines how aggressive of a torque is applied in reaching the goal angular velocity. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AngularVelocity

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property is a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] which determines the goal angular velocity a [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity|BodyAngularVelocity]] should maintain through the exertion of torque. For this property, the direction of the vector is the axis of rotation. The magnitude is the angular velocity in **radians per second**.

You can multiply a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] by `Library.math.rad(360)`, or `2π`, in order to convert angular frequency (rotations per second) into the desired angular velocity (radians per second).

### angularvelocity

> [!warning] Deprecated
> This deprecated property is a variant of
> `Class.BodyAngularVelocity.AngularVelocity` which should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

### MaxTorque

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the limit of the torque that may be exerted on each world axis. If an assembly isn't moving, consider raising this value and also check that it is not [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] or attached to another anchored assembly). See also [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity#P|P]] (power).

### maxTorque

> [!warning] Deprecated
> This deprecated property is a variant of
> `Class.BodyAngularVelocity.MaxTorque` which should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

The maxTorque property is a deprecated variant of [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity#MaxTorque|BodyAngularVelocity.MaxTorque]] that lets you set how much force could be applied to each axis.

### P

**Type:** float

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines how much power is used while applying torque in order to reach the goal [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity#AngularVelocity|AngularVelocity]]. The higher this value, the more power will be used and the faster it will be used.

---
*Source: [BodyAngularVelocity](https://create.roblox.com/docs/reference/engine/classes/BodyAngularVelocity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
