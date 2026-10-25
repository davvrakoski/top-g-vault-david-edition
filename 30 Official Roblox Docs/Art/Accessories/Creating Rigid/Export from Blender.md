---
title: "Export from Blender"
description: "Use Blender's .fbx exporter with the correct settings to create a Studio-ready asset."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating-rigid/exporting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use Blender's .fbx exporter with the correct settings to create a Studio-ready asset.*

[Video: Exporting.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Exporting.mp4)

After modeling and texturing your asset, you can begin the process of **exporting** your Blender project as a `.fbx` or `.gltf`. For up-to-date settings, see [[30 Official Roblox Docs/Art/Modeling/Export settings|Export settings]].

> [!warning]
> If you are creating your own accessory object, it's important to clean up your project, which can involve deleting or removing any extra objects, such as lights, cameras, or mannequins, to ensure you only export the accessory mesh, and applying any modifiers to your mesh object.

To export your model as a `.fbx`:

1. In the topbar, click **File** > **Export** > **FBX (.fbx)**. The **Blender File View** window displays.
1. On the right-hand side, set **Path Mode** to **Copy**, then toggle the **Embed Textures** button.

   *(image in the full Top G Vault)*

1. In the **Transform** section, set **Apply Scalings** to **FBX Unit Scale**. If you run into scaling issues on import, see [[30 Official Roblox Docs/Art/Blender#Adjust scale (FBX)|Blender FBX scaling]] for alternative approaches.

   *(image in the full Top G Vault)*

1. Click the **Export FBX** button.

> [!success]
> You've completed the exporting section of this tutorial. If desired, download a [reference sample](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Chest-Texturing-Complete.fbx) of this exported file for comparison. You can use this reference in the next importing step.

---
*Source: [Export from Blender](https://create.roblox.com/docs/art/accessories/creating-rigid/exporting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
