---
title: "InputBindingType"
description: "This enum is used by `InputBinding.Type` to determine whether the binding responds to hardware input or is driven programmatically."
api_type: enum
aliases: ["Enum.InputBindingType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/InputBindingType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*This enum is used by [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Type|InputBinding.Type]] to determine whether the binding responds to hardware input or is driven programmatically.*

## Description

This enum is used by [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Type|InputBinding.Type]] to determine whether the [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] responds to hardware input devices or is driven programmatically via [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Fire|InputBinding:Fire()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Automatic` | 0 | The [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBinding]] responds to physical input devices (keyboard, mouse, gamepad, touch) based on its [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode\|KeyCode]] or composite direction properties. This is the default. |
| `Scriptable` | 1 | The [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBinding]] ignores hardware input and instead receives state updates exclusively through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Fire\|InputBinding:Fire()]] method. |

---
*Source: [InputBindingType](https://create.roblox.com/docs/reference/engine/enums/InputBindingType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
