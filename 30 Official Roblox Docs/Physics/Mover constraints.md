---
title: "Mover constraints"
description: "Mover constraints apply force or torque to move one or more assemblies."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/mover-constraints"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Mover constraints apply force or torque to move one or more assemblies.*

The physics engine includes the following [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] that apply force or torque to move one or more assemblies. In addition, various [[30 Official Roblox Docs/Physics/Mechanical constraints|mechanical constraints]] are available which behave as conceptual mechanical connections, including hinges, springs, ropes, and more.

[[30 Official Roblox Docs/Physics/Constraints/LinearVelocity|Linear Velocity]]

[Video: LinearVelocity-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LinearVelocity-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] applies force on an assembly to maintain a constant velocity along a 3D vector, line, or 2D plane*

[[30 Official Roblox Docs/Physics/Constraints/AngularVelocity|Angular Velocity]]

[Video: AngularVelocity-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AngularVelocity-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/AngularVelocity|AngularVelocity]] applies torque on an assembly to maintain a constant angular velocity*

[[30 Official Roblox Docs/Physics/Constraints/AlignPosition|Align Position]]

[Video: AlignPosition-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AlignPosition-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/AlignPosition|AlignPosition]] applies force to move two attachments together, or to move one attachment to a goal position*

[[30 Official Roblox Docs/Physics/Constraints/AlignOrientation|Align Orientation]]

[Video: AlignOrientation-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AlignOrientation-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]] applies torque to align two attachments, or to align one attachment with a goal orientation*

[[30 Official Roblox Docs/Physics/Constraints/VectorForce|Vector Force]]

[Video: VectorForce-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/VectorForce-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/VectorForce|VectorForce]] applies constant linear force on an assembly*

[[30 Official Roblox Docs/Physics/Constraints/Torque|Torque]]

[Video: Torque-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Torque-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/Torque|Torque]] applies constant torque on an assembly from its center of mass*

[[30 Official Roblox Docs/Physics/Constraints/LineForce|Line Force]]

[Video: LineForce-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LineForce-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/LineForce|LineForce]] applies force along the theoretical line connecting its two attachments*

[[30 Official Roblox Docs/Physics/Constraints/AnimationConstraint|Animation Constraint]]

[Video: AnimationConstraint-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AnimationConstraint-Demo.mp4)

*[[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]] constrains its [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] by an offset transform [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].*

## Constraint visualization

To accurately visualize constraints in Studio, you can toggle the following from the **View** menu or through the respective shortcut:

- **Show Welds** (<kbd>Alt</kbd><kbd>W</kbd> or <kbd>⌥</kbd><kbd>W</kbd>) — Show [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] separately from the visualization of other constraints.
- **Show Constraint Details** (<kbd>Alt</kbd><kbd>D</kbd> or <kbd>⌥</kbd><kbd>D</kbd>) — Show complete visual details of non-weld constraints.

> [!success]
> In addition to the above visualization, you can view colored outlines around mechanisms (groups of parts that share simulation step and [[30 Official Roblox Docs/Physics/Network ownership|network ownership]]) by toggling on **Mechanisms** from the [[30 Official Roblox Docs/Studio/Studio interface#Visualization options|Visualization Options]] widget in the upper‑right corner of the 3D viewport.

## Create constraints

Mover constraints typically connect one or two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]]. When connected to [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]], the constraint will use their animated position and orientation.

To create a mechanical constraint, you can either insert one from the **Constraint** picker/button or through the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window.

### Constraint Picker

1. In Studio's **Model** tab toolbar, click‑hold over the small corner arrow on a constraint button to open its picker menu, then select the desired constraint.

   *(image in the full Top G Vault)*

2. In the 3D viewport, hover over any [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and click to add a new [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] to the part at the visualized point. Alternatively, hover over and click an existing [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] to use it for the constraint.

3. Some mover constraints utilize or support a **secondary** attachment in their functionality, so the tool might prompt you to repeat the previous step on another [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]].

   *(image in the full Top G Vault)*

   *[[30 Official Roblox Docs/Physics/Constraints/AngularVelocity|AngularVelocity]] using one attachment*

   *(image in the full Top G Vault)*

   *[[30 Official Roblox Docs/Physics/Constraints/AlignPosition|AlignPosition]] using two attachments*

### Explorer

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy, hover over the intended parent, click the **⊕** button, and insert the desired constraint from the dropdown menu, such as a [[30 Official Roblox Docs/Physics/Constraints/LinearVelocity|LinearVelocity]] constraint.

   *(image in the full Top G Vault)*

1. With the new constraint selected, locate its currently empty **Attachment0** property in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

   *(image in the full Top G Vault)*

1. Link the **Attachment0** property to an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] in two consecutive steps:

   1. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, click in the **Attachment0** row to reveal the selection cursor.

   2. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy, click on the target [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]].

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

1. Some mover constraints use or support a **secondary** [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] in their functionality. If necessary, repeat the previous step on the **Attachment1** property in the **Properties** window. For instance:

   - By default, [[30 Official Roblox Docs/Physics/Constraints/AlignPosition|AlignPosition]] and [[30 Official Roblox Docs/Physics/Constraints/AlignOrientation|AlignOrientation]] align their primary attachment (**Attachment0**) with a secondary attachment (**Attachment1**).
   - [[30 Official Roblox Docs/Physics/Constraints/LineForce|LineForce]] **requires** two attachments to apply force along the theoretical line connecting them.

