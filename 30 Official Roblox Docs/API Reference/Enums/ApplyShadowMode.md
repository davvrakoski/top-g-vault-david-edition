---
title: "ApplyShadowMode"
description: "Controls which part of a parent UI element a `UIShadow` applies its drop shadow to."
api_type: enum
aliases: ["Enum.ApplyShadowMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ApplyShadowMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls which part of a parent UI element a [[30 Official Roblox Docs/API Reference/Classes/UIShadow|UIShadow]] applies its drop shadow to.*

## Description

Controls which part of a parent UI element a [[30 Official Roblox Docs/API Reference/Classes/UIShadow|UIShadow]] applies its drop shadow to. The default value is [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Enum.ApplyShadowMode.Shape]], which casts a shadow from the element's bounding frame. Set the value to [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Enum.ApplyShadowMode.Text]] to cast the shadow from rendered glyphs instead; this has no effect if the parent element is not a text-rendering object such as [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Shape` | 0 | The shadow is applied to the parent element's frame. |
| `Text` | 1 | The shadow is applied to the parent element's text; no-op if the parent is not a text element. |

---
*Source: [ApplyShadowMode](https://create.roblox.com/docs/reference/engine/enums/ApplyShadowMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
