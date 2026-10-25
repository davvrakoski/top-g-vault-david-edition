---
title: "AuthorityMode"
description: "Enum used with `Workspace.AuthorityMode`."
api_type: enum
aliases: ["Enum.AuthorityMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AuthorityMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Enum used with [[30 Official Roblox Docs/API Reference/Classes/Workspace#AuthorityMode|Workspace.AuthorityMode]].*

## Description

Enum used with [[30 Official Roblox Docs/API Reference/Classes/Workspace#AuthorityMode|Workspace.AuthorityMode]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Server` | 0 | Server authority with client side prediction and rollback enabled. |
| `Automatic` | 1 | Traditional distributed authority model where, for each instance, the engine decides whether the server or a client should be the authority; [[30 Official Roblox Docs/API Reference/Classes/BasePart#SetNetworkOwner\|BasePart:SetNetworkOwner()]] can be used to influence the decision. |

---
*Source: [AuthorityMode](https://create.roblox.com/docs/reference/engine/enums/AuthorityMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
