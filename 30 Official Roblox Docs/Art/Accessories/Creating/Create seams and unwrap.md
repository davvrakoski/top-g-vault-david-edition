---
title: "Create seams and unwrap"
description: "Use Blender's seams and unwrapping functionality to project your 3D surface on a 2D texture plane."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating/unwrapping"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use Blender's seams and unwrapping functionality to project your 3D surface on a 2D texture plane.*

**Texturing** is the process of customizing the color, tone, and shading of your model's surface. Custom meshes and models use a 2D image, known as a texture map, to project various surface appearance elements onto your 3D object. In this tutorial, apply a complete color to your shirt and add a smaller design using Blender's Texture Paint mode.

> [!warning]
> This tutorial does not cover [[30 Official Roblox Docs/Art/Modeling/PBR textures|PBR textures]], which are advanced textures that can replicate real-world texture properties, like reflectivity and surface roughness, and are recommended to give your clothing items an extra dimension of creativity and visual pop. PBR textures often require a third-party application such as Substance Painter.

*(image in the full Top G Vault)*

*Clothing mesh after sculpting*

*(image in the full Top G Vault)*

*Clothing mesh after texturing*

The next three texturing sections cover the following processes:

1. Creating seams in your mesh to define how Blender unwraps your 3D object.
1. Unwrapping the UV of your model to create a distinct front and back 2D surface to apply textures on based on your seams.
1. Creating a new texture image to save as your 2D map.
1. Painting a custom texture using Blender's Texture Paint tools.

## Create seams

To begin texturing, you must first generate a **UV map**, or 2D projection, of the surface of your mesh. To set up this UV map, you tell Blender which edges of your mesh to use as seams when creating the projection.

To create seams that naturally separate the front and back of the shirt:

1. With **LongSleeve** active, switch to **Edit** mode.
1. Press <kbd>2</kbd> to switch to edge selection.
1. Hold <kbd>Alt</kbd> and click on the center vertical edges of your shirt. The detected edge highlights.
1. Whenever a complete edge is selected, right-click in the viewport and select **Make Seam** from the contextual menu. The edge highlights to indicate the seam in your model.
1. Repeat to create a continuous seam across your mesh.

   [Video: Texturing_01.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating/Texturing_01.mp4)

## UV unwrap

After applying the seams, Blender now knows how to "unwrap" the mesh surface onto a 2D plane as a front and back surface.

*(image in the full Top G Vault)*

*UV-mapping of your 3D clothing mesh.*

To UV Unwrap your object by your selected seams:

1. While still in **Edit** mode, press <kbd>A</kbd> to highlight all vertices.
1. At the top of the viewport, select **UV** > **Unwrap**.
1. Switch to **Texture Paint** mode. Your UVs display on the left window when your t-shirt is active.

   [Video: Texturing_02.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating/Texturing_02.mp4)

---
*Source: [Create seams and unwrap](https://create.roblox.com/docs/art/accessories/creating/unwrapping) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
