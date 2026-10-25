---
title: "RtlTextSupport"
description: "Controls whether right-to-left text rendering is enabled for the experience."
api_type: enum
aliases: ["Enum.RtlTextSupport"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RtlTextSupport"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether right-to-left text rendering is enabled for the experience.*

## Description

Determines how [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] handles bidirectional text layout across the experience. Right-to-left (RTL) support allows UI text to flow from right to left, which is the natural reading direction for scripts such as Arabic and Hebrew. When set to [[30 Official Roblox Docs/API Reference/Enums/RtlTextSupport|Enum.RtlTextSupport.Default]] or [[30 Official Roblox Docs/API Reference/Enums/RtlTextSupport|Enum.RtlTextSupport.Enabled]], text-bearing UI elements correctly display these scripts, including proper text alignment and character ordering. Setting the property to [[30 Official Roblox Docs/API Reference/Enums/RtlTextSupport|Enum.RtlTextSupport.Disabled]] forces all text to render left-to-right regardless of the script's natural direction.

The [[30 Official Roblox Docs/API Reference/Classes/StarterGui#RtlTextSupport|StarterGui.RtlTextSupport]] property defaults to [[30 Official Roblox Docs/API Reference/Enums/RtlTextSupport|Enum.RtlTextSupport.Default]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Enables RTL text support using the engine's default behavior. |
| `Disabled` | 1 | Disables RTL text support, forcing all text to render left-to-right. |
| `Enabled` | 2 | Explicitly enables RTL text support for right-to-left scripts such as Arabic and Hebrew. |

---
*Source: [RtlTextSupport](https://create.roblox.com/docs/reference/engine/enums/RtlTextSupport) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
