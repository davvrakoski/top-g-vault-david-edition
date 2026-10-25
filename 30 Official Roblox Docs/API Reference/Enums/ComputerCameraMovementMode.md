---
title: "ComputerCameraMovementMode"
description: "The camera movement mode currently in-use by the client."
api_type: enum
aliases: ["Enum.ComputerCameraMovementMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ComputerCameraMovementMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The camera movement mode currently in-use by the client.*

## Description

The camera movement mode currently in-use by the client.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | The default camera movement mode is classic. |
| `Classic` | 1 | Camera tracks the player but will not automatically rotate if the player walks left or right. |
| `Follow` | 2 | Camera tracks the player and automatically rotates if the player walks left or right. |
| `Orbital` | 3 | The camera has a fixed Y position, but can be rotated around the player. |
| `CameraToggle` | 4 | The camera toggles between locked and free rotation with the right mouse button. |

---
*Source: [ComputerCameraMovementMode](https://create.roblox.com/docs/reference/engine/enums/ComputerCameraMovementMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
