---
title: "Build a hinged door"
description: "The process for creating a door using a HingeConstraint."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/physics/build-a-hinged-door"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The process for creating a door using a HingeConstraint.*

Roblox's physics system allows you to construct moving mechanisms like doors, rotating platforms, and even vehicles using **constraints**. For instance, a swinging door can be built using the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]].

[Video: introToConstraints_finalExample.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/building-a-hinged-door/introToConstraints_finalExample.mp4)

## Door setup

Start by creating parts for the door and its attachments. **Attachments** are where one object can connect to another. These attachments will later be used to connect the door to its frame with a hinge.

1. Create two parts with names like **Door** and **DoorFrame**.

   *(image in the full Top G Vault)*

2. Select **DoorFrame**. In the **Properties** window, enable **Anchored** so it won't move.

   *(image in the full Top G Vault)*

3. In the **Explorer**, hover over **DoorFrame** and add a new **Attachment**. Repeat the same to add an attachment to the **Door**.

   *(image in the full Top G Vault)*

4. Rename the attachments to indicate what they're attached to, such as **DoorAttachment** and **FrameAttachment**.

   *(image in the full Top G Vault)*

## Move the attachments

New attachments are created in the center of a part. So they can work with the door, the two attachments need to be moved to face each other.

1. To view constraints and attachments, toggle on **Show Constraint Details** from Studio's **View** menu.
2. In the **Explorer**, select **FrameAttachment**.

   *(image in the full Top G Vault)*

3. Press <kbd>F</kbd> to focus on the attachment and zoom in if needed. Then, use the **Move** tool to position the attachment on the surface of the door frame, facing the door.

   [Video: introToConstraints_showMoveAttachment.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/building-a-hinged-door/introToConstraints_showMoveAttachment.mp4)

    > [!info]
    > It's best to position attachments so they're precisely aligned with one another. In this case, misaligned attachments may cause the door to swing incorrectly.
    >
    > For precise positioning, use **Snap to Grid** with increments appropriate for the size of the part. Alternatively, edit the attachment's position in the **Properties** window.

4. Repeat the same to move **DoorAttachment**. Your attachments should be positioned on the surface facing their counterpart.

*(image in the full Top G Vault)*

***Left**: FrameAttachment / **Right**: DoorAttachment*

## Rotate the attachments

The orientation of an attachment affects how a constraint can move. For the door, both attachments must be rotated so the hinge swings left and right, like those on a standard door.

1. On the door frame, hover over **FrameAttachment**. Notice the **yellow arrow**. This arrow, the **axis**, determines the hinge's rotation.

   *(image in the full Top G Vault)*

    > [!info]
    > Depending on the **DoorFrame** object, the axis may point in a different direction. For instance, a hinge added to the attachment shown above would pivot around the yellow arrow, like in the video below.
    >
    > [Video: introToConstraints_doorSwingingWrong.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/building-a-hinged-door/introToConstraints_doorSwingingWrong.mp4)

2. For accurate rotation, turn on rotation snapping in Studio's toolbar by checking **Rotate** and setting the value to `90`.

   *(image in the full Top G Vault)*

3. Use the **Rotate** tool to orient **both** yellow attachments to point **upwards**. If your axes are already vertical, no action is needed.

   *(image in the full Top G Vault)*

## Add the constraint

Remember, constraints are a way of connecting two attachments to move in a specific way. This door will use a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]], a common constraint that rotates objects along the axes of two attachments.

1. Under **DoorFrame**, create a new **HingeConstraint**.

   *(image in the full Top G Vault)*

2. In the constraint's properties, find **Attachment0**. Click the empty box right of the property and then, in the **Explorer**, click **DoorAttachment**.

   [Video: introToConstraints_selectAttachment0.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/building-a-hinged-door/introToConstraints_selectAttachment0.mp4)

3. Repeat the same process by connecting **Attachment1** to **FrameAttachment**. The properties should appear as below.

   *(image in the full Top G Vault)*

4. Test the project by walking into the door with your character.

   [Video: introToConstraints_finalDoor.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/building-a-hinged-door/introToConstraints_finalDoor.mp4)

   > [!warning]
   > You may encounter the following issues when testing:
   >
   > **Parts not moving:**
   >
   > - Make sure that your door is not anchored.
   > - Make sure that the door's motion isn't blocked by terrain or nearby parts.
   >
   > **Door not swinging as expected:**
   >
   > - Ensure the axis of each attachment is pointed up (see [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Physics/Build a hinged door#Rotate the attachments|Rotating Attachments]]).

## Adjust the door

The door is currently able to swing past the door frame. This can be fixed by adjusting the hinge **limits**.

1. In the properties for **HingeConstraint**, find and toggle **LimitsEnabled**. When active, you can set the rotation limits of the hinge.

   *(image in the full Top G Vault)*

1. To make sure this is oriented correctly, select **DoorAttachment** and use the rotate tool so the orange arrow points **towards** the door frame, like below.

   *(image in the full Top G Vault)*

    > [!warning]
    > Remember that the yellow axis arrows affect the pivot of the hinge. Limits are affected by the orange axis arrows.

1. Under the **Limits** section of the properties, both LowerAngle and UpperAngle to -90 and 90, respectively. This creates a range of motion like the image on the left.

   *(image in the full Top G Vault)*
   *(image in the full Top G Vault)*

1. Test the door and notice that the hinge is now limited.

   [Video: introToConstraints_finalDoor_WithLimits.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/building-a-hinged-door/introToConstraints_finalDoor_WithLimits.mp4)

   > [!warning]
   > If the door limits don't work as expected, it's possible that the orange axis on an attachment isn't correctly aligned. Select DoorAttachment, and make sure that a green plane with an arc points **towards** the door frame, as in the image below.
   >
   > *(image in the full Top G Vault)*

With the door complete, take some time to explore using hinge constraints in different situations, such as a trap door or a swinging axe trap.

---
*Source: [Build a hinged door](https://create.roblox.com/docs/tutorials/use-case-tutorials/physics/build-a-hinged-door) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
