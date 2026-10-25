---
title: "Import emotes"
description: "Use the Animation Editor to import and convert animations into emotes."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/emotes/import"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the Animation Editor to import and convert animations into emotes.*

Studio's [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] lets you import animations into your projects. The following instructions detail how to import a `.fbx` file with animation data into Studio, convert it into a `CurveAnimation` object with an asset ID, then use that asset ID in [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] objects that you can use in your games, upload to the Marketplace, or share with other creators.

It's important to ensure your emote meets Roblox's [[30 Official Roblox Docs/Avatar/Emotes/Emote specifications|emote specifications]] to use or sell this asset as an avatar-ready emote, otherwise you can encounter errors at different points in the workflow.

## Import into Studio

To import your asset as an animation:

1. If you don't already have a character body with a [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|standard R15 rig]], add one to your project in Studio.

   1. In the **Avatar** tab, click the **Character** button.

      *(image in the full Top G Vault)*

   1. Set **Rig Type** to **R15**.
   1. Set **Body Shape** to either **Masculine** or **Feminine**.
   1. Select an avatar style from the provided options. An avatar character body with a standard rigging armature displays in the viewport.

1. Open the Animation Editor.

   1. In the **Avatar** tab, click the **Clip Editor** button.
   1. Select the character with a standard rigging armature. The Animation Editor updates accordingly.

1. In the **Animation Editor**, select **⋯** > **Import** > **From File** and select your `.fbx` file. Your animation populates in the Animation Editor's timeline.

   *(image in the full Top G Vault)*

## Generate asset ID

To generate an asset ID for your animation, you must first convert your animation data in the timeline into a `CurveAnimation` object. When you save the `CurveAnimation` object, Roblox creates a cloud-based asset ID to represent your emote.

> [!warning]
> The animation data for emotes must be a [[30 Official Roblox Docs/API Reference/Classes/CurveAnimation|CurveAnimation]] object instead of a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] object.

To convert an existing keyframe sequence to a `CurveAnimation`:

1. In the **Animation Editor**, select the **Curve Editor** button next to the timeline. A confirmation prompt displays.

   *(image in the full Top G Vault)*

1. Press **Confirm** to convert your keyframes into a `CurveAnimation` clip.

   *(image in the full Top G Vault)*

1. Back in the **Animation Editor**, select the **⋯** > **Publish to Roblox**. The **Asset Configuration** window displays.

   *(image in the full Top G Vault)*

1. Add a title and description, then click the **Save** button. The **Asset Configuration** window updates with a copyable asset ID.

   *(image in the full Top G Vault)*

## Create an Animation object

To submit an emote to the Marketplace, you must submit an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object with the `AnimationId` property set to the asset ID of your `CurveAnimation` object.

*(image in the full Top G Vault)*

*`Animation` object in the Explorer window.*

*(image in the full Top G Vault)*

*`AnimationId` property in the Properties window.*

To create an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object you can publish as an emote:

1. In the **Explorer** window, add a new `Animation` object.
1. In the **Properties** window, add the asset ID of your emote animation.

## Upload emote to Marketplace

When you have an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object with your emote animation asset ID set, you can upload the emote to the Marketplace. This process requires an [[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions#Upload fees|upload fee]] of **80 Robux**.

1. In the **Explorer** window, right-click the `Animation` object and select **Save to Roblox**. The **Asset Configuration** window displays.
1. Configure the following fields:
   1. Add a title and description.
   1. Set the **Content Type** to **Avatar Item**.
   1. Set the **Asset Category** to **Emote**.
1. Click the **Submit** button to upload your asset for moderation.

For more information on the upload and publishing process, see [[30 Official Roblox Docs/Marketplace/Publish to Marketplace#Upload an asset|Publish to Marketplace]].

---
*Source: [Import emotes](https://create.roblox.com/docs/avatar/emotes/import) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
