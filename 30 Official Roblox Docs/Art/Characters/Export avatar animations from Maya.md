---
title: "Export avatar animations from Maya"
description: "Explains the process for exporting avatar animations from Maya."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/export-avatar-animations-from-maya"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the process for exporting avatar animations from Maya.*

**Avatar animations** are animations that you can create and assign to play for any avatar action, such as walking, swimming, or dancing. In addition to using the [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] or [[30 Official Roblox Docs/Animation/Animation capture|Animation Capture]] tools within Studio, you can create avatar animations through third-party modeling and animation tools like [Maya](https://www.autodesk.com/products/maya/overview), then import your avatar animations directly into Studio to apply to any avatar with Roblox. By using this guide as a checklist of the specific settings your rig and animation must meet for the export process, you can ensure that your animations import successfully.

*(image in the full Top G Vault)*

*Mannequin reference*

[Video: Moving-Rig.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/exporting-avatar-animations-from-maya/Moving-Rig.mp4)

*Example walking animation*

> [!info]
> This guide uses a downloadable [R15-Mannequin-Rig.ma](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/exporting-avatar-animations-from-maya/R15-Mannequin-Rig.ma) file that contains a mannequin with a [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|standard R15 rig]] that you can use as a reference to create and export animations. If you choose to animate on your own standard R15 rig, the same rig configuration and export settings apply.

## Configure the rig

Before you export your avatar animation from Maya, you must configure your rig to be compatible with Studio's import requirements, including making sure that the rig follows a specific hierarchy and naming conventions so that Studio is able to recognize the file as an avatar animation, and that the rig's translation channel is muted so that the root node doesn't move with the animation.

### Hierarchy and naming conventions

Studio requires a specific hierarchy and naming conventions for a humanoid rig's internal joint structure so that it can recognize what you're importing as an avatar animation. If you aren't using the downloadable standard R15 rig to create your animations, make sure your rig uses the following joint hierarchy and naming convention exactly as it is:

- Root
- HumanoidRootPart
- LowerTorso
- UpperTorso
- Head (representing the base of the neck)
- LeftUpperArm
- LeftLowerArm
- LeftHand
- RightUpperArm
- RightLowerArm
- RightHand
- LeftUpperLeg
- LeftLowerLeg
- LeftFoot
- RightUpperLeg
- RightLowerLeg
- RightFoot

### Mute the translation channel

Roblox avatar animations cannot move a character when they play; instead, avatar animations animate rigs at their world position. If your avatar animation is a locomotion-type of animation where the root node moves in space, such as a character that moves forward as their walk animation plays, you must mute the rig's translation channel so that the animation plays without moving the rig on export.

To mute the translation channel:

1. Open the **Graph Editor**.

   1. In the menu bar, click **Windows**. A contextual menu displays.
   1. Hover over **Workspaces**, then click **Animation**. The **Graph Editor** displays.

      *(image in the full Top G Vault)*

1. Move the **Time Marker** to frame 0.

   *(image in the full Top G Vault)*

1. In the **Outliner**, select the root node. If you are using the reference file, this is **TSM3_root**.
1. In the **Channel Box**, right-click on the **Translate Z** value. A contextual menu displays.
1. Select **Mute Selected**. The Translate Z value's channel box color changes to orange to confirm that it's muted.

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

When you play the animation, the character's root node doesn't move in space anymore, and the character animates in place at the origin of the scene.

## Export the animation

Now that your rig animates in place and has a hierarchy and naming data that is compatible with Studio, you can export the animation into a `.fbx` format. Maya doesn't load this capability by default, so you need to enable an FBX plugin to gain the additional settings necessary to export the file in a format Studio can recognize.

To export your avatar animation from Maya:

1. Install the FBX plugin.

   1. In the menu bar, click **Windows**. A contextual menu displays.
   1. Hover over **Settings/Preferences**, then click **Plug-in Manager**. The **Plug-in Manager** window displays.

      *(image in the full Top G Vault)*

   1. In the search field, input **fbxmaya**. The **fbxmaya.mll** plugin displays.
   1. Enable the **Loaded** and **Auto load** options.

      *(image in the full Top G Vault)*

1. In the menu bar, click **File**. A contextual menu displays.
1. Select **Export All**. The **Export All** window displays.

   *(image in the full Top G Vault)*

1. At the bottom of the window,

   1. In the **File name** field, input a name for your avatar animation.
   1. Click the **Files of Type** dropdown menu, then select **FBX export**. The **Options pane** updates its settings.

1. In the **Options** pane, click the **Animation** dropdown for additional animation settings, then in the **Bake Animation** section,

   1. Enable **Bake Animation**.
   1. Verify that the **Start** and **End** fields correlate to the frames you want to export for your animation loop.
   1. Set **Step** to **1**.

      *(image in the full Top G Vault)*

1. Click the **Advanced Options** dropdown for additional export settings, then in the **FBX File Format** section,

   1. Set **Type** to **Binary**.
   1. If required, set **Version** to **FBX 2020**.

      *(image in the full Top G Vault)*

1. In the bottom right corner, click the **Export All** button. After a moment, the avatar animation `.fbx` file displays in your file browser.

## Test the animation in Studio

Once you have your avatar animation `.fbx` file, you can test it within Studio to make sure that the animation plays without any errors.

To test the animation in Studio:

1. Open a pre-built character rig.

   1. From the toolbar's **Avatar** tab, click **Character**.
   1. Select any rig you want to use as a test. The rig displays within the viewport.

1. Connect the rig to the **Animation Editor**.

   1. From the toolbar's **Avatar** tab, click **Clip Editor**. The [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] window displays.
   1. In the viewport, click your rig. A dialog displays in the editor.
   1. In the **Animation Name** field, enter a new animation name, then click the **Create** button. The editor window displays the media and playback controls, timeline, and track list.

1. Import your avatar animation into the rig.

   1. Navigate to the **Media and Playback Controls** and click the **⋯** button. A contextual menu displays.
   1. Hover over **Import**, then select **From FBX Animation**. A file browser displays.

      *(image in the full Top G Vault)*

   1. Select the FBX animation you just exported from Maya, then click **Open**. The animation's keyframes load into the **Animation Editor**.

1. Navigate to the **Media and Playback Controls** and click the **Play button** to play the avatar animation.

---
*Source: [Export avatar animations from Maya](https://create.roblox.com/docs/art/characters/export-avatar-animations-from-maya) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
