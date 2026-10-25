---
title: "ExperienceEventStatus"
description: "Describes the lifecycle state of a Roblox experience event as returned by `SocialService`."
api_type: enum
aliases: ["Enum.ExperienceEventStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ExperienceEventStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the lifecycle state of a Roblox experience event as returned by [[30 Official Roblox Docs/API Reference/Classes/SocialService|SocialService]].*

## Description

Describes the lifecycle state of a Roblox experience event. [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetExperienceEventAsync|SocialService:GetExperienceEventAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetUpcomingExperienceEventsAsync|SocialService:GetUpcomingExperienceEventsAsync()]] return event dictionaries whose `Status` field is a value of this enum, derived from the `eventStatus` field in the virtual-events API response. `GetUpcomingExperienceEventsAsync()` filters out events whose status is `Cancelled`, `Moderated`, or `Unpublished`, so only `Active` events appear in that list.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Active` | 0 | The event is currently published and available. |
| `Cancelled` | 1 | The event has been cancelled and will not occur. |
| `Moderated` | 2 | The event has been removed by moderation. |
| `Unpublished` | 3 | The event has been unpublished by the creator. |
| `Unknown` | 4 | The event status could not be determined. |

---
*Source: [ExperienceEventStatus](https://create.roblox.com/docs/reference/engine/enums/ExperienceEventStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
