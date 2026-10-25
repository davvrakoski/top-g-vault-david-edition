---
title: "ExternalEditorMode"
description: "Controls whether Roblox Studio opens scripts in the operating system's default editor or in a user-selected external editor."
api_type: enum
aliases: ["Enum.ExternalEditorMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ExternalEditorMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether Roblox Studio opens scripts in the operating system's default editor or in a user-selected external editor.*

## Description

Controls whether Roblox Studio opens scripts in the operating system's default editor or in a specific editor chosen by the user. Used by the `ExternalEditorMode` property of [[30 Official Roblox Docs/API Reference/Classes/Studio|Studio]]. The default value is [[30 Official Roblox Docs/API Reference/Enums/ExternalEditorMode|Enum.ExternalEditorMode.SystemDefault]].

When set to [[30 Official Roblox Docs/API Reference/Enums/ExternalEditorMode|Enum.ExternalEditorMode.UserSelectedEditor]], the [[30 Official Roblox Docs/API Reference/Classes/Studio#ExternalEditorSelection|Studio.ExternalEditorSelection]] property becomes active and determines which editor executable Studio launches.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `SystemDefault` | 0 | Studio opens scripts using the operating system's default application for the file type. |
| `UserSelectedEditor` | 1 | Studio opens scripts using the external editor executable specified in [[30 Official Roblox Docs/API Reference/Classes/Studio#ExternalEditorSelection\|Studio.ExternalEditorSelection]]. |

---
*Source: [ExternalEditorMode](https://create.roblox.com/docs/reference/engine/enums/ExternalEditorMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
