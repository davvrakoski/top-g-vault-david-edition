---
title: "SensorMode"
description: "Specifies whether a `ControllerPartSensor` targets floor or ladder geometry, and which detection algorithm to use."
api_type: enum
aliases: ["Enum.SensorMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SensorMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies whether a [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor|ControllerPartSensor]] targets floor or ladder geometry, and which detection algorithm to use.*

## Description

The [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode]] enum controls both the type of geometry a [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor|ControllerPartSensor]] targets (floor surfaces or ladder rungs) and the detection algorithm it applies. [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Floor]] and [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Ladder]] use the current sensing algorithms, while [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.ClassicFloor]] and [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.ClassicLadder]] preserve legacy behavior. The default value of [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensorMode|ControllerPartSensor.SensorMode]] is [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Floor]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Floor` | 0 | Detects floor surfaces below the part using the modern detection algorithm; the default value of [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensorMode\|ControllerPartSensor.SensorMode]]. |
| `Ladder` | 1 | Detects ladder surfaces adjacent to the part using the modern piercing-based detection algorithm. |
| `ClassicFloor` | 2 | Detects floor surfaces below the part using the legacy raycast-based algorithm. |
| `ClassicLadder` | 3 | Detects ladder surfaces adjacent to the part using the legacy ladder detection algorithm. |

---
*Source: [SensorMode](https://create.roblox.com/docs/reference/engine/enums/SensorMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
