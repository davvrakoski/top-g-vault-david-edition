---
title: "Export layered accessories"
description: "Use the appropriate export settings in Blender and Maya to generate Studio-ready .fbx files."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/layered-accessories/export"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the appropriate export settings in Blender and Maya to generate Studio-ready .fbx files.*

When you are ready to export a layered accessory model that meets Roblox's [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory specifications]], it's important to review the following prerequisite information and step-by-step instructions for the `.fbx` or `.gltf` export files so that your creation takes advantage of all of Studio's [[30 Official Roblox Docs/Studio/Importer|Importer]] features.

This is particularly important for layered accessory models because they contain all the mesh and texture data, including the rig and influence data that's essential for accessories to move and animate properly with character bodies across the platform.

> [!info] For other types of 3D models:
> - [[30 Official Roblox Docs/Art/Modeling/Export settings|General mesh]] export settings.
> - [[30 Official Roblox Docs/Avatar/Rigid Accessories/Export rigid accessories|Rigid accessory]] export settings.

## Prerequisites

Before you export your custom layered accessory, ensure that you are only exporting the Roblox supported objects related to your model. If you have any modifiers to your mesh or project objects, make sure to apply or delete them before export.

You can export layered accessory models with the following object structure:

| | |
| --- | --- |
| • Armature parent• Bones / joints<br>• Primary mesh object<br><br>• Cage parent object• Inner cage mesh object<br>• Outer cage mesh object | *(image in the full Top G Vault)* |

You can also export shoes together. Even though left and right shoes are separate layered accessories, you can either export the left and right shoe individually, or export both shoes at the same time using the following structure:

| | |
| --- | --- |
| • Armature parent• Bones / joints<br>• Left shoe mesh object<br>• Right shoe mesh object<br><br>• Cage parent object• Left shoe inner cage<br>• Left shoe outer cage<br>• Right shoe inner cage<br>• Right shoe outer cage | *(image in the full Top G Vault)* |

> [!warning]
> Each shoe must include their own inner and outer cage.

## Blender export settings

Blender allows you to export your layered accessory as either a `.fbx` or `.gltf` file. If you are exporting it as a `.fbx` file, familiarize yourself with [[30 Official Roblox Docs/Art/Blender#Adjust scale (FBX)|Blender's FBX scaling]] to ensure that you successfully import the model into Studio at the correct scale.

To export your layered accessory in Blender as a `.fbx` file:

1. In the topbar, click **File** > **Export** > **FBX (.fbx)**. The **Blender File View** window displays.
1. On the right-hand side, set **Path Mode** to **Copy**, then toggle the **Embed Textures** button.

   *(image in the full Top G Vault)*

1. In the **Transform** section, set **Apply Scalings** to **FBX Unit Scale**. If you run into scaling issues on import, see [[30 Official Roblox Docs/Art/Blender#Adjust scale (FBX)|Blender FBX scaling]] for alternative approaches.

   *(image in the full Top G Vault)*

1. In the **Armature** section, uncheck **Add Leaf Bones**.

   *(image in the full Top G Vault)*

1. Click the **Export FBX** button and save the `.fbx` to the directory of your choice.

> [!success]
> You now have a `.fbx` file that you can [[30 Official Roblox Docs/Avatar/Layered Accessories/Import layered accessories|import into Studio]] as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] layered accessory. Once the layered accessory is in Studio, you can use the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] to convert the model into an accessory.

## Maya export settings

To export your layered accessory in Maya as a `.fbx` file:

1. In the topbar, click **File** > **Export All**. The **Export All** window displays.
1. Near the bottom of the window, click the **Files of type** dropdown, then select **FBX export**.
1. On the right-hand side of the window, navigate to the **Options...** section.
1. In the **Geometry** section, enable **Smooth Mesh** and **Referenced Asset Content**.
1. If you need to import textures as a `.png`, in the **Embed Media** section, enable **Embed Media**.
1. In the **Advanced Options** section,
   - Navigate to **Units**, then enable **Automatic**.
   - Navigate to **Axis Conversion**, then set the **Up Axis** property to **Y**.
1. Click the **Export All** button and save the `.fbx` to the directory of your choice.

    *(image in the full Top G Vault)*

> [!success]
> You now have a `.fbx` file that you can [[30 Official Roblox Docs/Avatar/Layered Accessories/Import layered accessories|import into Studio]] as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] layered accessory. Once the layered accessory is in Studio, you can use the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] to convert the model into an accessory.

---
*Source: [Export layered accessories](https://create.roblox.com/docs/avatar/layered-accessories/export) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
