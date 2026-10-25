---
title: "Prismatic"
description: "PrismaticConstraint allows two attachments to slide along one axis but not rotate, with optional assigned power for mechanisms like sliding doors and elevator platforms."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/prismatic"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*PrismaticConstraint allows two attachments to slide along one axis but not rotate, with optional assigned power for mechanisms like sliding doors and elevator platforms.*

> [!info]
> For an overview on creating, visualizing, and simulating mechanical constraints, including [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]], see [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] creates a rigid joint between two attachments, allowing them to slide along one axis but not rotate. The constraint can also be [[30 Official Roblox Docs/Physics/Constraints/Prismatic#Linear power|powered]] for mechanisms like sliding doors and elevator platforms.

[Video: Prismatic-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Prismatic-Demo.mp4)

> [!info]
> Orientation of a prismatic's attachments affects how it will move. To ensure movement occurs along the desired axis, each attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]], visualized by the yellow arrow, should point in the same direction.

## Linear power

If a prismatic's [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]], it attempts to translate the attachments with the goal of reaching [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|Velocity]]. You can further control this translation through both [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|MotorMaxAcceleration]] and [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|MotorMaxForce]].

If a prismatic's [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|ActuatorType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Servo]], it attempts to translate the attachments to a set separation specified by [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|TargetPosition]]. This translation is controlled by [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|Speed]], [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|LinearResponsiveness]], and [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|ServoMaxForce]].

[Video: Prismatic-ActuatorType-Motor.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Prismatic-ActuatorType-Motor.mp4)

*ActuatorType = **Motor***

[Video: Prismatic-ActuatorType-Servo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Prismatic-ActuatorType-Servo.mp4)

*ActuatorType = **Servo***

## Limits

You can set limits to restrict the sliding range a prismatic. Enabling the [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|LowerLimit]] and [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|UpperLimit]] values, as well as [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|Restitution]] which defines the elasticity of the attachments when they reach either limit.

---
*Source: [Prismatic](https://create.roblox.com/docs/physics/constraints/prismatic) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
