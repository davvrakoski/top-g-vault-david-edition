---
title: "Hinge"
description: "HingeConstraint allows its two attachments to rotate about one axis, with optional assigned power for motor or servo behavior."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/hinge"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*HingeConstraint allows its two attachments to rotate about one axis, with optional assigned power for motor or servo behavior.*

> [!info]
> For an overview on creating, visualizing, and simulating mechanical constraints, including [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]], see [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]]
allows its two attachments to rotate about one axis, forcing them into
the same position and **X** axis alignment. This constraint can also be
powered to behave like a [[30 Official Roblox Docs/Physics/Constraints/Hinge#Angular power|motor]] or [[30 Official Roblox Docs/Physics/Constraints/Hinge#Angular power|servo]], and you can set limits to restrict the hinge's rotational range.

[Video: Hinge-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Hinge-Demo.mp4)

> [!info]
> Orientation of a hinge's attachments affects how it rotates. To ensure rotation occurs around the desired axis, each attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]], visualized by the yellow arrow, should point in the same direction.

### Angular power

If a hinge's [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], it attempts to rotate the attachments with the goal of reaching its [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularVelocity|AngularVelocity]]. You can further control this rotation through both [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#MotorMaxAcceleration|MotorMaxAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#MotorMaxTorque|MotorMaxTorque]].

If a hinge's [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], it attempts to rotate to an angle specified by [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#TargetAngle|TargetAngle]]. This rotation is controlled by both [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularSpeed|AngularSpeed]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ServoMaxTorque|ServoMaxTorque]].

[Video: Hinge-ActuatorType-Motor.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Hinge-ActuatorType-Motor.mp4)

*ActuatorType = **Motor***

[Video: Hinge-ActuatorType-Servo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Hinge-ActuatorType-Servo.mp4)

*ActuatorType = **Servo***

### Limits

You can set limits to restrict the rotation of a hinge, useful for mechanisms like doors which should only swing open or closed within a set range. Enabling the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LimitsEnabled|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#LowerAngle|LowerAngle]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#UpperAngle|UpperAngle]] limits, as well as [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#Restitution|Restitution]] which defines the elasticity of the attachments when they reach either limit.

---
*Source: [Hinge](https://create.roblox.com/docs/physics/constraints/hinge) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
