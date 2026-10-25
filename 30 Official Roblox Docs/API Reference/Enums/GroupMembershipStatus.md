---
title: "GroupMembershipStatus"
description: "Defines the possible outcomes of the `GroupService:PromptJoinAsync()` method."
api_type: enum
aliases: ["Enum.GroupMembershipStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/GroupMembershipStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Defines the possible outcomes of the [[30 Official Roblox Docs/API Reference/Classes/GroupService#PromptJoinAsync|GroupService:PromptJoinAsync()]] method.*

## Description

`GroupMembershipStatus` is an enumeration that represents the result of a player's interaction with the [[30 Official Roblox Docs/API Reference/Classes/GroupService#PromptJoinAsync|GroupService:PromptJoinAsync()]] method. It conveys the player's group membership status after the prompt.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | The player chose not to join, cancelled the prompt, or was not eligible to join the group. |
| `Joined` | 1 | The player successfully joined the group during the prompt. |
| `JoinRequestPending` | 2 | The player submitted a request to join the group, or already had a pending join request prior to prompting. |
| `AlreadyMember` | 3 | The player was already a member of the group. |

---
*Source: [GroupMembershipStatus](https://create.roblox.com/docs/reference/engine/enums/GroupMembershipStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
