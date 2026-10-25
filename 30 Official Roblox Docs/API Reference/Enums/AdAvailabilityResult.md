---
title: "AdAvailabilityResult"
description: "Indicates whether an ad is available or the reason it cannot be shown."
api_type: enum
aliases: ["Enum.AdAvailabilityResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AdAvailabilityResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates whether an ad is available or the reason it cannot be shown.*

## Description

Indicates whether an ad is available or the reason it cannot be shown.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `IsAvailable` | 1 | An ad is available to show the user. |
| `DeviceIneligible` | 2 | The device is ineligible to receive ads. |
| `ExperienceIneligible` | 3 | The experience is ineligible to receive ads. Check if its eligibility has been revoked. |
| `InternalError` | 4 | An unspecified internal error occurred. Try fetching the ad again. |
| `NoFill` | 5 | There are no ads available to fill your ad request. You might have hit the ad frequency limit. |
| `PlayerIneligible` | 6 | The user is ineligible to receive ads during this session. The user might be under 13 or located in a blocked region. |
| `PublisherIneligible` | 7 | The publisher is ineligible to receive ads because they have not met the publisher eligibility requirements. |

---
*Source: [AdAvailabilityResult](https://create.roblox.com/docs/reference/engine/enums/AdAvailabilityResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
