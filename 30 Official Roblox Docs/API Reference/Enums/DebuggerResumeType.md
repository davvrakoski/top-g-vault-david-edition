---
title: "DebuggerResumeType"
description: "Specifies how the debugger should resume execution after a pause."
api_type: enum
aliases: ["Enum.DebuggerResumeType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DebuggerResumeType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies how the debugger should resume execution after a pause.*

## Description

Returned from the [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#OnStopped|ScriptDebuggerService.OnStopped]] callback (via [ScriptResumeAction](https://create.roblox.com/docs/reference/engine/datatypes/ScriptResumeAction)) to control how execution resumes after a debugger pause.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `StepInto` | 0 | Step into the next function call on the specified thread. |
| `StepOut` | 1 | Step out of the current function on the specified thread. |
| `StepOver` | 2 | Step over the current line on the specified thread. |
| `Resume` | 3 | Resume execution normally without stepping. |

---
*Source: [DebuggerResumeType](https://create.roblox.com/docs/reference/engine/enums/DebuggerResumeType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
