---
title: "TextureMode"
description: "Describes how the texture of a `Trail` or `Beam` behaves."
api_type: enum
aliases: ["Enum.TextureMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TextureMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes how the texture of a [[30 Official Roblox Docs/API Reference/Classes/Trail|Trail]] or [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] behaves.*

## Description

Describes how the texture of a [[30 Official Roblox Docs/API Reference/Classes/Trail|Trail]] or [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] behaves.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Stretch` | 0 | For a [[30 Official Roblox Docs/API Reference/Classes/Trail\|Trail]], the texture will stretch out based on the lifetime of the trail, and shrink inwards if the trail's attachments stop moving.<br><br>For a [[30 Official Roblox Docs/API Reference/Classes/Beam\|Beam]], the texture will repeat [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength\|TextureLength]] times across the beam's overall length. See [[30 Official Roblox Docs/Effects/Beams#Texture length/mode\|here]] for details. |
| `Wrap` | 1 | For a [[30 Official Roblox Docs/API Reference/Classes/Trail\|Trail]], the texture will be tiled as the length of the trail changes, but the textures will remain stationary relative to their attachments.<br><br>For a [[30 Official Roblox Docs/API Reference/Classes/Beam\|Beam]], the texture repetitions will equal the beam's overall length (in studs) divided by its [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength\|TextureLength]]. See [[30 Official Roblox Docs/Effects/Beams#Texture length/mode\|here]] for details. |
| `Static` | 2 | For a [[30 Official Roblox Docs/API Reference/Classes/Trail\|Trail]], the texture will be rolled out as the attachments move, and they will remain in place until their lifetime is met. This setting is ideal for trail textures that should appear "stamped" where rendered, such as paw prints or tire tracks.<br><br>This value is not supported for [[30 Official Roblox Docs/API Reference/Classes/Beam\|Beam]] and therefore behaves identically to **Wrap**. |

---
*Source: [TextureMode](https://create.roblox.com/docs/reference/engine/enums/TextureMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
