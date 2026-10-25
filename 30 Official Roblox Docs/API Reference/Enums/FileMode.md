---
title: "FileMode"
description: "Controls whether `FileSystemService` normalizes line endings when reading or writing files."
api_type: enum
aliases: ["Enum.FileMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FileMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether [FileSystemService](https://create.roblox.com/docs/reference/engine/classes/FileSystemService) normalizes line endings when reading or writing files.*

## Description

The `FileMode` enum is passed to [FileSystemService:ReadFile()](https://create.roblox.com/docs/reference/engine/classes/FileSystemService#ReadFile) and [FileSystemService:WriteFile()](https://create.roblox.com/docs/reference/engine/classes/FileSystemService#WriteFile) to control line-ending handling. [[30 Official Roblox Docs/API Reference/Enums/FileMode|Enum.FileMode.Text]] normalizes `\r\n` sequences to `\n` on both read and write, ensuring consistent cross-platform behavior when working with text content. [[30 Official Roblox Docs/API Reference/Enums/FileMode|Enum.FileMode.Binary]] performs no transformation, preserving every byte exactly as stored on disk.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Binary` | 0 | Reads or writes raw bytes with no line-ending transformation, preserving all characters exactly as stored on disk. |
| `Text` | 1 | Reads or writes file content with `\r\n` sequences normalized to `\n`, ensuring consistent line endings across platforms. |

---
*Source: [FileMode](https://create.roblox.com/docs/reference/engine/enums/FileMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
