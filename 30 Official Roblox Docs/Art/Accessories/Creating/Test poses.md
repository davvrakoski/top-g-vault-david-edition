---
title: "Test poses"
description: "Test your poses after rigging a clothing item to ensure the clothes bend and deform correctly."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating/test-poses"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Test your poses after rigging a clothing item to ensure the clothes bend and deform correctly.*

With the clothing mesh parented to an armature, you can now perform quick tests to verify that your t-shirt deforms correctly.

> [!warning]
> If you see issues with the deformation of your clothing, you may need to correct the issue with weight-painting, a technique for manually applying skinning data to your meshes.
>
> This tutorial doesn't cover the process of weight-painting. For additional resources on manually weight painting and instructions on updating skinning data on meshes, see the following resources:
>
> - [[30 Official Roblox Docs/Art/Modeling/Skin a simple mesh|Skin a simple mesh]]
> - [[30 Official Roblox Docs/Art/Modeling/Skin a humanoid model|Skin a humanoid mesh]]

To test your t-shirt's movement:

1. With your armature active, navigate to the Properties Editor > **Armature Properties** tab.
1. In **Viewport Display** > **Show**, enable **In Front**. The **In Front** property enables you to easily see and access the bones for posing.

   *(image in the full Top G Vault)*

1. Switch to **Pose** mode, then click on various bones and press <kbd>R</kbd> to rotate and set a pose. After pressing <kbd>R</kbd>:

   1. Click to save the rotation.
   1. Right-click to cancel an unsaved rotation.
   1. If you have saved a rotation, reset your pose in the viewport with right-click and select **Clear User Transforms**.

1. Try various natural poses of your character to ensure that your clothing stretches and fits correctly. When you are done, do **not** delete the armature as it is a vital component for your t-shirt to layer correctly in Studio.

   [Video: Rigging_03.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating/Rigging_03.mp4)

> [!success]
> You've completed the rigging section of this tutorial. If desired, download a [reference sample](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/checkpoint/3_LongSleeve-Rigging-Complete.blend) of this project for comparison.

---
*Source: [Test poses](https://create.roblox.com/docs/art/accessories/creating/test-poses) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
