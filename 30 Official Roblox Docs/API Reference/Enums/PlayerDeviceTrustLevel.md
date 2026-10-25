---
title: "PlayerDeviceTrustLevel"
description: "The trust level of a player's device."
api_type: enum
aliases: ["Enum.PlayerDeviceTrustLevel"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PlayerDeviceTrustLevel"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The trust level of a player's device.*

## Description

The trust level of a player's device as reported by [[30 Official Roblox Docs/API Reference/Classes/Player|Player.DeviceTrustLevel]]. The trust level describes the device, not the player or their account.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Pending` | 0 | Roblox is still checking the device. Every player starts at this level, and some players might stay at it for the whole session. |
| `Unknown` | 1 | Roblox can't tell whether the device is trusted, because the player is on an unsupported platform or an error occurred on the Roblox side. The device might or might not be trustworthy. |
| `None` | 2 | The device failed the check, or the player is on a platform that can't be verified. |
| `Standard` | 3 | The device passed some of the checks, but not all of them. |
| `Full` | 4 | The device passed every check. |

---
*Source: [PlayerDeviceTrustLevel](https://create.roblox.com/docs/reference/engine/enums/PlayerDeviceTrustLevel) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
