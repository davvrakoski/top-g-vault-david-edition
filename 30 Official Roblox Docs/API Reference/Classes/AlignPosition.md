---
title: "AlignPosition"
description: "Constraint which applies force to move two attachments together, or to move one attachment to a goal position."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AlignPosition"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Constraint which applies force to move two attachments together, or to move one attachment to a goal position.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

The `AlignPosition` constraint applies force to move two attachments together, or to move one attachment to a goal position. As indicated by the name, it only affects the **position** of the attachments, not their orientation (to align attachments by **orientation**, see [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]]).

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Force Location

By default, force is applied to the parent of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] at that attachment's location, meaning that if the parent's center of mass is not aligned with the direction of the force, torque will be applied as well as force. Alternatively, force can be applied to the parents' center of mass by toggling on [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ApplyAtCenterOfMass|ApplyAtCenterOfMass]].

#### Reactionary Force

By default, the constraint only applies force to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] while [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] remains unaffected. If desired, force can be applied to both attachments in **equal and opposite directions** by enabling [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ReactionForceEnabled|ReactionForceEnabled]].

#### Force Limits

You can configure this constraint to apply the maximum force that constraints allow through the [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled|RigidityEnabled]] property. When `true`, the physics solver reacts as quickly as possible to complete the alignment. When `false`, the force applied by the constraint is limited based on [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceLimitMode|ForceLimitMode]], [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxVelocity|MaxVelocity]], and [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Responsiveness|Responsiveness]]. See [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceLimitMode|ForceLimitMode]] for further details.

#### Attachment Mode

This constraint can use either **one** or **two** attachments in calculating its goal. See [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Mode|Mode]] for details.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ApplyAtCenterOfMass\|ApplyAtCenterOfMass]] | boolean | Whether force is applied to the parent of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]] at that attachment's location, or at the parents' center of mass. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceLimitMode\|ForceLimitMode]] | [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode\|ForceLimitMode]] | Determines how the constraint force will be limited. Only used if [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled\|RigidityEnabled]] is `false`. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceRelativeTo\|ForceRelativeTo]] | [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|ActuatorRelativeTo]] | Determines the axes that the constraint uses to limit the force. Only applies when [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled\|RigidityEnabled]] is `false` and [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceLimitMode\|AlignPosition.ForceLimitMode]] is [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode\|PerAxis]]. . |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxAxesForce\|MaxAxesForce]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum force along each axis that the constraint can apply to achieve its goal. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxForce\|MaxForce]] | float | Maximum force magnitude the constraint can apply to achieve its goal. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxVelocity\|MaxVelocity]] | float | Maximum speed the attachments can move when converging. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Mode\|Mode]] | [[30 Official Roblox Docs/API Reference/Enums/PositionAlignmentMode\|PositionAlignmentMode]] | Whether the constraint uses one or two attachments in calculating its goal. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The position to which the constraint should move its [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ReactionForceEnabled\|ReactionForceEnabled]] | boolean | Whether the constraint applies force only to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]], or to both attachments in equal and opposite directions. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Responsiveness\|Responsiveness]] | float | Controls how quickly the constraint reaches its goal. Higher values cause the attachment(s) to align more rapidly. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled\|RigidityEnabled]] | boolean | Whether force is dependent on other properties, or if the physics solver reacts as quickly as possible to complete the alignment. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ApplyAtCenterOfMass

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** AlignPosition · **Loaded/Saved:** true/true · **Capabilities:** Physics

When `false` (default), force is applied to the parent of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] at that attachment's location, meaning that if the parent's center of mass is not aligned with the direction of the force, torque will be applied as well as force. When `true`, force is applied at the parents' center of mass.

### ForceLimitMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|ForceLimitMode]]

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Determines how the constraint force will be limited when [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled|RigidityEnabled]] is `false`. When set to [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|Magnitude]], the constraint force will be limited such that the magnitude is less than [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxForce|MaxForce]]. When set to [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|PerAxis]], the constraint force along each axis will be limited by [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxAxesForce|MaxAxesForce]]. The axes along which the force will be limited are based on the [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceRelativeTo|ForceRelativeTo]] property.

### ForceRelativeTo

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|ActuatorRelativeTo]]

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Determines the axes that the constraint uses to limit the force. Only applies when [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled|RigidityEnabled]] is `false` and [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceLimitMode|AlignPosition.ForceLimitMode]] is [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|PerAxis]]. When set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], the constraint force is computed in the world reference frame and the force limits specified in [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxAxesForce|MaxAxesForce]] refer to the axes of the world coordinate system. When set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment0]] or [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]], the force limits specified in [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxAxesForce|MaxAxesForce]] refer to the axes of the specified attachment coordinate system.

### MaxAxesForce

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Maximum force along each axis that the constraint can apply to achieve its goal. Only used if [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled|RigidityEnabled]] is `false` and [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceLimitMode|ForceLimitMode]] is [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|PerAxis]]. The axes used to apply to the limit are specified using the [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceRelativeTo|ForceRelativeTo]] property.

### MaxForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Maximum force magnitude the constraint can apply to achieve its goal. Only used if [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled|RigidityEnabled]] is `false` and [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceLimitMode|ForceLimitMode]] is [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|Magnitude]].

Note that [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxForce|MaxForce]], as well as [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxVelocity|MaxVelocity]], are **caps** to the force and velocity respectively. The actual scale is determined by [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Responsiveness|Responsiveness]].

### MaxVelocity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Maximum speed the attachments can move when converging. Only used if [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled|RigidityEnabled]] is `false`.

Note that [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxVelocity|MaxVelocity]], as well as [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxForce|MaxForce]], are **caps** to the velocity and force respectively. The actual scale is determined by [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Responsiveness|Responsiveness]].

### Mode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PositionAlignmentMode|PositionAlignmentMode]]

**Thread safety:** ReadSafe · **Category:** AlignmentMode · **Loaded/Saved:** true/true · **Capabilities:** Physics

Whether the constraint uses **one** or **two** attachments in calculating its goal. By default, this is [[30 Official Roblox Docs/API Reference/Enums/PositionAlignmentMode|TwoAttachment]], meaning that the constraint disregards [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Position|Position]] and attempts to move [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] to the position of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]].

If set to [[30 Official Roblox Docs/API Reference/Enums/PositionAlignmentMode|OneAttachment]], the constraint disregards [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] and attempts to move [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] to [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Position|Position]].

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** AlignPosition · **Loaded/Saved:** true/true · **Capabilities:** Physics

The position to which the constraint should move its [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. Only used if [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Mode|Mode]] is set to [[30 Official Roblox Docs/API Reference/Enums/PositionAlignmentMode|OneAttachment]], in which case [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] is disregarded.

### ReactionForceEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** AlignPosition · **Loaded/Saved:** true/true · **Capabilities:** Physics

If `false` (default), the constraint only applies force to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] while [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] remains unaffected. If `true`, the constraint applies force to both attachments in **equal and opposite directions**.

### Responsiveness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Controls how quickly the constraint reaches its goal. Higher values cause the attachment(s) to align more rapidly. Value can be between 5 and 200.

### RigidityEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** AlignPosition · **Loaded/Saved:** true/true · **Capabilities:** Physics

Whether force is dependent on other properties, or if the physics solver reacts as quickly as possible to complete the alignment. If `false` (default), the force is determined by [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxForce|MaxForce]], [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxVelocity|MaxVelocity]], and [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Responsiveness|Responsiveness]]. If `true`, the physics solver reacts as quickly as possible to complete the alignment.

---
*Source: [AlignPosition](https://create.roblox.com/docs/reference/engine/classes/AlignPosition) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
