---
title: "PlayerDeviceTrustDecision"
description: "The decision that `IntegrityService.EvaluatePlayerDeviceTrust` returns for a player."
api_type: enum
aliases: ["Enum.PlayerDeviceTrustDecision"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PlayerDeviceTrustDecision"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The decision that [IntegrityService.EvaluatePlayerDeviceTrust](https://create.roblox.com/docs/reference/engine/classes/IntegrityService#EvaluatePlayerDeviceTrust) returns for a player.*

## Description

The decision that [IntegrityService.EvaluatePlayerDeviceTrust](https://create.roblox.com/docs/reference/engine/classes/IntegrityService#EvaluatePlayerDeviceTrust) returns in the `Action` field of its result, which tells Roblox whether a player can stay in the server based on their device trust level.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Accept` | 0 | The player stays in the server. |
| `Reject` | 1 | The player is disconnected from the server and sees a rejection message. |

---
*Source: [PlayerDeviceTrustDecision](https://create.roblox.com/docs/reference/engine/enums/PlayerDeviceTrustDecision) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
