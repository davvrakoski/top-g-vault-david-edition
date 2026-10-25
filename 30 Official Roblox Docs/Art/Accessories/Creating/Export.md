---
title: "Export"
description: "Use Blender's FBX export with specific settings when exporting a clothing asset."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating/exporting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use Blender's FBX export with specific settings when exporting a clothing asset.*

It's important to follow the Blender export settings to ensure a Studio-compatible `.fbx` file. Before exporting your file, ensure that you've removed extra objects, such as lights, cameras, or mannequins, and applied or removed any active modifiers.

To export your file from Blender:

1. In the Outliner, unhide all objects, make them selectable, then select everything in your project.

   *(image in the full Top G Vault)*

1. In the topbar, click **File** > **Export** > **FBX (.fbx)**. The **Blender File View** window displays.
1. On the right-hand side, set **Path Mode** to **Copy**, then toggle the **Embed Textures** button.

   *(image in the full Top G Vault)*

1. In the **Include** section, enable **Selected Objects**.
1. In the **Transform** section, set **Apply Scalings** to **FBX Unit Scale**. If you run into scaling issues on import, see [[30 Official Roblox Docs/Art/Blender#Adjust scale (FBX)|Blender FBX scaling]] for alternative approaches.

   *(image in the full Top G Vault)*

1. In the **Armature** section, disable **Add Leaf Bones**.

   *(image in the full Top G Vault)*

1. Disable **Bake Animation**.

   *(image in the full Top G Vault)*

1. Click the **Export FBX** button.

> [!success]
> You've completed the exporting section of this tutorial. If desired, download a [reference sample](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating/Long_Sleeve_Export.fbx) of this exported file for comparison. You can use this reference in the next importing step.

---
*Source: [Export](https://create.roblox.com/docs/art/accessories/creating/exporting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
