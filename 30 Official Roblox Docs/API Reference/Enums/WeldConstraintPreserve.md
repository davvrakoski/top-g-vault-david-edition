---
title: "WeldConstraintPreserve"
description: "Controls which `WeldConstraints` are included in the recommendation table returned by `GeometryService:CalculateConstraintsToPreserve()`."
api_type: enum
aliases: ["Enum.WeldConstraintPreserve"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/WeldConstraintPreserve"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls which [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] are included in the recommendation table returned by [[30 Official Roblox Docs/API Reference/Classes/GeometryService#CalculateConstraintsToPreserve|GeometryService:CalculateConstraintsToPreserve()]].*

## Description

Controls which [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] are included in the recommendation table returned by [[30 Official Roblox Docs/API Reference/Classes/GeometryService#CalculateConstraintsToPreserve|GeometryService:CalculateConstraintsToPreserve()]] after a solid modeling operation such as [[30 Official Roblox Docs/API Reference/Classes/GeometryService#UnionAsync|GeometryService:UnionAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GeometryService#SubtractAsync|GeometryService:SubtractAsync()]], or [[30 Official Roblox Docs/API Reference/Classes/GeometryService#IntersectAsync|GeometryService:IntersectAsync()]]. Pass this enum as the `weldConstraintPreserve` key inside the `options` dictionary argument to that method. The default value used when no option is specified is [[30 Official Roblox Docs/API Reference/Enums/WeldConstraintPreserve|Enum.WeldConstraintPreserve.Touching]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `All` | 0 | All [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint\|WeldConstraints]] will be returned in the recommended table. |
| `None` | 1 | [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint\|WeldConstraints]] will be ignored and not returned in the recommended table. |
| `Touching` | 2 | Only [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint\|WeldConstraints]] that connect touching parts in the performed operation will be returned in the recommended table. |

---
*Source: [WeldConstraintPreserve](https://create.roblox.com/docs/reference/engine/enums/WeldConstraintPreserve) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
