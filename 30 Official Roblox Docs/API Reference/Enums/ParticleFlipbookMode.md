---
title: "ParticleFlipbookMode"
description: "Determines the type of the flipbook animation."
api_type: enum
aliases: ["Enum.ParticleFlipbookMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ParticleFlipbookMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the type of the flipbook animation.*

## Description

Determines the type of the flipbook animation.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Loop` | 0 | Continuously play through all frames, starting back at the first frame after playing the last. |
| `OneShot` | 1 | Play through the animation only once across the particle's lifetime. With this setting, the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookFramerate\|ParticleEmitter.FlipbookFramerate]] property doesn't apply; instead, the framerate is determined by the particle's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime\|ParticleEmitter.Lifetime]] divided evenly by the number of frames in the animation. **OneShot** animations are useful for clear non-repeating animations, such as an explosion that creates a puff of smoke and then fades out. |
| `PingPong` | 2 | Play from the first to the last frame, then in reverse from the last to the first, repeating throughout the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime\|ParticleEmitter.Lifetime]] of the particle. |
| `Random` | 3 | Play the frames in a random order, blending/crossfading from one frame to the next. This can be useful for organic particle textures at low framerates, such as stars slowly twinkling between subtly different shapes. |

---
*Source: [ParticleFlipbookMode](https://create.roblox.com/docs/reference/engine/enums/ParticleFlipbookMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
