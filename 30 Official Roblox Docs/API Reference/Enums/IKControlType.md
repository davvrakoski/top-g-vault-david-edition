---
title: "IKControlType"
description: "Used on `IKControl` to specify their `Type`, to change their behavior."
api_type: enum
aliases: ["Enum.IKControlType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/IKControlType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used on [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] to specify their [[30 Official Roblox Docs/API Reference/Classes/IKControl#Type|Type]], to change their behavior.*

## Description

Used on [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] to specify their [[30 Official Roblox Docs/API Reference/Classes/IKControl#Type|Type]], to change their behavior.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Transform` | 0 | It is a full 6-DoF constraint. Aligns the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] to that of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]]. It is the default value. |
| `Position` | 1 | Aligns the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] position to that of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]] . |
| `Rotation` | 2 | Aligns the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] rotation to that of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]]. |
| `LookAt` | 3 | Moves and orients the whole chain to make the forward axis on the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] point at a position in the world specified by [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]]. |

---
*Source: [IKControlType](https://create.roblox.com/docs/reference/engine/enums/IKControlType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
