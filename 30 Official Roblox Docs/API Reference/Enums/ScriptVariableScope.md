---
title: "ScriptVariableScope"
description: "Indicates the scope category of a variable returned by the debugger."
api_type: enum
aliases: ["Enum.ScriptVariableScope"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ScriptVariableScope"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the scope category of a variable returned by the debugger.*

## Description

Used in [ScriptVariable](https://create.roblox.com/docs/reference/engine/datatypes/ScriptVariable) to classify the scope of a variable returned by [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetRootVariables|ScriptDebuggerService:GetRootVariables()]] or [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetVariables|ScriptDebuggerService:GetVariables()]]. Children of a variable inherit the parent's scope.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Local` | 0 | A local variable declared in the current function scope. |
| `Upvalue` | 1 | A variable captured from an enclosing function scope. |
| `Global` | 2 | A global variable. |

---
*Source: [ScriptVariableScope](https://create.roblox.com/docs/reference/engine/enums/ScriptVariableScope) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
