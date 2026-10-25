---
title: "SlidingBallConstraint"
description: "The base class for constraints that allow their attachments to slide along an axis."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SlidingBallConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The base class for constraints that allow their attachments to slide along an axis.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|CylindricalConstraint]], [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]]
- **Memory category:** BaseParts
- **Tags:** `NotCreatable`

## Description

**SlidingBallConstraint** is the base class for constraints that allow their attachments to slide along an axis, including [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|CylindricalConstraint]]. The base class does not restrict rotation. [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] prevents rotation, while [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|CylindricalConstraint]] allows rotation about an axis.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Linear Power

If this constraint's [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], it attempts to translate the attachments with the goal of reaching [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|Velocity]]. You can further control this translation through both [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|MotorMaxAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|MotorMaxForce]].

If this constraint's [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], it attempts to translate the attachments to a set separation specified by [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|TargetPosition]]. This translation is controlled by [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|Speed]], [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|LinearResponsiveness]], and [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|ServoMaxForce]].

#### Limits

You can set **limits** to restrict this constraint's sliding range. Enabling the [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|LowerLimit]] and [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|UpperLimit]] values, as well as [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|Restitution]] which defines the elasticity of the attachments when they reach either limit.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] | [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|ActuatorType]] | Sets whether the translation of the [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint\|SlidingBallConstraint]] is actuated and, if so, what kind of actuation. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#CurrentPosition\|CurrentPosition]] | float | The current offset between the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LimitsEnabled\|LimitsEnabled]] | boolean | Sets whether the [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint\|SlidingBallConstraint]] will limit the range of translation. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LinearResponsiveness\|LinearResponsiveness]] | float | Specifies the "sharpness" of the linear servo motor in reaching the [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#TargetPosition\|TargetPosition]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LowerLimit\|LowerLimit]] | float | The lower positional limit along the **X** axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]] if [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LimitsEnabled\|LimitsEnabled]] is true. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#MotorMaxAcceleration\|MotorMaxAcceleration]] | float | The constraint's maximum acceleration when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Motor]] as the constraint attempts to reach its desired [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Velocity\|Velocity]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#MotorMaxForce\|MotorMaxForce]] | float | The constraint's maximum force when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Motor]], as the constraint attempts to reach its desired [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Velocity\|Velocity]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Restitution\|Restitution]] | float | The elasticity of the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]] when they reach the end of the range specified by [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#UpperLimit\|UpperLimit]] and [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LowerLimit\|LowerLimit]], assuming [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LimitsEnabled\|LimitsEnabled]] is set to true. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ServoMaxForce\|ServoMaxForce]] | float | The constraint's maximum force when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Servo]], as the constraint attempts to reach its desired [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Speed\|Speed]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Size\|Size]] | float | The constraint's visualized size. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#SoftlockServoUponReachingTarget\|SoftlockServoUponReachingTarget]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Speed\|Speed]] | float | The constraint's desired speed when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Servo]], as the constraint translates towards its [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#TargetPosition\|TargetPosition]]. Measured in studs per second. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#TargetPosition\|TargetPosition]] | float | The constraint's attempted target position when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Servo]]. Measured in studs. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#UpperLimit\|UpperLimit]] | float | The upper positional limit along the **X** axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]] if [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LimitsEnabled\|LimitsEnabled]] is true. |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Velocity\|Velocity]] | float | The constraint's attempted velocity when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Motor]]. Measured in studs per second. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ActuatorType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|ActuatorType]]

**Thread safety:** ReadSafe · **Category:** Slider · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets whether the translation of the [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|SlidingBallConstraint]] is actuated and, if so, what kind of actuation.

- If [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|None]], the joint can slide freely.

- If [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], it attempts to translate the attachments with the goal of reaching [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|Velocity]]. You can further control this translation through both [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|MotorMaxAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|MotorMaxForce]].

- If this constraint's [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], it attempts to translate the attachments to a set separation specified by [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|TargetPosition]]. This translation is controlled by [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|Speed]], [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|LinearResponsiveness]], and [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|ServoMaxForce]].

### CurrentPosition

**Type:** float

**Thread safety:** ReadSafe · **Category:** Derived · **Loaded/Saved:** false/true · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

The current offset between the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

### LimitsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Slider · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets whether the [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|SlidingBallConstraint]] will limit the range of translation. If true, this property exposes the [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|LowerLimit]] and [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|UpperLimit]] values, as well as [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|Restitution]] which defines the elasticity of the attachments when they reach either limit.

### LinearResponsiveness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Servo · **Loaded/Saved:** true/true · **Capabilities:** Physics

Specifies the "sharpness" of the linear servo motor in reaching the [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#TargetPosition|TargetPosition]] when the derived classes' actuator type is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]]. Larger values correspond to faster a response and smaller values results in more damping and a slower response.

### LowerLimit

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

The lower positional limit along the **X** axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] if [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LimitsEnabled|LimitsEnabled]] is true.

### MotorMaxAcceleration

**Type:** float

**Thread safety:** ReadSafe · **Category:** Motor · **Loaded/Saved:** true/true · **Capabilities:** Physics

The constraint's maximum acceleration when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], as the constraint attempts to reach its desired [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Velocity|Velocity]].

### MotorMaxForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** Motor · **Loaded/Saved:** true/true · **Capabilities:** Physics

The constraint's maximum force when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], as the constraint attempts to reach its desired [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Velocity|Velocity]].

### Restitution

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

The elasticity of the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] when they reach the end of the range specified by [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#UpperLimit|UpperLimit]] and [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LowerLimit|LowerLimit]], assuming [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LimitsEnabled|LimitsEnabled]] is set to true. The valid range is between 0–1.

### ServoMaxForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** Servo · **Loaded/Saved:** true/true · **Capabilities:** Physics

The constraint's maximum force when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], as the constraint attempts to reach its desired [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Speed|Speed]].

### Size

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

The constraint's visualized size.

### SoftlockServoUponReachingTarget

> [!warning] Deprecated
> This property should not be used in new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Servo · **Loaded/Saved:** true/true · **Capabilities:** Physics · **Tags:** `Deprecated`

### Speed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Servo · **Loaded/Saved:** true/true · **Capabilities:** Physics

The constraint's desired speed when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], as the constraint translates towards its [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#TargetPosition|TargetPosition]]. Measured in studs per second.

### TargetPosition

**Type:** float

**Thread safety:** ReadSafe · **Category:** Servo · **Loaded/Saved:** true/true · **Capabilities:** Physics

The constraint's attempted target position when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]] Measured in studs.

### UpperLimit

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

The upper positional limit along the **X** axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] if [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LimitsEnabled|LimitsEnabled]] is true.

### Velocity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Motor · **Loaded/Saved:** true/true · **Capabilities:** Physics

The constraint's attempted velocity when [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]]. Measured in studs per second.

---
*Source: [SlidingBallConstraint](https://create.roblox.com/docs/reference/engine/classes/SlidingBallConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
