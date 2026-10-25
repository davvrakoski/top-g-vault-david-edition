---
title: "Tween"
description: "The `Tween` object controls the playback of an interpolation."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Tween"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] object controls the playback of an interpolation.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/TweenBase|TweenBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] object controls the playback of an interpolation. Creating and configuring a [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] is done with the [[30 Official Roblox Docs/API Reference/Classes/TweenService#Create|TweenService:Create()]] function; [[30 Official Roblox Docs/API Reference/Datatypes/Instance#new|Instance.new()]] cannot be used for this particular object.

Note that while the configuration of a tween can be accessed after a tween has been created, it can not be modified. If new goals are needed for an interpolation, a new [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] must be created.

Also note that multiple tweens can be played on the same object at the same time, but they must not be interpolating the same property. If two tweens attempt to modify the same property, the initial tween will be cancelled and overwritten by the most recent tween.

*Code samples for this API (`Tween-Creation`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Tween); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Tween#Instance\|Instance]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Read-only property that points to the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] whose properties are being interpolated by the tween. |
| [[30 Official Roblox Docs/API Reference/Classes/Tween#TweenInfo\|TweenInfo]] | [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] | Read-only property that includes information on how the interpolation of the [[30 Official Roblox Docs/API Reference/Classes/Tween\|Tween]] is to be carried out. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/TweenBase|TweenBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Instance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

This property of a [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] (read-only) points to the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] whose properties are being interpolated.

*Code samples for this member (`Tween-Instance`) are published on the source page; their code is not part of the open-source repo.*

### TweenInfo

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

Read-only property that includes information on how the interpolation of the [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] is to be carried out, using the [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] data type.

*Code samples for this member (`TweenInfo`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Tween](https://create.roblox.com/docs/reference/engine/classes/Tween) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
