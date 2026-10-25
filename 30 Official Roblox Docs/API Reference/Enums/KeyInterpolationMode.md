---
title: "KeyInterpolationMode"
description: "Describes the interpolation method between two keys."
api_type: enum
aliases: ["Enum.KeyInterpolationMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/KeyInterpolationMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the interpolation method between two keys.*

## Description

Describes the interpolation method for a [[30 Official Roblox Docs/API Reference/Classes/FloatCurve|FloatCurve]] or [[30 Official Roblox Docs/API Reference/Classes/RotationCurve|RotationCurve]] segment between the key for which this mode is set and the next key in the curve.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Constant` | 0 | The segment starting at this key will constantly evaluate to the value set at this key. |
| `Linear` | 1 | The segment starting at this key will evaluate using a linear interpolation at this key and the value at the next key. |
| `Cubic` | 2 | The segment starting at this key will evaluate using cubic interpolation of this key value using its right tangent and the next key value and its left tangent. |

---
*Source: [KeyInterpolationMode](https://create.roblox.com/docs/reference/engine/enums/KeyInterpolationMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
