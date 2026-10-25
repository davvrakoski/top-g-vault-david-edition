---
title: "PredictionStatus"
description: "Enum used with `RunService:GetPredictionStatus()` to check the status of a specific instance."
api_type: enum
aliases: ["Enum.PredictionStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PredictionStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Enum used with [[30 Official Roblox Docs/API Reference/Classes/RunService#GetPredictionStatus|RunService:GetPredictionStatus()]] to check the status of a specific instance.*

## Description

Enum used with [[30 Official Roblox Docs/API Reference/Classes/RunService#GetPredictionStatus|RunService:GetPredictionStatus()]] to check the status of a specific instance.

This prediction status can be used to determine whether any associated scripts should run. If the status is `Authoritative` or `Predicted`, such scripts should run, since the local node is either the authority for the instance or is predicting it. If the status is `None`, such scripts do not need to run.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Authoritative` | 0 | This instance is authoritative. |
| `Predicted` | 1 | This instance is being predicted. |
| `None` | 2 | The instance will not be resimulated; classic simulation rules apply instead. |

---
*Source: [PredictionStatus](https://create.roblox.com/docs/reference/engine/enums/PredictionStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
