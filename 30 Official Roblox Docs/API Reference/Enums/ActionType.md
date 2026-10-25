---
title: "ActionType"
description: "Describes the outcome of a game action, such as winning, losing, or drawing."
api_type: enum
aliases: ["Enum.ActionType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ActionType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the outcome of a game action, such as winning, losing, or drawing.*

## Description

Legacy enum historically used with the player-points and badge-award system to classify game results. No current engine API property or method accepts or returns this enum; it remains in the Luau reflection system for backward compatibility.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Nothing` | 0 | No specific game action occurred. |
| `Pause` | 1 | The game or round was paused. |
| `Lose` | 2 | The player lost the game or round. |
| `Draw` | 3 | The game or round ended in a draw with no winner. |
| `Win` | 4 | The player won the game or round. |

---
*Source: [ActionType](https://create.roblox.com/docs/reference/engine/enums/ActionType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
