---
title: "FinishRecordingOperation"
description: "Controls how `ChangeHistoryService:FinishRecording()` completes or discards a recording session."
api_type: enum
aliases: ["Enum.FinishRecordingOperation"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FinishRecordingOperation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#FinishRecording|ChangeHistoryService:FinishRecording()]] completes or discards a recording session.*

## Description

Controls what [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#FinishRecording|ChangeHistoryService:FinishRecording()]] does when a plugin ends a recording. Pass [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation|Enum.FinishRecordingOperation.Commit]] to push recorded changes onto the undo/redo stack, [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation|Enum.FinishRecordingOperation.Append]] to merge them with the previous entry when possible, or [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation|Enum.FinishRecordingOperation.Cancel]] to discard them.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Cancel` | 0 | Cancels the recording, automatically undoing any work in progress. |
| `Commit` | 1 | Commits the recorded work. |
| `Append` | 2 | Commits the recorded work and merges with the previous recording if possible. |

---
*Source: [FinishRecordingOperation](https://create.roblox.com/docs/reference/engine/enums/FinishRecordingOperation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
