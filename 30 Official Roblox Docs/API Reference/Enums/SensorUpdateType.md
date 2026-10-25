---
title: "SensorUpdateType"
description: "Controls when a sensor recalculates its output properties."
api_type: enum
aliases: ["Enum.SensorUpdateType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SensorUpdateType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls when a sensor recalculates its output properties.*

## Description

Controls when a sensor recalculates its output properties. Assign this enum to the `UpdateType` property on any [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]]‑derived instance ([[30 Official Roblox Docs/API Reference/Classes/ControllerSensor|ControllerSensor]], [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor|FluidForceSensor]], [[30 Official Roblox Docs/API Reference/Classes/AtmosphereSensor|AtmosphereSensor]]) to choose between automatic lazy evaluation and fully manual control.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `OnRead` | 0 | The sensor lazily recalculates its output the next time an output property is read and the output is marked dirty. |
| `Manual` | 1 | The sensor never automatically recalculates its output; scripts are responsible for driving output updates. |

---
*Source: [SensorUpdateType](https://create.roblox.com/docs/reference/engine/enums/SensorUpdateType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
