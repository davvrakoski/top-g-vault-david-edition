---
title: "RsvpStatus"
description: "Indicates a player's RSVP response to a Roblox experience event."
api_type: enum
aliases: ["Enum.RsvpStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RsvpStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates a player's RSVP response to a Roblox experience event.*

## Description

Indicates a player's RSVP response to a Roblox experience event. [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetEventRsvpStatusAsync|SocialService:GetEventRsvpStatusAsync()]] returns a value of this enum to reflect whether a player has responded to an event invitation, and `PromptRsvpToEventCompleted` passes both the new and previous status as `RsvpStatus` values when a player finishes interacting with the RSVP prompt.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | The player has not yet responded to the event invitation; this is the default RSVP state. |
| `Going` | 1 | The player has accepted the event invitation and confirmed they are going. |
| `NotGoing` | 2 | The player has declined the event invitation and indicated they are not going. |

---
*Source: [RsvpStatus](https://create.roblox.com/docs/reference/engine/enums/RsvpStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
