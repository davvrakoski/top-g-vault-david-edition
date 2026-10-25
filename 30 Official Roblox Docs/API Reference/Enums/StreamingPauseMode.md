---
title: "StreamingPauseMode"
description: "Determines how a client should handle not having enough content streamed in to continue playing properly."
api_type: enum
aliases: ["Enum.StreamingPauseMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/StreamingPauseMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines how a client should handle not having enough content streamed in to continue playing properly.*

> [!warning] Deprecated
> Please use `Class.Workspace.StreamingIntegrityMode` instead.

## Description

This enum is used to control [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace.StreamingPauseMode]] behavior. The `Disabled` mode indicates that gameplay continues unchanged even if player does not have the minimum streaming radius available. In `ClientPhysicsPause` mode, client-side physics is paused when the player doesn't have the minimum radius present and resumed when the minimum radius is available.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | **Deprecated.** Default behavior (subject to change). |
| `Disabled` | 1 | **Deprecated.** No change to gameplay due to streaming region availability. |
| `ClientPhysicsPause` | 2 | **Deprecated.** Client owned physics is paused. |

---
*Source: [StreamingPauseMode](https://create.roblox.com/docs/reference/engine/enums/StreamingPauseMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
