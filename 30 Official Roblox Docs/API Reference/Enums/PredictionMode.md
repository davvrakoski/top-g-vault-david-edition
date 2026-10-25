---
title: "PredictionMode"
description: "Enum used with `RunService:SetPredictionMode()` to define the prediction mode for the instance."
api_type: enum
aliases: ["Enum.PredictionMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PredictionMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Enum used with [[30 Official Roblox Docs/API Reference/Classes/RunService#SetPredictionMode|RunService:SetPredictionMode()]] to define the prediction mode for the instance.*

## Description

Enum used with [[30 Official Roblox Docs/API Reference/Classes/RunService#SetPredictionMode|RunService:SetPredictionMode()]] to define the prediction mode for the instance.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Automatic` | 0 | The engine will automatically decide if this instance should be predicted or not. Currently, only [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] near the local player character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] will be predicted within a dynamic radius that grows and shrinks based on the device's capability to handle the simulation load. |
| `On` | 1 | The instance will be predicted. Mismatches in the attributes of this instance between the client and server will cause a rollback and resimulation. If the instance is a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]], its physics properties will be predicted ahead of the replicated authoritative server state. |
| `Off` | 2 | The instance will **not** be predicted. Regular network ownership semantics apply. |

---
*Source: [PredictionMode](https://create.roblox.com/docs/reference/engine/enums/PredictionMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
