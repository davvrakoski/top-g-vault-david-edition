---
title: "StreamingIntegrityMode"
description: "Determines how a user's client should handle not having enough content streamed in."
api_type: enum
aliases: ["Enum.StreamingIntegrityMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/StreamingIntegrityMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines how a user's client should handle not having enough content streamed in.*

## Description

This enum is used to control [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode|Workspace.StreamingIntegrityMode]] behavior. For all modes, the replication focus defaults to be the local character model unless explicitly set via [[30 Official Roblox Docs/API Reference/Classes/Player#ReplicationFocus|Player.ReplicationFocus]].

Note that `MinimumRadiusPause` and `PauseOutsideLoadedArea` both set the [[30 Official Roblox Docs/API Reference/Classes/Player#GameplayPaused|Player.GameplayPaused]] property when their respective pause logic is triggered, and a default message is displayed on the client.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Default behavior (subject to change). |
| `Disabled` | 1 | Simulation of the replication focus is never paused, regardless of the amount of content streamed in on the client. |
| `MinimumRadiusPause` | 2 | All client-side simulation is paused when content is not streamed in up to the minimum radius. |
| `PauseOutsideLoadedArea` | 3 | Simulation of the replication focus is paused when any part of its bounding box is not in a streamed-in area. |

---
*Source: [StreamingIntegrityMode](https://create.roblox.com/docs/reference/engine/enums/StreamingIntegrityMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
