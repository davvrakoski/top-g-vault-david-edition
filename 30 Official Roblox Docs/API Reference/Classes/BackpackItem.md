---
title: "BackpackItem"
description: "BackpackItem is an abstract class for backpack items such as HopperBins and Tools."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BackpackItem"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*BackpackItem is an abstract class for backpack items such as HopperBins and Tools.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/HopperBin|HopperBin]], [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]]
- **Memory category:** BaseParts
- **Tags:** `NotCreatable`

## Description

BackpackItem is an abstract class for backpack items such as HopperBins and Tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BackpackItem#TextureContent\|TextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The texture icon that is displayed for a tool in the player's backpack. Only supports asset URIs. |
| [[30 Official Roblox Docs/API Reference/Classes/BackpackItem#TextureId\|TextureId]] | ContentId | The texture icon that is displayed for a tool in the player's backpack. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### TextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The texture icon that is displayed for a tool in the player's backpack.

This property should be set to the content ID of an image uploaded to the Roblox website. Only asset URIs are supported for this property.

If this property is left blank, the [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] GUI will display the name of the tool instead.

### TextureId

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The texture icon that is displayed for a tool in the player's backpack.

This property should be set to the content ID of an image uploaded to the Roblox website.

If this property is left blank, the [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] GUI will display the name of the tool instead.

---
*Source: [BackpackItem](https://create.roblox.com/docs/reference/engine/classes/BackpackItem) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
