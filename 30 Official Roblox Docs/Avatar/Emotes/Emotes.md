---
title: "Emotes"
description: "Emotes are full body animations that an avatar character can perform to communicate and celebrate with others in games."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/emotes"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Emotes are full body animations that an avatar character can perform to communicate and celebrate with others in games.*

**Emotes** are full body animations that an avatar character can perform to communicate and celebrate with others in a game, such as gestures, reactions, and dances. While Roblox provides a set of default emotes for each avatar on the platform, you can create and sell your own emotes on the Marketplace or within games.

> [!info]
> Game developers can access and modify emotes within their games. For more information on this process, see [[30 Official Roblox Docs/Characters/Emotes|character emotes]].

## Components

Emotes are made up of an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object with the unique [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|AnimationId]] property set to the asset ID of your animation sequence.

*(image in the full Top G Vault)*

*`Animation` object in the Explorer window.*

*(image in the full Top G Vault)*

*`AnimationId` property in the Properties window.*

All emotes must meet Roblox's technical [[30 Official Roblox Docs/Avatar/Emotes/Emote specifications|emote specifications]], [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards), and [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policies]].

## Create emotes

There are several ways you can create emotes using either Studio or a third-party animation tool. Review the following table for specific workflows and resources:

| Animation workflow | Description |
| --- | --- |
| Animation Capture | Use Studio's [[30 Official Roblox Docs/Animation/Animation capture#Body\|Animation Capture]] tool to convert a full body video into a keyframe sequence for your emote. |
| Manual animation with Animation Editor | Use Studio's [[30 Official Roblox Docs/Animation/Animation Editor\|Animation Editor]] to manually animate a character rig. For an in-depth tutorial on creating a character animation, see [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Animation/Create character animations\|Create character animations]]. |
| Third-party plug-ins | Use a third-party animation plugin, such as [Moon Animator](https://create.roblox.com/store/asset/4725618216/Moon-Animator-2), to generate your animation. |

To convert your keyframe sequence into an animation that you can upload to the Marketplace, see [[30 Official Roblox Docs/Avatar/Emotes/Import emotes#Generate asset ID|Import emotes - Generate asset ID]].

---
*Source: [Emotes](https://create.roblox.com/docs/avatar/emotes) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
