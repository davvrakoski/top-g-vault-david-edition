---
title: "Rig a simple mesh"
description: "Explains the process for rigging a basic model in Blender."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/rig-a-simple-mesh"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the process for rigging a basic model in Blender.*

You can create a **rigged mesh** using a third party modeling tool such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview). You should rig a model after designing it, but prior to [[30 Official Roblox Docs/Art/Modeling/Export settings|exporting]].

To rig a simple model in Blender:

- [[30 Official Roblox Docs/Art/Modeling/Rig a simple mesh#Set up Blender|Set up Blender]] to Studio's relative scene units before importing a model to rig.
- [[30 Official Roblox Docs/Art/Modeling/Rig a simple mesh#Create a bone structure|Create and reposition bones]] within the mesh object.
- [[30 Official Roblox Docs/Art/Modeling/Rig a simple mesh#Parent armature|Parent the mesh to the armature]] to bind the bone armature to the mesh object.
- [[30 Official Roblox Docs/Art/Modeling/Rig a simple mesh#Assign vertices to bones|Assign vertices to specific bones]] to define which parts of the mesh is driven by which bones.
- [[30 Official Roblox Docs/Art/Modeling/Rig a simple mesh#Test|Test your rigged mesh]] to ensure that the bones are properly positioned and influenced within the mesh.

> [!info]
> This guide uses a downloadable [example robot model](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/shoebot-base-model.fbx) and [Blender version 3.0](https://www.blender.org/download/releases/3-0/). If you are using another version of Blender, there may be minor differences in UI and settings.

## Set up Blender

To start the process of creating a rigged mesh, first set up the following in your Blender project:

1. Open a new **General** project in Blender.
2. Select the default shape, camera, and lights, then press <kbd>Delete</kbd>.

### Import a model

For this example, import a [robot model](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/shoebot-base-model.fbx) into Blender as your mesh object.

To import an existing `.fbx` model:

1. In the topbar, click **File**. A pop-up menu displays.
2. Select **Import**, then the file format of the model you're importing. For this example, select **FBX (.fbx)** and the `.fbx` reference model. The model displays on the 3D viewport.

   *(image in the full Top G Vault)*

## Create a bone structure

Now that your model is within Blender, you must add an **armature** and **bones** to your mesh object. An **armature** is a skeleton-like rigging object that acts as a container for bones, while **bones** are objects that control the movement and deformation of the group of vertices, or **vertex group**, that surround the bone.

### Add an armature

An armature is a structure required to add bones to your mesh. After you add in an armature, you can create and reposition any number of bones inside of your mesh object.

To add an armature:

1. At the top of the 3D viewport, select **Add** → **Armature**.

2. For better visualization of the bones, in the left-hand navigation of the **Properties Editor**, navigate to **Armature Object Properties**.

3. In the **Viewport Display** section, navigate to the **Show** property, then enable **In Front**.

   [Video: 2-adding-armature.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/rigging-simple/2-adding-armature.mp4)

### Add and position bones

When you add an armature to your project, Blender automatically adds one bone to the armature at a default position and scale which will act as the root bone.

To add and position two additional bones:

1. Click on the **bone** to highlight it.
2. At the top of the 3D viewport, click on the Mode dropdown, then switch to **Edit Mode**.
3. In the Viewport, click **Add** → **Single Bone**. Perform this step twice.

   [Video: 3.1-positioning-bones.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/rigging-simple/3.1-positioning-bones.mp4)

4. In the Viewport or Outliner, click on **a newly created bone** to highlight it.
5. Press <kbd>G</kbd> and use your mouse to drag the bone onto the **right arm**.
6. Click on the second bone and press <kbd>G</kbd> to drag the bone on the **left arm**.

   [Video: 3.2-positioning-bones.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/rigging-simple/3.2-positioning-bones.mp4)

7. Click on the top of the **right bone** so that the tip is highlighted. Press <kbd>G</kbd> to drag and orient the bone horizontally toward the right.
8. Click on the top of the **left bone** so that the tip is highlighted. Press <kbd>G</kbd> to drag and orient the bone horizontally toward the left.

   [Video: 3.3-positioning-bones.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/rigging-simple/3.3-positioning-bones.mp4)

9. In the Outliner, double-click and **rename** your bones so they can be easily referenced later.

   [Video: 4-rename-bones.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/rigging-simple/4-rename-bones.mp4)

## Parent armature

After you create and position the bone structure, you need to connect the armature to the mesh object by parenting the armature to the mesh object.

In this guide, you should also use Blender's **Automatic Weights** function when you are parenting an armature, as it automatically adds weights and influences to your mesh.

To parent an armature to a mesh:

1. At the top of the 3D viewport, click on the Mode dropdown, then switch back to **Object Mode**.
2. Press <kbd>Alt</kbd><kbd>A</kbd> (Windows) or <kbd>⌥</kbd><kbd>A</kbd> (Mac) to deselect every object.
3. Hold <kbd>Shift</kbd> and select the **mesh object** and then the **armature**. The selection order is important.
4. In the **Viewport**, right-click on the mesh object. A pop-up menu displays.
5. Select **Parent**, then **With Automatic Weights**.

   [Video: 5-parenting-armature.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/rigging-simple/5-parenting-armature.mp4)

## Assign vertices to bones

With your armature connected to the mesh object, you can now assign the mesh vertices of your limbs to be fully influenced by their corresponding
bones. As a rigid model, each limb will completely bend and articulate when the bones are rotated, which is ideal for a non-organic character like a robot.

To assign bone influence to the left and right arms:

1. In Object Mode, select the **robot mesh object**.
2. In the Mode dropdown, switch to **Edit Mode**.
3. At the top-right of the Viewport, switch to **X-Ray** view using the Material Preview options.

   [Video: 6.1-assigning-vertices.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/rigging-simple/6.1-assigning-vertices.mp4)

4. Drag and select the vertices you want to move with the right bone.
5. Navigate to the **Object Properties** panel.
6. In the **Vertex Group** section, select the name of the bone you want to assign and click **Assign**.
7. **Repeat steps 4-6** for the other bone and arm vertices.

   [Video: 6.2-assigning-vertices.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/rigging-simple/6.2-assigning-vertices.mp4)

8. Drag and select the rest of the vertices in the center of the robot.
9. Navigate to the **Object Properties** panel.
10. In the Vertex Group section, select the **Middle bone** and click **Assign**.

    [Video: 6.3-assigning-vertices.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/rigging-simple/6.3-assigning-vertices.mp4)

## Test

You can test your rig in different poses in Pose mode. It's important to test your rigs after applying or changing influences before exporting.

To test your applied influences:

1. In **Object Mode**, select any part of your model.
2. At the top of the 3D viewport, click on the Mode dropdown, then switch to **Pose** mode.
3. Hold <kbd>Shift</kbd> and click the bone you want to test to highlight it, then press <kbd>R</kbd> to test the rotation.
4. Press <kbd>Alt</kbd><kbd>A</kbd> (<kbd>⌥</kbd><kbd>A</kbd>) to deselect the current bone, then reselect and test another bone.

   [Video: 7-testing.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/rigging-simple/7-testing.mp4)

> [!info]
> To reset the rotation of a selected bone to neutral, press <kbd>Alt</kbd>+<kbd>R</kbd>. While rotating, you can also press your mouse's scroll wheel to change the axes of your rotation.

The robot model is now a rigged mesh and ready to [[30 Official Roblox Docs/Art/Modeling/Export settings|export]] to Studio. For reference, you can download the [final export](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/shoebot-rigged-model.fbx) (`.fbx`) of the model rigged in this guide.

---
*Source: [Rig a simple mesh](https://create.roblox.com/docs/art/modeling/rig-a-simple-mesh) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
