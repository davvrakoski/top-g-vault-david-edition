---
title: "RenderPriority"
description: "A list of standard reserved values in BindToRenderStep."
api_type: enum
aliases: ["Enum.RenderPriority"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RenderPriority"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*A list of standard reserved values in BindToRenderStep.*

## Description

A list of standard reserved values in BindToRenderStep.

See [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep|RunService:BindToRenderStep()]] for the proper usage, as the enum itself isn't used.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `First` | 0 | The lowest reserved priority level; callbacks run before all other standard priorities. |
| `Input` | 100 | Runs after `First`; intended for input-processing callbacks. |
| `Camera` | 200 | Runs after `Input`; intended for camera-update callbacks. |
| `Character` | 300 | Runs after `Camera`; intended for character-response callbacks. |
| `Last` | 2000 | The highest reserved priority level; callbacks run after all other standard priorities. |

---
*Source: [RenderPriority](https://create.roblox.com/docs/reference/engine/enums/RenderPriority) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
