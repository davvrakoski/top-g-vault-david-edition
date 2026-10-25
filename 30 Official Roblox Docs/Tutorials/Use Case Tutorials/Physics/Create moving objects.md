---
title: "Create moving objects"
description: "Explains the process of creating dynamic motion by moving objects."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/physics/create-moving-objects"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the process of creating dynamic motion by moving objects.*

**Moving objects** are objects that move on one or more axes within the 3D space. Using the built-in power of Roblox's simulation engine, you can make objects move and interact with their environment in a way that emulates real-world physical behavior that's familiar and intuitive to players, such as gravity, aerodynamics, and friction.

Using the [Moving Objects](https://www.roblox.com/games/17560154079/UCT-Linear-Movement) `.rbxl` file as a reference, this tutorial explains how physical forces impact linear motion in Studio, and shows you various techniques to move objects from point A to point B in your games with different movement behavior, including guidance on:

- Using a [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] mover constraint to move an entire assembly at a constant linear velocity.
- Using a [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] to constrain an assembly to a single axis and move it at a constant linear velocity relative to a point in the 3D space.
- Using the [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyImpulse|ApplyImpulse]] method to move an assembly with an initial impulse of force so that the assembly slowly decelerates over time.

> [!info]
> You can create your own assemblies using basic parts or meshes from third-party modeling tools, then follow along with your own assets. For information on exporting meshes for use in Studio, see [[30 Official Roblox Docs/Art/Modeling/Export settings|Exporting Requirements]].

[Video: Intro.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/Intro.mp4)

## Linear motion and physical forces

Roblox Studio is a real-world simulation engine that emulates physical behavior in real time, so in order to predict how objects moving linearly can behave in games, it's important to have a high-level understanding of how objects move in real life with linear motion.

**Linear motion** is movement along an axis. For example, when a block has linear motion, it moves along a set axis.

*(image in the full Top G Vault)*

[Video: Move-Block.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/Move-Block.mp4)

Linear motion cannot exist without external, physical forces pushing or pulling objects to move. According to Newton's [first law of motion](https://en.wikipedia.org/wiki/Newton%27s_laws_of_motion#First_law), stationary objects remain stationary and moving objects remain in motion with a constant velocity unless they are acted on by an external force. For example, a stationary block remains stationary unless a physical force like wind pushes it to move.

[Video: Wind-Block.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/Wind-Block.mp4)

**Force** is the measure of the direction and magnitude of a physical push or pull that causes objects to change their linear velocity along an axis. A change in velocity is known as **acceleration**. This concept is particularly important for objects to move in Studio; the more force you apply to objects, the more quickly they accelerate.

This is because the force needs to be greater than any physical forces pushing back against the object, such as gravity or friction. For example, if you were to place the block on a metal plate, the physical force of the wind needs to overcome the amount of friction from the metal plate to continue accelerating the block. If the wind's force is not much greater than the friction from the metal plate, the block accelerates, just more slowly than the previous example.

*(image in the full Top G Vault)*

[Video: Plate-Friction.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/Plate-Friction.mp4)

**Linear velocity** is the measure of an object's movement, or how fast the object changes its position along an axis over a period of time. Studio measures linear velocity according to how many studs an object moves per second. Studs are Roblox's primary physical units for measuring length, and each stud equates to about 28cm in the real world.

*(image in the full Top G Vault)*

Understanding linear velocity is important for designing gameplay because it helps you determine how much force you need in order to achieve a particular speed for your moving objects. For instance, when you want to propel objects upward, it's important to consider how you must adjust your force to overcome gravity within the environment so that the objects move accurately.

The following sections dive deeper into these concepts as you learn how to move objects at either a constant or initial linear velocity with the necessary force to overcome any oppositional physical forces within the environment. As you review these physics concepts with the upcoming techniques, you can more accurately predict how to adjust property values to achieve any ideal linear movement behavior in Studio.

## Maintain a constant linear velocity

For an object to reach and maintain a constant linear velocity, it needs a force to overcome any oppositional physical forces that either decelerate the object's linear velocity, or cause the object to remain stationary. For example, if you want an object to have a linear velocity of `[0, 12, 0]` in Studio, you need enough force for the object to reach and maintain 12 studs per second along the Y axis in its environment.

