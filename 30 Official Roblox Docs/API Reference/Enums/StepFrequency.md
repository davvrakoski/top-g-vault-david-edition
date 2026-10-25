---
title: "StepFrequency"
description: "Enum used with `RunService:BindToSimulation()` to indicate the frequency at which the bound function is called."
api_type: enum
aliases: ["Enum.StepFrequency"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/StepFrequency"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Enum used with [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|RunService:BindToSimulation()]] to indicate the frequency at which the bound function is called.*

## Description

Enum used with [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|RunService:BindToSimulation()]] to indicate the frequency at which the bound function is called during the simulation step.

The Roblox simulation pipeline runs at 60 Hz. Each `StepFrequency` value divides that base rate so the bound callback fires at the requested cadence and receives a `deltaTime` argument representing the simulation-time interval represented by the invocation. Choosing a lower frequency reduces per-frame overhead for logic that does not need to run every physics tick, such as periodic state checks. Because these callbacks run on the simulation step and can be replayed during client resimulation, avoid using them for actions that must occur exactly once, such as network replication. The default frequency for [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|RunService:BindToSimulation()]] is [[30 Official Roblox Docs/API Reference/Enums/StepFrequency|Enum.StepFrequency.Hz30]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Hz60` | 0 | The bound function is called at 60 Hz. |
| `Hz30` | 1 | The bound function is called at 30 Hz. |
| `Hz15` | 2 | The bound function is called at 15 Hz. |
| `Hz10` | 3 | The bound function is called at 10 Hz. |
| `Hz5` | 4 | The bound function is called at 5 Hz. |
| `Hz1` | 5 | The bound function is called at 1 Hz. |

---
*Source: [StepFrequency](https://create.roblox.com/docs/reference/engine/enums/StepFrequency) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
