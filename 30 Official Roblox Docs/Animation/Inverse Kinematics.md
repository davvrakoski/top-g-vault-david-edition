---
title: "Inverse Kinematics"
description: "Inverse Kinematics is a technique in computer animation to make characters move and interact with their environment."
area: "30 Official Roblox Docs"
cluster: "Animation"
source: "https://create.roblox.com/docs/animation/inverse-kinematics"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Inverse Kinematics is a technique in computer animation to make characters move and interact with their environment.*

[Inverse Kinematics](https://en.wikipedia.org/wiki/Inverse_kinematics) (IK) is a common technique in computer animation to efficiently make characters move and interact realistically with their environment. The process of creating a realistic movement for a character often requires many iterations and minor adjustments of the various joints. With IK, you can pose and animate multiple character parts by posing or adjusting a single object.

This animation technique can provide solutions to the following examples:

[Video: IK-Place-Hand.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/inverse-kinematics/IK-Place-Hand.mp4)

*Grab and pose a character's hand while automatically adjusting the related limbs, such as the wrist, elbow, and shoulder.*

[Video: IK-Uneven-Surfaces.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/inverse-kinematics/IK-Uneven-Surfaces.mp4)

*Make a character's feet interact realistically on different surfaces and slopes.*

[Video: IK-Drag-Accessory.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/inverse-kinematics/IK-Drag-Accessory.mp4)

*Grab and move a single target object to quickly create realistic interactions with your character and props.*

## IKControl

You can use an [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] to procedurally add IK to your character rigs outside of the **Animation Editor**. Studio allows you to programmatically apply IK to all characters to create realistic movement and interactions in your game.

When adding an [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]], set the [[30 Official Roblox Docs/Animation/Inverse Kinematics#Required properties|required properties]] correctly to avoid unexpected and unnatural animation results. As with all animation, [[30 Official Roblox Docs/Animation/Inverse Kinematics#Test IKControls|test your IKControls]] to ensure that you achieve the desired behavior.

### Required properties

When adding a [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] to your character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] or [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]], you must set the following required properties to enable IK:

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#Type\|Type]] | Specifies the behavior type of the IK control. See [[30 Official Roblox Docs/API Reference/Enums/IKControlType\|Enum.IKControlType]] for the list of behavior options. Common behavior types are `Position` or `Transform`. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] | A [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Bone\|Bone]] in your character rig that tracks toward the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]]. For example, you can set a **LeftHand** bone as a [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] to reach a doorknob object set as the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]] | The object the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] reaches or points toward. A [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]] can be any object with a world position. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot\|ChainRoot]] | Defines the chain of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] or [[30 Official Roblox Docs/API Reference/Classes/Bone\|Bones]] that the [[30 Official Roblox Docs/API Reference/Classes/IKControl\|IKControl]] affects. All connected parts between the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot\|ChainRoot]] and the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] are affected by the [[30 Official Roblox Docs/API Reference/Classes/IKControl\|IKControl]] using the behavior type defined. <br><br> For example, if your character's **LeftHand** is set as the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]], you can apply IK to the entire left arm by setting [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot\|ChainRoot]] to the **LeftUpperArm**. To apply IK just to the parts below the elbow, set [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot\|ChainRoot]] to the **LeftLowerArm**. |

### Test IKControls

You can add and edit [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] programmatically or directly through the **Explorer**. You can even add and make changes to [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] during a Play test to quickly check how various properties affect a character's movements.

To quickly test your [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] using an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] as a target:

1. From Studio's mezzanine, [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|initiate a playtest]].
2. In the **Explorer** window, navigate to **Workspace** → your user's [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. This [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] instance is named as your current Roblox account.
3. Click the **⊕** icon next to your character model's `HumanoidRootPart` and add an **Attachment**.

   *(image in the full Top G Vault)*

4. Select the **Attachment** and use the **Move** tool to position the object in front of your character in the viewport.

   *(image in the full Top G Vault)*

5. In the **Explorer** window, select the **⊕** icon next to your character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] and add an **IKControl**.

   *(image in the full Top G Vault)*

6. Select the [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] and set the following property values in the **Properties** window:

   1. **Type**: Select `Transform` from the dropdown.
   2. **EndEffector**: Select your model's **LeftHand** [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] in the **Explorer**.
   3. **Target**: Select the newly created **Attachment** object in the **Explorer**.
   4. **ChainRoot**: Select your model's **LeftUpperArm** [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] in the **Explorer**.

   *(image in the full Top G Vault)*

   *IKControl Properties*

   *(image in the full Top G Vault)*

   *Explorer - Character Model*

   Your character's left arm should now reach for the target [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]. You can experiment with moving the [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or editing the [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] properties to achieve different results.

   [Video: IK-Drag-Hand.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/inverse-kinematics/IK-Drag-Hand.mp4)

### Add constraints

You can use [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] to restrict how joints can move when reaching its target. Constraints can ensure joints like the elbows and knees bend naturally, or to make the mechanical joints rotate in a specific orientation.

*(image in the full Top G Vault)*

*Elbow bending unnaturally*

*(image in the full Top G Vault)*

*Elbow bending correctly*

