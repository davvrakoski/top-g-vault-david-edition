---
title: "RenderingCacheOptimizationMode"
description: "Controls rendering cache optimization behavior."
api_type: enum
aliases: ["Enum.RenderingCacheOptimizationMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RenderingCacheOptimizationMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls rendering cache optimization behavior.*

## Description

Determines whether the renderer caches per-object rendering state to avoid redundant per-frame work. This enum is used by [[30 Official Roblox Docs/API Reference/Classes/Workspace#RenderingCacheOptimizations|Workspace.RenderingCacheOptimizations]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Uses the engine-default rendering cache state. |
| `Disabled` | 1 | Rendering cache optimizations are disabled. |
| `Enabled` | 2 | Rendering cache optimizations are enabled. |

---
*Source: [RenderingCacheOptimizationMode](https://create.roblox.com/docs/reference/engine/enums/RenderingCacheOptimizationMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
