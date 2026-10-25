---
title: "DomainType"
description: "Specifies the type of domain that a `User` is scoped to."
api_type: enum
aliases: ["Enum.DomainType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DomainType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the type of domain that a [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] is scoped to.*

## Description

The **DomainType** enum describes the kind of domain in which a domain user ID is unique. It is used by the [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] data type to identify whether the user's ID belongs to an experience or an OAuth application.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `EXPERIENCE` | 1 | The user ID is scoped to a specific experience (universe). |
| `OAUTH` | 3 | The user ID is scoped to a specific OAuth application. |

---
*Source: [DomainType](https://create.roblox.com/docs/reference/engine/enums/DomainType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
