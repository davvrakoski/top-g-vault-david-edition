---
title: "Torque"
description: "Applies constant torque to an assembly from its center of mass."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Torque"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies constant torque to an assembly from its center of mass.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A `Torque` constraint applies constant torque to an assembly from its center of mass. Alternatively:

- Because the `Torque` constraint applies **constant** torque and angular acceleration, very high speeds may result if no other forces are involved. If you want to maintain a more steady velocity over time, use an [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity|AngularVelocity]] constraint.
- If you only need **initial** velocity, set the [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyAngularVelocity|AssemblyAngularVelocity]] property directly on the assembly.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Relativity

By default, torque is applied relative to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. If the parent assembly rotates, the torque will change direction to match the adjusted orientation of the attachment.

If [[30 Official Roblox Docs/API Reference/Classes/Torque#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], torque will be applied in world coordinates, independent of the parent or attachment orientations.

If [[30 Official Roblox Docs/API Reference/Classes/Torque#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]], torque will be applied relative to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] and, if the attachment rotates, change to match its orientation.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Torque#RelativeTo\|RelativeTo]] | [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|ActuatorRelativeTo]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] in which the torque is expressed. |
| [[30 Official Roblox Docs/API Reference/Classes/Torque#Torque\|Torque]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The strength and direction of the torque. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### RelativeTo

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|ActuatorRelativeTo]]

**Thread safety:** ReadSafe · **Category:** Torque · **Loaded/Saved:** true/true · **Capabilities:** Physics

The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in which the torque is expressed.

### Torque

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Torque · **Loaded/Saved:** true/true · **Capabilities:** Physics

The strength and direction of the torque.

---
*Source: [Torque](https://create.roblox.com/docs/reference/engine/classes/Torque) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
