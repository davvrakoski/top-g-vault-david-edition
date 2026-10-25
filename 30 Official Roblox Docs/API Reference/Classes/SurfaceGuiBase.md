---
title: "SurfaceGuiBase"
description: "Base class for containers that render `GuiObjects` onto a face of a `BasePart` in the 3D world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SurfaceGuiBase"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Base class for containers that render [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] onto a face of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] in the 3D world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]], [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

[[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase|SurfaceGuiBase]] is the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] base class for containers that render their [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] descendants onto a face of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] in the 3D world. [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] and [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]] inherit from it.

The target part is set through the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Adornee|Adornee]] property; if no adornee is specified, the container renders on its parent when that parent is a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. The [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Face|Face]] property selects which surface of the part the UI is projected onto.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Active\|Active]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]] sinks user input; `true` by default. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Adornee\|Adornee]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] on which to apply the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]], overriding the default parent association. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Face\|Face]] | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] face upon which to apply the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Active

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] will sink input, for example if the parent or [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Adornee|Adornee]] part contains a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] class like [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]].

Note that interactive UI elements like [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButtons]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButtons]] inside a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] will only receive user input if they are parented to the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] (the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui.Adorneee]] property can be used to target a part in the 3D world while the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] itself remains in the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]). Additionally, the part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|CanQuery]] property must be `true` for the interactive UI element to receive input.

### Adornee

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] on which to apply the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]], overriding the default parent association.

### Face

**Type:** [[30 Official Roblox Docs/API Reference/Enums/NormalId|NormalId]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]] face of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] parent (or its [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Adornee|Adornee]]) upon which to apply the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]].

---
*Source: [SurfaceGuiBase](https://create.roblox.com/docs/reference/engine/classes/SurfaceGuiBase) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
