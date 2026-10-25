---
title: "TriStateBoolean"
description: "A three-state boolean enumeration used by `PolicyService` to represent a value that is explicitly `True`, explicitly `False`, or not yet resolved (`Unknown`)."
api_type: enum
aliases: ["Enum.TriStateBoolean"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TriStateBoolean"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*A three-state boolean enumeration used by [[30 Official Roblox Docs/API Reference/Classes/PolicyService|PolicyService]] to represent a value that is explicitly `True`, explicitly `False`, or not yet resolved (`Unknown`).*

## Description

A three-state boolean that extends a standard boolean with [[30 Official Roblox Docs/API Reference/Enums/TriStateBoolean|Enum.TriStateBoolean.Unknown]] for values not yet determined. Used by [[30 Official Roblox Docs/API Reference/Classes/PolicyService|PolicyService]] for region-specific platform states that may be unknown before policy queries complete. Defaults to [[30 Official Roblox Docs/API Reference/Enums/TriStateBoolean|Enum.TriStateBoolean.Unknown]] until explicitly set.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | Indicates the condition has not yet been determined or resolved; the default value. |
| `True` | 1 | Indicates the condition is explicitly true. |
| `False` | 2 | Indicates the condition is explicitly false. |

---
*Source: [TriStateBoolean](https://create.roblox.com/docs/reference/engine/enums/TriStateBoolean) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
