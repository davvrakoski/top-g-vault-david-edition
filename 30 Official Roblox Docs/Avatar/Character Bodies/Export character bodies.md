---
title: "Export character bodies"
description: "Use the appropriate export settings in Maya and Blender to generate Studio-ready .fbx files."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/character-bodies/export"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the appropriate export settings in Maya and Blender to generate Studio-ready .fbx files.*

When you are ready to export a character body model that meets Roblox's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character body specifications]], it's important to review the following prerequisite information and step-by-step instructions for the `.fbx` or `.gltf` export files so that your creation takes advantage of all of Studio's [[30 Official Roblox Docs/Studio/Importer|Importer]] features.

This is particularly important for character body models because they contain all the mesh and texture data, including the rig and influence data that's essential for characters to move and animate properly across the platform.

> [!warning]
> If you are using Roblox's avatar template files, you must perform the [[30 Official Roblox Docs/Art/Characters/Creating/Combine head geometry|cleanup steps]] in order for the assets to properly validate.

> [!info] For other types of 3D models:
> - [[30 Official Roblox Docs/Art/Modeling/Export settings|General mesh]] export settings.
> - [[30 Official Roblox Docs/Avatar/Rigid Accessories/Export rigid accessories|Rigid accessory]] export settings.
> - [[30 Official Roblox Docs/Avatar/Layered Accessories/Export layered accessories|Layered accessory]] export settings.

## Prerequisites

Before you export your custom character body:

- Ensure that you are only exporting the Roblox-supported objects related to your model. If you have any modifiers to your mesh or project objects, make sure to apply or delete them before export.

- While your mesh objects must be parented within an armature object, you can also parent your outer cage objects to a single empty object to simplify your workspace.

  *(image in the full Top G Vault)*

- In the cage parent object, ensure you have an [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Outer cages|outer cage]] for each of your 15 body parts with appropriate naming affix.

  *(image in the full Top G Vault)*

- In the armature object, ensure that you include the all [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Body parts|15 mesh objects]] and [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Attachments|19 attachments]] with the appropriate naming affix.

  *(image in the full Top G Vault)*

> [!info]
> For more information on supported modeling objects and proper configuration, see [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|Character specifications]].

- When exporting character bodies with animation or FACS animation, ensure that your animation timeline **Start** and **End** include the entire range of your animations.

*(image in the full Top G Vault)*

## Blender export settings

Blender allows you to export your character body as either a `.fbx` or `.gltf` file. If you are exporting it as a `.fbx` file, familiarize yourself with [[30 Official Roblox Docs/Art/Blender#Adjust scale (FBX)|Blender's FBX scaling]] to ensure that you successfully import the model into Studio at the correct scale.

To export your character body in Blender as a `.fbx` file:

1. In the topbar, click **File** > **Export** > **FBX (.fbx)**. The **Blender File View** window displays.
1. On the right-hand side, set **Path Mode** to **Copy**, then toggle the **Embed Textures** button.
1. In the **Include** section, enable **Custom Properties**.
1. In the **Transform** section, set **Apply Scalings** to **FBX Unit Scale**. If you run into scaling issues on import, see [[30 Official Roblox Docs/Art/Blender#Adjust scale (FBX)|Blender FBX scaling]] for alternative approaches.
1. In the **Armature** section, uncheck **Add Leaf Bones**.
1. Enable and expand **Animation**, then:

   1. Uncheck **NLA Strips**, **All Actions**, and **Force Start/End Keyframes**.

      > [!info]
      > Ensure your project animation timeline has the correct **Start** and **End** range of all your keyframes.

   1. Set **Simplify** to `0.0`.

1. Click the **Export FBX** button and save the `.fbx` to the directory of your choice.

*(image in the full Top G Vault)*

> [!success]
> You now have a `.fbx` file that you can [[30 Official Roblox Docs/Avatar/Character Bodies/Import character bodies|import into Studio]] as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] character. Once the character body is in Studio, you can:
>
> - [[30 Official Roblox Docs/Avatar/Character Bodies/Test character bodies|Test your character]] using various Studio tooling and workflows.
> - [[30 Official Roblox Docs/Marketplace/Publish to Marketplace|Upload the character]] to the Marketplace.
> - Use the character in an existing game project by applying a [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|HumanoidDescription]] to the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object.
> - [Save the character](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) to your **Toolbox** to use within any of your games or share with other creators.

## Maya export settings

To export your character body in Maya as a `.fbx` file:

1. In the topbar, click **File** > **Export All**. The **Export All** window displays.
1. Near the bottom of the window, click the **Files of type** dropdown, then select **FBX export**.
1. On the right-hand side of the window, navigate to the **Options...** section.
1. In the **Geometry** section, enable **Smooth Mesh** and **Referenced Asset Content**.
1. In the **Animation** section, enable **Animation**. Avatar characters with [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic heads|dynamic heads]] require animation data.
1. Enable **Bake Animation**.
1. If you need to import textures as a `.png`, in the **Embed Media** section, enable **Embed Media**.
1. In the **Advanced Options** section,

   1. Navigate to **Units**, then enable **Automatic**.
   1. Navigate to **Axis Conversion**, then set the **Up Axis** property to **Y**.

1. Click the **Export All** button and save the `.fbx` to the directory of your choice.

    *(image in the full Top G Vault)*

> [!success]
> You now have a `.fbx` file that you can [[30 Official Roblox Docs/Avatar/Character Bodies/Import character bodies|import into Studio]] as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] character. Once the character body is in Studio, you can:
>
> - [[30 Official Roblox Docs/Avatar/Character Bodies/Test character bodies|Test your character]] using various Studio tooling and workflows.
> - [[30 Official Roblox Docs/Art/Accessories/Creating Rigid/Upload and publish|Upload the character]] to the Marketplace.
> - Use the character in an existing game project by applying a [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|HumanoidDescription]] to the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object.
> - [Save the character](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) to your **Toolbox** to use within any of your games or share with other creators.

---
*Source: [Export character bodies](https://create.roblox.com/docs/avatar/character-bodies/export) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
