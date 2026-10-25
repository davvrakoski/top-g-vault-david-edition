---
title: "Platform"
description: "Historically a form of `Seat` that wouldn't place the player in a sitting pose. This object is no longer create-able and cannot be used by developers."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Platform"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Historically a form of [[30 Official Roblox Docs/API Reference/Classes/Seat|Seat]] that wouldn't place the player in a sitting pose. This object is no longer create-able and cannot be used by developers.*

> [!warning] Deprecated
> Historically a form of `Class.Seat` that wouldn't place the player in a
> sitting pose. This object is no longer create-able and cannot be used by
> developers.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] → [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]] → [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts
- **Tags:** `NotCreatable`

## Description

The Platform object creates a brick that when touched by a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] will anchor their torso to the brick. This allows for the creation of vehicles that players can stand in and not be flung about the cabin/deck of the vehicle.

The Platform is almost identical to the [[30 Official Roblox Docs/API Reference/Classes/Seat|Seat]] object, except that instead of sitting down the player will be standing while locked in place. Good for ships.

The Platform object is very useful for making people's characters staying in one spot while they move around, such as a ship or truck. When a player touches the Platform a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] constraint is created, so they are 'attached' to the Platform and can't move until that weld is broken. It can be removed by hitting the spacebar, when the player jumps to exit the Platform.

---
*Source: [Platform](https://create.roblox.com/docs/reference/engine/classes/Platform) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
