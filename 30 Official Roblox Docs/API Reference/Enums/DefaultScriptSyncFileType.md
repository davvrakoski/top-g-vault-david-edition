---
title: "DefaultScriptSyncFileType"
description: "Controls the file extension used when Studio's script sync feature saves script instances to the filesystem."
api_type: enum
aliases: ["Enum.DefaultScriptSyncFileType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DefaultScriptSyncFileType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls the file extension used when Studio's script sync feature saves script instances to the filesystem.*

## Description

Specifies whether Studio writes synced script files with a `.lua` or `.luau` extension when using the file sync (external editor) workflow. The active value is read from [[30 Official Roblox Docs/API Reference/Classes/Studio#DefaultScriptSyncFileType|Studio.DefaultScriptSyncFileType]]. Defaults to [[30 Official Roblox Docs/API Reference/Enums/DefaultScriptSyncFileType|Enum.DefaultScriptSyncFileType.Luau]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Lua` | 0 | Script files are synced to the filesystem with a `.lua` extension. |
| `Luau` | 1 | Script files are synced to the filesystem with a `.luau` extension. |

---
*Source: [DefaultScriptSyncFileType](https://create.roblox.com/docs/reference/engine/enums/DefaultScriptSyncFileType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
