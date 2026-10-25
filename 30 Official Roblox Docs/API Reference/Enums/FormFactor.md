---
title: "FormFactor"
description: "Deprecated enum that previously controlled the minimum size and resize increment of a `FormFactorPart` along each axis."
api_type: enum
aliases: ["Enum.FormFactor"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FormFactor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Deprecated enum that previously controlled the minimum size and resize increment of a [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]] along each axis.*

> [!warning] Deprecated
> This item is deprecated as parts no longer contain a FormFactor to determine
> their minimum size. The minimum size of all parts now behaves like "Custom" by
> default.

## Description

The FormFactor Enum for [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart#FormFactor|FormFactorPart.FormFactor]].

Minimum size along a given axis is 1 \* RateOfIncrease for that axis, except in the case of the "Custom" FormFactor, which has a minimum size of 0.2 along all axes.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Symmetric` | 0 | Increases by a rate of 1 along all axes. |
| `Brick` | 1 | Increases by a rate of 1 along the x- and z- axes, 1.2 along the y-axis. |
| `Plate` | 2 | Increases by a rate of 1 along the x- and z- axes, 0.4 along the y-axis. |
| `Custom` | 3 | Increases by a rate as low as .001 along all axes. |

---
*Source: [FormFactor](https://create.roblox.com/docs/reference/engine/enums/FormFactor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
