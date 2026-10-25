---
title: "ComputerMovementMode"
description: "The computer movement type in-use by the client."
api_type: enum
aliases: ["Enum.ComputerMovementMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ComputerMovementMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The computer movement type in-use by the client.*

## Description

Describes the movement control scheme currently active for the local player on a computer. This value is read from [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#ComputerMovementMode|UserGameSettings.ComputerMovementMode]] and reflects the scheme in use at runtime, whether chosen by the player or enforced by the developer via [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevComputerMovementMode|StarterPlayer.DevComputerMovementMode]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | The movement mode has not been explicitly set and behaves identically to `KeyboardMouse`. |
| `KeyboardMouse` | 1 | The player moves their character using keyboard keys and steers the camera with the mouse. |
| `ClickToMove` | 2 | The player moves their character by clicking a destination in the game world; the character automatically navigates there and jumps over surmountable obstacles. |

---
*Source: [ComputerMovementMode](https://create.roblox.com/docs/reference/engine/enums/ComputerMovementMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
