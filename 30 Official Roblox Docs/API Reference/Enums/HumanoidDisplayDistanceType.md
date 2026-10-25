---
title: "HumanoidDisplayDistanceType"
description: "HumanoidDisplayDistanceType determines how `Humanoid.HealthDisplayDistance`, and `Humanoid.NameDisplayDistance` are used in determining whether a players's name and health are visible to other players."
api_type: enum
aliases: ["Enum.HumanoidDisplayDistanceType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/HumanoidDisplayDistanceType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*HumanoidDisplayDistanceType determines how [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayDistance|Humanoid.HealthDisplayDistance]], and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameDisplayDistance|Humanoid.NameDisplayDistance]] are used in determining whether a players's name and health are visible to other players.*

## Description

HumanoidDisplayDistanceType determines how [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayDistance|Humanoid.HealthDisplayDistance]], and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameDisplayDistance|Humanoid.NameDisplayDistance]] are used in determining whether a players's name and health are visible to other players.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Viewer` | 0 | A player selecting `Viewer` on their [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] will see the Name and healthbar of other players if those other players are within the distance settings set in the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] selecting `Viewer` (this can be thought of as the lowest priority, and will not be taken into account if other players are selecting 'Subject' or 'None'). |
| `Subject` | 1 | A player selecting `Subject` on their [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] will allow other players to see their Name and healthbar if those other players are within the distance settings set in the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] selecting `Subject` (this can be thought of as the second highest priority). |
| `None` | 2 | A player selecting `None` on their [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] will not have their Name and healthbar displayed to other players under any circumstance (this can be thought of as the highest priority). |

---
*Source: [HumanoidDisplayDistanceType](https://create.roblox.com/docs/reference/engine/enums/HumanoidDisplayDistanceType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
