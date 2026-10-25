---
title: "Export textures"
description: "Export your character textures from Blender using the correct settings and processes."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/creating/export-textures"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Export your character textures from Blender using the correct settings and processes.*

> [!warning]
> It's important to test your assets multiple times at every point of the asset creation process, whether it is within Blender or after importing into Studio. For more information, see [[30 Official Roblox Docs/Avatar/Character Bodies/Test character bodies|Test character bodies]].

Whether you are exporting your character for testing, or are performing a final export out of Blender, you must apply the appropriate export settings to ensure that Blender exports the proper character data.

## Export textures

Including the default PBR textures, your template character includes four separate image maps that make up its surface appearance. Depending on your workflow, you can choose to embed the image maps to your export file or export the textures separately as image files. Both methods have advantages:

- [[30 Official Roblox Docs/Art/Characters/Creating/Export textures#Embed textures|Embedding textures]] simplifies your export by packing all of your textures within the single `.fbx` file.
- [[30 Official Roblox Docs/Art/Characters/Creating/Export textures#Export textures|Exporting texture images]] directly allows you direct access to the image textures, so you can test and swap them more quickly.

### Embed textures

Embedding the texture maps to your `.fbx` export can simplify the Blender export and Studio import process. When embedding your textures with Roblox's template files, you need to make a quick adjustment to custom skin tone shader nodes in the Blender file.

*(image in the full Top G Vault)*

*Default node configuration: Mix node connected to Base Color*

*(image in the full Top G Vault)*

*Exportable node configuration: Color node connected directly to Base Color*

To prepare your textures to embed with export:

1. In **Object** mode, select any part of the character.
1. Navigate to the **Shading** tab, then in the node editor, set **Shader Type** to **Object**.

   *(image in the full Top G Vault)*

1. Find the node that connects to the **Principled BSDF's Base Color** node.

   *(image in the full Top G Vault)*

1. Click and drag the line from **Base Color** to disconnect the node.

   *(image in the full Top G Vault)*

1. Find the **file26** node with the color texture map and click and drag the **Color** to the **Principled BSDF's Base Color** node.

   *(image in the full Top G Vault)*

   [Video: Exporting_01.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Exporting_01.mp4)

### Unpack image files

As an alternative to embedding textures, you can export your texture files as separate `.png` image files, which allows you to quickly access and swap image texture maps.

To export your texture image files:

1. Navigate to **File** > **External Data** > **Unpack Resources**.
2. Select **Use files in current directory** to save in the same directory as your project. Blender exports your image files to a textures directory in your project's parent directory.

   *(image in the full Top G Vault)*

---
*Source: [Export textures](https://create.roblox.com/docs/art/characters/creating/export-textures) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
