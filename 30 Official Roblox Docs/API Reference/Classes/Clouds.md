---
title: "Clouds"
description: "Renders realistic clouds that drift slowly across the sky."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Clouds"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Renders realistic clouds that drift slowly across the sky.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **Clouds** object renders realistic clouds that drift slowly across the sky. Both cloud cover and density can be adjusted, as well as cloud color to achieve atmospheres like stormy skies, moody sunsets, alien worlds, etc.

See the [[30 Official Roblox Docs/Environment/Dynamic clouds|Dynamic Clouds]] article for a summary of properties and expected results.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Clouds#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Controls the material color of cloud particles. |
| [[30 Official Roblox Docs/API Reference/Classes/Clouds#Cover\|Cover]] | float | Defines the cloud cover within the overall skyscape layer. |
| [[30 Official Roblox Docs/API Reference/Classes/Clouds#Density\|Density]] | float | Controls the particulate density of clouds. |
| [[30 Official Roblox Docs/API Reference/Classes/Clouds#Enabled\|Enabled]] | boolean | Toggles rendering of the [[30 Official Roblox Docs/API Reference/Classes/Clouds\|Clouds]] object. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

This property controls the material color of cloud particles. However, cloud color is influenced by several [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] and [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] properties, so it is not intended as a dedicated property to simulate colored sunsets, sunrises, etc.

See the [[30 Official Roblox Docs/Environment/Dynamic clouds|Dynamic Clouds]]
article for a summary of properties and expected results.

### Cover

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

This property defines the cloud cover within the overall skyscape layer. Valid range is from 0 to 1 (sparse cloud cover to full cloud cover).

See the [[30 Official Roblox Docs/Environment/Dynamic clouds|Dynamic Clouds]]
article for a summary of properties and expected results.

### Density

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

This property controls the particulate density of clouds (the proportion of airborne water vapor particles at full cloud cover).

See the [[30 Official Roblox Docs/Environment/Dynamic clouds|Dynamic Clouds]]
article for a summary of properties and expected results.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

This property toggles rendering of the [[30 Official Roblox Docs/API Reference/Classes/Clouds|Clouds]] object. Useful for toggling on/off different [[30 Official Roblox Docs/API Reference/Classes/Clouds|Clouds]] objects that exist in the same place.

---
*Source: [Clouds](https://create.roblox.com/docs/reference/engine/classes/Clouds) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
