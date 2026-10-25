---
title: "AvatarSettingsAccessoryLimitMethod"
description: "Determines how `AvatarAccessoryRules` enforces accessory size limits when an accessory exceeds the configured bounds."
api_type: enum
aliases: ["Enum.AvatarSettingsAccessoryLimitMethod"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsAccessoryLimitMethod"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines how `AvatarAccessoryRules` enforces accessory size limits when an accessory exceeds the configured bounds.*

## Description

Determines how `AvatarAccessoryRules` enforces accessory size limits when an accessory exceeds `LimitBounds`. Used by `LimitMethod`, which defaults to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsAccessoryLimitMethod|Enum.AvatarSettingsAccessoryLimitMethod.Remove]]. Only takes effect when `AccessoryMode` is [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsAccessoryMode|Enum.AvatarSettingsAccessoryMode.CustomLimit]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Scale` | 0 | Scales down rigid accessories that exceed the configured bounds, or removes them if scaling would reduce them below minimum size thresholds. |
| `Remove` | 1 | Destroys any rigid accessory whose bounding box exceeds the configured bounds. |
| `PreviewScale` | 2 | Reports whether an accessory would be scaled or removed for exceeding the configured bounds without actually modifying it. |
| `PreviewRemove` | 3 | Reports whether an accessory would be removed for exceeding the configured bounds without actually destroying it. |

---
*Source: [AvatarSettingsAccessoryLimitMethod](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsAccessoryLimitMethod) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
