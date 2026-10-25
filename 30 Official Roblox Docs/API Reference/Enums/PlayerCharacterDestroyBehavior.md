---
title: "PlayerCharacterDestroyBehavior"
description: "Controls destruction behavior when a player character is removed."
api_type: enum
aliases: ["Enum.PlayerCharacterDestroyBehavior"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PlayerCharacterDestroyBehavior"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls destruction behavior when a player character is removed.*

## Description

Controls whether the engine automatically calls `Destroy()` on a player's old character when it is replaced and on the `Player` object when the player leaves. This enum is used by [[30 Official Roblox Docs/API Reference/Classes/Workspace#PlayerCharacterDestroyBehavior|Workspace.PlayerCharacterDestroyBehavior]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Uses the engine-default behavior. |
| `Disabled` | 1 | Automatic `Destroy()` calls on character replacement and player removal are disabled. |
| `Enabled` | 2 | The engine automatically calls `Destroy()` on old characters when they are replaced (for example, on respawn) and on `Player` objects when players leave. |

---
*Source: [PlayerCharacterDestroyBehavior](https://create.roblox.com/docs/reference/engine/enums/PlayerCharacterDestroyBehavior) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
