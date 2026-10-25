---
title: "Flag"
description: "The Flag object helps you make 'capture the flag' style games."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Flag"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The Flag object helps you make 'capture the flag' style games.*

> [!warning] Deprecated
> The `Class.Flag` and `Class.FlagStand` objects were created to allow
> developers to make 'capture the flag' style games quickly. However they have
> been deprecated and developers are advised to design their own systems which
> will be more flexible and reliable.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] → [[30 Official Roblox Docs/API Reference/Classes/BackpackItem|BackpackItem]] → [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts
- **Tags:** `Deprecated`

## Description

The Flag is a unit spawned with a [[30 Official Roblox Docs/API Reference/Classes/FlagStand|FlagStand]] object, and will respawn when captured. When a player touches this object's Handle, which must be a child of the Flag object, which is a Part named "Handle", the flag will be added to the player's backpack and will appear in their hand. A player cannot select other weapons while carrying a flag, and can drop the flag at anytime by pressing "Backspace" on the keyboard. If the player carrying a flag steps onto another FlagStand of a different team color, the flag will be removed from the player's backpack and a point will be added to the user's leaderstats, if provided. The flag will then regenerate at the originating flag stand.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Flag#TeamColor\|TeamColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | **Deprecated.** The [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]] this flag is for. Corresponds with the TeamColors in the [[30 Official Roblox Docs/API Reference/Classes/Teams\|Teams]] service. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]], [[30 Official Roblox Docs/API Reference/Classes/BackpackItem|BackpackItem]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### TeamColor

> [!warning] Deprecated
> This property was a part of the now deprecated `Class.Flag` service. It
> should not be used in new work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, Input

The [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] this flag is for. Corresponds with the TeamColors in the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service.

The [[30 Official Roblox Docs/API Reference/Classes/Flag|Flag]] and [[30 Official Roblox Docs/API Reference/Classes/FlagStand|FlagStand]] objects were created to allow developers to make 'capture the flag' style games quickly.

---
*Source: [Flag](https://create.roblox.com/docs/reference/engine/classes/Flag) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
