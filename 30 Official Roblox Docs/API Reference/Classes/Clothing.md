---
title: "Clothing"
description: "Clothing is the base class for the `Shirt` and `Pants` clothing objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Clothing"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Clothing is the base class for the [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]] and [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]] clothing objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]], [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

The base class for clothing objects.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Clothing#Color3\|Color3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the colorization to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Clothing\|Clothing]] texture. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Color3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

This property determines the colorization to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Clothing|Clothing]] texture. The default colorization value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(1, 1, 1)]] (white), at which no colorization occurs.

This property is useful for creating outfits that have many different color variations but share the same basic look, possibly for a character creator in a roleplaying game or generating a lot of different varied NPCs.

See also [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic#Color3|ShirtGraphic.Color3]] which determines the colorization to be applied to the [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic|ShirtGraphic]] texture.

---
*Source: [Clothing](https://create.roblox.com/docs/reference/engine/classes/Clothing) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
