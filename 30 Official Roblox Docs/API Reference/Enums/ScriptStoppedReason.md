---
title: "ScriptStoppedReason"
description: "Describes why the debugger paused execution."
api_type: enum
aliases: ["Enum.ScriptStoppedReason"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ScriptStoppedReason"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes why the debugger paused execution.*

## Description

Passed in the [ScriptDebugStopped](https://create.roblox.com/docs/reference/engine/datatypes/ScriptDebugStopped) payload to the [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#OnStopped|ScriptDebuggerService.OnStopped]] callback, indicating what triggered the pause.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Breakpoint` | 0 | Execution stopped because a user-defined breakpoint was hit. |
| `Exception` | 1 | Execution stopped because an exception was thrown (governed by the current [[30 Official Roblox Docs/API Reference/Enums/DebugBreakModeType\|Enum.DebugBreakModeType]]). |
| `Pause` | 2 | Execution stopped because [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#Pause\|ScriptDebuggerService:Pause()]] was called. |
| `Step` | 3 | Execution stopped after completing a step operation. |
| `Entry` | 4 | Execution stopped at a script's entry point. |

---
*Source: [ScriptStoppedReason](https://create.roblox.com/docs/reference/engine/enums/ScriptStoppedReason) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
