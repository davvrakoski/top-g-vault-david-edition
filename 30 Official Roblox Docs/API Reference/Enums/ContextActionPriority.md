---
title: "ContextActionPriority"
description: "Describes the priority of a context action."
api_type: enum
aliases: ["Enum.ContextActionPriority"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ContextActionPriority"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the priority of a context action.*

## Description

`ContextActionPriority` specifies the relative priority of an action bound via [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActionAtPriority|ContextActionService:BindActionAtPriority()]]. When multiple actions are bound to the same input, [[30 Official Roblox Docs/API Reference/Classes/ContextActionService|ContextActionService]] invokes them in descending priority order — the action with the highest priority value runs first and may sink the input before lower-priority actions receive it. The three named levels map to the integer values `Low = 1000`, `Medium = 2000`, and `High = 3000`; arbitrary integers are also accepted by `BindActionAtPriority`. `Medium` is the default priority used by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|ContextActionService:BindAction()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Low` | 1000 | The lowest named priority level (value 1000); an action at this level is invoked after `High` and `Medium` actions bound to the same input. |
| `Medium` | 2000 | The default priority level (value 2000); used automatically by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction\|ContextActionService:BindAction()]] and falls between `High` and `Low` in processing order. |
| `High` | 3000 | The highest named priority level (value 3000); an action at this level is invoked before `Medium` and `Low` actions bound to the same input. |

---
*Source: [ContextActionPriority](https://create.roblox.com/docs/reference/engine/enums/ContextActionPriority) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
