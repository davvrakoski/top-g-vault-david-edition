---
title: "SignalBehavior"
description: "Determines when the engine resumes event handlers."
api_type: enum
aliases: ["Enum.SignalBehavior"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SignalBehavior"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines when the engine resumes event handlers.*

## Description

Determines when the engine resumes event handlers. At some future point, the default mode will be `Deferred` but opt-out will still be possible through use of `Immediate`.

For more information, see [[30 Official Roblox Docs/Scripting/Events/Deferred engine events|Deferred Events]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | The default behavior; currently equivalent to `Immediate` but this will eventually change to `Deferred`. |
| `Immediate` | 1 | Event handlers are resumed immediately when the event occurs. |
| `Deferred` | 2 | All events are deferred and their handlers resumed at specific resumptions points each frame. |
| `AncestryDeferred` | 3 | Equivalent to `Deferred` but only for events triggered by changes in ancestry. |

---
*Source: [SignalBehavior](https://create.roblox.com/docs/reference/engine/enums/SignalBehavior) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
