---
title: "ListenerType"
description: "Defines where and how the listener is positioned when picking up spatial audio."
api_type: enum
aliases: ["Enum.ListenerType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ListenerType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Defines where and how the listener is positioned when picking up spatial audio.*

## Description

Defines where and how the listener is positioned when picking up spatial audio. Used in [[30 Official Roblox Docs/API Reference/Classes/SoundService#SetListener|SoundService.SetListener]] and [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetListener|SoundService.GetListener]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Camera` | 0 | Uses the world CFrame of `workspace.CurrentCamera`. |
| `CFrame` | 1 | Uses a specified world CFrame. |
| `ObjectPosition` | 2 | Uses the world position of an instance and the rotation of `workspace.CurrentCamera`. |
| `ObjectCFrame` | 3 | Uses the world CFrame from an instance. |

---
*Source: [ListenerType](https://create.roblox.com/docs/reference/engine/enums/ListenerType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
