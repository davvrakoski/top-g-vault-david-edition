---
title: "StudioPlaceUpdateFailureReason"
description: "Describes why a place publish or update operation failed in Roblox Studio."
api_type: enum
aliases: ["Enum.StudioPlaceUpdateFailureReason"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/StudioPlaceUpdateFailureReason"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes why a place publish or update operation failed in Roblox Studio.*

## Description

Describes why a place publish or update operation failed in Roblox Studio. This enum is passed as the `reason` parameter of the `GamePublishFinished` event when `success` is `false`.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Other` | 0 | The place publish or update failed for an unspecified or generic reason. |
| `TeamCreateConflict` | 1 | The place publish failed because a Team Create server currently holds a lock on the place. |

---
*Source: [StudioPlaceUpdateFailureReason](https://create.roblox.com/docs/reference/engine/enums/StudioPlaceUpdateFailureReason) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
