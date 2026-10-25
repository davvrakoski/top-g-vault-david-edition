---
title: "TickCountSampleMethod"
description: "Controls the precision and performance trade-off used when sampling the current time."
api_type: enum
aliases: ["Enum.TickCountSampleMethod"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TickCountSampleMethod"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls the precision and performance trade-off used when sampling the current time.*

## Description

Controls the precision and performance trade-off used when sampling the current time via [[30 Official Roblox Docs/API Reference/Classes/DebugSettings#TickCountPreciseOverride|DebugSettings.TickCountPreciseOverride]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Fast` | 0 | Compute time using a faster, but less precise method. |
| `Benchmark` | 1 | Dynamically decide between using `Fast` and `Precise` depending on the value of `DebugSettings.TickCountPreciseOverride`. |
| `Precise` | 2 | Compute time using a precise method. |

---
*Source: [TickCountSampleMethod](https://create.roblox.com/docs/reference/engine/enums/TickCountSampleMethod) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
