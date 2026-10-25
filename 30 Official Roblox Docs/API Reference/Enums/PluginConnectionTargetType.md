---
title: "PluginConnectionTargetType"
description: "Describes the data model type that the remote end of a `PluginConnection` runs in."
api_type: enum
aliases: ["Enum.PluginConnectionTargetType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PluginConnectionTargetType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the data model type that the remote end of a [[30 Official Roblox Docs/API Reference/Classes/PluginConnection|PluginConnection]] runs in.*

## Description

An enum describing the possible relationships a target data model of a [[30 Official Roblox Docs/API Reference/Classes/PluginConnection|PluginConnection]] can have to the current data model.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Edit` | 0 | The target data model is an edit-session data model which spawned this test data model. |
| `Test` | 1 | The target data model is a test (simulation/playtest) data model spawned from this edit data model. |

---
*Source: [PluginConnectionTargetType](https://create.roblox.com/docs/reference/engine/enums/PluginConnectionTargetType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
