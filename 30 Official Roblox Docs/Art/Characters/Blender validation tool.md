---
title: "Blender validation tool"
description: "The Avatar Validation Tool checks for common character model issues in Blender."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/validation-tool"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Avatar Validation Tool checks for common character model issues in Blender.*

> [!warning]
> This tool is no longer in active development. You are free to use the tool for any purpose. The tool may be out of date or incompatible with modern Roblox assets.

The **Avatar Validation Tool** is a supplemental Blender add-on you can use to quickly identify common issues with your character model. This tool checks that your model meets most of Roblox's avatar [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|technical specifications]] and, when possible, attempts to automatically resolve them.

*(image in the full Top G Vault)*

This tool can save you time by checking for common validation specifications before you export your model, but it doesn't provide a comprehensive verification of all aspects of your character model. You should always continually test your character model, including testing your characters [[30 Official Roblox Docs/Avatar/Character Bodies/Studio tests for character bodies|in Studio]] and verifying on your own if your model meets Roblox's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character body specifications]].

## Install

> [!warning]
> The Validation Tool plugin is compatible with Blender 3.5.1+. You may experience unexpected behavior if using earlier versions of Blender.

To install the Validation Tool in Blender:

1. Download [ValidationTool_Blender.zip](https://github.com/Roblox/avatar/tree/main/Tools/ClothingValidationTool) and save the .zip file locally. Do not open the .zip file.
2. In Blender, navigate to **Edit** > **Preferences**.
3. In Preferences, go to the **Add-Ons** section on the left sidebar.

   *(image in the full Top G Vault)*

4. Click the **Install...** button. A file browser displays.
5. Select the downloaded .zip file and click **Install Add-On**.
6. In the Add-Ons section, find the Validation Tool and **enable** the add-on.

   *(image in the full Top G Vault)*

7. Return to your workspace and expand the side toolbar in the Viewport to access the add-on.

*(image in the full Top G Vault)*

*Sidebar indicator*

*(image in the full Top G Vault)*

*Expanded sidebar*

## Validate

After installing the plugin, you can begin validating your character models. When validating, results with issues display as red. In some cases, you can apply an automatic fix to checks that have issues. See [[30 Official Roblox Docs/Art/Characters/Blender validation tool#Checks and troubleshooting|Checks and Troubleshooting Steps]] for details on each validation check.

To use the validation tool on your asset:

1. In the Target Armature field, select the **eyedropper**.
2. With the eyedropper active, select your character's **armature object**. This object is often named Joints or Armature.
3. Select **Run All Checks** to go through each individual check. Alternatively, you can click individual buttons to run a specific check.
4. Checks that detect issues display as red and an error output displays at the bottom of the tool.

   [Video: Validation-Tool-Test.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/Validation-Tool-Test.mp4)

> [!info]
> This validation tool only checks for common validation issues. You should always continually test your character model, including testing your characters [[30 Official Roblox Docs/Avatar/Character Bodies/Studio tests for character bodies|in Studio]] and verifying on your own if your model meets Roblox's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character body specifications]].

## Checks and troubleshooting

Each button on the validation tool performs a different check against the expected [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character specifications]]. The following are the specific types of verification each check performs, as well as general troubleshooting steps to resolve discovered issues:

****Layers****

Checks for extra layers in the scene. Automatic fix attempts to remove extra layers. <br><br>If the automatic fix fails, manually remove extra layers.

****Transforms****

Checks that geometry location, rotation, and scale are frozen (`0`,`0`,`0`). Automatic fix button attempts to freeze the transforms. This may cause changes to your rig. <br><br>If the automatic fix fails, manually freeze your geometry.

****UV****

Checks if the body Geometry UVs are within `0`-`1`. You must resolve issues manually by setting  your body object UVs within a `0`-`1` range.

****Cage UV Modifications****

Checks if cage object UVs have incorrect modifications. Automatic fix attempts to resolve UV coordinates.  <br><br>If automatic fix fails, you may want to use a new template cage.

****Asset Size****

Checks if the character total size and individual parts are within expected bounds. You must resolve issues manually by resizing your character model or individual parts.

****Unused Data****

Checks for any unused data in the scene, such as orphan data, or unused materials. Automatic fix attempts to remove extra data.  <br><br>If automatic fix fails, manually remove unnecessary data and objects.

****Keyframes****

Checks for any unnecessary keyframes. Keyframes related to facial expressions are expected and ignored. Automatic fix attempts to remove keyframes associated with non-face objects. <br><br> If automatic fix fails, manually remove keyframe data from non-face objects. Do not delete keyframes that also contain facial data.

****Attachment Points****

Checks that attachment points are parented to the armature and use the correct naming convention. Automatic fix attempts to parent any unexpected attachment points.

****Joint Positions****

Checks for the following: • Root and HumanoidRootNode bones exist<br>• Root bone is at `0`,`0`,`0` world space<br>• Bones with Left/Right naming conventions are on correct axes.<br> Refer to the output messages to manually resolve joint position issues.

****FACS Data****

Checks for the following FACs data: • `Neutral Pose` exists as a mapped pose<br>• Mapped Custom Properties under the Head_Geo exists<br>• Property name and values correctly set<br>• Corrective poses must include existing base poses<br>• Corrective poses do not use more than 3 base poses Refer to the output messages to manually resolve FACS data issues.<br>

****Head Joint Names****

Checks for duplicate head bone names, including duplicates with Blender's duplicate affixes .001, .002, .003, and such. Refer to the output messages to manually resolve face joint names.

****Intersection****

Checks for any intersection between character geometry and cage mesh geometry. The tool switches to Edit mode and highlights areas where potential intersections are detected.

****Polygon Data****

Checks for common polygon issues:• Meshes are watertight<br>• Meshes are within polycount budgets<br>• Meshes don't use N-Gons Meshes<br>• Meshes are non-manifold<br>• Meshes don't have vertex color information<br><br><br>Refer to the output messages to manually resolve any polygon data issues.

****Texture Format****

Checks that textures match texture requirements, such as resolution size. Users can also select an external image file. Refer to the output messages to manually resolve any texture related issues.

---
*Source: [Blender validation tool](https://create.roblox.com/docs/art/characters/validation-tool) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
