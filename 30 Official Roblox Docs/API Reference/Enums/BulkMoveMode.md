---
title: "BulkMoveMode"
description: "Determines the set of property changed events that fire when parts are moved by `WorldRoot:BulkMoveTo()`."
api_type: enum
aliases: ["Enum.BulkMoveMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/BulkMoveMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the set of property changed events that fire when parts are moved by [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#BulkMoveTo|WorldRoot:BulkMoveTo()]].*

## Description

Determines which property [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] events fire when [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#BulkMoveTo|WorldRoot:BulkMoveTo()]] repositions parts. Passing [[30 Official Roblox Docs/API Reference/Enums/BulkMoveMode|Enum.BulkMoveMode.FireCFrameChanged]] instead of [[30 Official Roblox Docs/API Reference/Enums/BulkMoveMode|Enum.BulkMoveMode.FireAllEvents]] reduces per-part event overhead by suppressing [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Orientation|Orientation]], and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Rotation|Rotation]] changed signals while still firing the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]] changed signal. The default value of the `eventMode` parameter in [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#BulkMoveTo|WorldRoot:BulkMoveTo()]] is [[30 Official Roblox Docs/API Reference/Enums/BulkMoveMode|Enum.BulkMoveMode.FireAllEvents]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `FireAllEvents` | 0 | Every property changed event fires for each moved part, including [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame\|CFrame]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position\|Position]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Orientation\|Orientation]], and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Rotation\|Rotation]]. |
| `FireCFrameChanged` | 1 | Only the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame\|CFrame]] property changed event fires for each moved part; [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position\|Position]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Orientation\|Orientation]], and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Rotation\|Rotation]] changed events are suppressed. |

---
*Source: [BulkMoveMode](https://create.roblox.com/docs/reference/engine/enums/BulkMoveMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