To add constraints to your character using [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]], your [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] and constraint must meet the following conditions:

- The attachments referenced in the constraint's [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]/[[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] properties attaches to the same parts as the [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|Part0]]/[[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1|Part1]].
- The relative positions of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]/[[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] must equal the corresponding positions of the [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]]/[[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]] CFrames.
- The constraint and the IKControl share the same parent [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

The following instructions describe the process of adding a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] to restrict the rotation of a character's elbow and adding a [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint|BallSocketConstraint]] to the wrist to limit the rotation angle.

#### Elbow

Characters with [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|R15 rigs]] already include attachments in their joints that you can use to apply the elbow constraint. For the elbow, both the LeftUpperArm and the LeftLowerArm include a `LeftElbowRigAttachment`. Along with adding a constraint, you also need to add additional child attachments to each part's `LeftElbowRigAttachment` to specify which axis the elbow can rotate about.

To add the [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] and child attachments:

1. In the **Explorer** window, locate your model's **LeftLowerArm** and click the **⊕ button**.
2. Add a **HingeConstraint** with the name `LeftElbowConstraint`.
3. In the **Explorer** window, navigate to the **LeftUpperArm.LeftElbowRigAttachment** and add an attachment:

   1. Click the **⊕ button** to add an **Attachment** with the name `LeftElbowConstraintAttachment0`.
   2. In the viewport, select the attachment and use the **Rotate tool** to rotate the attachment so the yellow **PrimaryAxis** is the axis of your elbow's expected rotation.

      *(image in the full Top G Vault)*

   3. Set the **LeftElbowConstraint.Attachment0** property to this new attachment.

4. In the **Explorer** window, navigate to your model's **LeftLowerArm.LeftElbowRigAttachment** add an attachment:

   1. Click the **⊕ button** and add an **Attachment** with the name `LeftElbowConstraintAttachment1`.
   2. Set the **LeftUpperArm.LeftElbowConstraint.Attachment1** property to this new attachment.
   3. Copy the **LeftElbowConstraintAttachment0.CFrameOrientation** property and paste it as the **LeftElbowConstraint.Attachment1.CFrameOrientation** value.

   *(image in the full Top G Vault)*

> [!danger]
> If you see a red arrow on the constraint's visualization, that means your attachment orientations are violating the hinge constraint. Go back and make sure the **LeftElbowConstraintAttachment1** has the same orientation as the **LeftElbowConstraintAttachment0**.

Test your IKControl to verify the elbow only rotates about its hinge axis:

[Video: hinge-constraint.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/inverse-kinematics/hinge-constraint.mp4)

#### Wrists

Even with the elbow constraint, the IKControl can still produce unrealistic poses with the wrists.

*(image in the full Top G Vault)*

*The wrist bends unnaturally at certain orientations*

You can improve this by adding a [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint|BallSocketConstraint]] to limit the rotation of the wrist. While this is similar to the process for adding a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] to the elbow, you can use the [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled|LimitsEnabled]] property on this constraint to further control the range of motion of the wrist.

To add a [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint|BallSocketConstraint]] for the wrist:

1. In the **Explorer** window, locate your model's **LeftHand** and click the **⊕ button**.
   1. Add a **BallSocketConstraint** with the name `LeftWristConstraint`.
2. Locate your model's **LeftLowerArm.LeftWristRigAttachment** and add an attachment:
   1. Click the **⊕ button** and add an **Attachment** with the name `LeftWristConstraintAttachment0`.
   2. In the viewport, select the attachment and use the **Rotate tool** to rotate the attachment so the yellow PrimaryAxis points toward the model's fingertips.
      *(image in the full Top G Vault)*
   3. Set the **LeftWristConstraint.Attachment0** property to the new `LeftWristConstraintAttachment0`.
3. Locate your model's **LeftHand.LeftWristRigAttachment** and add an attachment:
   1. Click the **⊕ button** and add an **Attachment** with the name `LeftWristConstraintAttachment1`.
   2. Copy the **LeftWristConstraintAttachment0.CFrameOrientation** property and paste it as the **LeftWristConstraintAttachment1.CFrameOrientation** property.
   3. Set the **LeftWristConstraint.Attachment1** property to this new **LeftWristConstraintAttachment1**.
4. In the **Explorer** window, select the **LeftWristConstraint**.
5. In the **Properties** window, set the following:
   1. Enable **LimitsEnabled**.
   2. Set **UpperAngle** to `80`. This controls how much the constraint's axis can rotate, and 80 degrees is approximately how much the wrist should be able to bend.
6. Depending on your character you may want to tweak the direction the cone is pointing in. You can do this by using the **Rotate tool** to rotate the constraint's **Attachment0**.

When selecting the **LeftWristConstraint**, a green cone appears visualizing the wrist's range of motion.

*(image in the full Top G Vault)*

With the constraint set up, test the IKControl with the hand pointing down in front of the character and the wrist should rotate and bend more realistically.

[Video: ball-socket-constraint.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/inverse-kinematics/ball-socket-constraint.mp4)

---
*Source: [Inverse Kinematics](https://create.roblox.com/docs/animation/inverse-kinematics) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
