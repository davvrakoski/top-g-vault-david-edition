---
title: "LinearVelocity"
description: "The LinearVelocity constraint applies force on an assembly to maintain a constant velocity along a 3D vector, line, or 2D plane."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/linear-velocity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The LinearVelocity constraint applies force on an assembly to maintain a constant velocity along a 3D vector, line, or 2D plane.*

> [!info]
> For an overview on creating, visualizing, and simulating mover constraints, including [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]], see [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] constraint applies force on an assembly to maintain a constant velocity. It can be set to apply force along a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], line, or 2D plane.

[Video: LinearVelocity-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LinearVelocity-Demo.mp4)

> [!warning]
> The [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] constraint applies a force that attempts to maintain a **constant** linear velocity. If you want to control the amount of force applied, use a [[30 Official Roblox Docs/Physics/Constraints/VectorForce|VectorForce]] constraint. Alternatively, if you only need **initial** linear velocity, set the [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity|AssemblyLinearVelocity]] property directly on the assembly.

## Relativity

Application of velocity can be controlled through the constraint's [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|RelativeTo]] property. If set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], force will be applied in world coordinates, independent of the parent or attachment orientations. If set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment0]] or [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]], force will be applied relative to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] or [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] respectively.

[Video: LinearVelocity-RelativeTo-World.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LinearVelocity-RelativeTo-World.mp4)

*RelativeTo = **World***

[Video: LinearVelocity-RelativeTo-Attachment0.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LinearVelocity-RelativeTo-Attachment0.mp4)

*RelativeTo = **Attachment0***

---
*Source: [LinearVelocity](https://create.roblox.com/docs/physics/constraints/linear-velocity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
