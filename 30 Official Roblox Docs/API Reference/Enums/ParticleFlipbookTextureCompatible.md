---
title: "ParticleFlipbookTextureCompatible"
description: "Indicates whether a `ParticleEmitter`'s flipbook texture dimensions are compatible with the selected flipbook layout."
api_type: enum
aliases: ["Enum.ParticleFlipbookTextureCompatible"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ParticleFlipbookTextureCompatible"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates whether a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]]'s flipbook texture dimensions are compatible with the selected flipbook layout.*

## Description

Describes runtime compatibility between a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]]'s texture and its [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookLayout|FlipbookLayout]]. Flipbook playback requires a 1024×1024 texture; if the texture does not meet this requirement, the engine sets [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookTextureCompatible|Enum.ParticleFlipbookTextureCompatible.NotCompatible]] and disables flipbook playback. The value begins as [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookTextureCompatible|Enum.ParticleFlipbookTextureCompatible.Unknown]] and transitions to [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookTextureCompatible|Enum.ParticleFlipbookTextureCompatible.Compatible]] or [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookTextureCompatible|Enum.ParticleFlipbookTextureCompatible.NotCompatible]] once texture dimensions are resolved. Set automatically by the engine; not writable from scripts.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `NotCompatible` | 0 | The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter\|ParticleEmitter]]'s flipbook texture dimensions are incompatible with the active flipbook layout (the texture must be 1024×1024); flipbook playback is suppressed. |
| `Compatible` | 1 | The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter\|ParticleEmitter]]'s flipbook texture dimensions are confirmed compatible with the active flipbook layout; flipbook playback proceeds normally. |
| `Unknown` | 2 | Compatibility has not yet been determined; this is the initial state before the engine resolves the flipbook texture dimensions. |

---
*Source: [ParticleFlipbookTextureCompatible](https://create.roblox.com/docs/reference/engine/enums/ParticleFlipbookTextureCompatible) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
