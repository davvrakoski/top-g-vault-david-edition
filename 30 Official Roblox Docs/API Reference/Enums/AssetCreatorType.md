---
title: "AssetCreatorType"
description: "Indicates whether an asset is owned by an individual user or a group."
api_type: enum
aliases: ["Enum.AssetCreatorType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AssetCreatorType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates whether an asset is owned by an individual user or a group.*

## Description

Indicates whether an asset is owned by an individual user or a group. Used as the `CreatorType` field in the request parameters of [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateAssetAsync|AssetService:CreateAssetAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateAssetVersionAsync|AssetService:CreateAssetVersionAsync()]] to specify the type of entity that will own the resulting asset. When set to [[30 Official Roblox Docs/API Reference/Enums/AssetCreatorType|Enum.AssetCreatorType.User]], the accompanying `CreatorId` is interpreted as a user ID; when set to [[30 Official Roblox Docs/API Reference/Enums/AssetCreatorType|Enum.AssetCreatorType.Group]], it is interpreted as a group ID.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `User` | 0 | The asset is owned by an individual user; the accompanying creator ID is a user ID. |
| `Group` | 1 | The asset is owned by a group; the accompanying creator ID is a group ID. |

---
*Source: [AssetCreatorType](https://create.roblox.com/docs/reference/engine/enums/AssetCreatorType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
