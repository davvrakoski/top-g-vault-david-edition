---
title: "LineHandleAdornment"
description: "A line-shaped handle that can be adorned to a `BasePart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/LineHandleAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A line-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`LineHandleAdornment` is a line-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. This line starts at the center of the adornment's [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#CFrame|CFrame]] (offset by its [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#SizeRelativeOffset|SizeRelativeOffset]]) and is oriented along its [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#CFrame|CFrame]]. If parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], handles can listen to input events for purposes such as making dragger tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LineHandleAdornment#Length\|Length]] | float | Length of the line. |
| [[30 Official Roblox Docs/API Reference/Classes/LineHandleAdornment#Thickness\|Thickness]] | float | Thickness of the line in pixels. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Length

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The length of the line in studs.

### Thickness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The thickness of the line in pixels.

---
*Source: [LineHandleAdornment](https://create.roblox.com/docs/reference/engine/classes/LineHandleAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
