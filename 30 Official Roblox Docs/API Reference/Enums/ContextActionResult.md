---
title: "ContextActionResult"
description: "Describes whether a contextual action should sink or pass input events."
api_type: enum
aliases: ["Enum.ContextActionResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ContextActionResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes whether a contextual action should sink or pass input events.*

## Description

`ContextActionResult` controls the behavior of multiple bound actions. It gives the option of controlling whether or not a bound action should sink or pass the input event, meaning other things (including other bound actions) can process it.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Sink` | 0 | If `functionToBind` from [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction\|ContextActionService:BindAction()]] returns [[30 Official Roblox Docs/API Reference/Enums/ContextActionResult\|Enum.ContextActionResult.Sink]], the input event will stop at that function and no other bound actions under it will be processed. This is the default behavior if `functionToBind` does not return anything or yields in any way. |
| `Pass` | 1 | If `functionToBind` from [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction\|ContextActionService:BindAction()]] returns [[30 Official Roblox Docs/API Reference/Enums/ContextActionResult\|Enum.ContextActionResult.Pass]], the input event is considered to have not been handled by `functionToBind` and will continue being passed to actions bound to the same input type. |

---
*Source: [ContextActionResult](https://create.roblox.com/docs/reference/engine/enums/ContextActionResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
