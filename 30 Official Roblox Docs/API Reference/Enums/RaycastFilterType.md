---
title: "RaycastFilterType"
description: "Used in a `RaycastParams` object to determine how its `FilterDescendantsInstances` list will be used."
api_type: enum
aliases: ["Enum.RaycastFilterType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RaycastFilterType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used in a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]] object to determine how its [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#FilterDescendantsInstances|FilterDescendantsInstances]] list will be used.*

## Description

Used in a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]] object to determine how its [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#FilterDescendantsInstances|FilterDescendantsInstances]] list will be used.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Exclude` | 0 | Every [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] in the raycast operation will be considered **except** those that are descendants of objects in the filter list. |
| `Include` | 1 | Only [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] which are descendants of objects in the filter list will be considered in the raycast operation. |

---
*Source: [RaycastFilterType](https://create.roblox.com/docs/reference/engine/enums/RaycastFilterType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
