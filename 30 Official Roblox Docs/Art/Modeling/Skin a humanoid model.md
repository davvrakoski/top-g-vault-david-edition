---
title: "Skin a humanoid model"
description: "Explains the process for skinning a humanoid R15 model in Blender."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/skin-a-humanoid-model"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the process for skinning a humanoid R15 model in Blender.*

A humanoid skinned mesh is a character model that, when posed or animated, bends and stretches naturally at its joints. You can create a skinned mesh using a third party modeling tool such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview).

This is an advanced guide on skinning a humanoid model into an R15 model in Blender using the humanoid model completed in [[30 Official Roblox Docs/Art/Modeling/Rig a humanoid model|Rig a humanoid model]]. Before skinning a humanoid model, you should also familiarize yourself with the basic concepts in [[30 Official Roblox Docs/Art/Modeling/Skin a simple mesh|Skin a simple mesh]].

To skin a humanoid model in Blender, you need to:

- [[30 Official Roblox Docs/Art/Modeling/Skin a humanoid model#Set up Blender|Set up Blender]] with a rigged model to optimize the weight painting process with bone visualization settings and Auto Normalize.
- [[30 Official Roblox Docs/Art/Modeling/Skin a humanoid model#Weight painting|Weight paint]] vertices of your mesh objects by balancing influence of your vertices between two or more bones of a humanoid rig architecture.

> [!info]
> This guide uses the humanoid model rigged in [[30 Official Roblox Docs/Art/Modeling/Rig a humanoid model|Rig a humanoid model]] and [Blender version 3.0](https://www.blender.org/download/releases/3-0/). If you are
> using another version of Blender, there may be minor differences in UI and
> settings.

## Set up Blender

This guide uses the rigged model completed in [[30 Official Roblox Docs/Art/Modeling/Rig a humanoid model|Rig a humanoid model]]. You can also download the rigged model [Blender project](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/lola-rigged-r15.blend) to follow along with this guide.

To optimize the process of skinning a rigid character, first set up the following in your Blender project:

- Open the Blender project and configure the [[30 Official Roblox Docs/Art/Modeling/Skin a humanoid model#Bone visualization|bone visualization]] settings.
- Enable [[30 Official Roblox Docs/Art/Modeling/Skin a humanoid model#Auto normalize|Auto Normalize]] to help optimize the weight-painting process.

### Bone visualization

By default, Blender displays bone objects as octahedral shapes. This original shape is useful when positioning bones but can get in the way while weight painting. To help visualization during the weight painting process, change your bone visualization to sticks.

To update the visualization of your bones:

1. In Object Mode, click the **armature**.
2. In the **Object Data Properties**, change the **Display As** value to **Sticks**.

   [Video: 1-bone-visualizations.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/1-bone-visualizations.mp4)

### Auto normalize

The Auto Normalize setting forces the influence on your vertices to equal one. This makes weight painting multiple meshes and bones more efficient by ensuring that each vertex in your character is fully influenced by at least one bone. See Blender's documentation on the [Auto Normalize](https://docs.blender.org/manual/en/latest/sculpt_paint/weight_paint/tool_settings/options.html) for more information.

Auto Normalize also prevents cases where a vertex is fully influenced by multiple bones and can prevent common weight painting mistakes.

[Video: autonormalize-example2.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/autonormalize-example2.mp4)

*Without Auto Normalize, it is not clear until testing that this fully influenced head is also influenced by another bone due to a painting mistake.*

[Video: autonormalize-example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/autonormalize-example.mp4)

*With Auto Normalize, painting influence to an incorrect bone removes the existing influence from the original bone. This makes mistakes easier to catch and resolve.*

> [!warning]
> Studio doesn't support more than 4 bones to influence any single vertex. This may occur in complex rigs or inadvertently with Auto Normalize disabled.

To enable Auto Normalize:

1. In **Object Mode**, select the **armature**.
2. Hold <kbd>Shift</kbd> and select **any mesh object** on your model.
3. At the top of the 3D viewport, click on the Mode dropdown and switch to **Weight Paint** mode.
4. On the right side of the viewport, expand the **Tool** tab.
5. Under **Options**, enable **Auto Normalize**.

[Video: 2-auto-normalize.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/2-auto-normalize.mp4)

## Weight painting

Weight painting applies specific weights, or influences, that bones will have over parts of a mesh using a painting workflow. There are also additional ways to apply influences through weight painting or other tools, some which are covered in [[30 Official Roblox Docs/Art/Modeling/Skin a simple mesh|Skin a simple mesh]]. See additional online resources such as Blender's [Character Rigging](https://www.youtube.com/watch?v=f2pTkW-1JkE) and [Vertex Groups](https://www.youtube.com/watch?v=dKZrzG5r13g) fundamental guides for more information on skinning and applying weights.

This guide will cover one process of weight painting the head and arm meshes of a humanoid model. These weight painting techniques can be used to weight paint the rest of the model.

> [!warning]
> Do not apply influences on the Root or HumanoidRootNode parent bones in a humanoid rig. Any added influences are dropped when importing into Studio.

### Paint the head mesh

The head mesh connects to the upper torso at the bottom vertices of the neck. To create a realistic bend in the model, the head mesh needs to share influence with the Head bone and the Upper Torso bone near the neckline.

To begin weight painting the Head mesh object:

1. In Object Mode, click the **armature** then hold <kbd>Shift</kbd> and click the **Head mesh object**.
2. In the Mode dropdown, switch to **Weight Paint** mode.
3. Hold <kbd>Shift</kbd> and click the **Upper Torso bone**. The head should be completely blue as the Upper Torso doesn't yet influence any head vertices.

   [Video: 3-select-head.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/3-select-head.mp4)

      > [!info]
      > A common error is to apply weights with the incorrect bone selected. Make sure to <kbd>Shift</kbd> select and un-select the correct bones when applying weights. The name of the bone currently being painted will populate in the Viewport.

4. In the top right of the Viewport, open the **Tool** menu and set the **brush strength** to **1**.
5. With the Upper Torso bone selected, **paint** the Head of your model at the neckline. You can temporarily **Hide** the Upper Torso mesh in the Outliner to have direct access to the bottom of the neck.

   [Video: 4-weight-paint-head.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/4-weight-paint-head.mp4)

6. At any point, check the applied influences by holding <kbd>Shift</kbd> and deselecting the Upper Torso bone and selecting the Head bone. Press <kbd>R</kbd> to rotate the Head bone with your mouse and test how the mesh object shares influences between the Head and Upper Torso bone.

   [Video: 5-test-head.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/5-test-head.mp4)

7. If additional painting is required, hold <kbd>Shift</kbd> and select the bone you want to add or remove influence from, and use the Brush tool to apply.

The final result of weight painting the head of the model should balance the head mesh influences with the Head bone and the Upper Torso bone:

*(image in the full Top G Vault)*

*The Head bone fully influences the Head_Geo mesh from the neck up.*

*(image in the full Top G Vault)*

*The Upper Torso bone fully influences the Head_Geo mesh from the neck down.*

### Paint the arm meshes

Similar to the process for balancing influences between the Head bone and Upper Torso bone, arms and legs require a similar weight painting process.

The right arm includes the Right Hand, Right Lower Arm, and Right Upper Arm, each with their corresponding bones. The following instructions provide guidance on painting influences to all of the arm mesh objects. You can then apply these techniques to the rest of the meshes in your model.

#### Hand

Starting with the Right Hand, you can balance the influences of the mesh between the **Hand bone** and the **Lower Arm bone** to create a natural bend at the wrist.

To weight paint influences to the right hand:

1. From Object Mode, click the **armature**, hold <kbd>Shift</kbd>, and click the right **hand** geometry.
2. In the mode dropdown, switch to **Weight Paint** mode. With the hand bone selected in this mode, you can press <kbd>R</kbd> and test the current rotation of the hand mesh object.

   [Video: 6-select-hand-and-test.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/6-select-hand-and-test.mp4)

3. In the top right of the Viewport, open the **Tool** menu and set the **brush strength** to **1**.
4. With the Lower Arm bone selected, **paint** the hand of your model at the wrist. You can temporarily **Hide** the Lower Arm mesh in the Outliner to get better access to the wrist.

   [Video: 7-weight-paint-hand.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/7-weight-paint-hand.mp4)

5. During and after weight painting the hand, press <kbd>R</kbd> with the bone selected to test the rotation and flexibility.

   [Video: 8-test-hand.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/8-test-hand.mp4)

> [!info]
> You can add and skin additional bones, such as fingers, if you want additional controls to your skinned mesh.
>
> Extra bone objects that are skinned to a mesh but do not share a Humanoid bone object name (such as LowerTorso, LeftFoot, Right UpperArm) are imported into Studio as a [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] with the same name it was assigned with in the 3D modeling software.

#### Lower arm

After the wrist of the right hand is weight painted, you can proceed to balance the influences of the Lower Arm mesh between the **Lower Arm bone** and the **Upper Arm bone** to create a natural bend at the elbow.

To weight paint influences to the lower arm:

1. Switch back to Object Mode.
2. Click the **armature** and hold <kbd>Shift</kbd> and click the right **lower arm** geometry.
3. In the mode dropdown, switch to **Weight Paint** mode.
4. Hold <kbd>Shift</kbd> and deselect other bones besides the Lower Arm bone. You can test the current rotation of the highlighted Lower Arm bone by pressing <kbd>R</kbd>.

   [Video: 9-switch-to-lower-arm.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/9-switch-to-lower-arm.mp4)

5. Hold <kbd>Shift</kbd> and select the Upper Arm bone.
6. With the Upper Arm bone selected, **paint** the lower arm of your model at the elbow. You can temporarily **Hide** the Upper Arm mesh in the Outliner to get better access to the elbow.
7. During and after weight painting the lower arm, press <kbd>R</kbd> with the lower arm bone selected to test the rotation and flexibility.

   [Video: 10-weight-paint-lower-arm.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/10-weight-paint-lower-arm.mp4)

#### Upper arm

After the elbow of the right lower arm is weight painted, you can proceed to balance the influences of the Upper Arm mesh between the **Upper Arm bone** and the **Upper Torso bone** to create a natural bend at the underarm.

To weight paint influences to the upper arm:

1. Switch back to Object Mode.
2. Click the **armature** and hold <kbd>Shift</kbd> and click the right **upper arm** geometry.
3. In the mode dropdown, switch to **Weight Paint** mode.
4. Hold <kbd>Shift</kbd> and deselect other bones besides the Upper Arm bone. You can test the current rotation of the highlighted Upper Arm bone by pressing <kbd>R</kbd>.

   [Video: 11-switch-to-upper-arm.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/11-switch-to-upper-arm.mp4)

5. Press <kbd>R</kbd> and drag your mouse to rotate the Upper Arm so that the arm is horizontal. This makes it easier to access the vertices of the underarm.
6. Hold <kbd>Shift</kbd> and select the Upper Torso bone.
7. With the Upper Torso bone selected, **paint** the upper arm of your model at the underarm. You can temporarily **Hide** the Upper Torso mesh in the Outliner to get better access to the elbow.
8. During and after weight painting the lower arm, press <kbd>R</kbd> with the upper arm bone selected to test the rotation and flexibility.

   [Video: 12-weight-paint-upper-arm.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/12-weight-paint-upper-arm.mp4)

#### Shoulder

After the underarm is weight painted, you can proceed to balance the influences of the Upper Torso mesh between the **Upper Torso bone** and the **Upper Arm bone** to create a natural bend at the shoulder when the arm is moved. Since this movement is subtle, you only need to apply a partial strength influence to these vertices.

To weight paint a partial strength influence to the upper torso:

1. Switch back to Object Mode.
2. Click the **armature** and hold <kbd>Shift</kbd> and click the **upper torso** geometry.
3. In the mode dropdown, switch to **Weight Paint** mode.
4. Hold <kbd>Shift</kbd> and deselect other bones besides the Upper Arm bone. You can test the current rotation of the highlighted Upper Arm bone by pressing <kbd>R</kbd>.

   [Video: 13-switch-to-upper-torso.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/13-switch-to-upper-torso.mp4)

5. In the top right of the Viewport, open the **Tool** menu and set the **brush strength** to **.25**. You may want to adjust this based on the results when testing.
6. With the Upper Torso bone selected, **paint** the upper torso of your model at the shoulder.
7. During and after weight painting the lower arm, press <kbd>R</kbd> with the upper arm bone selected to test the rotation and flexibility of your influences to the upper torso.

   [Video: 14-weight-paint-upper-torso.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/skinning-humanoid/14-weight-paint-upper-torso.mp4)

   > [!warning]
   > *(image in the full Top G Vault)*
   >
   >
   > When rotating arms to their full range of motion, a candy-wrapping effect may occur between the shoulder and torso where the skinning loses volume and doesn't deform naturally. This effect may not be avoidable in many cases.

You can continue to weight paint the rest of the limbs of your model using these processes. When completed, you can [[30 Official Roblox Docs/Art/Modeling/Export settings|export]] your skinned model as a `.fbx` using the Blender export settings for use in Studio. For reference, you can download a [Blender project](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/lola-skinned-s15.blend) with the model fully skinned.

> [!warning]
> Since this reference model doesn't yet have [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|inner and outer cage mesh data]], this model can't equip layered accessories.

---
*Source: [Skin a humanoid model](https://create.roblox.com/docs/art/modeling/skin-a-humanoid-model) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
