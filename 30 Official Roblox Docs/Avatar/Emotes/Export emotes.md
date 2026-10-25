---
title: "Export emotes"
description: "Use the appropriate export settings in Maya and Blender to generate Studio-ready .fbx files."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/emotes/export"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the appropriate export settings in Maya and Blender to generate Studio-ready .fbx files.*

When you are ready to export animation data that meets Roblox's [[30 Official Roblox Docs/Avatar/Emotes/Emote specifications|emote specifications]], it's important to review the following prerequisite information and step-by-step instructions for the `.fbx` or `.gltf` export files so that you don't run into any errors for the [[30 Official Roblox Docs/Avatar/Emotes/Import emotes|import]] process.

> [!info] How do I create animation data?
> Creators typically use a third-party modeling tool like Blender or Maya to animate a character model. Once the animation is complete, you can export both the model and the animation data as a `.fbx` or `.gltf` file.

## Prerequisites

When you export a character model with full body animation or FACS animation data, ensure that your animation timeline's **Start** and **End** include the entire range of your animation.

*(image in the full Top G Vault)*

## Blender export settings

Blender allows you to export your character model and animation data as either a `.fbx` or `.gltf` file. If you are exporting it as a `.fbx` file, familiarize yourself with [[30 Official Roblox Docs/Art/Blender#Adjust scale (FBX)|Blender's FBX scaling]] to ensure that you successfully import the model into Studio at the correct scale.

To export your character model with animation data in Blender as a `.fbx` file:

1. Ensure your project's animation timeline has the correct **Start** and **End** range of all your keyframes.
1. In the topbar, click **File** > **Export** > **FBX (.fbx)**. The **Blender File View** window displays.
1. On the right-hand side, set **Path Mode** to **Copy**, then toggle the **Embed Textures** button.
1. In the **Include** section, enable **Custom Properties**.
1. In the **Transform** section, set **Apply Scalings** to **FBX Unit Scale**. If you run into scaling issues on import, see [[30 Official Roblox Docs/Art/Blender#Adjust scale (FBX)|Blender FBX scaling]] for alternative approaches.
1. In the **Armature** section, uncheck **Add Leaf Bones**.
1. Enable and expand **Animation**, then:

   1. Uncheck **NLA Strips**, **All Actions**, and **Force Start/End Keyframes**.
   1. Set **Simplify** to `0.0`.

1. Click the **Export FBX** button and save the `.fbx` to the directory of your choice.

*(image in the full Top G Vault)*

## Maya export settings

> [!info]
> For additional context on exporting animations from Maya, see the [[30 Official Roblox Docs/Art/Characters/Export avatar animations from Maya|Export avatar animations from Maya]] tutorial.

To export your character model with animation data in Maya as a `.fbx` file:

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

---
*Source: [Export emotes](https://create.roblox.com/docs/avatar/emotes/export) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
