---
title: "LinearVelocity"
description: "Applies force on an assembly to maintain a constant linear velocity."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/LinearVelocity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies force on an assembly to maintain a constant linear velocity.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

The `LinearVelocity` constraint applies force on an assembly to maintain a **constant** linear velocity. It can be set to apply force along a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], line, or 2D plane. Alternatively:

- If you want to control the amount of force applied, use a [[30 Official Roblox Docs/API Reference/Classes/VectorForce|VectorForce]] constraint.
- If you only need **initial** linear velocity, set the [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity|AssemblyLinearVelocity]] property directly on the assembly.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Relativity

Application of velocity can be controlled through the constraint's [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] property. If set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], force will be applied in world coordinates, independent of the parent or attachment orientations. If set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment0]] or [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]], force will be applied relative to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] or [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] respectively.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitMode\|ForceLimitMode]] | [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode\|ForceLimitMode]] | Determines how the constraint force will be limited. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitsEnabled\|ForceLimitsEnabled]] | boolean | Determines if the constraint force will be limited or if the physics solver can apply an unlimited force to achieve the target velocity. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#LineDirection\|LineDirection]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The normalized [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] direction for constraining the velocity along a line. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#LineVelocity\|LineVelocity]] | float | Float value of the velocity when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode\|VelocityConstraintMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode\|Line]]. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxAxesForce\|MaxAxesForce]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum force along each axis that the constraint can apply to achieve the vector velocity. Only used if [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitsEnabled\|ForceLimitsEnabled]] is `true`, [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitMode\|ForceLimitMode]] is [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode\|PerAxis]], and [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode\|VelocityConstraintMode]] is [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode\|Vector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxForce\|MaxForce]] | float | Maximum magnitude of the force vector the constraint can apply. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxPlanarAxesForce\|MaxPlanarAxesForce]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Maximum force along each axis that the constraint can apply to achieve the plane velocity. Only used if [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitsEnabled\|ForceLimitsEnabled]] is `true`, [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitMode\|ForceLimitMode]] is [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode\|PerAxis]], and [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode\|VelocityConstraintMode]] is [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode\|Plane]]. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#PlaneVelocity\|PlaneVelocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] value of the velocity in each tangent direction of the plane. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#PrimaryTangentAxis\|PrimaryTangentAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The primary axis in the plane, when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode\|VelocityConstraintMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode\|Plane]]. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ReactionForceEnabled\|ReactionForceEnabled]] | boolean | Determines whether an equal and opposite reaction force is also applied to the assembly of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]] when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo\|RelativeTo]] is [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|Attachment1]]. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo\|RelativeTo]] | [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|ActuatorRelativeTo]] | Sets the [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|Enum.ActuatorRelativeTo]] property for the constraint. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#SecondaryTangentAxis\|SecondaryTangentAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The secondary axis in the plane, when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode\|VelocityConstraintMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode\|Plane]]. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VectorVelocity\|VectorVelocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] velocity value when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode\|VelocityConstraintMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode\|Vector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode\|VelocityConstraintMode]] | [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode\|VelocityConstraintMode]] | The mode of the constraint. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ForceLimitMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|ForceLimitMode]]

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Determines how the constraint force will be limited. When set to [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|Magnitude]], the constraint force will have a magnitude less than [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxForce|MaxForce]]. When set to [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|PerAxis]], the force along each axis will be less than the corresponding value in [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxAxesForce|MaxAxesForce]] when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] is [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Vector]] or the corresponding value in [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxPlanarAxesForce|MaxPlanarAxesForce]] when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] is [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Plane]]. Only used when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitsEnabled|ForceLimitsEnabled]] is `true`.

### ForceLimitsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Mode · **Loaded/Saved:** true/true · **Capabilities:** Physics

Determines if the constraint force will be limited or if the physics solver can apply an unlimited force to achieve the target velocity. When enabled, the constraint force is limited based on [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitMode|ForceLimitMode]]. When disabled, the physics solver will always apply a force that is large enough to achieve the target velocity.

### LineDirection

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Line · **Loaded/Saved:** true/true · **Capabilities:** Physics

The normalized [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] direction for constraining the velocity along a line, when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Line]].

### LineVelocity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Line · **Loaded/Saved:** true/true · **Capabilities:** Physics

Float value of the velocity when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Line]].

### MaxAxesForce

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Maximum force along each axis that the constraint can apply to achieve the target velocity. Only used if [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitsEnabled|ForceLimitsEnabled]] is `true`, [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitMode|ForceLimitMode]] is [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|PerAxis]], and [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] is [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Vector]]. The axes used to apply the limit correspond to the [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] property.

### MaxForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Maximum magnitude of the force vector the constraint can apply. Only used if [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitsEnabled|ForceLimitsEnabled]] is `true` and [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitMode|ForceLimitMode]] is [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|Magnitude]].

### MaxPlanarAxesForce

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Maximum force along each axis that the constraint can apply to achieve the plane velocity. Only used if [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitsEnabled|ForceLimitsEnabled]] is `true`, [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitMode|ForceLimitMode]] is [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|PerAxis]], and [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] is [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Plane]]. The axes used to apply the limit correspond to the [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] property.

### PlaneVelocity

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Plane · **Loaded/Saved:** true/true · **Capabilities:** Physics

[[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] value of the velocity in each tangent direction of the plane, when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Plane]].

### PrimaryTangentAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Plane · **Loaded/Saved:** true/true · **Capabilities:** Physics

The primary axis in the plane, when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Plane]]. Value depends on the value of [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] as follows:

- If [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment0]], this axis is the [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]] of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]].
- If [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]], this axis is the [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]] of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]].
- If [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], this value must be specified in the world space.

### ReactionForceEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Mode · **Loaded/Saved:** true/true · **Capabilities:** Physics

Determines whether the constraint applies an equal and opposite reaction force to the assembly of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]]. Defaults to `true`. This reaction force is relevant when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] is [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Enum.ActuatorRelativeTo.Attachment1]] — the mode in which the constraint drives the `Attachment0` assembly's velocity relative to the `Attachment1` assembly. Because `RelativeTo` defaults to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Enum.ActuatorRelativeTo.World]], this property is typically only meaningful once `RelativeTo` is set to `Attachment1`.

When enabled in that mode, the constraint applies the reaction force to the `Attachment1` assembly, coupling the two assemblies. When disabled, the constraint applies force only to the `Attachment0` assembly; the `Attachment1` assembly receives no reaction force, though its pose and velocity are still read as the reference frame for the target velocity.

### RelativeTo

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|ActuatorRelativeTo]]

**Thread safety:** ReadSafe · **Category:** Mode · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets the [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Enum.ActuatorRelativeTo]] property for the constraint.

### SecondaryTangentAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Plane · **Loaded/Saved:** true/true · **Capabilities:** Physics

The secondary axis in the plane, when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Plane]]. Value depends on the value of [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] as follows:

- If [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment0]], this axis is the [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]] of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]].
- If [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]], this axis is the [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]] of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]].
- If [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], this value must be specified in the world space.

### VectorVelocity

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Vector · **Loaded/Saved:** true/true · **Capabilities:** Physics

[[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] velocity value when [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Vector]].

### VelocityConstraintMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|VelocityConstraintMode]]

**Thread safety:** ReadSafe · **Category:** Mode · **Loaded/Saved:** true/true · **Capabilities:** Physics

The mode of the constraint: [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Line]], [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Plane]], or [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Vector]]. Default is [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Vector]].

---
*Source: [LinearVelocity](https://create.roblox.com/docs/reference/engine/classes/LinearVelocity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
