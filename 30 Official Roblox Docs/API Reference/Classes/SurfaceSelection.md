---
title: "SurfaceSelection"
description: "Highlights a face of a surface in a configurable color."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SurfaceSelection"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Highlights a face of a surface in a configurable color.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PartAdornment|PartAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A `SurfaceSelection` highlights a particular face ([[30 Official Roblox Docs/API Reference/Classes/SurfaceSelection#TargetSurface|TargetSurface]]) of its [[30 Official Roblox Docs/API Reference/Classes/PartAdornment#Adornee|Adornee]]. The highlight's color is configurable using the [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Color3|Color3]] property.

The `SurfaceSelection` object is typically used by [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] when the user is selecting the face of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceSelection#TargetSurface\|TargetSurface]] | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] | Sets which side the SurfaceSelection will appear on, on the adorned [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PartAdornment|PartAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### TargetSurface

**Type:** [[30 Official Roblox Docs/API Reference/Enums/NormalId|NormalId]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

Sets which side the SurfaceSelection will appear on, on the adorned [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

---
*Source: [SurfaceSelection](https://create.roblox.com/docs/reference/engine/classes/SurfaceSelection) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
