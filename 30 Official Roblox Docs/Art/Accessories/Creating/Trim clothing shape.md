---
title: "Trim clothing shape"
description: "Create the general shape of your clothing item by removing unnecessary sections of your duplicated mesh."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating/trimming"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Create the general shape of your clothing item by removing unnecessary sections of your duplicated mesh.*

With a clean mesh object to work with, cut the basic shape of the type of clothing item you intend to create and prepare the mesh for additional sculpting detail. In this tutorial, you create a long-sleeve shirt shape by removing the leg, arm, and head sections, smoothing out the mesh to create a flat canvas, and repositioning the mesh onto your temporary mannequin.

*(image in the full Top G Vault)*

*Long-sleeve trimming of the full-body mesh.*

## Trim clothing shape

Create the general shape of your t-shirt by trimming sections of your duplicated mannequin mesh.

To trim your clothing shape:

1. Select **LongSleeve**, then switch to **Edit** mode.
1. In the top right corner of the viewport, enable **Wireframe** mode.
1. Click and drag over parts of the mesh that you do not want to include in your shirt, then press <kbd>X</kbd> and select **Vertices** from the contextual menu to delete these sections of your mesh.
1. Repeat until you reach your desired clothing shape.

   [Video: Modeling_02.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating/Modeling_02.mp4)

## Add and smooth vertices

With the basic shape created, subdivide the surface of your t-shirt to add vertices and smooth out the mesh. This process removes the grid-like surface and allows you to apply more complex sculpting detail later.

*(image in the full Top G Vault)*

*Before applying Subdivision modifier and Shade Smooth*

*(image in the full Top G Vault)*

*After applying Subdivision modifier and Shade Smooth*

To add and smooth your vertices:

1. Switch to **Object** mode.
1. With **LongSleeve** active, navigate to the **Modifier Properties** tab in the Properties Editor.
1. Select **Add Modifier** > **Subdivision Surface**, then click the **Apply** button with the default settings.
1. In the viewport, right-click the object and select **Shade Smooth** from the contextual menu to eliminate the creases on your t-shirt.

   [Video: Modeling_03.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating/Modeling_03.mp4)

## Scale and position

With your base clothing shape created, the next steps are to scale out the t-shirt and reposition it on top of the mannequin.

*(image in the full Top G Vault)*

*Clothing mesh should fit over mannequin after applying a reposition and scale*

To set up and scale your clothing to your mannequin:

1. Switch to **Object** mode, then unhide one of your cage meshes.
1. Using the filter dropdown, enable the **Selectable** toggle, then set your body mesh to unselectable to prevent accidental edits to your mannequin.
1. With **LongSleeve** active, lightly scale and position your asset to rest over the mannequin.
   1. Press <kbd>S</kbd> and use your mouse to scale. In most cases, the scaling should be a small change.
   1. Press <kbd>G</kbd> and click to grab your shirt. Make sure the shirt rests loosely over the mannequin; it does not need to fit perfectly at this point.

   [Video: Modeling_04.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating/Modeling_04.mp4)

---
*Source: [Trim clothing shape](https://create.roblox.com/docs/art/accessories/creating/trimming) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