The amount of force necessary not only depends on oppositional physical forces within the environment itself, such as gravity and friction, but also on the object itself. For example, if you have two objects of the same shape that are moving on the same axis, the object with the larger amount of mass requires more force to achieve the same linear acceleration.

[Video: Small-Triangle.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/Small-Triangle.mp4)

*The little triangle part has a small amount of mass, so it needs less force to achieve the same acceleration.*

[Video: Big-Triangle.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/Big-Triangle.mp4)

*The large triangle part has a large amount of mass, so it needs more force to achieve the same acceleration.*

The following subsections use assemblies of different shapes and sizes to teach you how to move either an entire object or only a portion of the object at a constant linear velocity. As you experiment with different property values, you will learn how to estimate the maximum amount of force you need for assemblies in your own games.

### Use LinearVelocity constraints

[[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] objects are a type of [[30 Official Roblox Docs/Physics/Mechanical constraints|mover constraint]] that apply force on an entire assembly to maintain a constant linear velocity. By not locking the assembly's position to an axis during its motion, the assembly is free to rotate as it collides with other objects in the 3D space. This type of movement leads to surprising gameplay scenarios that are more difficult for players to predict.

[Video: LV-Intro.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/LV-Intro.mp4)

*As the lily pads collide with one another, they change orientation but continue to flow down the river at a constant linear velocity.*

<br>

To begin moving the assembly, the [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] constraint needs to know:

- The point and positive or negative direction to apply a force.
- The amount of studs you want the assembly to move per second.
- The maximum amount of force the engine can apply for the assembly to reach the constant linear velocity.

To demonstrate this process, you will configure a lily pad with an attachment that a [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] constraint references to move the lily pad `15` studs per second along the world's negative X axis at a constant linear velocity.

*(image in the full Top G Vault)*

#### Add attachment

You can specify the point to apply force by adding an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] object to the assembly, then configuring the attachment's position in the 3D space. The sample [Moving Objects](https://www.roblox.com/games/17560154079/UCT-Linear-Movement) game places an attachment in the center of the lily pad so that the constraint can move the mesh from the attachment along a particular axis.

Attachments include visual aids to help you visualize their axes of motion. The yellow arrow denotes the attachment's primary axis, and the orange arrow denotes the attachment's secondary axis. While neither axis of motion influences the lily pad's movement in the steps of this technique, it's important to understand these visual aids for future reference because they can assist you in determining ideal behavior for different types of constraints, such as the [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] in the next technique.

*(image in the full Top G Vault)*

To add an attachment:

1. In the **Explorer** window, expand the **LinearVelocityExample** folder, then expand its child **LilyPad_DIY** model.
1. Insert an attachment into the **Pad** mesh.

   1. Hover over the mesh and click the ⊕ button. A contextual menu displays.
   1. From the menu, insert an **Attachment**. The attachment displays in the center of the part.
   1. Rename the attachment to **MoveAttachment**.

   *(image in the full Top G Vault)*

#### Configure constraint

Now that your mesh has a fixed point to move the lily pad, you can configure the properties of a [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] constraint to specify the direction and magnitude for the constant linear velocity, the amount of studs you want the mesh to move per second, and the maximum amount of force the engine can apply for the mesh to reach a constant linear velocity.

The sample [Moving Objects](https://www.roblox.com/games/17560154079/UCT-Linear-Movement) game applies up to 5000 Rowtons of constant force to move the lily pad 15 studs per second along the world's negative X axis at a constant linear velocity. Rowtons are Roblox's primary physical units for measuring force. To reference Roblox physical units and how they convert to metric units, see [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]].

To configure a [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] constraint:

1. To make the constraint visible in the viewport so that you can reference its linear direction, enable **Show Constraint Details** from Studio's **View** menu.
1. Insert a [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]] constraint into the **Pad** mesh.
   1. In the **Explorer** window, hover over the mesh, then click the ⊕ icon. A contextual menu displays.
   1. From the contextual menu, insert **LinearVelocity**.
