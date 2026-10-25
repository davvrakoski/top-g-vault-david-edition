---
title: "TeamCreateErrorState"
description: "Indicates the outcome of a Team Create place-upload attempt, as reported by the `TeamCreateErrorStatus` event on `TeamCreatePublishService`."
api_type: enum
aliases: ["Enum.TeamCreateErrorState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TeamCreateErrorState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the outcome of a Team Create place-upload attempt, as reported by the `TeamCreateErrorStatus` event on `TeamCreatePublishService`.*

## Description

`TeamCreateErrorState` is fired as the `result` argument of `TeamCreatePublishService.TeamCreateErrorStatus` after each Team Create auto-save or publish attempt. Studio clients use this value to update status indicators and surface warnings or errors to collaborators. Values reflect the outcome of serializing the place and comparing its size against the configured thresholds.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PlaceSizeTooLarge` | 0 | The serialized place size has exceeded the hard upload limit and the save was aborted. |
| `PlaceSizeApproachingLimit` | 1 | The serialized place size has reached or exceeded the public warning threshold but is still below the hard upload limit. |
| `PlaceUploadFailing` | 2 | Repeated upload attempts have failed due to HTTP or network errors, and the consecutive-failure count has reached the configured warning threshold. |
| `NoError` | 3 | The place serialized and uploaded successfully with no size-limit issues detected. |

---
*Source: [TeamCreateErrorState](https://create.roblox.com/docs/reference/engine/enums/TeamCreateErrorState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
