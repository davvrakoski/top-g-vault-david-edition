---
title: "DraftsService"
description: "A Studio service that manages script drafts in a Team Create session with collaborative editing enabled."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DraftsService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A Studio service that manages script drafts in a Team Create session with collaborative editing enabled.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`DraftsService` backs the collaborative editing "drafts" workflow in a Team Create session. When collaborative editing is enabled, a collaborator's changes to a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] are kept as a local _draft_ rather than being applied to the shared session copy immediately, and a draft must be committed before other collaborators receive it.

The service exposes the operations behind Studio's Drafts interface. `GetDrafts()` enumerates the current drafts, `GetDraftStatus()` reports a draft's status, and `GetEditors()` lists the collaborators editing a given script. `CommitEdits()` and `DiscardEdits()` publish or drop changes; `RestoreScripts()` and `UpdateToLatestVersion()` reconcile local drafts with the server; and `ShowDiffsAgainstBase()` and `ShowDiffsAgainstServer()` open diff views. Events including `DraftAdded`, `DraftRemoved`, `DraftStatusChanged`, and `EditorsListChanged` fire as drafts and their editors change.

`DraftsService` is a Studio-only service; retrieve it with `game:GetService("DraftsService")`.

---
*Source: [DraftsService](https://create.roblox.com/docs/reference/engine/classes/DraftsService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
