---
title: "NegateOperationHiddenHistory"
description: "Records the CSG combination operation — Union or Intersection — that previously merged multiple `NegateOperation` parts, allowing the engine to restore the correct result type when those parts are later separated."
api_type: enum
aliases: ["Enum.NegateOperationHiddenHistory"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/NegateOperationHiddenHistory"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Records the CSG combination operation — Union or Intersection — that previously merged multiple [[30 Official Roblox Docs/API Reference/Classes/NegateOperation|NegateOperation]] parts, allowing the engine to restore the correct result type when those parts are later separated.*

## Description

Type of the `PreviousOperation` property. Records which CSG combination produced this [[30 Official Roblox Docs/API Reference/Classes/NegateOperation|NegateOperation]] — [[30 Official Roblox Docs/API Reference/Enums/NegateOperationHiddenHistory|Enum.NegateOperationHiddenHistory.NegatedUnion]] or [[30 Official Roblox Docs/API Reference/Enums/NegateOperationHiddenHistory|Enum.NegateOperationHiddenHistory.NegatedIntersection]] — so the engine can restore the correct output type when the solid is later separated. Defaults to [[30 Official Roblox Docs/API Reference/Enums/NegateOperationHiddenHistory|Enum.NegateOperationHiddenHistory.None]] when no prior combination history is recorded.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | Indicates no previous CSG combination operation is recorded for this [[30 Official Roblox Docs/API Reference/Classes/NegateOperation\|NegateOperation]] part. This is the default value of `PreviousOperation`. |
| `NegatedUnion` | 1 | Indicates this [[30 Official Roblox Docs/API Reference/Classes/NegateOperation\|NegateOperation]] was previously produced by a Union operation applied to multiple negated parts. |
| `NegatedIntersection` | 2 | Indicates this [[30 Official Roblox Docs/API Reference/Classes/NegateOperation\|NegateOperation]] was previously produced by an Intersection operation applied to multiple negated parts. |

---
*Source: [NegateOperationHiddenHistory](https://create.roblox.com/docs/reference/engine/enums/NegateOperationHiddenHistory) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
