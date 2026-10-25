---
title: "DebugBreakModeType"
description: "Controls when the debugger pauses on exceptions."
api_type: enum
aliases: ["Enum.DebugBreakModeType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DebugBreakModeType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls when the debugger pauses on exceptions.*

## Description

Used with [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#SetExceptionBreakMode|ScriptDebuggerService:SetExceptionBreakMode()]] to control when the debugger pauses on exceptions. The mode applies to all [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModels]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Never` | 0 | Never break on exceptions. |
| `Always` | 1 | Break on all exceptions. |
| `Unhandled` | 2 | Break only on unhandled exceptions. |

---
*Source: [DebugBreakModeType](https://create.roblox.com/docs/reference/engine/enums/DebugBreakModeType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
