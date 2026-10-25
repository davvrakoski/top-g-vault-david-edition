---
title: "TerrainRegion"
description: "An object that stores a chunk of terrain voxel data, produced by `Terrain:CopyRegion()` and consumed by `Terrain:PasteRegion()`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TerrainRegion"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that stores a chunk of terrain voxel data, produced by [[30 Official Roblox Docs/API Reference/Classes/Terrain#CopyRegion|Terrain:CopyRegion()]] and consumed by [[30 Official Roblox Docs/API Reference/Classes/Terrain#PasteRegion|Terrain:PasteRegion()]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A TerrainRegion is a snapshot of [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] retrieved from the [[30 Official Roblox Docs/API Reference/Classes/Terrain#CopyRegion|Terrain:CopyRegion()]] method. Can be later pasted into the Terrain using [[30 Official Roblox Docs/API Reference/Classes/Terrain#PasteRegion|Terrain:PasteRegion()]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion#IsSmooth\|IsSmooth]] | boolean | **Deprecated.** The state of this property shows whether or not this [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion\|TerrainRegion]] contains _smooth terrain_. |
| [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion#SizeInCells\|SizeInCells]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The size of this TerrainRegion in cells. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion#ConvertToSmooth\|ConvertToSmooth()]] | () | **Deprecated.** Transforms the TerrainRegion so it can be used with smooth terrain. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### IsSmooth

> [!warning] Deprecated
> This item is a deprecated function of a legacy `Class.Terrain` engine that
> has been removed. Do not use it for new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Environment · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

The state of this property shows whether or not this [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion|TerrainRegion]] contains _smooth terrain_.

### SizeInCells

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Environment · **Tags:** `ReadOnly`, `NotReplicated`

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] whose components indicate the number of terrain cells along each axis of the stored region. Each terrain cell occupies 4 studs in world space, so multiplying by 4 gives the region's world-space dimensions. The value is set when the region is captured by [[30 Official Roblox Docs/API Reference/Classes/Terrain#CopyRegion|Terrain:CopyRegion()]] and cannot be changed afterward.

## Methods

### ConvertToSmooth

> [!warning] Deprecated
> This item is a deprecated function of a legacy `Class.Terrain` engine that
> has been removed. Do not use it for new work.

```lua
TerrainRegion:ConvertToSmooth(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

Calling this method transforms the TerrainRegion into a [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion|TerrainRegion]] usable for [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]]. This can only be done from a plugin, when in edit mode.

The game can't be running, nor can it have a [[30 Official Roblox Docs/API Reference/Classes/NetworkServer|NetworkServer]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [TerrainRegion](https://create.roblox.com/docs/reference/engine/classes/TerrainRegion) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
