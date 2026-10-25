---
title: "ReservedHighlightId"
description: "Identifies the built-in reserved role assigned to a `Highlight` via its `ReservedId` property."
api_type: enum
aliases: ["Enum.ReservedHighlightId"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ReservedHighlightId"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies the built-in reserved role assigned to a [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] via its `ReservedId` property.*

## Description

`ReservedHighlightId` enumerates the system-reserved roles used to distinguish Studio selection, hover, active (last-selected), and CSG visualization [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instances from ordinary developer-created ones. The `ReservedId` property (accessible only at `RobloxScript` security level and hidden from the Properties panel) stores this value. Its default is [[30 Official Roblox Docs/API Reference/Enums/ReservedHighlightId|Enum.ReservedHighlightId.Standard]], which marks the instance as a normal, non-reserved highlight available for general scripted use.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Standard` | 0 | Marks a [[30 Official Roblox Docs/API Reference/Classes/Highlight\|Highlight]] as a standard, non-reserved instance not tied to any built-in system state. |
| `Active` | 131072 | Marks a [[30 Official Roblox Docs/API Reference/Classes/Highlight\|Highlight]] as the last-selected object in Studio. |
| `Hover` | 262144 | Marks a [[30 Official Roblox Docs/API Reference/Classes/Highlight\|Highlight]] as the hover-state indicator, applied to an object currently under the mouse cursor. |
| `Selection` | 524288 | Marks a [[30 Official Roblox Docs/API Reference/Classes/Highlight\|Highlight]] as the selection-state indicator, applied to a selected object in Studio. |
| `NegatedPart` | 1048576 | Marks a [[30 Official Roblox Docs/API Reference/Classes/Highlight\|Highlight]] used for CSG negated-part visualization in Roblox Studio. |

---
*Source: [ReservedHighlightId](https://create.roblox.com/docs/reference/engine/enums/ReservedHighlightId) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
