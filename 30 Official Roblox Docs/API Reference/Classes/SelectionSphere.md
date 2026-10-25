---
title: "SelectionSphere"
description: "Renders a 3D sphere around its `Adornee`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SelectionSphere"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Renders a 3D sphere around its [[30 Official Roblox Docs/API Reference/Classes/PVAdornment#Adornee|Adornee]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`SelectionSphere` renders a 3D sphere around its [[30 Official Roblox Docs/API Reference/Classes/PVAdornment#Adornee|Adornee]] when it is a descendant of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or anywhere where GUI objects are rendered. The sphere's geometry consists of a ring/outline in addition to a surface. `SelectionSphere` does not capture any form of input; it is solely a visual effect.

For an outline/fill overlay effect which covers non‑primitive geometry such as that of a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], see [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SelectionSphere#SurfaceColor\|SurfaceColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | **Deprecated.** A [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] version of [[30 Official Roblox Docs/API Reference/Classes/SelectionBox#SurfaceColor3\|SurfaceColor3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SelectionSphere#SurfaceColor3\|SurfaceColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of the sphere's surface. |
| [[30 Official Roblox Docs/API Reference/Classes/SelectionSphere#SurfaceTransparency\|SurfaceTransparency]] | float | Determines the transparency of the sphere's surface. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### SurfaceColor

> [!warning] Deprecated
> This property is deprecated in favor of
> `Class.SelectionSphere.SurfaceColor3|SurfaceColor3` which uses the more
> precise `Datatype.Color3` data type instead of a `Datatype.BrickColor`
> used by this property.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** Basic, UI · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

A [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] version of [[30 Official Roblox Docs/API Reference/Classes/SelectionBox#SurfaceColor3|SurfaceColor3]].

### SurfaceColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

`SurfaceColor3` determines the color of the sphere's surface.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Color3|Color3]], a property of the superclass [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] which controls the color of the outline rather than the surface faces.

### SurfaceTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

`SurfaceTransparency` determines the transparency of the sphere's surface, similar to the way [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|BasePart.Transparency]] works. By default, this property is `1` which causes the surfaces to be invisible.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Transparency|Transparency]], a property of the superclass [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] which controls the transparency of the outline rather than the surface.

---
*Source: [SelectionSphere](https://create.roblox.com/docs/reference/engine/classes/SelectionSphere) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
