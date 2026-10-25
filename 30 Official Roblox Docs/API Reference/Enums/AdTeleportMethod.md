---
title: "AdTeleportMethod"
description: "Describes the method by which a player teleports during an immersive ad portal flow."
api_type: enum
aliases: ["Enum.AdTeleportMethod"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AdTeleportMethod"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the method by which a player teleports during an immersive ad portal flow.*

## Description

Describes the user-initiated method by which a player teleports during an immersive ad portal flow, distinguishing forward travel to the advertiser's experience from a return to the publisher's experience.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Undefined` | 0 | Default uninitialized sentinel value indicating that no teleport method has been determined yet. |
| `PortalForward` | 1 | The player teleported forward to the advertiser's destination experience by walking into an [[30 Official Roblox Docs/API Reference/Classes/AdPortal\|AdPortal]]. |
| `InGameMenuBackButton` | 2 | The player initiated a return teleport to the publisher's experience by pressing the back button in the in-game menu. |
| `UIBackButton` | 3 | The player initiated a return teleport to the publisher's experience by pressing a back button rendered in the ad destination's UI overlay. |

---
*Source: [AdTeleportMethod](https://create.roblox.com/docs/reference/engine/enums/AdTeleportMethod) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
