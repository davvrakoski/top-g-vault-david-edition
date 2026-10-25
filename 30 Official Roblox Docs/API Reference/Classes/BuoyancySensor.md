---
title: "BuoyancySensor"
description: "A `SensorBase` that outputs data about how its `BasePart` is interacting with `Terrain` water."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BuoyancySensor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] that outputs data about how its [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is interacting with [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] water.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] that outputs data about how its [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is interacting with [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] water, allowing you to determine if the part is or is not in water.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BuoyancySensor#FullySubmerged\|FullySubmerged]] | boolean | True when the entirety of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] is submerged in [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water with at least one voxel of water above it. |
| [[30 Official Roblox Docs/API Reference/Classes/BuoyancySensor#TouchingSurface\|TouchingSurface]] | boolean | True when any position on the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] is touching [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### FullySubmerged

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property is true when the entirety of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is submerged in [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] water with at least one voxel of water above it.

### TouchingSurface

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property is true when any position on the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is touching [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] water. The detection measurements are not exact and may use the bounding box of the part instead of its exact geometry.

---
*Source: [BuoyancySensor](https://create.roblox.com/docs/reference/engine/classes/BuoyancySensor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
