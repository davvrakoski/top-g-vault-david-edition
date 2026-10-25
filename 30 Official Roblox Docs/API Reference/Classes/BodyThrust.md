---
title: "BodyThrust"
description: "Applies a constant force to an object at a specific point."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BodyThrust"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a constant force to an object at a specific point.*

> [!warning] Deprecated
> This object is deprecated and should not be used for new work. Use
> `Class.VectorForce` instead, and see the
> [legacy conversion notes](30%20Official%20Roblox%20Docs/Physics/Mover%20constraints.md#legacy-mover-conversion).

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

The `BodyThrust` object applies a force relative to the assembly to which it is parented at a specific location. It behaves similar to a [[30 Official Roblox Docs/API Reference/Classes/BodyForce|BodyForce]] except that this object's force applies at a specific point ([[30 Official Roblox Docs/API Reference/Classes/BodyThrust#Location|Location]]), allowing you to exert a torque (rotational force). To apply a force dynamically so that an assembly maintains a constant angular velocity, use a [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity|BodyAngularVelocity]] instead. To apply a force dynamically so that an assembly maintains a constant orientation (angular position), use a [[30 Official Roblox Docs/API Reference/Classes/BodyGyro|BodyGyro]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyThrust#Force\|Force]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the amount of force exerted on each axis relative to the assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyThrust#Force\|force]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BodyThrust#Location\|Location]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the relative position where the [[30 Official Roblox Docs/API Reference/Classes/BodyThrust#Force\|Force]] is exerted. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyThrust#Location\|location]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Force

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the amount of force exerted on each axis relative to the assembly. The force is exerted at the [[30 Official Roblox Docs/API Reference/Classes/BodyThrust#Location|Location]] which is also relative to the assembly.

### force

> [!warning] Deprecated
> This property is a deprecated variant of `Class.BodyThrust.Force|Force`
> which should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

### Location

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the relative position where the [[30 Official Roblox Docs/API Reference/Classes/BodyThrust#Force|Force]] is exerted. This is the primary means for turning force into torque.

### location

> [!warning] Deprecated
> This property is a deprecated variant of `Class.BodyThrust.Location` which
> should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

---
*Source: [BodyThrust](https://create.roblox.com/docs/reference/engine/classes/BodyThrust) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
