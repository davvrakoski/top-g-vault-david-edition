---
title: "HingeConstraint"
description: "Constrains its attachments to rotate about a single axis."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HingeConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Constrains its attachments to rotate about a single axis.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A **HingeConstraint** allows two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] to rotate about one axis, constraining the two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] so that they both occupy the same position and that their **X** axes point in the same direction.

Note that if this constraint attaches one part (**A**) to another part (**B**) that is anchored or connected to an anchored part (**Z**), part **A** will not be locally simulated when interacting with a player.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Angular Power

Hinges can be configured to actuate rotation. If a hinge's [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], it attempts to rotate the attachments with the goal of reaching its [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularVelocity|AngularVelocity]]. You can further control this rotation through both [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#MotorMaxAcceleration|MotorMaxAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#MotorMaxTorque|MotorMaxTorque]]. If a hinge's [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], it attempts to rotate to an angle specified by [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#TargetAngle|TargetAngle]]. This rotation is controlled by both [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularSpeed|AngularSpeed]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ServoMaxTorque|ServoMaxTorque]].

#### Limits

You can set limits to restrict the rotation of a hinge, useful for mechanisms like doors which should only swing open or closed within a set range. Enabling the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LimitsEnabled|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LowerAngle|LowerAngle]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#UpperAngle|UpperAngle]] limits, as well as [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#Restitution|Restitution]] which defines the elasticity of the attachments when they reach either limit.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType\|ActuatorType]] | [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|ActuatorType]] | Sets whether the rotation of the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] is actuated and, if so, what kind of actuation it uses. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularResponsiveness\|AngularResponsiveness]] | float | Specifies the sharpness of the servo motor in reaching the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#TargetAngle\|TargetAngle]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularSpeed\|AngularSpeed]] | float | The desired angular speed a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] with [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType\|ActuatorType]] set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Servo]] will attempt to maintain while rotating towards its [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#TargetAngle\|TargetAngle]]. Measured in radians/second. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularVelocity\|AngularVelocity]] | float | The angular velocity a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] with [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType\|ActuatorType]] set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Motor]] will attempt to achieve. Measured in radians/second. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#CurrentAngle\|CurrentAngle]] | float | The current angle of the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LimitsEnabled\|LimitsEnabled]] | boolean | Sets whether the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] will limit the range of rotation. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LowerAngle\|LowerAngle]] | float | The minimum rotation angle the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] will allow if [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LimitsEnabled\|LimitsEnabled]] is true. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#MotorMaxAcceleration\|MotorMaxAcceleration]] | float | The maximum angular acceleration a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] with [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType\|ActuatorType]] set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Motor]] can apply to achieve its [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularVelocity\|AngularVelocity]]. Measured in radians/second². |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#MotorMaxTorque\|MotorMaxTorque]] | float | The maximum torque a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] with [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType\|ActuatorType]] set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Motor]] can apply when trying to reach its desired [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularVelocity\|AngularVelocity]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#Radius\|Radius]] | float | The visualized radius of the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#Restitution\|Restitution]] | float | How elastic [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] connected by a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] will be when they reach the end of the range when [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LimitsEnabled\|LimitsEnabled]] is true. Constrained between 0 and 1. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ServoMaxTorque\|ServoMaxTorque]] | float | The maximum torque a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] with [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType\|ActuatorType]] set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Servo]] can apply when trying to reach its desired [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#TargetAngle\|TargetAngle]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#SoftlockServoUponReachingTarget\|SoftlockServoUponReachingTarget]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#TargetAngle\|TargetAngle]] | float | The target angle a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] will attempt to rotate to if its [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType\|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Servo]]. Measured in degrees. |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#UpperAngle\|UpperAngle]] | float | The maximum rotation angle the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] will allow if [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LimitsEnabled\|LimitsEnabled]] is true. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ActuatorType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|ActuatorType]]

**Thread safety:** ReadSafe · **Category:** Hinge · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets whether the rotation of the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] is actuated and, if so, what kind of actuation.

- If [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], the hinge will attempt to rotate the attachments with the goal of reaching [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularVelocity|AngularVelocity]]. This rotation is limited by both [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#MotorMaxAcceleration|MotorMaxAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#MotorMaxTorque|MotorMaxTorque]].
- If [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], the hinge will attempt to rotate to an angle specified by [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#TargetAngle|TargetAngle]]. This rotation is limited by both [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularSpeed|AngularSpeed]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ServoMaxTorque|ServoMaxTorque]].

Note that both actuated and free spinning rotation can be limited by setting [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LimitsEnabled|LimitsEnabled]] to true.

### AngularResponsiveness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Servo · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property specifies the sharpness of the servo motor in reaching the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#TargetAngle|TargetAngle]], when [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]]. Larger values correspond to a faster response and smaller values results in more damping and a slower response.

### AngularSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Servo · **Loaded/Saved:** true/true · **Capabilities:** Physics

The desired angular speed a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] with [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]] will attempt to maintain while rotating towards its [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#TargetAngle|TargetAngle]]. Measured in radians/second.

### AngularVelocity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Motor · **Loaded/Saved:** true/true · **Capabilities:** Physics

The angular velocity a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] with [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]] will attempt to achieve. Measured in radians/second.

### CurrentAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Derived · **Loaded/Saved:** false/true · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

The current angle of the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]]. This angle is calculated by measuring the angle separation of the **Y** axes of the [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

### LimitsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Hinge · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets whether the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] will limit the range of rotation. If enabled, the constraint will only allow the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#CurrentAngle|CurrentAngle]] to be between [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LowerAngle|LowerAngle]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#UpperAngle|UpperAngle]]. If the [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] reach the end of the limited range of rotation then they will stop rotating. If [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#Restitution|Restitution]] is greater than 0 then the attachments will bounce when they hit the ends of the limited range.

### LowerAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

The minimum rotation angle the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] will allow if [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LimitsEnabled|LimitsEnabled]] is true. Measured in degrees.

### MotorMaxAcceleration

**Type:** float

**Thread safety:** ReadSafe · **Category:** Motor · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum angular acceleration a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] with [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]] can apply to achieve its [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularVelocity|AngularVelocity]]. Measured in radians/second².

### MotorMaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Motor · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum torque a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] with [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]] can apply when trying to reach its desired [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularVelocity|AngularVelocity]].

### Radius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

The visualized radius of the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]].

### Restitution

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

How elastic [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] connected by a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] will be when they reach the end of the range when [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LimitsEnabled|LimitsEnabled]] is true. Constrained between 0 and 1.

### ServoMaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Servo · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum torque a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] with [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]] can apply when trying to reach its desired [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#TargetAngle|TargetAngle]].

### SoftlockServoUponReachingTarget

> [!warning] Deprecated
> This property should not be used in new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Servo · **Loaded/Saved:** true/true · **Capabilities:** Physics · **Tags:** `Deprecated`

### TargetAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Servo · **Loaded/Saved:** true/true · **Capabilities:** Physics

The target angle a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] will attempt to rotate to if its [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]]. Measured in degrees.

### UpperAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum rotation angle the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] will allow if [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LimitsEnabled|LimitsEnabled]] is true. Measured in degrees.

---
*Source: [HingeConstraint](https://create.roblox.com/docs/reference/engine/classes/HingeConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
