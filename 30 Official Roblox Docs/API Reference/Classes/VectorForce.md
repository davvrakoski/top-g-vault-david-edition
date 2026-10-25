---
title: "VectorForce"
description: "Applies constant force to an assembly."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VectorForce"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies constant force to an assembly.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

The `VectorForce` constraint applies constant force to an assembly. The direction and strength of the force is determined by a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] and can be relative to an attachment on the part, another attachment, or the world coordinate system. Alternatively:

- Because the `VectorForce` constraint applies **constant** force and acceleration, very high speeds may result if no other forces are involved. If you want to maintain a more steady velocity over time, use a [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] constraint.
- If you only need **initial** velocity, set the [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity|AssemblyLinearVelocity]] property directly on the assembly.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Force Location

By default, force is applied to the assembly at the location of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. Thus, if its center of mass is not aligned with the direction/point of force, torque will be applied as well. If desired, force can be focused at the center of mass by toggling on [[30 Official Roblox Docs/API Reference/Classes/VectorForce#ApplyAtCenterOfMass|ApplyAtCenterOfMass]].

#### Relativity

By default, force is applied relative to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. If the parent assembly rotates, the force will change direction to match the adjusted orientation of the attachment; visualize this behavior in how the thruster of a rocket pushes it forward, regardless of the rocket's rotation.

If [[30 Official Roblox Docs/API Reference/Classes/VectorForce#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], force will be applied in world coordinates, independent of the parent or attachment orientations; visualize this behavior as a directional force like the wind blowing against an object.

If [[30 Official Roblox Docs/API Reference/Classes/VectorForce#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]], force will be applied relative to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] and, if the attachment rotates, the force will change to match its orientation.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VectorForce#ApplyAtCenterOfMass\|ApplyAtCenterOfMass]] | boolean | Whether force is applied at the center of mass of the parent assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/VectorForce#Force\|Force]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The strength and direction of the force. |
| [[30 Official Roblox Docs/API Reference/Classes/VectorForce#RelativeTo\|RelativeTo]] | [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|ActuatorRelativeTo]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] in which the force is expressed. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ApplyAtCenterOfMass

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** VectorForce · **Loaded/Saved:** true/true · **Capabilities:** Physics

When `true`, force is applied at the center of mass of the parent assembly of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. When `false`, force is applied at [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]].

### Force

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** VectorForce · **Loaded/Saved:** true/true · **Capabilities:** Physics

The strength and direction of the force.

### RelativeTo

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|ActuatorRelativeTo]]

**Thread safety:** ReadSafe · **Category:** VectorForce · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in which the force is expressed.

---
*Source: [VectorForce](https://create.roblox.com/docs/reference/engine/classes/VectorForce) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
