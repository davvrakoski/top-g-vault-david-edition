---
title: "GuiBase3d"
description: "An abstract class for 3D GUI elements that are rendered in the world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GuiBase3d"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract class for 3D GUI elements that are rendered in the world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/FloorWire|FloorWire]], [[30 Official Roblox Docs/API Reference/Classes/InstanceAdornment|InstanceAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PartAdornment|PartAdornment]], [[30 Official Roblox Docs/API Reference/Classes/SelectionLasso|SelectionLasso]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

An abstract class for 3D GUI elements that are rendered in the world.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | **Deprecated.** Sets the color of a GUI object. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Color3\|Color3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of this [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d\|GuiBase3d]] object. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Transparency\|Transparency]] | float | Sets the transparency of this [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d\|GuiBase3d]] object. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Visible\|Visible]] | boolean | Determines whether this [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d\|GuiBase3d]] object and its descendants will be displayed. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Color

> [!warning] Deprecated
> This property has been deprecated in favor of `Class.GuiBase3d.Color3`,
> which allows for greater color customization and should be used in new
> work instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

Sets the color of a GUI object.

### Color3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the color of this [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] object.

### Transparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the transparency of this [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] object, where `1` is invisible and `0` is fully visible.

### Visible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines whether this [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] object and its descendants will be displayed.

---
*Source: [GuiBase3d](https://create.roblox.com/docs/reference/engine/classes/GuiBase3d) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
