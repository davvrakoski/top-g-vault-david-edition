---
title: "InstanceAdornment"
description: "A base class for all objects that adorn `Instance` classes."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/InstanceAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A base class for all objects that adorn [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] classes.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/SelectionBox|SelectionBox]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

A base class for 3D GUI elements ([[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]]) that adorn objects of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] class. Unlike [[30 Official Roblox Docs/API Reference/Classes/PartAdornment|PartAdornment]] and [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], whose adornee is restricted to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] respectively, an [[30 Official Roblox Docs/API Reference/Classes/InstanceAdornment|InstanceAdornment]] can adorn any [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] set through its [[30 Official Roblox Docs/API Reference/Classes/InstanceAdornment#Adornee|InstanceAdornment.Adornee]] property. Like other [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] objects, it renders in 3D relative to its adornee when it is a descendant of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or another location where GUI objects are rendered.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InstanceAdornment#Adornee\|Adornee]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Which [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to adorn. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Adornee

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

Since adornments are usually parented to some GUI, this property determines which [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] they are adorning. They render in 3D positioned relative to the "adornee", not to their parent.

---
*Source: [InstanceAdornment](https://create.roblox.com/docs/reference/engine/classes/InstanceAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
