---
title: "Accoutrement"
description: "An object that can attach to a player's character."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Accoutrement"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that can attach to a player's character.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]], [[30 Official Roblox Docs/API Reference/Classes/Hat|Hat]]
- **Memory category:** Instances

## Description

An Accoutrement welds its child [[30 Official Roblox Docs/API Reference/Classes/Part|part]] called "Handle" to the player's character. You can change the position and rotation of the Handle part using the [[30 Official Roblox Docs/API Reference/Classes/Accoutrement#AttachmentPos|AttachmentPos]], [[30 Official Roblox Docs/API Reference/Classes/Accoutrement#AttachmentRight|Right]], [[30 Official Roblox Docs/API Reference/Classes/Accoutrement#AttachmentForward|Forward]], and [[30 Official Roblox Docs/API Reference/Classes/Accoutrement#AttachmentUp|Up]] properties.

Parts descending from an accoutrement are massless when attach to other parts (e.g. with a Weld) as long as they are not the root part of the assembly that [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetRootPart|GetRootPart()]] returns. [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetMass|GetMass()]] returns 0 for parts in this case, and it doesn't add to the total mass or rotational inertia of the Assembly.

This doesn't apply to a part descending from an accoutrement when an accoutrement welds to another part that is massless or one if its parts otherwise becomes root. This also doesn't apply for the root part, and it has mass like a normal part.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Accoutrement#AttachmentForward\|AttachmentForward]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Sets the offset position of the object on the Player. |
| [[30 Official Roblox Docs/API Reference/Classes/Accoutrement#AttachmentPoint\|AttachmentPoint]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The exact CFrame of the Accoutrement. |
| [[30 Official Roblox Docs/API Reference/Classes/Accoutrement#AttachmentPos\|AttachmentPos]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Sets the position of the object on the Player. |
| [[30 Official Roblox Docs/API Reference/Classes/Accoutrement#AttachmentRight\|AttachmentRight]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Sets the offset position of the object on the Player. |
| [[30 Official Roblox Docs/API Reference/Classes/Accoutrement#AttachmentUp\|AttachmentUp]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Sets the offset position of the object on the Player. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AttachmentForward

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `Hidden`, `NotReplicated`

Sets the offset position of the object on the Player.

### AttachmentPoint

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The exact CFrame of the Accoutrement.

### AttachmentPos

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `Hidden`, `NotReplicated`

Sets the position of the object on the Player.

### AttachmentRight

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `Hidden`, `NotReplicated`

Sets the offset position of the object on the Player.

### AttachmentUp

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `Hidden`, `NotReplicated`

Sets the offset position of the object on the Player.

---
*Source: [Accoutrement](https://create.roblox.com/docs/reference/engine/classes/Accoutrement) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
