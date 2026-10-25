---
title: "CylindricalConstraint"
description: "Constrains two attachments on two parts to have a relative linear and rotational motion."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CylindricalConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Constrains two attachments on two parts to have a relative linear and rotational motion.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|SlidingBallConstraint]] → [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A **CylindricalConstraint** allows its attachments to slide along one axis and rotate about another axis. It can be thought of like a combination of a [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] and a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]]. The sliding axis is determined by the **X** axis of the constraint's [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. The rotation axis is centered at the constraint's [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] and is angled off of the sliding constraint by the constraint's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#InclinationAngle|InclinationAngle]].

This constraint, along with a [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]], is ideal for building vehicle suspension.

Note that if this constraint attaches one part (**A**) to another part (**B**) that is anchored or connected to an anchored part (**Z**), part **A** will not be locally simulated when interacting with a player.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Angular Power

If a cylindrical's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularActuatorType|AngularActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], it attempts to rotate the attachments with the goal of reaching its [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularVelocity|AngularVelocity]]. You can further control this rotation through both [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#MotorMaxAngularAcceleration|MotorMaxAngularAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#MotorMaxTorque|MotorMaxTorque]]. If a cylindrical's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularActuatorType|AngularActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], it attempts to rotate to an angle specified by [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#TargetAngle|TargetAngle]]. This rotation is controlled by [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularSpeed|AngularSpeed]], [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularResponsiveness|AngularResponsiveness]], and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#ServoMaxTorque|ServoMaxTorque]].

#### Linear Power

If a cylindrical's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], it attempts to translate the attachments with the goal of reaching [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|Velocity]]. You can further control this translation through both [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|MotorMaxAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|MotorMaxForce]]. If a cylindrical's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], it attempts to translate the attachments to a set separation specified by [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|TargetPosition]]. This translation is controlled by [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|Speed]], [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|LinearResponsiveness]], and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|ServoMaxForce]].

#### Limits

