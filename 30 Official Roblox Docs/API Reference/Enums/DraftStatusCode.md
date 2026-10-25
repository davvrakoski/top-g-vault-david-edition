---
title: "DraftStatusCode"
description: "Describes the state of a script draft tracked by `DraftsService`."
api_type: enum
aliases: ["Enum.DraftStatusCode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DraftStatusCode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the state of a script draft tracked by [[30 Official Roblox Docs/API Reference/Classes/DraftsService|DraftsService]].*

## Description

State of a script draft from `GetDraftStatus` and from `CommitStatusChanged` / `UpdateStatusChanged`. See individual items for in-sync, outdated, committed, and removed-script outcomes.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `OK` | 0 | The draft is in sync with the server's base version and has no blocking conflicts. |
| `DraftOutdated` | 1 | The server version of the script has advanced beyond the base version used when the draft was created, so the draft must be updated before it can be committed. |
| `ScriptRemoved` | 2 | The script referenced by the draft no longer exists in the data model. |
| `DraftCommitted` | 3 | The draft was successfully committed to the server and removed from the local sandbox. |

---
*Source: [DraftStatusCode](https://create.roblox.com/docs/reference/engine/enums/DraftStatusCode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
