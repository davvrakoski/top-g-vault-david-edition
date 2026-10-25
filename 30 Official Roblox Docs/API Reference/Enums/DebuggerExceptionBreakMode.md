---
title: "DebuggerExceptionBreakMode"
description: "Controls when the Luau debugger pauses script execution in response to a runtime exception."
api_type: enum
aliases: ["Enum.DebuggerExceptionBreakMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DebuggerExceptionBreakMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls when the Luau debugger pauses script execution in response to a runtime exception.*

## Description

Controls when the Luau debugger pauses script execution in response to a runtime exception. This enum is used as the `breakMode` argument to `DebuggerConnection:SetExceptionBreakMode()`.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Never` | 0 | The debugger never pauses due to a runtime exception; execution continues normally regardless of whether the exception is caught or uncaught. |
| `Always` | 1 | The debugger pauses on every runtime exception, including those caught by `pcall` or `xpcall`. |
| `Unhandled` | 2 | The debugger pauses only on runtime exceptions that propagate without being caught by `pcall` or `xpcall`. |

---
*Source: [DebuggerExceptionBreakMode](https://create.roblox.com/docs/reference/engine/enums/DebuggerExceptionBreakMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
