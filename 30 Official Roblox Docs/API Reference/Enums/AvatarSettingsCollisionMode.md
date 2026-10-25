---
title: "AvatarSettingsCollisionMode"
description: "Determines the collision geometry mode for avatars managed by `AvatarCollisionRules`."
api_type: enum
aliases: ["Enum.AvatarSettingsCollisionMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsCollisionMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the collision geometry mode for avatars managed by `AvatarCollisionRules`.*

## Description

Determines the collision geometry mode for avatars managed by `AvatarCollisionRules`. [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCollisionMode|Enum.AvatarSettingsCollisionMode.Default]] uses each body part's native collision geometry. [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCollisionMode|Enum.AvatarSettingsCollisionMode.SingleCollider]] replaces per-part collision with a single box collider welded to the HumanoidRootPart. [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCollisionMode|Enum.AvatarSettingsCollisionMode.Legacy]] delegates to the `LegacyCollisionMode` setting.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Each body part uses its native collision geometry. The HumanoidRootPart, UpperTorso, and LowerTorso collide while other parts do not. This is the default value for `CollisionMode`. |
| `SingleCollider` | 1 | A single box-shaped collider part replaces all per-part collision. The collider is welded to the HumanoidRootPart and sized by `SingleColliderSize` (default 2, 3, 1). All other parts become non-collidable and massless. |
| `Legacy` | 2 | Collision geometry is determined by `LegacyCollisionMode`, which selects either inner-box colliders or R6-style colliders. |

---
*Source: [AvatarSettingsCollisionMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsCollisionMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
