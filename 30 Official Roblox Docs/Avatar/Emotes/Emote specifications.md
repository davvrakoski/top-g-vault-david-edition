---
title: "Emote specifications"
description: "Emote specifications list the specific technical requirements necessary for Studio compatibility."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/emotes/specifications"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Emote specifications list the specific technical requirements necessary for Studio compatibility.*

Emotes are made up of an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object with the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationId]] property set to the asset ID of your animation sequence. The [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object is the only component required to upload an emote to the Marketplace because animations do not require meshes, textures, or other 3D art components.

*(image in the full Top G Vault)*

*`Animation` object in the Explorer window.*

*(image in the full Top G Vault)*

*`AnimationId` property in the Properties window.*

## Animation requirements

Emotes must meet the following requirements before you upload them to the Marketplace, otherwise they may fail validation:

- Emotes must be less than 10 seconds.
- The joint root of the character cannot move too far from its starting position.
- Movement speed can't exceed a certain threshold to prevent teleportation abuse (measured from a frame-by-frame basis).
- Animation data must reference a [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|standard R15 rig]].

   > [!info]
   > Emotes for [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|advanced R15 rigs]] are currently in a closed beta. For more information, see the [DevForum announcement](https://devforum.roblox.com/t/upload-and-publish-for-emotes-with-additional-joints-is-now-open/4710932).

- Animation must be sourced from a `CurveAnimation`. For information on converting animation data, see [[30 Official Roblox Docs/Avatar/Emotes/Import emotes#Generate asset ID|Import emotes - Generate asset ID]].
- Animations must meet Roblox's [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards) and [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policies]].

---
*Source: [Emote specifications](https://create.roblox.com/docs/avatar/emotes/specifications) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
