---
title: "Calisthenics Tool"
description: "Calisthenics Tool is a Blender plugin that you can use to verify skinning quality of an asset."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/calisthenics-tool"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Calisthenics Tool is a Blender plugin that you can use to verify skinning quality of an asset.*

> [!warning]
> This tool is no longer in active development. You are free to use the tool for any purpose. The tool may be out of date or incompatible with modern Roblox assets.

The **Calisthenics Tool** is a supplemental [Blender](https://www.blender.org/) add-on that allows you to quickly test your asset through a set of animation cycles to verify your skinning data. At any point during the animation testing, you can pause and use Blender's skinning Tools, such as [Weight Painting brushes](https://docs.blender.org/manual/en/latest/sculpt_paint/weight_paint/introduction.html), to resolve any skinning imperfections.

Skinning your layered accessories and character bodies is a critical and often time-intensive process to create high quality assets that move and fit with different character bodies. Similar to the [[30 Official Roblox Docs/Art/Accessories/Layered Accessory Validation Tool|Layered Accessory Validation Tool]], the Calisthenics Tool can save you time when testing your character models after rigging and skinning.

> [!info]
> The Calisthenics Tool doesn't provide complete verification of all potential skinning issues. You must also ensure that your custom models meet Studio's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character body specifications]] and any applicable [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory specifications]] for the best results in your game.

[Video: Walking-Reference.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/calisthenic-tool/Walking-Reference.mp4)

*Walking Animation*

[Video: Running-Reference.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/calisthenic-tool/Running-Reference.mp4)

*Running Animation*

[Video: Movement-Reference.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/calisthenic-tool/Movement-Reference.mp4)

*Generic Movements*

## Installation

> [!info]
> The Calisthenics Tool plugin is designed for [Blender 3.0+](https://www.blender.org/download/). You can download and modify the tool for any use.

To install the Calisthenics Tool in Blender:

1. Download the [CalisthenicsTool.zip](https://github.com/Roblox/avatar/tree/main/Tools/CalisthenicsTool) and save the `.zip` file locally.
2. In Blender, navigate to **Edit** > **Preferences**.
   *(image in the full Top G Vault)*

3. In the left sidebar of the **Preferences** window, navigate to the **Add-Ons** section.
4. Click the **Install…** button. A file browser displays.
5. Select the `.zip` and click **Install Add-On**.
6. Using the search bar, search for "Calisthenics Tool" and select the add-on.
7. Enable the add-on by checking the box next to the add-on name.

   *(image in the full Top G Vault)*

8. Close the Preferences window. You can now access the Calisthenics Tool by expanding the tool sidebar in the Viewport.

*(image in the full Top G Vault)*

*Use the arrow on the side of the Viewport to open the sidebar.*

*(image in the full Top G Vault)*

*Access the Calisthenics Tool by selecting the tab in the sidebar tool menu.*

## Use the Calisthenics Tool

After installation, you can use the Calisthenics Tool whenever you want to test a [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|standard R15]] rigging armature with skinning data. With the Calisthenics Tool, you can check how a character body would move with generic animations, as well as attach reference rigid accessories to verify attachment during these movements. The tool also includes an option to automatically export your character, removing reference animation and accessory data.

You can try out the Calisthenics Tool using an [example character body model](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/calisthenic-tool/Fish-Character-No-FACS.fbx).

> [!info]
> For demonstration purposes, this reference model doesn't contain FACS data. If you require a reference with facial animation, you can download the same model with FACS data from our [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|reference models]].

### Test animations

When testing your character body model, first set the armature in the Calisthenics Tool then select one of the reference animations. It is important to visually verify your skinning quality using various movements and angles to ensure the best results for your model.

> [!warning]
> If you encounter any errors or warnings when setting armature or playing animations, verify that your model uses an appropriate bone hierarchy and naming convention outlined in Roblox's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|custom mesh requirements]].

To test animations:

1. Open a Blender project with an existing character body with a [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|standard R15 rig]], or import an appropriate character model `.fbx` using **File** > **Import** > **FBX (.fbx)**.

2. For easier visualization, hide non-rendered mesh objects, such as armature, cages, and attachments to better preview the reference animations.

   [Video: 1_Hide-Armature.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/calisthenic-tool/1_Hide-Armature.mp4)

3. Set which rig you want to test a reference animation on:
   1. In the add-on's **Armature** field, select the Eyedropper.
   2. In the Outliner, select the **Armature** object that contains your character's rig data.
4. Click on an animation cycle to preview, such as **Walk**, **Run**, **Move** or **Idle**.
5. Press **Stop Animation** to clear animation data.

   [Video: 2_Set-Armature-Test.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/calisthenic-tool/2_Set-Armature-Test.mp4)

6. If you notice any unexpected skinning deformations, pause on the frame and switch to **Weight Paint mode** or use Blender's other skinning tools to resolve. See [[30 Official Roblox Docs/Art/Modeling/Skin a humanoid model|Skin a humanoid model]] for additional instruction.

   [Video: 3_Fix-Skinning-Example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/calisthenic-tool/3_Fix-Skinning-Example.mp4)

### Test accessory attachments

You can add reference attachments to your character body model using the **Attach Test Accessory** buttons. These test accessories help preview how rigid accessories attach to your character and how they can move with your model. The tool includes two sets of rigid accessories to apply to your character.

*(image in the full Top G Vault)*

***Normal Size** - Loads normal accessory references.*

*(image in the full Top G Vault)*

***Slender Size** - Loads slender accessory references.*

To test accessories:

1. Use the following **Attach Test Accessory** buttons to add or remove sample accessories to your character's attachment points:
   - **Normal Size** - Adds normal scale test accessories.
   - **Slender Size** - Adds slender scale test accessories.
   - **Detach Test Accessories** - Removes any test accessories from your character.
2. If an accessory is not attaching at an expected location, reposition the associated **Attachment object** in your character's rigging armature.

### Export models

When you are ready to export your model, you can export your character body directly through the Calisthenics Tool. The tool automatically clears any of the test data and applies appropriate export settings.

> [!info]
> Using this tool to export models with [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic heads|facial animations]] may result in unexpected behavior because the stored FACS data can conflict with the tool's reference animations.

To export from the Calisthenics Tool:

1. In the **Export Path** field, set the export directory by clicking the folder icon and browsing to the appropriate file directory.
   *(image in the full Top G Vault)*

2. Click the **Export Model** button. The character model `.fbx` populates in the designated folder as `Character_Model_Export.fbx`.

> [!warning]
> If you are manually exporting your model with Blender's `.fbx` importer instead of the Calisthenics Tool, ensure the following before export:
> - Detach the Calisthenics Tool's test accessories.
> - Use the **Stop Animation** button to clear test animations from the timeline.
> - Return the model to the default pose with no additional pose data.
> - Verify your settings follow Roblox's [[30 Official Roblox Docs/Art/Modeling/Export settings|Blender export settings]].

---
*Source: [Calisthenics Tool](https://create.roblox.com/docs/art/modeling/calisthenics-tool) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
