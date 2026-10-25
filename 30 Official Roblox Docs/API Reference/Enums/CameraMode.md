---
title: "CameraMode"
description: "Used to set `Player.CameraMode` to determine when first person and third person cameras should be used."
api_type: enum
aliases: ["Enum.CameraMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CameraMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used to set [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMode|Player.CameraMode]] to determine when first person and third person cameras should be used.*

## Description

The **CameraMode** enum is used to set [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMode|Player.CameraMode]] to determine when first person and third person cameras should be used.

#### Third Person

In the default third person mode ([[30 Official Roblox Docs/API Reference/Enums/CameraMode|Classic]]), the character can be seen in the camera. While in this mode, the default behavior is:

- Players can right-click and drag (mouse), tap and drag (mobile), use the secondary thumbstick (gamepad), or press the left/right arrows (keyboard) to rotate the camera around their character.
- When a player moves their character, it faces in the corresponding movement direction.
- Players can zoom in and out freely, even to first person on full zoom in.

#### First Person

In first person mode ([[30 Official Roblox Docs/API Reference/Enums/CameraMode|LockFirstPerson]]), the player's camera is zoomed all the way in. Unless there is a visible GUI present with the [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Modal|GuiButton.Modal]] property set to `true`, moving the mouse, tap-dragging on mobile, or using the secondary thumbstick on a gamepad will rotate the camera around the character.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Classic` | 0 | Third person camera which can be zoomed into first person. |
| `LockFirstPerson` | 1 | Exclusively first person camera. |

---
*Source: [CameraMode](https://create.roblox.com/docs/reference/engine/enums/CameraMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
