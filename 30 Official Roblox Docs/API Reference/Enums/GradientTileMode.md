---
title: "GradientTileMode"
description: "Used alongside `UIGradient.TileMode` to set how the gradient repeats."
api_type: enum
aliases: ["Enum.GradientTileMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/GradientTileMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used alongside [[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|UIGradient.TileMode]] to set how the gradient repeats.*

## Description

Used alongside [[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|UIGradient.TileMode]] to set how the gradient repeats when the full sequence does not fully cover the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Clamp` | 0 | Default mode where the color/transparency values at the start and end of the sequence extend infinitely, so the start values fill any area before the gradient and the end values fill any area after it. |
| `Repeat` | 1 | The gradient repeats by wrapping the color/transparency sequence tiles seamlessly from end back to start. This can produce a visible seam if the first and last color/transparency values in the sequence differ. |
| `Mirror` | 2 | The gradient reflects at each boundary so the color/transparency sequence ping-pongs. This produces a smooth repetition with no seam, since the direction reverses at each tile edge. |

---
*Source: [GradientTileMode](https://create.roblox.com/docs/reference/engine/enums/GradientTileMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
