---
title: "Texture painting"
description: "Covers the process of associating PBR textures to rigid accessories in Blender."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating-rigid/texturing"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Covers the process of associating PBR textures to rigid accessories in Blender.*

*(image in the full Top G Vault)*

**Texturing** is the process of applying a surface appearance to a 3D object. **Texture painting** is a technique that allows you to digitally brush your surface colors onto your 3D object, or onto the 2D image that represents the surface of your object.

This tutorial covers basic texture painting in Blender. Common workflows in the industry utilize additional third-party tools to create textures, especially high-definition PBR textures that mimic realistic lighting and texture properties.

> [!warning]
> While PBR textures are not required for accessories and is not covered in this tutorial, adding PBR textures can add extra visual flair and realism to elevate your creations. This typically requires additional software. <br> <br> For more information, see [[30 Official Roblox Docs/Art/Modeling/PBR textures|PBR textures]].

## UV projecting

[Video: UV-Projecting.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/UV-Projecting.mp4)

Use Blender's automatic UV Project feature to "unwrap" your 3D object onto a 2D plane. This allows you to associate a 2D image to the 3D surface of your object.

1. In **Edit** mode, press <kbd>A</kbd> to select your object.
1. In the top UV menu, select **Smart UV Project**.
1. Set **Island Margin** to `.02`.

## Add new material

[Video: Adding-New-Material.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Adding-New-Material.mp4)

Add a new material for Blender to associate this new texture, and assign it to a new blank 2D image.

1. In the **Properties** panel, select the **Materials** tab.
1. Select the **+ New** button. Additional material options display below.
1. In **Base Color**, select the dot, then select **Image Texture** from the contextual menu.
1. Under **Base Color**, select the **+ New** button.
   1. Name the texture image file. Using an affix like "\_TXT" can help organize your files later.
   1. Select the color and pick a color. This tutorial recommends using a metallic color for your metal borders to save time.

## Texture painting

Texture painting allows you to paint directly on the 3D object or the 2D mapping of the surface.

Since Blender automatically mapped the 2D atlas of the texture, it's not easy to tell what parts of the 2D image maps to the 3D object. First mark the sections of the 3D object you want to paint solid before completing your texture by painting the 2D map.

> [!info]
> There are many ways to texture within Blender. To keep this process simple, the tutorial used Blender's [Smart UV Project](https://docs.blender.org/manual/en/2.79/editors/uv_image/uv/editing/unwrapping/mapping_types.html), but there are many ways to manually create your 2D texture islands and organize your mesh and texture.

### Mark 3D object

[Video: Marking-3d-Object.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Marking-3d-Object.mp4)

Switch to Texture Paint mode and use the paintbrush to track the "wood" parts of the treasure chest.

1. In **Edit** mode, select your object, then switch to **Texture Paint** mode. A side-by-side panel displays with your 2D atlas on the left and the 3D object on the right.
1. Expand the **Tool** submenu in the top-right of either window.
1. Select your brush settings and mark the wooden areas of your chest.
   1. Use <kbd>Ctrl</kbd><kbd>Z</kbd>/<kbd>⌘</kbd><kbd>Z</kbd> to undo any accidental brushes on the metal border.
   1. Hold <kbd>F</kbd> and drag the mouse to adjust brush size.

### Paint 2D map

[Video: Painting-2d-Map.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Painting-2d-Map.mp4)

With all of the wooden areas of your chest marked, you can now quickly texture your 2D atlas. First adjust your brush settings to have a hard edge and then begin painting the 2D image.

1. In the left window, expand the **Tool** submenu in the top-right.
   1. Set the **Falloff** shape to the flattest icon to ensure the edges are sharp.
   1. Set the color or any other brush settings.
1. Begin coloring in each island of your texture. You can quickly preview the changes on your 3D object on the right side.
   1. Use <kbd>Ctrl</kbd><kbd>Z</kbd>/<kbd>⌘</kbd><kbd>Z</kbd> to undo any accidental brushes on the metal border.
   1. Hold <kbd>F</kbd> and drag the mouse to adjust brush size.
1. After you're done, navigate to **Image** > **Save** to save your image file.

> [!success]
> You've completed the texturing section of this tutorial. If desired, download a [reference version](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Chest-Texturing-Complete.blend) of this stage of the project for comparison.

---
*Source: [Texture painting](https://create.roblox.com/docs/art/accessories/creating-rigid/texturing) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
