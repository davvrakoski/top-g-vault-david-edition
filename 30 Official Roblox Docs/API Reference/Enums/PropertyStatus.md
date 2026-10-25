---
title: "PropertyStatus"
description: "Indicates the validation state of a property as displayed in Roblox Studio's Properties panel."
api_type: enum
aliases: ["Enum.PropertyStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PropertyStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the validation state of a property as displayed in Roblox Studio's Properties panel.*

## Description

Indicates the validation state of a property as displayed in Roblox Studio's Properties panel. This enum is returned by the `PropertyStatusStudio` property on [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] and by `GetOverrideStatus()` on [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]] to communicate whether a property's current value is valid, has a recoverable issue, or is in an error state.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Ok` | 0 | The property value is valid; no status indicator is shown in Studio. |
| `Warning` | 1 | The property value has a recoverable issue; Studio displays a warning indicator on the instance. |
| `Error` | 2 | The property value is invalid and cannot be resolved; Studio displays an error indicator on the instance. |

---
*Source: [PropertyStatus](https://create.roblox.com/docs/reference/engine/enums/PropertyStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
