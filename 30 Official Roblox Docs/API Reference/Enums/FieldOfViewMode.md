---
title: "FieldOfViewMode"
description: "Determines which field-of-view angle a `Camera` holds constant when the viewport is resized."
api_type: enum
aliases: ["Enum.FieldOfViewMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FieldOfViewMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines which field-of-view angle a [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] holds constant when the viewport is resized.*

## Description

[[30 Official Roblox Docs/API Reference/Enums/FieldOfViewMode|Enum.FieldOfViewMode]] controls which field-of-view (FOV) measurement the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] treats as invariant when the viewport dimensions change. When the viewport is resized, the engine recalculates the other FOV values to keep the chosen axis constant. Used by [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfViewMode|FieldOfViewMode]], which defaults to [[30 Official Roblox Docs/API Reference/Enums/FieldOfViewMode|Enum.FieldOfViewMode.Vertical]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Vertical` | 0 | The camera holds its vertical field of view constant when the viewport is resized. |
| `Diagonal` | 1 | The camera holds its diagonal field of view constant when the viewport is resized. |
| `MaxAxis` | 2 | The camera holds the field of view along the longer viewport axis constant when the viewport is resized. |

---
*Source: [FieldOfViewMode](https://create.roblox.com/docs/reference/engine/enums/FieldOfViewMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
