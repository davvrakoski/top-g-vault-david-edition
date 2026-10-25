---
title: "VirtualInputMode"
description: "Describes the current operational state of a `VirtualInputManager`."
api_type: enum
aliases: ["Enum.VirtualInputMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/VirtualInputMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the current operational state of a [[30 Official Roblox Docs/API Reference/Classes/VirtualInputManager|VirtualInputManager]].*

## Description

Describes the current operational state of a [[30 Official Roblox Docs/API Reference/Classes/VirtualInputManager|VirtualInputManager]]. The service reports a value from this enum to indicate whether it is idle, actively capturing input events, or replaying a previously captured sequence. Transitions are driven by calls to `StartRecording()`, `StopRecording()`, `StartPlaying()`, and `StopPlaying()`.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | The [[30 Official Roblox Docs/API Reference/Classes/VirtualInputManager\|VirtualInputManager]] is idle and neither recording nor playing back input. |
| `Recording` | 1 | The [[30 Official Roblox Docs/API Reference/Classes/VirtualInputManager\|VirtualInputManager]] is actively capturing input events into a sequence. |
| `Playing` | 2 | The [[30 Official Roblox Docs/API Reference/Classes/VirtualInputManager\|VirtualInputManager]] is replaying a previously recorded input sequence. |

---
*Source: [VirtualInputMode](https://create.roblox.com/docs/reference/engine/enums/VirtualInputMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
