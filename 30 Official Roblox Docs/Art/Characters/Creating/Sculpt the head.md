---
title: "Sculpt the head"
description: "Use Blender's sculpting tools to make unique changes to the shape of your character."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/creating/sculpting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use Blender's sculpting tools to make unique changes to the shape of your character.*

After reviewing the modeling best practices and sculpting tips, you can begin sculpting your avatar character body. This tutorial demonstrates sculpting changes to the [RoundMale template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/RoundMale.zip), creating a goblin-like character.

The sculpting instructions utilize the following Sculpting tools:

- **Grab** - Selects and pulls a group of vertices.
- **Smooth** - Eliminates irregularities in the area of the brush's influence.
- **Flatten** - Averages out the vertices within the brush's influence on a common plane.
- **Elastic Deform** - Similar to Grab, but adds an organic stretch and elasticity to the neighboring vertices.

> [!info]
> You can use Blender's other sculpting tools, though it's important to use a tool that aligns with the [[30 Official Roblox Docs/Art/Characters/Creating/Modeling best practices#Non-destructive modeling|Non-Destructive Modeling]] concepts to preserve the vertices of the model.

To begin sculpting the head:

1. With the template project opened, hide the other Geo objects to isolate the head mesh.
1. Select the `Head_Geo` mesh object and switch to **Sculpting** mode.
1. At the top right of the viewport:
   1. Enable **X-Axis symmetry**.
   1. Enable **Wireframe** mode.

   [Video: Sculpting_01.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Sculpting_01.mp4)

1. Using the **Mask** tool, paint over the mouth and eyes where you do not want to sculpt unexpectedly.

   [Video: Sculpting_02.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Sculpting_02.mp4)

1. With the **Grab** and **Smooth** tools, make the following edits to your template head:

   1. Reshape the head, flattening and enlarging the top.

   1. Elongate the ears.

      1. Expand the surface near the ear to broaden the base
      1. Grab and extend each ear, ensuring it connects smoothly to the base and vertices remain proportionally spaced when possible.
      1. Try the **Flatten** tool to straighten and align a region.
      1. Try the **Elastic Deform** tool to stretch and pull multiple vertices.

         [Video: Sculpting_03.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Sculpting_03.mp4)

   1. Extend the bridge of the nose and expand the size of the brow.

      [Video: Sculpting_04.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Sculpting_04.mp4)

   1. Broaden the chin so it prominently protrudes.

      [Video: Sculpting_06.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Sculpting_06.mp4)

1. Perform a refinement pass to add final details, polish, and accentuate your main features, such as:
   - Adding details in the outer and inner ears
   - Adding more detail to chin and cheeks
   - Improving edge lines and spacing in areas with crowded vertices

     [Video: Sculpting_07.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Sculpting_07.mp4)

> [!success]
> For a comparison reference, you can download [this version of the tutorial project with sculpting completed](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/checkpoint/1_Goblin-sculpted.blend).

---
*Source: [Sculpt the head](https://create.roblox.com/docs/art/characters/creating/sculpting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
