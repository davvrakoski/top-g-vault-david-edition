---
title: "AvatarSettingsHitAndTouchDetectionMode"
description: "Determines whether hit detection and spatial queries use the individual body parts or the single collider when `AvatarCollisionRules.CollisionMode` is `Enum.AvatarSettingsCollisionMode.SingleCollider`."
api_type: enum
aliases: ["Enum.AvatarSettingsHitAndTouchDetectionMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsHitAndTouchDetectionMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether hit detection and spatial queries use the individual body parts or the single collider when `AvatarCollisionRules.CollisionMode` is [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCollisionMode|Enum.AvatarSettingsCollisionMode.SingleCollider]].*

## Description

Determines whether [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanTouch|BasePart.CanTouch]] (hit detection) and [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|BasePart.CanQuery]] (spatial queries) are routed to the individual avatar body parts or to the single collider part. Only takes effect when `AvatarCollisionRules.CollisionMode` is [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCollisionMode|Enum.AvatarSettingsCollisionMode.SingleCollider]]; in other collision modes it is ignored.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `UseParts` | 0 | Individual avatar body parts handle `Touched` events and spatial queries (`CanTouch` and `CanQuery` enabled on body parts) while the single collider part has `CanTouch` and `CanQuery` disabled. This is the default value for `AvatarCollisionRules.HitAndTouchDetectionMode`. |
| `UseCollider` | 1 | The single collider part handles `Touched` events and spatial queries (`CanTouch` and `CanQuery` enabled on the collider) while all individual body parts have `CanTouch` and `CanQuery` disabled. |

---
*Source: [AvatarSettingsHitAndTouchDetectionMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsHitAndTouchDetectionMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
