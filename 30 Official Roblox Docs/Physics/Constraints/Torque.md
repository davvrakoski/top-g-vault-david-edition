---
title: "Torque"
description: "The Torque constraint applies constant torque on an assembly from its center of mass."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/torque"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Torque constraint applies constant torque on an assembly from its center of mass.*

> [!info]
> For an overview on creating, visualizing, and simulating mover constraints, including [[30 Official Roblox Docs/API Reference/Classes/Torque|Torque]], see [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/Torque|Torque]] constraint applies constant torque on an assembly from its center of mass.

[Video: Torque-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Torque-Demo.mp4)

> [!warning]
> Because the [[30 Official Roblox Docs/API Reference/Classes/Torque|Torque]] constraint applies **constant** torque and angular acceleration, very high speeds may result if no other forces are involved. If you want to maintain a more steady velocity over time, use an [[30 Official Roblox Docs/Physics/Constraints/AngularVelocity|AngularVelocity]] constraint. Alternatively, if you only need **initial** velocity, set the [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyAngularVelocity|AssemblyAngularVelocity]] property directly on the assembly.

## Relativity

By default, torque is applied relative to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. If the parent assembly rotates, the torque will change direction to match the adjusted orientation of the attachment.

If [[30 Official Roblox Docs/API Reference/Classes/Torque#RelativeTo|RelativeTo]] is set to **World**, torque will be applied in world coordinates, independent of the parent or attachment orientations.

If [[30 Official Roblox Docs/API Reference/Classes/Torque#RelativeTo|RelativeTo]] is set to **Attachment1**, torque will be applied relative to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] and, if the attachment rotates, change to match its orientation.

[Video: Torque-RelativeTo-Attachment0.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Torque-RelativeTo-Attachment0.mp4)

*RelativeTo = **Attachment0***

[Video: Torque-RelativeTo-World.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Torque-RelativeTo-World.mp4)

*RelativeTo = **World***

---
*Source: [Torque](https://create.roblox.com/docs/physics/constraints/torque) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
