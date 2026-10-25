---
title: "DigitsRigDescriptionSide"
description: "Specifies which hand side a `DigitsRigDescription` instance is assigned to."
api_type: enum
aliases: ["Enum.DigitsRigDescriptionSide"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DigitsRigDescriptionSide"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies which hand side a [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] instance is assigned to.*

## Description

Identifies the hand that a [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] maps to within a character rig. The animation system routes finger-joint data by this value; an instance whose [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Side|DigitsRigDescription.Side]] is [[30 Official Roblox Docs/API Reference/Enums/DigitsRigDescriptionSide|Enum.DigitsRigDescriptionSide.None]] is skipped. Defaults to [[30 Official Roblox Docs/API Reference/Enums/DigitsRigDescriptionSide|Enum.DigitsRigDescriptionSide.None]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | The [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription\|DigitsRigDescription]] has not been assigned to a hand side and is skipped by the animation system. |
| `Left` | 1 | The [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription\|DigitsRigDescription]] is assigned to the left hand. |
| `Right` | 2 | The [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription\|DigitsRigDescription]] is assigned to the right hand. |

---
*Source: [DigitsRigDescriptionSide](https://create.roblox.com/docs/reference/engine/enums/DigitsRigDescriptionSide) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
