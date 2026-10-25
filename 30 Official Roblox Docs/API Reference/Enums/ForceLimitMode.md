---
title: "ForceLimitMode"
description: "The **ForceLimitMode** enum determines how the maximum force for a constraint is specified and how that limit is enforced by the constraint."
api_type: enum
aliases: ["Enum.ForceLimitMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ForceLimitMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The **ForceLimitMode** enum determines how the maximum force for a constraint is specified and how that limit is enforced by the constraint.*

## Description

This enum is used to determine how the maximum force for a constraint is specified and how that limit will be enforced by the constraint.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Magnitude` | 0 | A single number is used to specify the magnitude of the maximum constraint force. The constraint will ensure that the force it applies will have a magnitude that is less than this limit. |
| `PerAxis` | 1 | A vector is used to specify the maximum force value along each axis of a given reference frame. The constraint will ensure that each component of the force will have an absolute value that's less than the corresponding vector entry. |

---
*Source: [ForceLimitMode](https://create.roblox.com/docs/reference/engine/enums/ForceLimitMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
