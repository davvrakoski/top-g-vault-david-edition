---
title: "AvatarSettingsBuildMode"
description: "Determines whether players can freely scale their avatar body or whether the experience enforces custom scale ranges."
api_type: enum
aliases: ["Enum.AvatarSettingsBuildMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsBuildMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether players can freely scale their avatar body or whether the experience enforces custom scale ranges.*

## Description

Determines whether avatar body scaling in an experience uses full platform-wide limits (player's choice) or creator-defined custom ranges. This enum is used by the `BuildMode` property to control how avatar height, width, head, body type, and proportions scales are constrained when a player joins the experience.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PlayerChoice` | 0 | Players can scale their avatar body freely within the full platform-wide limits. This is the default value. |
| `CustomBuild` | 1 | The experience enforces creator-defined min/max ranges for avatar body scales (height, width, head, body type, and proportions), overriding the platform defaults. |

---
*Source: [AvatarSettingsBuildMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsBuildMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
