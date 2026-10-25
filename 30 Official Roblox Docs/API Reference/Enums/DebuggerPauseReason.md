---
title: "DebuggerPauseReason"
description: "Reason that the DataModel was paused."
api_type: enum
aliases: ["Enum.DebuggerPauseReason"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DebuggerPauseReason"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Reason that the DataModel was paused.*

## Description

Reason that the DataModel was paused.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | Pausing for a reason not covered by other values. |
| `Requested` | 1 | Pause was requested by user. |
| `Breakpoint` | 2 | Pausing on a user breakpoint. |
| `Exception` | 3 | Pausing on error hit in the code. |
| `SingleStep` | 4 | Pausing on an internal breakpoint set by debugger command: e.g. step over, step into, step out of. |
| `Entrypoint` | 5 | Pausing at the entry on the script. |

---
*Source: [DebuggerPauseReason](https://create.roblox.com/docs/reference/engine/enums/DebuggerPauseReason) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
