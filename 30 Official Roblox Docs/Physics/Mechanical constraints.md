---
title: "Mechanical constraints"
description: "Mechanical constraints behave as conceptual mechanical connections such as hinges, springs, and motors."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/mechanical-constraints"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Mechanical constraints behave as conceptual mechanical connections such as hinges, springs, and motors.*

The physics engine includes the following [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] that behave as conceptual mechanical connections, including hinges, springs, ropes, and more. In addition, various [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]] are available to exert directional or rotational force upon [[30 Official Roblox Docs/Physics/Assemblies|assemblies]].

[[30 Official Roblox Docs/Physics/Constraints/BallSocket|Ball Socket]]

[Video: BallSocket-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/BallSocket-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint|BallSocketConstraint]] forces its two attachments into the same position and allows them to freely rotate about all three axes, with optional limits to restrict both tilt and twist*

[[30 Official Roblox Docs/Physics/Constraints/Hinge|Hinge]]

[Video: Hinge-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Hinge-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] allows its two attachments to rotate about one axis, with optional assigned power for motor or servo behavior*

[[30 Official Roblox Docs/Physics/Constraints/Prismatic|Prismatic]]

[Video: Prismatic-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Prismatic-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] allows two attachments to slide along one axis but not rotate, with optional assigned power for mechanisms like sliding doors and elevator platforms*

[[30 Official Roblox Docs/Physics/Constraints/Cylindrical|Cylindrical]]

[Video: Cylindrical-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Cylindrical-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|CylindricalConstraint]] allows its attachments to slide along one axis and rotate about another axis, with optional assigned angular and/or linear power*

[[30 Official Roblox Docs/Physics/Constraints/Spring|Spring]]

[Video: Spring-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Spring-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]] applies a force on its attachments based on spring and damper behavior, with an optional minimum/maximum length*

[[30 Official Roblox Docs/Physics/Constraints/TorsionSpring|Torsion Spring]]

[Video: TorsionSpring-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/TorsionSpring-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint|TorsionSpringConstraint]] applies torque based on a relative angle and relative angular velocity, in an attempt to bring two axes from two parts together*

[[30 Official Roblox Docs/Physics/Constraints/Universal|Universal]]

[Video: Universal-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Universal-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint|UniversalConstraint]] ensures two axes on two assemblies remain perpendicular, useful for applications such as vehicle power transmission to rear drive shafts, robotics, and more*

[[30 Official Roblox Docs/Physics/Constraints/Rope|Rope]]

[Video: Rope-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Rope-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/RopeConstraint|RopeConstraint]] prevents two attachments from separating further than a defined length, with optional behavior as an extending or contracting winch*

[[30 Official Roblox Docs/Physics/Constraints/Rod|Rod]]

[Video: Rod-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Rod-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/RodConstraint|RodConstraint]] keeps two attachments separated by a defined length, with optional limits on rotational tilt*

[[30 Official Roblox Docs/Physics/Constraints/Plane|Plane]]

[Video: Plane-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Plane-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/PlaneConstraint|PlaneConstraint]] moves two attachments into a position/orientation along a plane, and both attachments remain free to translate and rotate unless otherwise constrained*

[[30 Official Roblox Docs/Physics/Constraints/Weld|Weld]]

*[[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] connects two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and ensures they stay in the same relative position and orientation to each other, even if they are not touching*

[[30 Official Roblox Docs/Physics/Constraints/Rigid|Rigid]]

*[[30 Official Roblox Docs/API Reference/Classes/RigidConstraint|RigidConstraint]] connects two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]] and ensures they stay in the same relative position/orientation to each other, even if they are not touching*

[[30 Official Roblox Docs/Physics/Constraints/NoCollision|No Collision]]

*[[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint|NoCollisionConstraint]] prevents collisions between two specific parts, but those parts may still register collisions with the rest of the world*

## Constraint visualization

To accurately visualize constraints in Studio, you can toggle the following from the **View** menu or through the respective shortcut:

- **Show Welds** (<kbd>Alt</kbd><kbd>W</kbd> or <kbd>⌥</kbd><kbd>W</kbd>) — Show [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] separately from the visualization of other constraints.
- **Show Constraint Details** (<kbd>Alt</kbd><kbd>D</kbd> or <kbd>⌥</kbd><kbd>D</kbd>) — Show complete visual details of non-weld constraints.

> [!success]
> In addition to the above visualization, you can view colored outlines around mechanisms (groups of parts that share simulation step and [[30 Official Roblox Docs/Physics/Network ownership|network ownership]]) by toggling on **Mechanisms** from the [[30 Official Roblox Docs/Studio/Studio interface#Visualization options|Visualization Options]] widget in the upper‑right corner of the 3D viewport.

## Create constraints

All mechanical constraints must connect one or two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]], except for [[30 Official Roblox Docs/Physics/Constraints/Weld|WeldConstraint]] and [[30 Official Roblox Docs/Physics/Constraints/NoCollision|NoCollisionConstraint]]. When connected to [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]], the constraint will use their animated position and orientation.

To create a mechanical constraint, you can either insert one from the **Constraint** picker/button or through the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window.

### Constraint Picker

1. In Studio's **Model** tab toolbar, click‑hold over the small corner arrow on a constraint button to open its picker menu, then select the desired constraint.

   *(image in the full Top G Vault)*

2. In the 3D viewport, hover over any [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and click to add a new [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] to the part at the visualized point. Alternatively, hover over and click an existing [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] to use it for the constraint.

3. Most mechanical constraints require a **secondary** attachment in their functionality, so the tool will typically prompt you to repeat the previous step on another [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]].

   *(image in the full Top G Vault)*

   *Completed [[30 Official Roblox Docs/Physics/Constraints/Spring|SpringConstraint]] connecting two attachments*

### Explorer

> [!info]
> Note that [[30 Official Roblox Docs/Physics/Constraints/Weld|WeldConstraint]] and [[30 Official Roblox Docs/Physics/Constraints/NoCollision|NoCollisionConstraint]] do not utilize [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]], so their linking properties in the following steps are **Part0**/**Part1**, not **Attachment0**/**Attachment1**. Similarly, you'll need to select a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] to complete the link, not an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]].

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy, hover over the intended parent, click the **⊕** button, and insert the desired constraint from the dropdown menu, such as a [[30 Official Roblox Docs/Physics/Constraints/Spring|SpringConstraint]].

   *(image in the full Top G Vault)*

1. With the new constraint selected, locate its currently empty **Attachment0** property in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

   *(image in the full Top G Vault)*

1. Link the **Attachment0** property to an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] in two consecutive steps:

   1. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, click in the **Attachment0** row to reveal the selection cursor.

   2. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy, click on the target [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]].

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

1. Most mechanical constraints require a **secondary** [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] in their functionality. If necessary, repeat the previous step on the **Attachment1** property in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

## Physical simulation

To simulate physics while [[30 Official Roblox Docs/Parts/Parts#Move|moving]] or [[30 Official Roblox Docs/Parts/Parts#Rotate|rotating]] parts, you can switch from **Geometric** mode to **Physical** mode in Studio's toolbar, effectively forcing parts to obey physical limitations. For example, if two parts are attached by a [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint|RopeConstraint]] and you drag one part around the scene, the other part will follow as the rope becomes taut.

*(image in the full Top G Vault)*

---
*Source: [Mechanical constraints](https://create.roblox.com/docs/physics/mechanical-constraints) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
