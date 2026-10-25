---
title: "BodyVelocity"
description: "Applies a force to maintain a constant velocity."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BodyVelocity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a force to maintain a constant velocity.*

> [!warning] Deprecated
> This object is deprecated and should not be used for new work. Use
> `Class.LinearVelocity` instead, and see the
> [legacy conversion notes](30%20Official%20Roblox%20Docs/Physics/Mover%20constraints.md#legacy-mover-conversion).

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

The `BodyVelocity` object applies a force on an assembly such that it will maintain a constant velocity. The [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#Velocity|Velocity]] property, not to be confused with [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity|BasePart.AssemblyLinearVelocity]], controls the goal velocity.

[[30 Official Roblox Docs/API Reference/Classes/BodyVelocity|BodyVelocity]] is the linear counterpart to [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity|BodyAngularVelocity]]. If you need the assembly to move toward a goal position, use [[30 Official Roblox Docs/API Reference/Classes/BodyPosition|BodyPosition]] instead. If you need further control on a force applied to an object, consider using a [[30 Official Roblox Docs/API Reference/Classes/BodyForce|BodyForce]] or [[30 Official Roblox Docs/API Reference/Classes/BodyThrust|BodyThrust]] instead.

The strength of the force applied by this object is controlled by several factors, namely the difference between the assembly's current velocity and the goal velocity. This is multiplied by [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#P|P]] (power) to either amplify or diminish it. The resulting force is then capped by [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#MaxForce|MaxForce]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#MaxForce\|MaxForce]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the limit on how much force that may be applied to each axis. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#maxForce\|maxForce]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#P\|P]] | float | Determines how aggressive of a force is applied in reaching the goal velocity. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#Velocity\|Velocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the goal velocity. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#Velocity\|velocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.**  |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#GetLastForce\|GetLastForce()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Not implemented and will always return the `0` vector. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#lastForce\|lastForce()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the last force in the object. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### MaxForce

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the limit on the amount of force that may be applied on each axis in reaching the goal [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#Velocity|Velocity]]. If an assembly isn't moving, consider increasing this value and also check that it is not [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] or attached to any anchored assemblies.

### maxForce

> [!warning] Deprecated
> This property is a deprecated variant of `Class.BodyVelocity.MaxForce`
> which should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

### P

**Type:** float

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines how much power is used while applying force in order to reach the goal [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#Velocity|Velocity]]. The higher this value, the more power will be used and the faster it will be used. The force the [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity|BodyVelocity]] exerts increases as the difference between the assembly's current velocity and the goal velocity increases. This property is multiplied to this force to either amplify or diminish it.

### Velocity

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property (not to be confused with [[30 Official Roblox Docs/API Reference/Classes/BasePart#Velocity|BasePart.Velocity]]) determines the target velocity towards which force will be exerted. It is specified relative to the world, not the assembly.

### velocity

> [!warning] Deprecated
> This property is a deprecated variant of `Class.BodyVelocity.Velocity`
> which should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

## Methods

### GetLastForce

```lua
BodyVelocity:GetLastForce(): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Physics

This method is not implemented and it will always return the `0` vector. You are advised to use [[30 Official Roblox Docs/API Reference/Classes/AlignPosition|AlignPosition]] instead.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

### lastForce

```lua
BodyVelocity:lastForce(): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Returns the last force in the object.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

---
*Source: [BodyVelocity](https://create.roblox.com/docs/reference/engine/classes/BodyVelocity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
