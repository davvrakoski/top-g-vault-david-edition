---
title: "RollOffMode"
description: "How `Sounds` parented to a `BasePart` or `Attachment` attenuate (fade out) as the distance between the listener and the parent increases."
api_type: enum
aliases: ["Enum.RollOffMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RollOffMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*How [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] attenuate (fade out) as the distance between the listener and the parent increases.*

## Description

Enum which determines how [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] attenuate (fade out) as the distance between the listener and the parent increases.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Inverse` | 0 | Volume attenuates from [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|Sound.RollOffMinDistance]] in an inverse manner, mirroring how sounds attenuate in the real world. This is done through [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|Sound.RollOffMinDistance]]/`distance`, where `distance` is the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Magnitude\|Vector3.Magnitude]] between the audio source and the audio listener. |
| `Linear` | 1 | Volume attenuates between [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|Sound.RollOffMinDistance]] and [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|Sound.RollOffMaxDistance]] with a linear relationship. This is done through ([[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|Sound.RollOffMaxDistance]]/`distance`)/([[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|Sound.RollOffMaxDistance]]-[[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|Sound.RollOffMinDistance]]), where `distance` is the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Magnitude\|Vector3.Magnitude]] between the audio source and the audio listener. |
| `LinearSquare` | 2 | Volume attenuates between [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|Sound.RollOffMinDistance]] and [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|Sound.RollOffMaxDistance]] with a linear squared relationship. This is done through squaring `Linear`. |
| `InverseTapered` | 3 | A hybrid model which follows the `Inverse` model when close to [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|Sound.RollOffMinDistance]] and the `LinearSquare` model when close to [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|Sound.RollOffMaxDistance]]. This is done by taking the lesser of `Inverse` and `LinearSquare`. |

---
*Source: [RollOffMode](https://create.roblox.com/docs/reference/engine/enums/RollOffMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
