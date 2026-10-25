---
title: "AvatarSettingsLegacyCollisionMode"
description: "Determines which legacy collision geometry is applied to R15 avatars when `Enum.AvatarSettingsCollisionMode` is set to Legacy."
api_type: enum
aliases: ["Enum.AvatarSettingsLegacyCollisionMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsLegacyCollisionMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines which legacy collision geometry is applied to R15 avatars when [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCollisionMode|Enum.AvatarSettingsCollisionMode]] is set to Legacy.*

## Description

When the avatar collision rules' `CollisionMode` is set to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCollisionMode|Legacy]], this enum selects which collision strategy the engine uses for R15 characters. `InnerBoxColliders` replaces each mesh part's physics data with inner-box geometry derived from the standard R15 scaling model, while `R6Colliders` creates six invisible box parts that approximate the classic R6 body shape.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `R6Colliders` | 0 | **Deprecated.** Creates six invisible box collider parts welded to R15 limbs to approximate classic R6 collision geometry. The engine spawns six invisible [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]] instances (head, torso, left arm, right arm, left leg, right leg) parented to the character and welded to the corresponding R15 body parts. All original R15 mesh parts have their [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide\|BasePart.CanCollide]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanTouch\|BasePart.CanTouch]], and [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery\|BasePart.CanQuery]] disabled and are made massless; only the HumanoidRootPart retains mass so it remains the physics assembly root. |
| `InnerBoxColliders` | 1 | **Deprecated.** Overrides each R15 mesh part's collision physics with inner-box geometry derived from the standard R15 scaling model. The engine recalculates every [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] in the character with collision data from the default R15 model's bounding dimensions, producing tighter collision volumes that follow the avatar's proportions without adding extra parts. This is the default value of `LegacyCollisionMode`. |

---
*Source: [AvatarSettingsLegacyCollisionMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsLegacyCollisionMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
