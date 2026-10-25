---
title: "Create face accessories"
description: "Face accessories are 3D accessories that move and animate with a live head."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/facial-animation/create-face-accessories"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Face accessories are 3D accessories that move and animate with a live head.*

> [!warning]
> **This tutorial covers advanced topics.** Before you begin, you should have prior knowledge on modeling, UV mapping, rigging, animation, and how to set up a character in [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview).

Face accessories are a type of [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories|layered accessory]] that equip to [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic heads|dynamic heads]]. As the head animates and emotes, face accessories like eyebrows, eyelashes, or glasses stretch and deform with the character's facial features.

You can create a face accessory model in third-party modeling software, such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview). When creating a face accessory, your accessory model must meet the following requirements:

- The accessory model must meet Studio's [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories#Modeling requirements|modeling requirements]].
- The model must be parented (Blender) or bound (Maya) to a character with a [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|standard]] or [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|advanced]] R15 rig.
- The model must include an inner and outer cage.

To help you meet these requirements, this tutorial covers the processes of connecting accessories to a Cubie character body's rigging armature from [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads|Create basic dynamic heads]], applying skinning data, and adding cages to the accessory, as well as how to export the accessory for import into Studio.

> [!info]
> This tutorial uses [Blender version 5.2](https://www.blender.org/download/releases/5-2/). If you are using another version of Blender, there might be minor differences in UI and settings.

## Reference files

The following face accessory reference files include all checkpoint references throughout this tutorial:

> [!warning]
> The reference Cubie character model is for educational purposes only. It does not meet the technical avatar [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character body specifications]] to be ready for the Marketplace.

| Name | Description |
| --- | --- |
| [Cubie-Complete.fbx](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-dynamic-heads/reference-files/Cubie-Complete.fbx) | The complete Cubie reference character, from [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads\|Create basic dynamic heads]]. This file is ready for import into Studio. |
| [Cubie-Cage-Only.fbx](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/reference-files/Cubie-Cage-Only.fbx) | The full body cage mesh of the Cubie reference character. This includes the inner and outer cage meshes. |
| [Cubie-Eyebrow-Geo.fbx](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/reference-files/CubieEyebrow_Geo.fbx) | A standalone eyebrow model, designed for the Cubie model. |
| [Cubie-Eyebrow-Rigged-And-Caged.fbx](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/reference-files/Cubie-Eyebrow-Rigged-And-Caged.fbx) | The Cubie eyebrow model, correctly rigged and caged following the instructions in this tutorial. This file is ready for import into Studio. |
| [Cubie-Hawk-Hair.fbx](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/reference-files/CubieHawkHair_Geo.fbx) | A hair model reference, designed for the Cubie model. |
| [Creating-Face-Accessories-Reference-Files.zip](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/reference-files/Creating-Face-Accessories-Reference-Files.zip) | A collection of all the provided reference files. |

## Modeling requirements

This tutorial uses a simple eyebrow reference as a demonstration on how to create a face accessory. If you're rigging and caging a different face accessory, ensure that your accessory model meets Roblox's [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory specifications]], including the [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications#Face accessories|face accessory]] requirements.

If creating your own face accessory mesh, consider the following guidelines:

- Model your face accessory mesh with your character body model for best results and fit.
- When possible, try to match up the edges of your face accessory's geometry with the edges/vertices of the underlying head topology. This improves the deformation of the accessory with the underlying head model.
- Some accessories like eyebrows can extrude or slightly intersect the character model mesh to achieve a certain cosmetic look.
- When working with a face accessory with multiple pieces, such as eyebrows or eyelashes, combine the meshes to a single mesh once you are done modeling and rigging.
- Face accessory meshes do not require a `_Geo` naming convention.

## Rig the eyebrows

**Rigging** is the process of connecting a mesh with an internal rig so that mesh surfaces can rotate and move as joints rotate and move. You must [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning|rig]] your face accessory to a character body's bone structure so that the accessory can bend and deform along with the character's facial poses.

After rigging, you can skin your model in your modeling tool, or you can transfer skinning data from your character to the face accessory at runtime by using [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer|Automatic skinning transfer]].

### Project setup

This tutorial uses a simple eyebrow model and the complete version of the dynamic head model from [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads|Create basic dynamic heads]] in a new Blender project.

To set up your Blender project:

1. Open a new **General** project in Blender.
1. Select the default shape, camera, and lights, then press <kbd>Delete</kbd>.
1. Import [Cubie-Complete](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-dynamic-heads/reference-files/Cubie-Complete.fbx).

   *(image in the full Top G Vault)*