## Physical simulation

To simulate physics while [[30 Official Roblox Docs/Parts/Parts#Move|moving]] or [[30 Official Roblox Docs/Parts/Parts#Rotate|rotating]] parts, you can switch from **Geometric** mode to **Physical** mode in Studio's toolbar, effectively forcing parts to obey physical limitations. For example, if two parts are attached by a [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint|RopeConstraint]] and you drag one part around the scene, the other part will follow as the rope becomes taut.

*(image in the full Top G Vault)*

## Legacy mover conversion

If your game relies on legacy [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]]‑based constraints, review the following notes when converting to modern mover constraints.

> [!note]- `BodyPosition`  ⟩  `AlignPosition`
> [[30 Official Roblox Docs/API Reference/Classes/AlignPosition|AlignPosition]] satisfies the majority of use cases covered by the deprecated [[30 Official Roblox Docs/API Reference/Classes/BodyPosition|BodyPosition]] mover. To sync with how the legacy mover treated each component independently and allowed a different force along each dimension, the [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceLimitMode|ForceLimitMode]] property of [[30 Official Roblox Docs/API Reference/Classes/AlignPosition|AlignPosition]] allows the constraint to operate in [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|Magnitude]] mode or [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|PerAxis]] mode:
>
> - In [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|Magnitude]] mode, the existing behavior is preserved and [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxForce|MaxForce]] is interpreted as a magnitude.
>
> - In [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|PerAxis]] mode, the force along each axis can be specified independently. Because the maximum force is specified as a vector, the reference frame of the force can also be specified through the [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceRelativeTo|ForceRelativeTo]] property with [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment0]], and [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]] options. Additionally, the formulation for the internal controller is modified to match that of [[30 Official Roblox Docs/API Reference/Classes/BodyPosition|BodyPosition]].

> [!note]- `BodyGyro`  ⟩  `AlignOrientation`
> [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]] satisfies the majority of use cases covered by the deprecated [[30 Official Roblox Docs/API Reference/Classes/BodyGyro|BodyGyro]] mover. The [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#AlignType|AlignType]] modes of [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]]  provide sufficient freedom for most applications and the combination of multiple constraints can replicate the vector torque limit. Additionally, the [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisLookAt]] mode forces the primary axis of the constraint's first attachment ([[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]) to always point towards the second attachment ([[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]]), making it a lot easier to add things such as motion tracking security cameras or guided missiles.

> [!note]- `BodyVelocity`  ⟩  `LinearVelocity`
> [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] satisfies the majority of use cases covered by the deprecated [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity|BodyVelocity]] mover. Although the legacy mover allows for a [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity#MaxForce|MaxForce]] vector, the typical application of that vector force was to zero a particular component, allowing the constraint to be disabled along that dimension. [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] achieves a similar effect by operating in distinct [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode|VelocityConstraintMode]] modes that corresponded to one ([[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Line]]), two ([[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Plane]]), and three ([[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode|Vector]]) dimensions.
>
> Additionally, the [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitMode|ForceLimitMode]] property with the option of [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode|PerAxis]] accommodates any applications of the vector force with all non‑zero components, such as an increase in the force along a single axis to counteract gravity.

> [!note]- `BodyAngularVelocity`  ⟩  `AngularVelocity`
> Although [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity|AngularVelocity]] has some discrepancies with the deprecated [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity|BodyAngularVelocity]] mover, specific cases related to those discrepancies have not been highlighted by the community, nor internally.
>
> As a separate improvement, [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity|AngularVelocity]] works with [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] and the [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#RelativeTo|RelativeTo]] property lets you specify the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in which the force is specified, for example [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]] or [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]].

> [!note]- `BodyForce`/`BodyThrust`  ⟩  `VectorForce`
> [[30 Official Roblox Docs/API Reference/Classes/VectorForce|VectorForce]] satisfies all use cases offered by the deprecated [[30 Official Roblox Docs/API Reference/Classes/BodyForce|BodyForce]] and [[30 Official Roblox Docs/API Reference/Classes/BodyThrust|BodyThrust]] movers. The modern constraint works with [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] and its [[30 Official Roblox Docs/API Reference/Classes/VectorForce#RelativeTo|RelativeTo]] property lets you apply force to a relative offset from center, similar to how [[30 Official Roblox Docs/API Reference/Classes/BodyThrust#Location|BodyThrust.Location]] worked.

> [!note]- `RocketPropulsion`  ⟩  `LineForce`/`AlignOrientation`
> A combination of [[30 Official Roblox Docs/API Reference/Classes/LineForce|LineForce]] and [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]] satisfies the majority of use cases covered by the deprecated [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion|RocketPropulsion]] mover. In the example of a guided missile, [[30 Official Roblox Docs/API Reference/Classes/LineForce|LineForce]] can be used to control the "follow target" behavior of [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion|RocketPropulsion]] while [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]] and its [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#LookAtPosition|LookAtPosition]] property can be used to control the "face target" behavior.

---
*Source: [Mover constraints](https://create.roblox.com/docs/physics/mover-constraints) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
