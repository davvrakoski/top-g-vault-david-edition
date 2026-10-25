---
title: "BodyForce"
description: "Applies a constant force to an object."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BodyForce"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a constant force to an object.*

> [!warning] Deprecated
> This object is deprecated and should not be used for new work. Use
> `Class.VectorForce` instead, and see the
> [legacy conversion notes](30%20Official%20Roblox%20Docs/Physics/Mover%20constraints.md#legacy-mover-conversion).

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

The `BodyForce` object applies (or exerts) a force on the assembly to which it is parented. If the magnitude of such a force is great enough, assemblies can begin to accelerate. The force is determined by the [[30 Official Roblox Docs/API Reference/Classes/BodyForce#Force|Force]] property, and is defined on the three world axes.

A `BodyForce` alone cannot apply a torque (it cannot cause the parent to rotate on its own). To apply a force at a specific point or apply forces relative to the orientation of the assembly, use a [[30 Official Roblox Docs/API Reference/Classes/BodyThrust|BodyThrust]] instead.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyForce#Force\|Force]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the force exerted on each axis. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyForce#Force\|force]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Determines the amount of force applied on each axis. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Force

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the magnitude of force exerted on each axis, relative to the world.

### force

> [!warning] Deprecated
> This deprecated property is a variant of `Class.BodyForce.Force` which
> should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

A deprecated variant of [[30 Official Roblox Docs/API Reference/Classes/BodyForce#Force|BodyForce.Force]] that indicates the amount of force applied on each axis.

---
*Source: [BodyForce](https://create.roblox.com/docs/reference/engine/classes/BodyForce) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
