---
title: "BreakReason"
description: "Reason for the breakpoint hit."
api_type: enum
aliases: ["Enum.BreakReason"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/BreakReason"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Reason for the breakpoint hit.*

## Description

Value for the reason the [ScriptDebugger.EncounteredBreak](https://create.roblox.com/docs/reference/engine/classes/ScriptDebugger#EncounteredBreak) signal fired.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Other` | 0 | Pausing for a reason not covered by other values, for example if the user hit "Pause" button. |
| `Error` | 1 | Pausing on error hit in the code. |
| `SpecialBreakpoint` | 2 | Pausing on an internal breakpoint set by debugger command: e.g. step over, step into, step out of. |
| `UserBreakpoint` | 3 | Pausing on a user breakpoint. |

---
*Source: [BreakReason](https://create.roblox.com/docs/reference/engine/enums/BreakReason) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
