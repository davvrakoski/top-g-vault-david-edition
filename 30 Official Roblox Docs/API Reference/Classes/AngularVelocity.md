---
title: "AngularVelocity"
description: "Applies torque on an assembly to maintain a constant angular velocity."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AngularVelocity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies torque on an assembly to maintain a constant angular velocity.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

The `AngularVelocity` constraint applies torque on an assembly to maintain a **constant** angular velocity. Alternatively:

- If you want to control the amount of torque applied, use a [[30 Official Roblox Docs/API Reference/Classes/Torque|Torque]] constraint.
- If you only need **initial** angular velocity, set the [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyAngularVelocity|AssemblyAngularVelocity]] method directly on the assembly.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Relativity

Application of velocity can be controlled through the constraint's [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#RelativeTo|RelativeTo]] property. If set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], the angular velocity vector is used as is. If set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]] and the constraint's [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] property is set to another attachment, the angular velocity will be affected by that of the other attachment. Setting [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#RelativeTo|RelativeTo]] to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]] also exposes the [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#ReactionTorqueEnabled|ReactionTorqueEnabled]] property.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#AngularVelocity\|AngularVelocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] that gives the desired or target angular velocity. |
| [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#MaxTorque\|MaxTorque]] | float | Magnitude of the maximum torque the constraint can apply. |
| [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#ReactionTorqueEnabled\|ReactionTorqueEnabled]] | boolean | Causes the constraint to apply equal and opposite reaction forces. |
| [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#RelativeTo\|RelativeTo]] | [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|ActuatorRelativeTo]] | The [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|Enum.ActuatorRelativeTo]] value specifying the coordinate frame in which the [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#AngularVelocity\|AngularVelocity]] vector is expressed; defaults to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|World]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AngularVelocity

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Torque · **Loaded/Saved:** true/true · **Capabilities:** Physics

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] that gives the desired or target angular velocity. This vector is set in the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] expressed by the [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#RelativeTo|RelativeTo]] property.

### MaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Torque · **Loaded/Saved:** true/true · **Capabilities:** Physics

Magnitude of the maximum torque the constraint can apply.

### ReactionTorqueEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Torque · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property, when enabled, causes the constraint to apply equal and opposite reaction forces. This is important if the two attached parts can collide, since without reaction forces collisions can create energy that would otherwise be disregarded.

When enabled, the reaction forces cause the constraint to act like an angular motor between the two attachments.

Only meaningful when [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]].

### RelativeTo

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|ActuatorRelativeTo]]

**Thread safety:** ReadSafe · **Category:** Torque · **Loaded/Saved:** true/true · **Capabilities:** Physics

The coordinate frame in which the [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#AngularVelocity|AngularVelocity]] vector is expressed, selected by an [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Enum.ActuatorRelativeTo]] value. If set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], the angular velocity vector is used as is. If set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]], the angular velocity is transformed by the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the assigned attachment.

[[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#RelativeTo|RelativeTo]] can also be set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment0]], but it makes no physical sense and will lead to unpredictable behaviors.

---
*Source: [AngularVelocity](https://create.roblox.com/docs/reference/engine/classes/AngularVelocity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
