---
title: "VectorForce"
description: "The VectorForce constraint applies constant linear force on an assembly."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/vector-force"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The VectorForce constraint applies constant linear force on an assembly.*

> [!info]
> For an overview on creating, visualizing, and simulating mover constraints, including [[30 Official Roblox Docs/API Reference/Classes/VectorForce|VectorForce]], see [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

The [[30 Official Roblox Docs/API Reference/Classes/VectorForce|VectorForce]] constraint applies constant linear force on an assembly. The direction and strength of the force is determined by a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] and can be relative to an attachment on the part, another attachment, or the world coordinate system.

[Video: VectorForce-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/VectorForce-Demo.mp4)

> [!warning]
> Because the [[30 Official Roblox Docs/API Reference/Classes/VectorForce|VectorForce]] constraint applies **constant** force and acceleration, very high speeds may result if no other forces are involved. If you want to maintain a more steady velocity over time, use a [[30 Official Roblox Docs/Physics/Constraints/LinearVelocity|LinearVelocity]] constraint. Alternatively, if you only need **initial** velocity, set the [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity|AssemblyLinearVelocity]] property directly on the assembly.

## Force location

By default, force is applied to the assembly at the location of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. Thus, if its center of mass is not aligned with the direction/point of force, torque will be applied as well. If desired, force can be focused at the center of mass by toggling on [[30 Official Roblox Docs/API Reference/Classes/VectorForce#ApplyAtCenterOfMass|ApplyAtCenterOfMass]].

[Video: VectorForce-ApplyAtCenterOfMass-False.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/VectorForce-ApplyAtCenterOfMass-False.mp4)

*ApplyAtCenterOfMass = **false***

[Video: VectorForce-ApplyAtCenterOfMass-True.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/VectorForce-ApplyAtCenterOfMass-True.mp4)

*ApplyAtCenterOfMass = **true***

## Relativity

By default, force is applied relative to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. If the parent assembly rotates, the force will change direction to match the adjusted orientation of the attachment; visualize this behavior in how the thruster of a rocket pushes it forward, regardless of the rocket's rotation.

If [[30 Official Roblox Docs/API Reference/Classes/VectorForce#RelativeTo|RelativeTo]] is set to **World**, force will be applied in world coordinates, independent of the parent or attachment orientations; visualize this behavior as a directional force like the wind blowing against an object.

If [[30 Official Roblox Docs/API Reference/Classes/VectorForce#RelativeTo|RelativeTo]] is set to **Attachment1**, force will be applied relative to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] and, if the attachment rotates, the force will change to match its orientation.

[Video: VectorForce-RelativeTo-Attachment0.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/VectorForce-RelativeTo-Attachment0.mp4)

*RelativeTo = **Attachment0***

[Video: VectorForce-RelativeTo-World.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/VectorForce-RelativeTo-World.mp4)

*RelativeTo = **World***

---
*Source: [VectorForce](https://create.roblox.com/docs/physics/constraints/vector-force) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