1. Assign the mesh's attachment to the new constraint.

   1. In the **Explorer** window, select the constraint.
   1. In the **Properties** window,
      1. Set **Attachment0** to **MoveAttachment**.
      1. Set **MaxForce** to `5000` to apply up to 5000 Rowtons of constant force to achieve the target linear velocity.
      1. Keep **RelativeTo** to **World** to move the lily pad relative to the world's position and orientation.
      1. Set **VelocityConstraint** to **Line** to constrain the force along a line from the attachment.
      1. Set **LineDirection** to `-1, 0, 0` to move the lily pad along the world's negative X axis. Note that if you were to set this property to `1, 0, 0` the lily pad would move along the world's positive X axis.
      1. Set **LineVelocity** to `15` to move the lily pad 15 studs per second.

   > [!info]
   > If you were to set **RelativeTo** to **Attachment**, the constraint would move the lily pad in relation to its attachment's orientation. However, as soon as the lily pad collides with objects, the attachment would rotate too and move the lily pad along a new orientation.

*(image in the full Top G Vault)*

1. Verify the amount of force you set moves the mesh 15 studs per second along the world's negative X axis.

   - Select the **Run** simulation mode from the mezzanine's dropdown menu and click the **Play** button to begin. Studio simulates the game at the current camera position without your avatar in the 3D space.

     *(image in the full Top G Vault)*

     [Video: LV-4.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/LV-4.mp4)

### Use PrismaticConstraint constraints

