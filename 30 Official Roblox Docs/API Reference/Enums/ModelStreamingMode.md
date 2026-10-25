---
title: "ModelStreamingMode"
description: "Controls stream in and out behavior of a model."
api_type: enum
aliases: ["Enum.ModelStreamingMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ModelStreamingMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls stream in and out behavior of a model.*

## Description

Controls how model is streamed in and out when used in an experience that is streaming enabled. Has no effect when experience is not streaming enabled.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Default behavior (subject to change). |
| `Atomic` | 1 | The [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] and all of its descendants are streamed in/out together. For streaming in, this applies when **any** descendant [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] is eligible for streaming in. For streaming out, this applies when **all** descendant [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] are eligible for streaming out. |
| `Persistent` | 2 | Persistent models are sent as a complete atomic unit soon after the player joins and before the [[30 Official Roblox Docs/API Reference/Classes/Workspace#PersistentLoaded\|Workspace.PersistentLoaded]] event fires. Persistent models and their descendants are never streamed out. |
| `PersistentPerPlayer` | 3 | Behaves as a persistent model for players that have been added using [[30 Official Roblox Docs/API Reference/Classes/Model#AddPersistentPlayer\|Model:AddPersistentPlayer()]]. For other players, behavior is the same as `Atomic`. You can revert a model from player persistence via [[30 Official Roblox Docs/API Reference/Classes/Model#RemovePersistentPlayer\|Model:RemovePersistentPlayer()]]. |
| `Nonatomic` | 4 | When a nonatomic model is streamed, descendants are also sent, except for part descendants. Nonatomic models that are not descendants of parts are sent during experience loading. |

---
*Source: [ModelStreamingMode](https://create.roblox.com/docs/reference/engine/enums/ModelStreamingMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
