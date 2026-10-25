---
title: "FloorWire"
description: "A FloorWire attempts to make a wire from two of its properties: `FloorWire.From` and `FloorWire.From`, which both need to be set to a `BasePart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/FloorWire"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A FloorWire attempts to make a wire from two of its properties: [[30 Official Roblox Docs/API Reference/Classes/FloorWire#From|FloorWire.From]] and [[30 Official Roblox Docs/API Reference/Classes/FloorWire#From|FloorWire.From]], which both need to be set to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

> [!warning] Deprecated
> The FloorWire object has been deprecated and should not be used in new work.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

A FloorWire attempts to make a wire from two of its properties: [[30 Official Roblox Docs/API Reference/Classes/FloorWire#From|FloorWire.From]] and [[30 Official Roblox Docs/API Reference/Classes/FloorWire#To|FloorWire.To]], which both need to be set to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. It sometimes goes through bricks but the majority of the time it works fine. It starts at From's center and goes to To's center. Which side of each one it goes into depends on the BaseParts's positions. It chooses the fastest route.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FloorWire#CycleOffset\|CycleOffset]] | float | **Deprecated.** A decimal number between 0 and 1, through which you can control how far all of the decals are along the wire. |
| [[30 Official Roblox Docs/API Reference/Classes/FloorWire#From\|From]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | **Deprecated.** The object that the FloorWire travels from. |
| [[30 Official Roblox Docs/API Reference/Classes/FloorWire#StudsBetweenTextures\|StudsBetweenTextures]] | float | **Deprecated.** The number of studs between each FloorWire segment. |
| [[30 Official Roblox Docs/API Reference/Classes/FloorWire#Texture\|Texture]] | ContentId | **Deprecated.** Sets the texture to be displayed on the FloorWire. |
| [[30 Official Roblox Docs/API Reference/Classes/FloorWire#TextureSize\|TextureSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | **Deprecated.** Sets the size of the texture used with the FloorWire. |
| [[30 Official Roblox Docs/API Reference/Classes/FloorWire#To\|To]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | **Deprecated.** The object that the FloorWire travels to. |
| [[30 Official Roblox Docs/API Reference/Classes/FloorWire#Velocity\|Velocity]] | float | **Deprecated.** The speed that the textures flow along the wire. |
| [[30 Official Roblox Docs/API Reference/Classes/FloorWire#WireRadius\|WireRadius]] | float | **Deprecated.** The radius of the wire. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CycleOffset

> [!warning] Deprecated
> The FloorWire object has been deprecated and should not be used in new
> work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

A decimal number between 0 and 1, through which you can control how far all of the decals are along the wire.

### From

> [!warning] Deprecated
> The FloorWire object has been deprecated and should not be used in new
> work.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The object that the FloorWire travels from.

### StudsBetweenTextures

> [!warning] Deprecated
> The FloorWire object has been deprecated and should not be used in new
> work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The number of studs between each FloorWire segment.

### Texture

> [!warning] Deprecated
> The FloorWire object has been deprecated and should not be used in new
> work.

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

Sets the texture to be displayed on the FloorWire.

### TextureSize

> [!warning] Deprecated
> The FloorWire object has been deprecated and should not be used in new
> work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

Sets the size of the texture used with the FloorWire.

### To

> [!warning] Deprecated
> The FloorWire object has been deprecated and should not be used in new
> work.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The object that the FloorWire travels to.

### Velocity

> [!warning] Deprecated
> The FloorWire object has been deprecated and should not be used in new
> work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The speed that the textures flow along the wire.

### WireRadius

> [!warning] Deprecated
> The FloorWire object has been deprecated and should not be used in new
> work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The radius of the wire.

---
*Source: [FloorWire](https://create.roblox.com/docs/reference/engine/classes/FloorWire) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
