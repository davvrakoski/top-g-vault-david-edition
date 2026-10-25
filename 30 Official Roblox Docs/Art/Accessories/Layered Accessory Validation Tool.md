---
title: "Layered Accessory Validation Tool"
description: "The Layered Accessory Validation Tool checks for common layered accessory creation issues in Blender or Maya before exporting."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/validation-tool"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Layered Accessory Validation Tool checks for common layered accessory creation issues in Blender or Maya before exporting.*

The **Layered Accessory Validation Tool** is a supplemental tool you can install in either [Blender](https://www.blender.org/download/releases/3-0/) or [Maya](https://www.autodesk.com/products/maya/overview) to help quickly identify and fix common issues with layered accessories before you [[30 Official Roblox Docs/Avatar/Layered Accessories/Export layered accessories|export]] them.

*(image in the full Top G Vault)*

*Blender Validation Tool*

*(image in the full Top G Vault)*

*Maya Validation Tool*

While this tool can save you time in the typical iteration process between your 3D modeling program and Studio, the tool doesn't provide comprehensive verification of all aspects of layered accessory assets. You must ensure your layered accessory model meets both the [[30 Official Roblox Docs/Art/Modeling/General specifications|general mesh requirements]] and Roblox-specific [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory specifications]] prior to importing it into Studio.

## Install the tool

There are two separate installation files and instructions for Blender and Maya.

> [!info]
> The Layered Accessory Validation Tool is designed for both [Blender 3.0](https://www.blender.org/download/releases/3-0/) and [Maya 2022](https://www.autodesk.com/products/maya/overview). You can download and modify the tool for any use.

### Blender

To install the Layered Accessory Validation Tool in Blender:

1. Download [ValidationTool_Blender.zip](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/accessories/validation-tool/ValidationTool_Blender.zip) and save the `.zip` file locally.
2. In Blender, navigate to **Edit** > **Preferences**.
3. In Preferences, go to the **Add-Ons** section on the left side-bar.

   *(image in the full Top G Vault)*

4. Click the **Install...** button. A file browser displays.
5. Select the downloaded `.zip` file and click **Install Add-On**.
6. In the **Add-Ons section**, find the **Validation Tool** and **enable the add-on**.

   *(image in the full Top G Vault)*

7. Return to your workspace and **expand the side toolbar** in the Viewport to access the add-on.

   *(image in the full Top G Vault)*

   *Sidebar indicator*

   *(image in the full Top G Vault)*

   *Expanded sidebar*

### Maya

Before you begin the process of installing the Layered Accessory Validation Tool in Maya, you must install [Python 3.0](https://www.python.org/downloads/) or higher. If you already have Python installed, you can proceed to installing the tool.

To install the Layered Accessory Validation Tool in Maya:

1. Install Python 3.0+ on your device.

   1. Download the appropriate installer from the official [Python website](https://www.python.org/downloads/).
   1. Open the installer and follow the installation instructions.

      - Enable **Add Python ### to PATH** before selecting **Install Now**.

   *(image in the full Top G Vault)*

1. Download [ValidationTool_Maya.zip](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/accessories/validation-tool/ValidationTool_Maya.zip) and unzip the content in a local directory.
1. Open the contents of the `.zip` file in a file browser.

   - If on Windows, **double-click** `install.bat`. This runs a batch script that enables you to quickly run the Validation Tool in Maya.
   - If on Mac, **right-click** the `install.command` file and select **Open With** > **Terminal**. This runs a terminal script that enables you to quickly run the Validation Tool in Maya.

   *(image in the full Top G Vault)*

   > [!warning]
   > If on Mac, you may need to adjust the read/write permissions for the `install.command` file to run successfully. This step requires administrator access.
   >
   > To allow the `install.command` file to have full read and write access:
   >
   > 1. Open **terminal** and use the `cd` command to navigate to the directory of the saved `install.command` file.
   > 1. Type the command `chmod 777 install.command` and press **Enter**. This should enable all read and write privileges for this file.

1. When prompted, type your Maya version and press **Enter**. For example, if using Maya 2020, input **2020** as your version.
   *(image in the full Top G Vault)*

1. When installation is successful, the following message displays:
   *(image in the full Top G Vault)*

1. Open Maya and navigate to **Windows** > **General Editors** > **Script Editor**.
   *(image in the full Top G Vault)*
1. When using the plugin for the first time, in the Script Editor, type `import ValidationTool` then press the **Play** button in the top bar of the Script Editor. The plugin UI displays.
   *(image in the full Top G Vault)*

   - When using the plugin after the initial launch, launch the plugin by typing `ValidationTool.validationTool()` and clicking the **Play** button.
   - Alternatively, you can set up a shortcut from the plugin UI after initial launch by clicking the **Create shortcut button on Maya shelf** button.

     *(image in the full Top G Vault)*

## Validate assets

With the plugin active and a layered accessory asset in your workspace, you can begin validating content. After the check, results with issues change to **red** (Blender) or **yellow** (Maya). You can resolve some failed checks by clicking the check button. See [[30 Official Roblox Docs/Art/Accessories/Layered Accessory Validation Tool#Checks and troubleshooting steps|Checks and Troubleshooting Steps]] for details on each validation check.

*(image in the full Top G Vault)*

*Checks without issues display as grey (Blender) or green (Maya).*

*(image in the full Top G Vault)*

*In this example, potential intersection issues are highlighted in the Viewport.*

To use the Layered Accessory Validation Tool on your asset:

1. **Select** the object in your scene.
2. Open the Validation Tool and click **Check Assets**. After a few moments, the UI updates and produces an output message.
3. Results with issues are highlighted with red or yellow. Some issues can be automatically corrected by clicking the highlighted button.

> [!info]
> The Layered Accessory Validation Tool only checks for common layered accessory creation issues. Ensure your layered accessory model meets both the [[30 Official Roblox Docs/Art/Modeling/General specifications|general mesh specifications]] and Roblox-specific [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory specifications]] before uploading to Studio.

## Checks and troubleshooting steps

Refer to the table below for details on the specific checks and troubleshooting steps:

****Layers****

Checks for extra layers in the scene. Automatic fix attempts to remove extra layers. <br><br>If the automatic fix fails, manually remove extra layers.

****Transforms****

Checks that geometry location, rotation, and scale are frozen (`0`,`0`,`0`). Automatic fix attempts to freeze the transforms. This may cause changes to your rig. <br><br>If the automatic fix fails, manually freeze your geometry.

****Unused Material****

Checks for any unused data in the scene, such as [orphan data](https://docs.blender.org/manual/en/latest/editors/outliner/interface.html?highlight=orphan) (Blender) or [construction history](https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2022/ENU/Maya-Basics/files/GUID-503E227B-EF49-4A78-B3CA-7EAC588017C9-htm.html) (Maya), or unused materials. Automatic fix attempts to remove extra data.  <br><br>If automatic fix fails, manually remove unnecessary data and objects.

****Keyframes****

Checks for any unnecessary keyframes. Automatic fix attempts to remove keyframes.<br><br> If automatic fix fails, manually remove keyframe data.

****Attachment Points****

Checks that attachment points are present and use the correct naming convention. Automatic fix attempts to parent any unexpected attachment points.

****Intersection****

Checks for any intersection between character geometry and the inner/outer cage mesh geometry. In Blender, clicking the button switches to **Edit Mode** and highlights vertices that are intersecting the inner or outer mesh. <br><br>Some edges, such as edges of the holes for the sleeves, neck and torso edges, may be highlighted by default behavior and can be ignored.

****Texture Format****

Checks that textures match texture requirements, such as resolution size. Users can also select an external image file. Refer to the output messages to manually resolve any texture related issues.

---
*Source: [Layered Accessory Validation Tool](https://create.roblox.com/docs/art/accessories/validation-tool) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
