---
title: "PVAdornment"
description: "An abstract class of which the inheritors can be adorned to objects of the `PVInstance` class."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PVAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract class of which the inheritors can be adorned to objects of the [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] class.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/SelectionSphere|SelectionSphere]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

The [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] class is an abstract class of which the inheritors can be adorned to objects of the [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] class.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PVAdornment#Adornee\|Adornee]] | [[30 Official Roblox Docs/API Reference/Classes/PVInstance\|PVInstance]] | The [[30 Official Roblox Docs/API Reference/Classes/PVInstance\|PVInstance]] which this [[30 Official Roblox Docs/API Reference/Classes/PVAdornment\|PVAdornment]] is attached to. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Adornee

**Type:** [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] which this [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] is attached to. An adornment will stay positioned and rotated relative to its adornee, even if the adornee moves.

---
*Source: [PVAdornment](https://create.roblox.com/docs/reference/engine/classes/PVAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
