---
title: "AvatarSettingsCustomBodyType"
description: "Determines whether an experience's custom body override is identified by individual asset references or by a single bundle ID."
api_type: enum
aliases: ["Enum.AvatarSettingsCustomBodyType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsCustomBodyType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether an experience's custom body override is identified by individual asset references or by a single bundle ID.*

## Description

This enum is used by the `CustomBodyType` property to control how a custom avatar body is specified when `AppearanceMode` is set to `CustomBody`. The default value is [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCustomBodyType|Enum.AvatarSettingsCustomBodyType.AvatarReference]].

When set to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCustomBodyType|Enum.AvatarSettingsCustomBodyType.AvatarReference]], the avatar body is assembled from per-part asset IDs configured on `AvatarBodyRules` (head, torso, arms, legs, etc.). When set to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCustomBodyType|Enum.AvatarSettingsCustomBodyType.BundleId]], the entire body is sourced from the bundle specified in `CustomBodyBundleId`.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `AvatarReference` | 0 | **Deprecated.** The custom body is assembled from individual per-part asset references on `AvatarBodyRules`. This is the default value. |
| `BundleId` | 1 | **Deprecated.** The custom body is sourced from a single avatar bundle, identified by the `CustomBodyBundleId` property. |

---
*Source: [AvatarSettingsCustomBodyType](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsCustomBodyType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
