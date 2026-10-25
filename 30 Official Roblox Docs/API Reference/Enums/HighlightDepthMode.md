---
title: "HighlightDepthMode"
description: "Controls how the `Highlight` effect displays with respect to other objects in the world."
api_type: enum
aliases: ["Enum.HighlightDepthMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/HighlightDepthMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how the [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] effect displays with respect to other objects in the world.*

## Description

Controls how the [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] effect displays with respect to other objects in the world.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `AlwaysOnTop` | 0 | Allows the [[30 Official Roblox Docs/API Reference/Classes/Highlight\|Highlight]] to display regardless if there are objects between the camera and the highlighted object. This means the viewer is always able to see the highlight regardless of what is between the highlighted object and the camera.<br><br>*(image in the full Top G Vault)* |
| `Occluded` | 1 | Hides the [[30 Official Roblox Docs/API Reference/Classes/Highlight\|Highlight]] if there are objects between the camera and the highlighted object. This means the viewer is only able to see the object if there are no obstructing objects between the highlighted object and the camera's view.<br><br>*(image in the full Top G Vault)* |

---
*Source: [HighlightDepthMode](https://create.roblox.com/docs/reference/engine/enums/HighlightDepthMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
