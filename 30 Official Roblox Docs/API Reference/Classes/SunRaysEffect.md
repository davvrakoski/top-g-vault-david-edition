---
title: "SunRaysEffect"
description: "Renders dynamic rays from the sun."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SunRaysEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Renders dynamic rays from the sun.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **SunRaysEffect** renders a halo of light around sun. The halo is shaped/blocked by world objects between the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] and the sun.

Like other post-processing effects, **SunRaysEffect** will only work while [[30 Official Roblox Docs/API Reference/Classes/PostEffect#Enabled|Enabled]] and when parented to [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] or [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]]. Also, it may not render on low-end devices, and it may render differently depending on your Studio settings (see the **Quality Level** settings in **Rendering** → **Performance**).

For more details on this effect and others, see [[30 Official Roblox Docs/Environment/Post-processing effects|Post-Processing Effects]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SunRaysEffect#Intensity\|Intensity]] | float | Determines the opacity of the sun rays. |
| [[30 Official Roblox Docs/API Reference/Classes/SunRaysEffect#Spread\|Spread]] | float | Determines how wide the sun rays will spread out. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Intensity

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Intensity determines the opacity of the sun rays. Values closer to 0 are less visible, while values closer to 1 become more visible.

### Spread

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Spread determines how wide the sun rays will spread across the sky. Its value should be set between 0 and 1 as values outside that range have undefined behavior.

---
*Source: [SunRaysEffect](https://create.roblox.com/docs/reference/engine/classes/SunRaysEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
