---
title: "WrapLayerAutoSkin"
description: "Controls how automatic bone weight transfer from the body is applied to a `WrapLayer` accessory's mesh."
api_type: enum
aliases: ["Enum.WrapLayerAutoSkin"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/WrapLayerAutoSkin"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how automatic bone weight transfer from the body is applied to a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] accessory's mesh.*

## Description

[[30 Official Roblox Docs/API Reference/Enums/WrapLayerAutoSkin|Enum.WrapLayerAutoSkin]] is used exclusively by [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#AutoSkin|WrapLayer.AutoSkin]], which defaults to [[30 Official Roblox Docs/API Reference/Enums/WrapLayerAutoSkin|Enum.WrapLayerAutoSkin.Disabled]]. It controls whether the engine runs an automatic skinning-transfer pass when layered clothing processes an accessory, and — when enabled — whether authored skinning weights are preserved or overridden.

Skinning transfer copies bone weights from the body part the accessory is fitted to so the accessory mesh animates with the character rig. That matters for accessories such as eyebrows and eyelashes, where the body schema may not guarantee a standard facial-bone set.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Disabled` | 0 | No automatic skinning transfer is applied; the accessory uses its authored skinning data as-is, and an unskinned mesh will not deform with the character. |
| `EnabledPreserve` | 1 | Applies automatic skinning transfer only when the mesh has no existing skinning data; otherwise the authored weights are kept. |
| `EnabledOverride` | 2 | Unconditionally overrides all skinning weights by running the cage-based skinning transfer algorithm, regardless of whether the mesh was originally skinned. |

---
*Source: [WrapLayerAutoSkin](https://create.roblox.com/docs/reference/engine/enums/WrapLayerAutoSkin) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
