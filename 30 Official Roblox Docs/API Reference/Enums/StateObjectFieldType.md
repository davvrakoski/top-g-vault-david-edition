---
title: "StateObjectFieldType"
description: "Identifies the data type of a field in a deprecated `StateObject`; all values are deprecated and the enum is retained only for backward compatibility."
api_type: enum
aliases: ["Enum.StateObjectFieldType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/StateObjectFieldType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies the data type of a field in a deprecated `StateObject`; all values are deprecated and the enum is retained only for backward compatibility.*

## Description

`StateObjectFieldType` formerly described the data type of a field within a `StateObject`. All enum values are deprecated. The enum itself is not used by engine code and is preserved solely so that existing creator scripts that reference it continue to function. New code should not depend on this enum.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Boolean` | 0 | **Deprecated.** A boolean field. |
| `CFrame` | 1 | **Deprecated.** A [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] field. |
| `Color3` | 2 | **Deprecated.** A [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] field. |
| `Float` | 3 | **Deprecated.** A floating-point number field. |
| `Instance` | 4 | **Deprecated.** An [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] reference field. |
| `Random` | 5 | **Deprecated.** A [[30 Official Roblox Docs/API Reference/Datatypes/Random\|Random]] field. |
| `Vector2` | 6 | **Deprecated.** A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] field. |
| `Vector3` | 7 | **Deprecated.** A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] field. |
| `INVALID` | 8 | **Deprecated.** An invalid or unrecognized field type. |

---
*Source: [StateObjectFieldType](https://create.roblox.com/docs/reference/engine/enums/StateObjectFieldType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
