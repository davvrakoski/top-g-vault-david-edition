---
title: "Reassign textures"
description: "To import custom makeup, replace the existing textures on the head template with your custom textures."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/makeup/reassign-textures"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*To import custom makeup, replace the existing textures on the head template with your custom textures.*

To import custom makeup textures, use Blender or Maya to reassign the existing textures on the reference template head to your custom texture images. After replacing the textures, export the entire head model, then [[30 Official Roblox Docs/Avatar/Makeup/Import into Studio|import]] it into Studio.

> [!warning]
> The following information is **specific** to applying makeup textures to Roblox's [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Template heads|template heads]] that already have PBR texture nodes assigned. For information on assigning textures from scratch, see [[30 Official Roblox Docs/Art/Modeling/Blender and Maya texture settings|Assign textures in Blender and Maya]].

## Blender

![](https://www.youtube.com/watch?v=B0y5fLlwkF0)

> [!info]
> The video presenter opts to clear all existing image links by navigating to **File** > **External Data** > **Unpack Resources** and selecting **Remove Pack**. This is a method to unassign all images instead of individually unassigning textures like step #5 in the following instructions.

To reassign textures in Blender:

1. Unzip and open the [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Template heads|Blender reference head file]].
2. Switch to the **Shading** tab.
3. In the Outliner, expand the Makeup collection and select the face region you intend to replace textures for.

    *(image in the full Top G Vault)*

4. In the node graph, select the texture image you intend to update, such as `Neutral_FaceDecal_ALB.png`
5. Click the **X** to remove the existing image assignment.

    *(image in the full Top G Vault)*

6. Click the folder icon to browse for a new image.

    *(image in the full Top G Vault)*

7. Repeat for all PBR textures that you intend to replace.
8. Delete any texture nodes you are not using.
9.  Verify your final node graph looks similar to the original reference with nothing unintentionally missing.
    *(image in the full Top G Vault)*

> [!info]
> After replacing your PBR textures, export the entire template file as a `.fbx` or `.gltf`. All 3D modeling [[30 Official Roblox Docs/Art/Modeling/Export settings|export requirements]] apply, but there are a few makeup-specific settings you must configure:
>
> 1. In the export file browser window, navigate to the **Include** section, then enable the **Custom Properties** toggle for makeup UV data transfer data purposes.
> 1. In the **Armature** section, enable **Only Deform Bones** to ensure your export file includes skinning data for eyebrows and eyelashes.
>
>     *(image in the full Top G Vault)*
>
>     *All necessary Blender export settings for makeup*

## Maya

![](https://www.youtube.com/watch?v=JaX5rcsStvQ)

To reassign textures in Blender:

1. Unzip and open the Maya [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Template heads|reference head file]].
2. In the Status Line near the top of the default layout, click on the Hypershade icon.

   *(image in the full Top G Vault)*

3. Move your mouse over the material's texture you intend to replace.
4. Click and hold right mouse-click and drag the selector to **Graph Network**.

   *(image in the full Top G Vault)*

5. In the newly displayed node graph, click on the Texture Node you intend to replace, such as `Neutral_Eyes_ALB.png`.
6. In the right Property Editor, navigate to Image Name and click the folder icon. A file browser displays.

  *(image in the full Top G Vault)*

1. Select the texture image file you want to use as a replacement.
2. Repeat for all PBR textures that you intend to replace.
3. Delete any texture nodes you are not using.
4.  Verify your final node graph looks similar to the original reference with nothing unintentionally missing.

  *(image in the full Top G Vault)*

> [!info]
> After replacing your PBR textures, export the entire template file as a `.fbx` or `.gltf`. All 3D modeling [[30 Official Roblox Docs/Art/Modeling/Export settings|export requirements]] apply, but there are a few makeup-specific settings you must configure:
>
> 1. In the export file browser window, navigate to the **Deformed Models** section.
> 1. Enable the **Skins** toggle to ensure your export file includes skinning data for eyebrows and eyelashes.
>
>     *(image in the full Top G Vault)*

---
*Source: [Reassign textures](https://create.roblox.com/docs/avatar/makeup/reassign-textures) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
