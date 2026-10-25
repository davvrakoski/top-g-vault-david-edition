---
title: "Accessory"
description: "An item that a Character can wear."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Accessory"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An item that a Character can wear.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Accoutrement|Accoutrement]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The Accessory Instance is the parent Instance of all accessories (regardless of their specific accessory type). It typically has a child Handle with a child Attachment and a WrapLayer in the case of Layered Clothing.

The Accessory class is the successor to the legacy Hat system. It's cross-compatible with both the legacy R6 character system and the new R15 character system.

If you insert an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] into the Accessory's Handle with the same name as an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] in one of the character's limbs, they connect and ignore properties inherited from the [[30 Official Roblox Docs/API Reference/Classes/Accoutrement|Accoutrement]] class. Otherwise, the Accessory functions identically to a [[30 Official Roblox Docs/API Reference/Classes/Hat|Hat]].

Note: If there are two matching `Attachments`, the resulting [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] is a child of the Accessory's Handle. This differs from the legacy behavior of Hats where the Weld is always a child of the Head of the character.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Accessory#AccessoryType\|AccessoryType]] | [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|AccessoryType]] | Specifies the AccessoryType of the Accessory (eg. Hat, Tshirt, Waist). |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Accoutrement|Accoutrement]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AccessoryType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|AccessoryType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Specifies the AccessoryType of the Accessory. Is [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|AccessoryType.Unknown]] unless you equip the Accessory through the player spawning process or [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]]. If available on the Marketplace, you can set [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType]] to categorize the Accessory item (for example, "Hat" or "Face").

---
*Source: [Accessory](https://create.roblox.com/docs/reference/engine/classes/Accessory) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
