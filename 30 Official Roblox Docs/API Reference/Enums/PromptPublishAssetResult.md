---
title: "PromptPublishAssetResult"
description: "Deprecated result enum for the `OpenPublishResultModal` event."
api_type: enum
aliases: ["Enum.PromptPublishAssetResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PromptPublishAssetResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Deprecated result enum for the `OpenPublishResultModal` event.*

## Description

Deprecated result enum for the `OpenPublishResultModal` event. Use [Enum.PromptCreatePlatformContentResult](https://create.roblox.com/docs/reference/engine/enums/PromptCreatePlatformContentResult) instead.

[[30 Official Roblox Docs/API Reference/Enums/PromptCreateAssetResult|Enum.PromptCreateAssetResult]] is a separate result enum returned by the `OpenCreateResultModal` event.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 1 | The asset was published successfully. |
| `PermissionDenied` | 2 | The user explicitly denied the consent prompt required to publish the asset. |
| `Timeout` | 3 | The publish flow timed out, typically because the user disconnected or left the experience during the consent prompt. |
| `UploadFailed` | 4 | The asset upload to the Roblox backend failed after consent was granted. |
| `NoUserInput` | 5 | The user did not grant or deny the consent prompt before the window expired. |
| `UnknownFailure` | 6 | The publish failed for an unspecified or unexpected reason. |

---
*Source: [PromptPublishAssetResult](https://create.roblox.com/docs/reference/engine/enums/PromptPublishAssetResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