1. To simplify the workspace, delete the inner and outer cage mesh objects. You will import a full-body cage later in the tutorial.

   [Video: Removing-Character-Cage.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/videos/Removing-Character-Cage.mp4)

1. Import [CubieEyebrow_Geo](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/reference-files/CubieEyebrow_Geo.fbx). If necessary:

   1. Reposition the accessory model on the face.
   1. Hide the armature temporarily to verify model placement.

   *(image in the full Top G Vault)*

### Parent accessory to armature

Now that you have the accessory in your scene, it's time to connect it to the character's rigging armature so that its joints can move the eyebrows appropriately. It's recommended to parent with automatic weights because it automatically applies influences to your model, which can save you time during the [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories#Skin the eyebrows|skinning]] process.

To parent your accessory to the armature:

1. In **Object** mode, hold <kbd>Shift</kbd> and click **CubieEyebrow**.
1. While still holding <kbd>Shift</kbd>, click any of the character joints.
1. Right-click in the viewport, then select **Parent** > **Armature Deform** > **With Automatic Weights**.

   [Video: Parent-Armature.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/videos/Parent-Armature.mp4)

> [!info]
> You can parent with **Empty Weights** to not apply any skinning influence to your accessory mesh, giving you more manual control over the skinning process. For more information, see Blender's official [Automatic Weights](https://docs.blender.org/manual/en/latest/animation/armatures/skinning/parenting.html#with-automatic-weights) documentation.

## Skin the eyebrows

**Skinning** is the process of assigning which parts of the mesh surface move and rotate with specific joints. In many cases, you can skip the skinning process for your accessory and use Studio's [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer|Automatic Skinning Transfer]] process instead. Alternatively, if you want manual control, you can apply manual skinning in Blender using the same process in [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Skin joints|Create basic dynamic heads - Skin joints]].

> [!info]
> Because the complete version of the dynamic head model includes a fully rigged and posed head, you can test your accessory on various FACS poses saved to the timeline within Blender, then adjust your skinning data as necessary.

## Add cages

The caging process for face accessories is similar to caging layered accessories and shares the same modeling and caging requirements. After you finish rigging, it's time to import a full-body inner and outer cage to your project, rename the cages, then stretch the vertices of the Outer Cage to cover the accessory model with minimal space.

To cage the eyebrow accessory:

1. Import [Cubie-Cage-Only](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/reference-files/Cubie-Cage-Only.fbx). This includes a single full-body inner and outer cage mesh for the Cubie model.

   *(image in the full Top G Vault)*

1. Rename cages to begin with **CubieEyebrow** before the **\_InnerCage** and **\_OuterCage** affix.
1. In **Edit** mode, extend the outer cage to fit over the accessory with minimal space. Use various material and viewing options to easily manipulate the correct vertices on the outer cage.

   [Video: Editing-Outer-Cage.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/videos/Editing-Outer-Cage.mp4)

If you are using automatic skinning transfer, you can ensure that automatic skinning transfer only applies to specific parts of the accessory by removing unnecessary sections of the cage. For more information, see [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer#Modify character cages|Automatic Skinning Transfer - Modify character cages]].

## Export your accessory

Export your model when ready to test your accessory model in Studio or when setting up for final export. When exporting face accessories, keep in mind the following guidelines:

- Ensure that the final accessory model follows Roblox's [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory specifications]], including properly named mesh and cage objects.
- Do not export any unnecessary data, such as animation data, or light and camera objects.
- If exporting PBR textures, follow Roblox's [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications#Textures|texture specifications]] when exporting texture images from your texture software.

To export your face accessory:

1. Ensure only the **accessory mesh**, **armature object** and **cage meshes** are exported. Delete all other objects in the workspace. You can quickly filter out **Geo** and **Att** named objects in your workspace to quickly delete them.

      [Video: Removing-Extra-Objects.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/creating-face-accessories/videos/Removing-Extra-Objects.mp4)

1. Follow the [[30 Official Roblox Docs/Avatar/Layered Accessories/Export layered accessories#Blender export settings|layered accessories export settings]] and save the file to your preferred location. The final export of the eyebrow `.fbx` is available for reference.

## Test in Studio

To use your exported model into Studio as an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]], use the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] to test and generate the accessory object. At this point, you can equip the accessory to a humanoid character. If you intend to transfer skinning data from your character to the accessory model at runtime, also enable [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer|automatic skinning transfer]] for your accessory.

> [!info]
> If following the references provided by this tutorial, only **EnabledOverride** applies the skinning transfer in Studio, since some skinning data will have been applied to the model during the [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories#Parent accessory to armature|parenting]] process.

---
*Source: [Create face accessories](https://create.roblox.com/docs/art/characters/facial-animation/create-face-accessories) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