[[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] objects are a type of [[30 Official Roblox Docs/Physics/Mechanical constraints|mechanical constraint]] that create a rigid joint between two attachments, allowing their parent assemblies to move along one axis **relative to each other**. By locking both assemblies' position to a single axis, each assembly is only able to rotate if they rotate together in the same direction.

[Video: Prismatic-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Prismatic-Demo.mp4)

This type of movement leads to stable gameplay scenarios that are easier for players to predict. For example, the sample [Moving Objects](https://www.roblox.com/games/17560154079/UCT-Linear-Movement) game uses [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] objects to move log platforms that players can use to carefully cross a giant river.

[Video: PC-Intro.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/PC-Intro.mp4)

When you set [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType|PrismaticConstraint.ActuatorType]] to **Motor**, this constraint applies force on the two attachments with the goal of the attachments reaching and maintaining a constant linear velocity. If you anchor one of the attachments' parent assemblies, the force continues to move the unanchored assembly at a constant linear velocity while the anchored assembly remains stationary.

To begin moving the assembly, the [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] constraint needs to know:

- The point and positive or negative direction to apply a force.
- The amount of studs you want the attachments to move per second.
- The maximum amount of force the engine can apply for the attachments and their parent assemblies to reach a constant linear velocity.

To demonstrate this process, you will configure a log assembly with two objects that have child attachments that a [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] references to move the log 40 studs per second along the world's negative X axis at a constant linear velocity.

*(image in the full Top G Vault)*

#### Configure attachments

You can specify the direction to move a particular object within an assembly by adding two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects to the assembly, then configuring their alignment and orientation in the 3D space. The sample [Moving Objects](https://www.roblox.com/games/17560154079/UCT-Linear-Movement) game aligns two attachments along the world's X axis near the position of where the unanchored log overlaps with the anchored part, and orients each attachment's primary axis to face the world's negative X axis.

When you configure your PrismaticConstraint constraint in the next section, it will move the log **in relation** to the anchor part. In other words, the log will move away from the stationary part that cannot move because it's anchored in the 3D space.

To configure attachments for the prismatic constraint:

1. In the **Explorer** window, expand the **PrismaticConstraintExample** folder, then expand its child **Log_DIY** model.
1. Insert an attachment into the **Log** mesh.

   1. Hover over the mesh and click the ⊕ button. A contextual menu displays.
   1. From the menu, insert an **Attachment**. The attachment displays in the center of the part.
   1. Rename the attachment to **LogAttachment**.

   *(image in the full Top G Vault)*

1. Using the same process, insert an attachment into the **Anchor** part, then rename the attachment **AnchorAttachment**.

   *(image in the full Top G Vault)*

1. Using the **View Selector** tool as a reference for the world's coordinates, rotate **LogAttachment** and **AnchorAttachment** until each attachment's primary axis faces the world's negative X axis

   *(image in the full Top G Vault)*

1. Reposition **AnchorAttachment** so that both attachments are aligned on the world's X axis.

   *(image in the full Top G Vault)*

#### Configure constraint

Now that your attachments are aligned on the same axis and face the same direction you want the log to move, you can configure the properties of a [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] constraint to specify whether to apply the target constant linear velocity in the positive or negative direction of each attachment's' primary axis, the amount of studs you want the attachments to move per second, and the maximum amount of force the engine can apply for the log to reach a constant linear velocity.

While you can choose different values for your own use cases, the sample [Moving Objects](https://www.roblox.com/games/17560154079/UCT-Linear-Movement) game applies up to 50000 Rowtons of constant force to move the attachments 40 radians per second along the world's negative X axis at a constant linear velocity. However, because the anchor attachment is in an anchored object, only the log's attachment can move.

To configure a prismatic constraint:

1. Insert a [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] object into the **Log** mesh.
   1. In the **Explorer** window, hover over the mesh, then click the ⊕ icon. A contextual menu displays.
   1. From the contextual menu, insert a **PrismaticConstraint**.
1. Assign the log's attachments to the new constraint so that the log moves in **relation to** the anchored block part.

   1. In the **Explorer** window, select the constraint.
   1. In the **Properties** window,
      1. Set **Attachment0** to **AnchorAttachment**.
      1. Set **Attachment1** to **LogAttachment**. The constraint displays in the viewport.

   *(image in the full Top G Vault)*

1. In the **Explorer** window, select the constraint, then in the **Properties** window:

   1. Set **ActuatorType** to **Motor**. New property fields display.
   1. Set **MotorMaxForce** to `50000` to apply up to 50000 Rowtons of constant force to achieve the target linear velocity.
   1. Set **Velocity** to `40` to move the log 40 studs per second.

   *(image in the full Top G Vault)*

1. Verify the amount of force you set moves the log 40 studs per second along the world's negative X axis.

   - Select the **Run** simulation mode from the mezzanine's dropdown menu and click the **Play** button to begin. Studio simulates the game at the current camera position without your avatar in the 3D space.

     *(image in the full Top G Vault)*

     [Video: PC-4.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/PC-4.mp4)

## Apply an initial linear force

Another way of changing an object's linear velocity is by applying an impulse of force. After the impulse of force, the object either decelerates until it becomes stationary if there is an oppositional force such as friction, or remains in motion with constant linear velocity if there aren't any oppositional forces.

This technique is useful to move objects after a significant gameplay event, such as an explosion or impactful collision, because it provides players instantaneous feedback. To demonstrate, the following subsection teaches you how to launch a player's character upward toward the sky when they collide with a jump pad with an initial impulse that you can adapt with new values to meet your own gameplay requirements.

### Use ApplyImpulse

The [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyImpulse|ApplyImpulse]] method applies force on an entire assembly to obtain an initial linear velocity before slowing to a stop when there are oppositional forces. To begin moving the assembly, the method needs to know:

- The assembly to move.
- The axis to apply force to reach an initial linear velocity.
- The amount of force to apply to each axis.

You can define all of these values in a script. For example, the sample script defines the assembly to move as the player character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] object, then it applies an impulse of force that's 2500 Rowton-seconds to launch the player upwards on the world's positive Y axis. Note that player characters have different amounts of mass, so you may need to increase and balance this force to launch every player without launching player characters with smaller amounts of mass too high.

To move an assembly using [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyImpulse|ApplyImpulse]]:

1. In the **Explorer** window, expand the **ApplyImpulseExample** folder, then expand its child **JumpPad_DIY** model.
1. Insert a script into the **JumpPad** part.
   1. Hover over the part and click the ⊕ button. A contextual menu displays.
   1. From the menu, insert a **Script**. The attachment displays in the center of the part.
   1. Rename the script to **JumpScript**.
1. Replace the default code with the following code:

   ```lua
   local volume = script.Parent

   local function onTouched(other)
     local impulse = Vector3.new(0, 2500, 0)
     local character = other.Parent
     local humanoid = character:FindFirstChildWhichIsA("Humanoid")
     if humanoid and other.Name == "LeftFoot" then
       other:ApplyImpulse(impulse)
     end
   end

   volume.Touched:Connect(onTouched)
   ```

   [Video: Impulse-3.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-moving-objects/Impulse-3.mp4)

---
*Source: [Create moving objects](https://create.roblox.com/docs/tutorials/use-case-tutorials/physics/create-moving-objects) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
