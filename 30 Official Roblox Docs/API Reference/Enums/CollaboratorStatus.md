---
title: "CollaboratorStatus"
description: "Describes the current editing activity of a collaborator in a Team Create session."
api_type: enum
aliases: ["Enum.CollaboratorStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CollaboratorStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the current editing activity of a collaborator in a Team Create session.*

## Description

Describes the current editing activity of a collaborator in a Team Create session. Stored on `Collaborator.Status` (defaults to [[30 Official Roblox Docs/API Reference/Enums/CollaboratorStatus|Enum.CollaboratorStatus.None]]) and updated server-side via `CollaboratorsService`. Do not set `Collaborator.Status` from client code; call through `CollaboratorsService` so server-side access checks apply.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | The collaborator has no active editing context; this is the default status. |
| `Editing3D` | 1 | The collaborator is actively working in the 3D viewport. |
| `Scripting` | 2 | The collaborator is editing a script that is replicated to the server. |
| `PrivateScripting` | 3 | The collaborator is editing a script that is not replicated to the server (a local or module script not visible server-side). |

---
*Source: [CollaboratorStatus](https://create.roblox.com/docs/reference/engine/enums/CollaboratorStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
