---
title: "InstanceFileSyncStatus"
description: "Describes the file sync status of an Instance."
api_type: enum
aliases: ["Enum.InstanceFileSyncStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/InstanceFileSyncStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the file sync status of an Instance.*

## Description

Describes the file sync status of an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `NotSynced` | 0 | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is not being synced or errored. |
| `Errored` | 1 | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is a sync root that has errored and stopped syncing. |
| `SyncedAsRoot` | 2 | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is being synced as the root of a sync tree. |
| `SyncedAsDescendant` | 3 | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is being synced because it is a descendant of a sync root. |
| `AncestorErrored` | 4 | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is not currently being synced because the root of its sync tree is `Errored`. |

---
*Source: [InstanceFileSyncStatus](https://create.roblox.com/docs/reference/engine/enums/InstanceFileSyncStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
