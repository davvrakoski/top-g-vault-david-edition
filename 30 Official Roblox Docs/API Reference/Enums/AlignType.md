---
title: "AlignType"
description: "An enum that specifies how the constraint will attempt to align the body associated with the constraint."
api_type: enum
aliases: ["Enum.AlignType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AlignType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*An enum that specifies how the constraint will attempt to align the body associated with the constraint.*

## Description

An enum that specifies how the constraint will attempt to align the body associated with the constraint and attachment. Depending on the configuration, it can be used to align specific axes to be parallel, perpendicular, or to look at a specific point.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Parallel` | 0 | **Deprecated.**  |
| `Perpendicular` | 1 | **Deprecated.**  |
| `PrimaryAxisParallel` | 2 | Aligns the primary axis to be parallel to the axis given by [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Constraint.Attachment1]]. |
| `PrimaryAxisPerpendicular` | 3 | Aligns the primary axis to be perpendicular to the axis given by [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Constraint.Attachment1]]. |
| `PrimaryAxisLookAt` | 4 | Aligns the primary axis to look at the point given by [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Constraint.Attachment1]] or the [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#LookAtPosition\|AlignOrientation.LookAtPosition]]. |
| `AllAxes` | 5 | Aligns all of the axes of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Constraint.Attachment0]] to the axes given by [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Constraint.Attachment1]] or to the target orientation provided by [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#PrimaryAxis\|AlignOrientation.PrimaryAxis]] and [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#SecondaryAxis\|AlignOrientation.SecondaryAxis]]. |

---
*Source: [AlignType](https://create.roblox.com/docs/reference/engine/enums/AlignType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
