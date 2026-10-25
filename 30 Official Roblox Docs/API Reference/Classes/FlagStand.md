---
title: "FlagStand"
description: "The FlagStand object helps you make 'capture the flag' style games."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/FlagStand"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The FlagStand object helps you make 'capture the flag' style games.*

> [!warning] Deprecated
> The FlagStand and Flag are deprecated objects that were used to make 'capture
> the flag' style games. Developers are advised to design their own systems
> which will be more flexible and reliable.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] → [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]] → [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts
- **Tags:** `Deprecated`

## Description

The [[30 Official Roblox Docs/API Reference/Classes/Flag|Flag]] and [[30 Official Roblox Docs/API Reference/Classes/FlagStand|FlagStand]] objects allow you to make 'Capture the Flag' style games quickly.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FlagStand#TeamColor\|TeamColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | **Deprecated.** The Team that owns the [[30 Official Roblox Docs/API Reference/Classes/FlagStand\|FlagStand]]. Corresponds with the TeamColors in the [[30 Official Roblox Docs/API Reference/Classes/Teams\|Teams]] service. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FlagStand#FlagCaptured\|FlagCaptured]] | `player` | **Deprecated.** Fires when a player bearing an opposing flag, and having the same [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor\|Player.TeamColor]] as the stand, touches the [[30 Official Roblox Docs/API Reference/Classes/FlagStand\|FlagStand]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### TeamColor

> [!warning] Deprecated
> This property was a part of the now deprecated `Class.Flag` service. It
> should not be used in new work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The Team that owns the [[30 Official Roblox Docs/API Reference/Classes/FlagStand|FlagStand]]. Corresponds with the TeamColors in the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service.

The [[30 Official Roblox Docs/API Reference/Classes/Flag|Flag]] and [[30 Official Roblox Docs/API Reference/Classes/FlagStand|FlagStand]] objects were created to allow developers to make 'capture the flag' style games quickly.

## Events

### FlagCaptured

> [!warning] Deprecated
> This event was a part of the now deprecated `Class.Flag` service. It
> should not be used in new work.

```lua
FlagStand.FlagCaptured(player: Instance)
```

**Capabilities:** Basic

This event fires when a player bearing an opposing flag, and having the same [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] as the stand, touches the [[30 Official Roblox Docs/API Reference/Classes/FlagStand|FlagStand]].

The [[30 Official Roblox Docs/API Reference/Classes/Flag|Flag]] and [[30 Official Roblox Docs/API Reference/Classes/FlagStand|FlagStand]] objects were created to allow developers to make 'capture the flag' style games quickly.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

---
*Source: [FlagStand](https://create.roblox.com/docs/reference/engine/classes/FlagStand) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
