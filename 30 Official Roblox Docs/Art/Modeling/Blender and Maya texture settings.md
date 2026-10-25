---
title: "Blender and Maya texture settings"
description: "Learn to assign basic or PBR textures in Blender or Maya to natively import into Studio."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/assign-textures"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn to assign basic or PBR textures in Blender or Maya to natively import into Studio.*

This guide covers the process to assign texture images in Blender or Maya to your 3D model so that they import seamlessly into Studio. The import process supports both basic textures and realistic PBR textures, as long as they meet Roblox's [[30 Official Roblox Docs/Art/Modeling/Texture specifications|texture specifications]].

> [!warning]
> The following information is **specific for applying makeup textures generic meshes**. For more information on reassigning textures for makeup assets, see [[30 Official Roblox Docs/Avatar/Makeup/Reassign textures|Reassign textures in Blender and Maya]].

## Blender

To assign Roblox-supported textures to your 3D model in Blender:

1. In the Outliner, select your mesh object.
1. In the Properties panel, navigate to the **Materials tab**.
1. Verify that your object has a Material assigned with the Surface set to `Principled BSDF`.

	 *(image in the full Top G Vault)*

1. If no material is assigned, click the + symbol to add a material.
   1. Click the New button. A new `Principled BSDF` material populates.

      *(image in the full Top G Vault)*

1. Navigate to the **Shading tab**.
1. With your mesh object selected, check the node graph. There may already be texture image nodes connected to the `Principled BSDF` node.
1. In the node graph area, add a texture image node with right-click ⟩ **Add** ⟩ **Texture** ⟩ **Image Texture**.

	 *(image in the full Top G Vault)*

1. In the new Image Texture node, click Open to open a file browser and insert your custom texture.

	 *(image in the full Top G Vault)*

   > [!info]
   > Alternatively to steps 7-8, you can **drag and drop** texture file from another window into the graph editor space.

1. After adding image texture nodes and assigning the appropriate files, drag the `Image Texture` sockets to the appropriate sockets in the `Principled BSDF` node:

	 *(image in the full Top G Vault)*

   - **Basic texture** or **PBR color/albedo**: connect `Color` to `Base Color`.
   - **Metallic texture**: connect `Color` to `Metallic`.
   - **Roughness texture**: connect `Color` to `Roughness`.
   - **Normal texture** images need to be added to a NormalMap node:
     1. Right-click in the graph-editor area and select **Add** ⟩ **Vector** ⟩ **Normal Map**.
     2. Connect Image Texture `Color` to NormalMap's `Color`.
     3. Connect NormalMap's `Normal` to PrincipledBSDF's `Normal` socket.

> [!success]
> After replacing your PBR textures, [[30 Official Roblox Docs/Art/Modeling/Export settings#Blender|export the entire model]] and follow instructions to [[30 Official Roblox Docs/Studio/Importer|import into Studio]]

## Maya

To assign Roblox-supported textures to your 3D model in Maya:

1. In the Status Line near the top of the default layout, click on the Hypershade icon.

	 *(image in the full Top G Vault)*

1. In the Create Window panel on the Hypershade popup, navigate to **Maya** ⟩ **Surface** and click **Standard Surface**. A surface node appears in the node editor.

	 *(image in the full Top G Vault)*

   1. If adding a normal map, navigate to **Maya** ⟩ **Utilities** and click **Bump 2d**. A node required for normal maps appears in the node editor.

      *(image in the full Top G Vault)*

1. Drag and drop your PBR textures to the graph network.

   *(image in the full Top G Vault)*

   1. If adding a normal map, select the Bump 2d node, and change to Tangent Space Normals.

      *(image in the full Top G Vault)*

1. Select your model and navigate to your material you intend to assign. Right-click and hold over the material and select **Assign Material to Selection**.

	 *(image in the full Top G Vault)*

> [!success]
> After replacing your PBR textures, [[30 Official Roblox Docs/Art/Modeling/Export settings#Maya|export the model]] and follow instructions to [[30 Official Roblox Docs/Studio/Importer|import into Studio]].

---
*Source: [Blender and Maya texture settings](https://create.roblox.com/docs/art/modeling/assign-textures) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