You can set limits to restrict both the **sliding range** and **rotation** of a cylindrical constraint. Enabling the [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|LowerLimit]] and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|UpperLimit]] values, as well as [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|Restitution]] which defines the elasticity of the attachments when they reach either limit. Enabling the [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularLimitsEnabled|AngularLimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#LowerAngle|LowerAngle]] and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#UpperAngle|UpperAngle]] limits, as well as [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularRestitution|AngularRestitution]] which defines the elasticity of the attachments when they reach either limit.

#### Inclination Angle

[[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#InclinationAngle|InclinationAngle]] defines the direction of the rotation axis as an angle from the **X** axis in the **XY** plane of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]], from -180 to 180. This lets you tilt the rotating element without changing the sliding axis.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularActuatorType\|AngularActuatorType]] | [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|ActuatorType]] | Type of angular actuator. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularLimitsEnabled\|AngularLimitsEnabled]] | boolean | Enables the angular limits around the rotation axis. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularResponsiveness\|AngularResponsiveness]] | float | Specifies the sharpness of the angular servo motor in reaching the [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#TargetAngle\|TargetAngle]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularRestitution\|AngularRestitution]] | float | Restitution of the two limits, or how elastic they are. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularSpeed\|AngularSpeed]] | float | Target angular speed. This value is unsigned as the servo will always move toward its target. In radians per second. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularVelocity\|AngularVelocity]] | float | The target angular velocity of the motor in radians per second around the rotation axis. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#CurrentAngle\|CurrentAngle]] | float | Signed angle (in degrees) between the reference axis and the secondary axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]] around the rotation axis. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#InclinationAngle\|InclinationAngle]] | float | Direction of the rotation axis as an angle from the **X** axis in the **XY** plane of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#LowerAngle\|LowerAngle]] | float | Lower limit for the angle (in degrees) between the reference axis and the SecondaryAxis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]] around the rotation axis. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#MotorMaxAngularAcceleration\|MotorMaxAngularAcceleration]] | float | The maximum angular acceleration of the motor in radians per second squared. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#MotorMaxTorque\|MotorMaxTorque]] | float | The maximum torque the motor can apply to achieve the target angular velocity. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#RotationAxisVisible\|RotationAxisVisible]] | boolean | Enable the visibility of the rotation axis. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#ServoMaxTorque\|ServoMaxTorque]] | float | Maximum torque the servo motor can apply. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#SoftlockAngularServoUponReachingTarget\|SoftlockAngularServoUponReachingTarget]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#TargetAngle\|TargetAngle]] | float | Target angle (in degrees) between the reference axis and the secondary axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]] around the rotation axis. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#UpperAngle\|UpperAngle]] | float | Upper limit for the angle (in degrees) between the reference axis and the secondary axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]] around the rotation axis. |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#WorldRotationAxis\|WorldRotationAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The unit vector direction of the rotation axis in world coordinates. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|SlidingBallConstraint]], [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AngularActuatorType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|ActuatorType]]

**Thread safety:** ReadSafe · **Category:** Cylinder · **Loaded/Saved:** true/true · **Capabilities:** Physics

If a cylindrical's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularActuatorType|AngularActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], it attempts to rotate the attachments with the goal of reaching its [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularVelocity|AngularVelocity]]. You can further control this rotation through both [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#MotorMaxAngularAcceleration|MotorMaxAngularAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#MotorMaxTorque|MotorMaxTorque]].

If a cylindrical's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularActuatorType|AngularActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], it attempts to rotate to an angle specified by [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#TargetAngle|TargetAngle]]. This rotation is controlled by [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularSpeed|AngularSpeed]], [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularResponsiveness|AngularResponsiveness]], and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#ServoMaxTorque|ServoMaxTorque]].

### AngularLimitsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Cylinder · **Loaded/Saved:** true/true · **Capabilities:** Physics

Enables the angular limits around the rotation axis.

### AngularResponsiveness

**Type:** float

**Thread safety:** ReadSafe · **Category:** AngularServo · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property specifies the sharpness of the angular servo motor in reaching the [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#TargetAngle|TargetAngle]], when [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularActuatorType|AngularActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]]. Larger values correspond to a faster response and smaller values results in more damping and a slower response.

### AngularRestitution

**Type:** float

**Thread safety:** ReadSafe · **Category:** AngularLimits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Restitution of the two limits, or how elastic they are. Constrained between 0 and 1.

### AngularSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** AngularServo · **Loaded/Saved:** true/true · **Capabilities:** Physics

Target angular speed. This value is unsigned as the servo will always move toward its target. In radians per second.

### AngularVelocity

**Type:** float

**Thread safety:** ReadSafe · **Category:** AngularMotor · **Loaded/Saved:** true/true · **Capabilities:** Physics

The target angular velocity of the motor in radians per second around the rotation axis.

### CurrentAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Derived · **Loaded/Saved:** false/true · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

Signed angle (in degrees) between the reference axis and the secondary axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] around the rotation axis. Valid range between -180 and 180.

### InclinationAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Cylinder · **Loaded/Saved:** true/true · **Capabilities:** Physics

Direction of the rotation axis as an angle from the **X** axis in the **XY** plane of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. Valid range between -180 and 180.

### LowerAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** AngularLimits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Lower limit for the angle (in degrees) between the reference axis and the SecondaryAxis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] around the rotation axis. Valid range between -180 and 180.

### MotorMaxAngularAcceleration

**Type:** float

**Thread safety:** ReadSafe · **Category:** AngularMotor · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum angular acceleration of the motor in radians per second squared.

### MotorMaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** AngularMotor · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum torque the motor can apply to achieve the target angular velocity. Units are mass × studs²/second².

### RotationAxisVisible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Enable the visibility of the rotation axis.

### ServoMaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** AngularServo · **Loaded/Saved:** true/true · **Capabilities:** Physics

Maximum torque the servo motor can apply. Units are mass × studs²/second².

### SoftlockAngularServoUponReachingTarget

> [!warning] Deprecated
> This property should not be used in new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** AngularServo · **Loaded/Saved:** true/true · **Capabilities:** Physics · **Tags:** `Deprecated`

### TargetAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** AngularServo · **Loaded/Saved:** true/true · **Capabilities:** Physics

Target angle (in degrees) between the reference axis and the secondary axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] around the rotation axis. Valid range between -180 and 180.

### UpperAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** AngularLimits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Upper limit for the angle (in degrees) between the reference axis and the secondary axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] around the rotation axis. Valid range between -180 and 180.

### WorldRotationAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Derived · **Loaded/Saved:** false/true · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

The unit vector direction of the rotation axis in world coordinates.

---
*Source: [CylindricalConstraint](https://create.roblox.com/docs/reference/engine/classes/CylindricalConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
