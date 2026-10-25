---
title: "Export and Import Animations"
description: "Part of the Roblox Build It, Play It Challenge - Island of Move. Export animations to share with other developers."
area: "30 Official Roblox Docs"
cluster: "Education"
source: "https://create.roblox.com/docs/education/build-it-play-it-island-of-move/sharing-animations"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Part of the Roblox Build It, Play It Challenge - Island of Move. Export animations to share with other developers.*

*(image in the full Top G Vault)*

Share animations with friends and fellow developers by exporting and importing them through Studio.

> [!info] Animation Permission Changes
> You can now share animations with friends, groups, and games without re-uploading them. For more information, see [Asset privacy](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/privacy.md).

## Export animations

Make sure to save your animation before exporting it.

1. In **Explorer**, expand the rig that you were animating with. It's likely that rig is named **_Dummy_**.

   *(image in the full Top G Vault)*

2. Expand **_AnimSaves_**. Then, find the name of the animation to share.

   *(image in the full Top G Vault)*

3. Right-click the animation name and select **Save to File**. This saves the animation as an `.RBXM` file on your computer, which can be shared. You can export more than one animation at a time.

## Import animations

Animations saved in an `.RBXM` file can be imported into different rigs by yourself or by friends in any Roblox file.

1. Select the rig you want to use. In the **Explorer**, select **_AnimSaves_**.

   > [!warning] Check The Rig Has Previous Animations
   > If the rig doesn't have any previous animations, it won't have an AnimSaves folder. To make that folder, in the rig, create and save a new animation. Saving an animation automatically creates the needed folder.

2. Right-click on **_AnimSaves_** and select **Insert From File**. Then, pick the `.RBXM` file with the exported animation.

3. To load the animation, in the Animation Editor (see the Plugins tab), click on **⋯**.

   *(image in the full Top G Vault)*

   Next, in the drop-down menu, go to **Load** and select the name of the `.RBXM` file just imported.

### Troubleshooting tips

**Issue**: Animation Not Loading
In the original `.RBXM` file, make sure there is a saved [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] object.

*(image in the full Top G Vault)*

If only a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] object was imported, try re-exporting the original animation and importing again. Make sure to export the named [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] and not just a keyframe object.

---
*Source: [Export and Import Animations](https://create.roblox.com/docs/education/build-it-play-it-island-of-move/sharing-animations) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
