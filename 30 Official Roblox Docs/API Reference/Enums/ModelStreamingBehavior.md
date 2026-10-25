---
title: "ModelStreamingBehavior"
description: "Controls how `Models` are sent to clients in experiences with instance streaming enabled."
api_type: enum
aliases: ["Enum.ModelStreamingBehavior"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ModelStreamingBehavior"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] are sent to clients in experiences with instance streaming enabled.*

## Description

Controls how [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] are replicated in experiences when instance [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|streaming]] is enabled. Only affects models with [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Default]]/[[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Nonatomic]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Default behavior (subject to change). |
| `Legacy` | 1 | Models are sent when their parent is sent, typically during player join. Models are never streamed out unless an ancestor of the model is streamed out. |
| `Improved` | 2 | Models are never sent during player join. See [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Model streaming controls\|model streaming controls]] for detailed behavioral notes. |

---
*Source: [ModelStreamingBehavior](https://create.roblox.com/docs/reference/engine/enums/ModelStreamingBehavior) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
