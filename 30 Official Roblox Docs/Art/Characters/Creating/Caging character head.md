---
title: "Caging character head"
description: "Cage your avatar characters in Blender to support layerable accessories and clothing."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/creating/caging"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Cage your avatar characters in Blender to support layerable accessories and clothing.*

**Caging** is the process of updating the [[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies#Cage meshes|cage mesh component]] of your avatar character. To allow your character to correctly wear layered accessories, you must update the default template cage mesh object to match the sculpting changes you made to your custom character.

Since this tutorial only applies modeling changes to the head, the caging instructions below only apply to the **Head_OuterCage** object. If you make geometry changes to other parts of the character, you must also adjust those specific **\_OuterCage** objects to match your sculpting changes.

> [!danger]
> Do not delete any vertices or faces of the provided cages. Destructive modification of the cages can cause import issues and prevent the character model from equipping clothing and cosmetics.

*(image in the full Top G Vault)*

*Default head cage mesh no longer fits over sculpted head*

*(image in the full Top G Vault)*

*Head cage mesh after adjustment*

> [!info]
> If your character body shape incorporates many changes with different body parts, it may be more efficient to use the [Blender Cage Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/Body_Cage_Templates.zip). This Blender project file includes a helper full-body `std_cage_deformable` mesh to automatically apply vertex changes to the individual body-part cages at the same time.

To begin caging your character:

1. In the **Layout** tab, hide everything in the Outliner except the `Head_OuterCage` and the `Head_Geo` objects.

   *(image in the full Top G Vault)*

   [Video: Caging_01.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Caging_01.mp4)

1. With `Head_OuterCage` selected, navigate to **Object Properties** > **Viewport Display** and set the **Display As** to **Wire**.

   [Video: Caging_02.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Caging_02.mp4)

1. Switch to **Edit** mode, then enable **X-Axis symmetry** and **Topology Mirror** to ensure you are making symmetrical vertex changes to your cage.

   *(image in the full Top G Vault)*

1. Using the **Grab** tool (<kbd>G</kbd>), click and grab parts of the cage mesh and align it to fit tightly over the goblin head mesh. Keep the following in mind:

   - **Never delete any of the cage vertices.** Missing vertices can cause errors and issues with equipping clothing accessories.
   - If editing the base of your head cage, ensure that the base of the `Head` cage aligns with the top of the `UpperTorso` cage.
   - In different Select modes, hold <kbd>Shift</kbd> and click multiple vertices/edges/faces to select and edit the geometry.
   - You can verify a tight fit by grabbing vertices and moving them into the `Head_Geo` mesh to check where the meshes intersect and moving the cage vertices until the cage mesh just covers the head mesh.

      [Video: Caging_03.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Caging_03.mp4)

   - Toggle visibility on your different mesh objects to improve visibility and access to vertices.

1. After the wireframe is tightly fitted over the head mesh, set the **Display As** back to **Solid** and spot check and fix any intersecting vertices.

      [Video: Caging_04.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Caging_04.mp4)

Your final product should feature a cage mesh that sits directly over the head mesh without any of the `Head_Geo` geometry intersecting through the solid sections of the cage.

*(image in the full Top G Vault)*

> [!success]
> For a comparison reference, you can download [this version of the tutorial project with caging completed](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/checkpoint/3_Goblin-caged.blend).

---
*Source: [Caging character head](https://create.roblox.com/docs/art/characters/creating/caging) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
