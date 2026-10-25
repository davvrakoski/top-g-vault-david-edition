---
title: "RuntimeUndoBehavior"
description: "Controls how `ChangeHistoryService` records and handles undo history during a Studio playtest session."
api_type: enum
aliases: ["Enum.RuntimeUndoBehavior"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RuntimeUndoBehavior"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService|ChangeHistoryService]] records and handles undo history during a Studio playtest session.*

## Description

`RuntimeUndoBehavior` is the type of the `ChangeHistoryService.RuntimeUndoBehavior` property and determines what Studio does when a waypoint is requested (via [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#SetWaypoint|ChangeHistoryService:SetWaypoint()]] or the recording API) while the game is in the run state (i.e., during a playtest). The three values offer different trade-offs between undo granularity and physics-change handling.

The default behavior is [[30 Official Roblox Docs/API Reference/Enums/RuntimeUndoBehavior|Enum.RuntimeUndoBehavior.Aggregate]]: waypoints are suppressed during the run, all runtime edits accumulate into a single waypoint, and they are all reverted at once when the playtest stops or resets.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Aggregate` | 0 | Rejects waypoint requests during a run session; all runtime changes accumulate into a single waypoint that is reverted together when the session stops or resets. |
| `Snapshot` | 1 | Accepts waypoint requests during a run session and captures a snapshot of each instance's position and velocity at every waypoint boundary so that physics state can be fully restored on undo. |
| `Hybrid` | 2 | Accepts waypoint requests during a run session but excludes unsolicited physics changes (position and velocity drift from simulation) from the recorded history. |

---
*Source: [RuntimeUndoBehavior](https://create.roblox.com/docs/reference/engine/enums/RuntimeUndoBehavior) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
