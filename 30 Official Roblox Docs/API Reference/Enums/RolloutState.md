---
title: "RolloutState"
description: "A three-phase rollout state used to opt in or out of engine features."
api_type: enum
aliases: ["Enum.RolloutState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RolloutState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*A three-phase rollout state used to opt in or out of engine features.*

## Description

Several [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] properties use `RolloutState` to support a three-phase rollout pattern, where a feature is initially opt-in (`Default` equals disabled), then opt-out (`Default` equals enabled), and finally always on. `Default` always tracks the current engine-wide phase.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Uses the engine-wide rollout default, which changes as the feature progresses through its rollout phases. |
| `Disabled` | 1 | Opts out of the feature regardless of the engine-wide rollout phase. |
| `Enabled` | 2 | Opts in to the feature regardless of the engine-wide rollout phase. |

---
*Source: [RolloutState](https://create.roblox.com/docs/reference/engine/enums/RolloutState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
