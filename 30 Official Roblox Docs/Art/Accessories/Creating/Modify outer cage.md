---
title: "Modify outer cage"
description: "Modify the outer cage to fit tightly over your clothing item."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating/modify-cage"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Modify the outer cage to fit tightly over your clothing item.*

With your project environment set, you can now adjust your outer cage using sculpting and editing tools. Set your outer cage as close as possible to your t-shirt mesh to ensure the best deformation and layering effects.

> [!danger]
> **Do not delete any vertices or faces of the provided cages.** Destructive modification of the cages can cause import issues and prevent the clothing from importing and displaying as expected.

To modify your outer cage:

1. With **LongSleeve_OuterCage** still active, switch to **Sculpt** mode.
1. In the top right corner of the viewport, enable **X-Axis symmetry** to perform symmetrical edits.
1. Select the **Inflate** tool, then press <kbd>F</kbd> to adjust the radius of the brush.
1. Starting with one side, expand the outer cage to fit precisely over the mesh
1. After expanding the cage mesh over a majority of the mesh, disable **X-Axis symmetry** and address individual spots. Keep the following in mind:
   - Your outer cage should always cover your clothing mesh.
   - Your outer cage should be as close to the clothing mesh as possible to ensure accurate layering.
   - For small angular areas, like the armpit, you may need to switch back to **Edit Mode** and grab the individual vertices to avoid crowding your cage mesh vertices.

      [Video: Caging_02.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating/Caging_02.mp4)

1. Perform additional passes in **Edit** mode with wireframe enabled to ensure your outer cage vertices fit as closely as possible. A tight fit ensures that your clothing item layers as accurately as possible.

   [Video: Caging_03.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating/Caging_03.mp4)

> [!success]
> You've completed the caging section of this tutorial. If desired, download a [reference sample](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/checkpoint/4_LongSleeve-Caging-Complete.blend) of this project for comparison before exporting your project and bringing it into Studio.

---
*Source: [Modify outer cage](https://create.roblox.com/docs/art/accessories/creating/modify-cage) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
