---
title: "Light"
description: "Light is a root class for dynamic lighting related objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Light"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Light is a root class for dynamic lighting related objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]], [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]], [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight|SurfaceLight]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

Light is a root class for dynamic lighting related objects.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness\|Brightness]] | float | Sets how bright the emitted light is, defaults to 1. |
| [[30 Official Roblox Docs/API Reference/Classes/Light#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The color of the emitted light. |
| [[30 Official Roblox Docs/API Reference/Classes/Light#Enabled\|Enabled]] | boolean | If set to true, light will be emitted from the source object. |
| [[30 Official Roblox Docs/API Reference/Classes/Light#Shadows\|Shadows]] | boolean | If set to true, will project shadows if light is blocked by an obstacle. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Brightness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets how bright the emitted light is, defaults to 1.

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The color of the emitted light.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

If set to true, light will be emitted from the source object.

### Shadows

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

If set to true, will project shadows if light is blocked by an obstacle.

---
*Source: [Light](https://create.roblox.com/docs/reference/engine/classes/Light) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
