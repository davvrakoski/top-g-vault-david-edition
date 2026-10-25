---
title: "Export settings"
description: "Use the appropriate export settings in Maya and Blender to generate Studio-ready .fbx files."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/export-requirements"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the appropriate export settings in Maya and Blender to generate Studio-ready .fbx files.*

Export your mesh or model as a `.fbx` to take advantage of all of Studio's 3D import features. When rigging or skinning a model, a `.fbx` export contains both the rig and influence data you need to later [[30 Official Roblox Docs/Parts/Meshes#Import meshes|import]] into Studio.

Check that your model meets Roblox's [[30 Official Roblox Docs/Art/Modeling/General specifications|modeling specifications]] before exporting to ensure Studio compatibility. Specific types of assets, like characters and accessories, have additional specifications:

> [!warning] If creating other types of 3D models:
> - For rigid accessories, see [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications|accessory specifications]] and [[30 Official Roblox Docs/Avatar/Rigid Accessories/Export rigid accessories|accessory export settings]].
> - For layered accessories, see [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory specifications]] and [[30 Official Roblox Docs/Avatar/Layered Accessories/Export layered accessories|layered export settings]].
> - For avatar characters, see [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|avatar specifications]] and [[30 Official Roblox Docs/Avatar/Character Bodies/Export character bodies|avatar export settings]].

## Blender

To export the `.fbx` file in Blender:

1. In the topbar, click **File**. A pop-up menu displays.
2. Select **Export**, then **FBX (.fbx)**. The **Blender File View** window displays.
3. On the right-hand side, change **Path Mode** to **Copy**, then toggle the **Embed Textures** button.

   *(image in the full Top G Vault)*

4. Set **Transform** > **Apply Scalings** to **FBX Unit Scale**. If you run into scaling issues on import, see [[30 Official Roblox Docs/Art/Blender#Adjust scale (FBX)|Blender FBX scaling]] for alternative approaches.

   *(image in the full Top G Vault)*

5. Under the **Armature** section, disable **Add Leaf Bones**.

   *(image in the full Top G Vault)*

6. Unless exporting content with animation keyframes, such as a walk cycle or a character with [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic heads|facial animation data]], disable **Bake Animation**.

   *(image in the full Top G Vault)* <br>

7. Click the **Export FBX** button.

## Maya

To export a mesh in Maya as a `.fbx` file:

1. In the topbar, click **File**. A pop-up menu displays.
2. Select **Export All**. The **Export All** window displays.
3. Near the bottom of the window, click the **Files of type** dropdown, then select **FBX export**.
4. On the right-hand side of the window, navigate to the **Options...** section.
5. In the **Geometry** section, enable **Smooth Mesh** and **Referenced Asset Content**.
6. In the **Animation** section, disable **Animation**, unless you need to import an animation to Studio. Some avatar assets require animation.
   1. If you are exporting animation, enable **Bake Animation**.
7. If you need to import textures as a `.png`, in the **Embed Media** section, enable **Embed Media**.
8. In the **Advanced Options** section,
   - Navigate to **Units**, then enable **Automatic**.
   - Navigate to **Axis Conversion**, then set the **Up Axis** property to **Y**.
9. Click the **Export All** button.

   *(image in the full Top G Vault)*

---
*Source: [Export settings](https://create.roblox.com/docs/art/modeling/export-requirements) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
