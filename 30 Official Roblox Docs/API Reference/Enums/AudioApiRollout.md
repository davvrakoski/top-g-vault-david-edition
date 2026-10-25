---
title: "AudioApiRollout"
description: "Used to determine whether voice chat is represented and controlled by `AudioDeviceInput` objects."
api_type: enum
aliases: ["Enum.AudioApiRollout"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AudioApiRollout"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used to determine whether voice chat is represented and controlled by [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] objects.*

## Description

Used to determine whether voice chat is represented and controlled by [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] objects.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Disabled` | 0 | Voice chat will use an internal voice chat implementation that is automatic and hidden. |
| `Automatic` | 1 | Currently means the same thing as `Disabled`, but will be updated to mean `Enabled` in the future. |
| `Enabled` | 2 | Voice chat can be customized or controlled via [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInputs]]. |

---
*Source: [AudioApiRollout](https://create.roblox.com/docs/reference/engine/enums/AudioApiRollout) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
