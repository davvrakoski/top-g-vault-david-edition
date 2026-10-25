---
title: "FileSystemWalkMode"
description: "Controls whether `FileSystemService:Walk()` descends into subdirectories."
api_type: enum
aliases: ["Enum.FileSystemWalkMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FileSystemWalkMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether [FileSystemService:Walk()](https://create.roblox.com/docs/reference/engine/classes/FileSystemService#Walk) descends into subdirectories.*

## Description

Controls whether [FileSystemService:Walk()](https://create.roblox.com/docs/reference/engine/classes/FileSystemService#Walk) traverses only the immediate entries of the target directory or also descends recursively into subdirectories. Pass one of these values as the `mode` argument to `Walk`; when `mode` is omitted the method defaults to [[30 Official Roblox Docs/API Reference/Enums/FileSystemWalkMode|Enum.FileSystemWalkMode.NonRecursive]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `NonRecursive` | 0 | Visits only the immediate entries of the specified directory, without descending into subdirectories. |
| `Recursive` | 1 | Visits all entries in the specified directory and all of its subdirectories, incrementing the iterator's `Depth` field for each level descended. |

---
*Source: [FileSystemWalkMode](https://create.roblox.com/docs/reference/engine/enums/FileSystemWalkMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
