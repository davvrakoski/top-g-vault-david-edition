---
title: "RejectCharacterDeletions"
description: "Controls whether the server rejects client attempts to delete player characters."
api_type: enum
aliases: ["Enum.RejectCharacterDeletions"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RejectCharacterDeletions"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether the server rejects client attempts to delete player characters.*

## Description

Determines whether the server rejects client replication requests that would delete player character models from the workspace. This enum is used by [[30 Official Roblox Docs/API Reference/Classes/Workspace#RejectCharacterDeletions|Workspace.RejectCharacterDeletions]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Uses the engine-default behavior (currently equivalent to `Enabled`). |
| `Disabled` | 1 | The server does not reject character deletion requests from clients. |
| `Enabled` | 2 | The server rejects client attempts to delete player characters. |

---
*Source: [RejectCharacterDeletions](https://create.roblox.com/docs/reference/engine/enums/RejectCharacterDeletions) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
