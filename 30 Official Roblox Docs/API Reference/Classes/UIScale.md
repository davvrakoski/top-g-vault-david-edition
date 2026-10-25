---
title: "UIScale"
description: "An object that acts as a multiplier for the size of the parent UI element's scale."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIScale"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that acts as a multiplier for the size of the parent UI element's scale.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A UIScale object simply contains a number that is used to multiply the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]] of the parent UI element. This number is stored in [[30 Official Roblox Docs/API Reference/Classes/UIScale#Scale|UIScale.Scale]].

*Code samples for this API (`UI-Scale-Demo`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/UIScale); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIScale#Scale\|Scale]] | float | Determines the multiplier to apply to the parent UI element's size. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Scale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

The Scale property determines the multiplier used on the parent UI element's [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]]. When set to 0.5, an AbsoluteSize of ,  becomes , . Similarly, when set to 2, such an AbsoluteSize would become , .

*Code samples for this member (`UI-Scale-Demo`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [UIScale](https://create.roblox.com/docs/reference/engine/classes/UIScale) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
