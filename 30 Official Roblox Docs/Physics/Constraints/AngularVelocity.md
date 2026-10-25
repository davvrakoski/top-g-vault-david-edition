---
title: "AngularVelocity"
description: "The AngularVelocity constraint applies torque on an assembly to maintain a constant angular velocity."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/angular-velocity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The AngularVelocity constraint applies torque on an assembly to maintain a constant angular velocity.*

> [!info]
> For an overview on creating, visualizing, and simulating mover constraints, including [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity|AngularVelocity]], see [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

An [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity|AngularVelocity]] constraint applies torque on an assembly to maintain a constant angular velocity.

[Video: AngularVelocity-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AngularVelocity-Demo.mp4)

> [!warning]
> The [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity|AngularVelocity]] constraint applies torque that attempts to maintain a **constant** angular velocity. If you want to control the amount of torque applied, use a [[30 Official Roblox Docs/Physics/Constraints/Torque|Torque]] constraint. Alternatively, if you only need **initial** angular velocity, set the [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyAngularVelocity|AssemblyAngularVelocity]] method directly on the assembly.

## Relativity

Application of velocity can be controlled through the constraint's [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#RelativeTo|RelativeTo]] property. If set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], the angular velocity vector is used as is. If set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]] and the constraint's [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] property is set to another attachment, the angular velocity will be affected by that of the other attachment as seen by how the upper-left red part's velocity affects the attached blue part's velocity.

[Video: AngularVelocity-RelativeTo-World.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AngularVelocity-RelativeTo-World.mp4)

*RelativeTo = **World***

[Video: AngularVelocity-RelativeTo-Attachment1.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AngularVelocity-RelativeTo-Attachment1.mp4)

*RelativeTo = **Attachment1***

> [!info]
> Setting [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#RelativeTo|RelativeTo]] to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]] also exposes the [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#ReactionTorqueEnabled|ReactionTorqueEnabled]] property.

---
*Source: [AngularVelocity](https://create.roblox.com/docs/physics/constraints/angular-velocity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
