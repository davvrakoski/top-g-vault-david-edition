---
title: "AnimationNodeBlendMode"
description: "Specifies how an `Enum.AnimationNodeType.OneShotNode` combines its one-shot pose with its base pose."
api_type: enum
aliases: ["Enum.AnimationNodeBlendMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AnimationNodeBlendMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies how an [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType.OneShotNode]] combines its one-shot pose with its base pose.*

## Description

Used by the [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType.OneShotNode]] to choose the blend operation applied to its one-shot input as it layers over the base input. Mirrors the behavior of the [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType.OverNode]], [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType.AddNode]], and [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType.SubtractNode]] nodes.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Over` | 0 | Composites the one-shot pose on top of the base pose, replacing it by the current blend weight. |
| `Add` | 1 | Adds the one-shot pose to the base pose as an additive layer scaled by the current blend weight. |
| `Subtract` | 2 | Subtracts the one-shot pose from the base pose scaled by the current blend weight. |

---
*Source: [AnimationNodeBlendMode](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeBlendMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
