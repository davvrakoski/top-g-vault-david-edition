---
title: "ConfigSnapshotErrorState"
description: "Describes the error state of a `ConfigSnapshot` object."
api_type: enum
aliases: ["Enum.ConfigSnapshotErrorState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ConfigSnapshotErrorState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the error state of a [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot|ConfigSnapshot]] object.*

## Description

Indicates whether a [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot|ConfigSnapshot]] loaded its configuration data successfully. Read the [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#Error|ConfigSnapshot.Error]] property (which defaults to [[30 Official Roblox Docs/API Reference/Enums/ConfigSnapshotErrorState|Enum.ConfigSnapshotErrorState.None]]) to check for errors before calling [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#GetValue|ConfigSnapshot:GetValue()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | Indicates the snapshot loaded successfully with no error; this is the default state. |
| `LoadFailed` | 1 | Indicates the snapshot failed to load because the underlying config service was unavailable at construction time. |

---
*Source: [ConfigSnapshotErrorState](https://create.roblox.com/docs/reference/engine/enums/ConfigSnapshotErrorState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
