---
title: "FacialAnimationStreamingState"
description: "A bitmask enum describing which facial animation streaming capabilities are active for a user or service."
api_type: enum
aliases: ["Enum.FacialAnimationStreamingState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FacialAnimationStreamingState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*A bitmask enum describing which facial animation streaming capabilities are active for a user or service.*

## Description

`FacialAnimationStreamingState` is a bitmask enum that represents which facial animation streaming modalities are currently enabled. Values can be combined via bitwise OR to represent multiple active states simultaneously. It covers both per-user opt-in state and place- or server-level enablement.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | Indicates that no facial animation streaming is active. |
| `Audio` | 1 | Indicates that audio-based facial animation streaming is enabled for the user. |
| `Video` | 2 | Indicates that video-based facial animation streaming is enabled for the user. |
| `Place` | 4 | Indicates that facial animation streaming is enabled at the place level. |
| `Server` | 8 | Indicates that facial animation streaming is enabled at the server level. |

---
*Source: [FacialAnimationStreamingState](https://create.roblox.com/docs/reference/engine/enums/FacialAnimationStreamingState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
