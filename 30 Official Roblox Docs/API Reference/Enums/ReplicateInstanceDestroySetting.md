---
title: "ReplicateInstanceDestroySetting"
description: "Controls how `Instance:Destroy()` calls are replicated from server to clients."
api_type: enum
aliases: ["Enum.ReplicateInstanceDestroySetting"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ReplicateInstanceDestroySetting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how `Instance:Destroy()` calls are replicated from server to clients.*

## Description

Determines the replication behavior the server uses when `Instance:Destroy()` is called. This enum is used by [[30 Official Roblox Docs/API Reference/Classes/Workspace#ReplicateInstanceDestroySetting|Workspace.ReplicateInstanceDestroySetting]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Uses the engine-default instance destroy replication behavior. |
| `Disabled` | 1 | Uses legacy instance destroy replication behavior. |
| `Enabled` | 2 | Uses improved instance destroy replication behavior. |

---
*Source: [ReplicateInstanceDestroySetting](https://create.roblox.com/docs/reference/engine/enums/ReplicateInstanceDestroySetting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
