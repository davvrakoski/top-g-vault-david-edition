---
title: "Cylindrical"
description: "CylindricalConstraint allows its attachments to slide along one axis and rotate about another axis, with optional assigned angular and/or linear power."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/cylindrical"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*CylindricalConstraint allows its attachments to slide along one axis and rotate about another axis, with optional assigned angular and/or linear power.*

> [!info]
> For an overview on creating, visualizing, and simulating mechanical constraints, including [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|CylindricalConstraint]], see [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|CylindricalConstraint]] allows its attachments to slide along one axis and rotate about another axis. This constraint, along with a
[[30 Official Roblox Docs/Physics/Constraints/Spring|SpringConstraint]], is ideal for building vehicle suspensions where the wheel shock can slide up and down while the wheel itself spins. This constraint can also be powered in both an [[30 Official Roblox Docs/Physics/Constraints/Cylindrical#Angular power|angular]] and [[30 Official Roblox Docs/Physics/Constraints/Cylindrical#Linear power|linear]] manner.

[Video: Cylindrical-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Cylindrical-Demo.mp4)

> [!info]
> Orientation of the attachments affects how the cylindrical aspect will rotate. To ensure rotation occurs around the desired axis, each attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]], visualized by the yellow and orange arrows, should point in the same direction.

## Angular power

If a cylindrical's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularActuatorType|AngularActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], it attempts to rotate the attachments with the goal of reaching its [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularVelocity|AngularVelocity]]. You can further control this rotation through both [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#MotorMaxAngularAcceleration|MotorMaxAngularAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#MotorMaxTorque|MotorMaxTorque]].

If a cylindrical's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularActuatorType|AngularActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], it attempts to rotate to an angle specified by [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#TargetAngle|TargetAngle]]. This rotation is controlled by [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularSpeed|AngularSpeed]], [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularResponsiveness|AngularResponsiveness]], and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#ServoMaxTorque|ServoMaxTorque]].

## Linear power

If a cylindrical's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], it attempts to translate the attachments with the goal of reaching [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|Velocity]]. You can further control this translation through both [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|MotorMaxAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|MotorMaxForce]].

If a cylindrical's [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], it attempts to translate the attachments to a set separation specified by [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|TargetPosition]]. This translation is controlled by [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|Speed]], [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|LinearResponsiveness]], and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|ServoMaxForce]].

## Limits

You can set limits to restrict both the **sliding range** and **rotation** of a cylindrical constraint.

Enabling the [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|LowerLimit]] and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|UpperLimit]] values, as well as [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|Restitution]] which defines the elasticity of the attachments when they reach either limit.

Enabling the [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularLimitsEnabled|AngularLimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#LowerAngle|LowerAngle]] and [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#UpperAngle|UpperAngle]] limits, as well as [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularRestitution|AngularRestitution]] which defines the elasticity of the attachments when they reach either limit.

[Video: Cylindrical-Limits-Linear.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Cylindrical-Limits-Linear.mp4)

*LimitsEnabled = **true***

[Video: Cylindrical-Limits-Angular.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Cylindrical-Limits-Angular.mp4)

*AngularLimitsEnabled = **true***

## Inclination angle

[[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#InclinationAngle|InclinationAngle]] defines the direction of the rotation axis as an angle from the **X** axis in the **X**/**Y** plane of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]], from -180 to 180. This lets you tilt the rotating element without changing the sliding axis.

[Video: Cylindrical-InclinationAngle-90.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Cylindrical-InclinationAngle-90.mp4)

*InclinationAngle = **90***

[Video: Cylindrical-InclinationAngle-30.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Cylindrical-InclinationAngle-30.mp4)

*InclinationAngle = **30***

---
*Source: [Cylindrical](https://create.roblox.com/docs/physics/constraints/cylindrical) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
