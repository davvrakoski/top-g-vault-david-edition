---
title: "AvatarPromptResult"
description: "The result of prompt operations of `AvatarEditorService`."
api_type: enum
aliases: ["Enum.AvatarPromptResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarPromptResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The result of prompt operations of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService|AvatarEditorService]].*

## Description

Indicates the outcome of a prompt operation initiated by [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService|AvatarEditorService]]. Each `Prompt` method on the service (such as [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSaveAvatar|AvatarEditorService:PromptSaveAvatar()]], [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSetFavorite|AvatarEditorService:PromptSetFavorite()]], and [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfit|AvatarEditorService:PromptCreateOutfit()]]) displays a native dialog to the user and fires a corresponding `Completed` event that passes this enum as its `result` parameter.

- **Success** — the user confirmed the prompt and the back-end request completed without error.
- **PermissionDenied** — the user dismissed the prompt or otherwise declined to grant the requested permission.
- **Failed** — an error occurred while processing the request (for example, a network failure or an invalid response from the server).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 1 | The prompted action was completed. |
| `PermissionDenied` | 2 | Denied permission to take the prompted action. |
| `Failed` | 3 | Failure while trying to take the prompted action. |

---
*Source: [AvatarPromptResult](https://create.roblox.com/docs/reference/engine/enums/AvatarPromptResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
