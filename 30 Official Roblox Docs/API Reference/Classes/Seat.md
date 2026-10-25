---
title: "Seat"
description: "A type of `BasePart` that characters can 'sit' in. When a character touches an enabled Seat object, it will be attached to the part by a `Weld` and the default character scripts will play a sitting animation."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Seat"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A type of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that characters can 'sit' in. When a character touches an enabled Seat object, it will be attached to the part by a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] and the default character scripts will play a sitting animation.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] → [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]] → [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A type of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that a player character can 'sit' in. When a character touches an enabled Seat object, it will be attached to the part by a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] and the default character scripts will play a sitting animation.

## How do Seats work?

When a model containing a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] and a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] called 'HumanoidRootPart' (generally a player character) touches a seat, a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] is created between the seat and the part. The [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]] and [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]] properties are configured so that the character is welded 2 studs above the seat. This weld is named 'SeatWeld' and parented to the seat.

When sitting the [[30 Official Roblox Docs/API Reference/Classes/Seat#Occupant|Seat.Occupant]] property is set to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] that is 'sitting' in the seat. Furthermore the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SeatPart|Humanoid.SeatPart]] property of the humanoid is set to the seat.

A character can also be forced to sit in a seat using the [[30 Official Roblox Docs/API Reference/Classes/Seat#Sit|Seat:Sit()]] function.

There are two ways for a character to get out of a seat. When a player jumps, they are removed from the seat. However this can also be done manually by destroying the seat weld, for example:

seat:FindFirstChild("SeatWeld"):Destroy()

Note seats have a cooldown (currently 3 seconds) that is on a per-character per-seat basis. This means once a character has gotten out of a seat they cannot sit back on the same seat for 3 seconds. This cooldown behavior may change and should not be relied upon by developers.

## What can Seats be used for?

Seats have a diverse range of uses, ranging from the obvious to the more unconventional.

- Creating chairs or benches without the need for any programming
- Allowing characters to 'sit' in moving objects such as vehicles without getting flung around
- Creating interfaces that are controlled by the character in the seat using the [[30 Official Roblox Docs/API Reference/Classes/Seat#Occupant|Seat.Occupant]] property

*Code samples for this API (`Seat-Occupant`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Seat); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Seat#Disabled\|Disabled]] | boolean | Whether or not the seat is usable. If set to true, the seat will act as a normal part. |
| [[30 Official Roblox Docs/API Reference/Classes/Seat#Occupant\|Occupant]] | [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] | The humanoid that is sitting in the seat. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Seat#Sit\|Sit()]] | () | Forces the character with the specified [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] to sit in the Seat. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Disabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic, AvatarBehavior

Whether or not the seat is usable. If set to true, the seat will act as a normal part.

### Occupant

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** Basic, AvatarBehavior · **Tags:** `ReadOnly`, `NotReplicated`

The humanoid that is sitting in the seat

## Methods

### Sit

```lua
Seat:Sit(humanoid: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic, AvatarBehavior

Forces the character with the specified [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] to sit in the Seat.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoid` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] being forced to sit in the `Seat`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [Seat](https://create.roblox.com/docs/reference/engine/classes/Seat) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
