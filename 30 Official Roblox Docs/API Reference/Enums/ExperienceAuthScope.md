---
title: "ExperienceAuthScope"
description: "Enumerates the authorization scopes an experience can request when prompting a creator for permission to access their assets."
api_type: enum
aliases: ["Enum.ExperienceAuthScope"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ExperienceAuthScope"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Enumerates the authorization scopes an experience can request when prompting a creator for permission to access their assets.*

## Description

Enumerates the authorization scopes passed to `ExperienceAuthService` when an experience needs to request specific permissions from a creator. Each value maps to an underlying OAuth-style token scope: `CreatorAssetsCreate` resolves to `asset:*:read,write`, granting the experience read and write access to the creator's assets for the duration of the session.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `DefaultScope` | 0 | The base scope (value `0`) representing no additional permissions; used internally when no specific asset authorization is required. |
| `CreatorAssetsCreate` | 1 | Requests read and write access to the creator's assets; maps to the `asset:*:read,write` authorization token scope. |

---
*Source: [ExperienceAuthScope](https://create.roblox.com/docs/reference/engine/enums/ExperienceAuthScope) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
