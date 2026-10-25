---
title: "HapticEffectType"
description: "Enum used alongside `HapticEffect.Type`."
api_type: enum
aliases: ["Enum.HapticEffectType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/HapticEffectType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Enum used alongside [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Type|HapticEffect.Type]].*

## Description

Enum used alongside [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Type|HapticEffect.Type]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Custom` | 0 | Allows for application of a custom haptic waveform through the [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#SetWaveformKeys\|HapticEffect:SetWaveformKeys()]] method. |
| `UIHover` | 1 | Useful for when a player browses over an object (often a UI object) without the intention of triggering its action; it can also alert the player that they have browsed over an interactable object. This effect type is subtle and does not disrupt the gameplay experience. |
| `UIClick` | 2 | Useful for when a player has selected an object (often a UI object) with the intention of triggering its action. This effect type is crisp and it provides immediate feedback without being overwhelming. |
| `UINotification` | 3 | Useful for when there is an inbound message that should draw the player's attention away from their current gameplay and prompt them that the notification requires immediate attention or action. |
| `GameplayExplosion` | 4 | Useful to signify a large-scale physics event that triggers impact across a large portion of a given scene. This effect is high intensity in order to represent the magnitude of the impact and it lingers for a longer period of time than `GameplayCollision`. |
| `GameplayCollision` | 5 | This effect is a large immediate rumble that dies down quickly, useful to signify a clear and purposeful impact between objects. |

---
*Source: [HapticEffectType](https://create.roblox.com/docs/reference/engine/enums/HapticEffectType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
