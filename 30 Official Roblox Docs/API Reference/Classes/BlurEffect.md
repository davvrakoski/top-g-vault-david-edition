---
title: "BlurEffect"
description: "Applies a blur to the entire game world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BlurEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a blur to the entire game world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **BlurEffect** applies a Gaussian blur to the entire rendered game world. The strength of the blur is controlled by the [[30 Official Roblox Docs/API Reference/Classes/BlurEffect#Size|BlurEffect.Size]]. Only one **BlurEffect** can be applied at once (the instance with the greatest [[30 Official Roblox Docs/API Reference/Classes/BlurEffect#Size|Size]] takes priority).

Like other post-processing effects, **BlurEffect** will only work while [[30 Official Roblox Docs/API Reference/Classes/PostEffect#Enabled|Enabled]] and when parented to [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] or [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]]. Also, it may render differently on low-end devices and/or depending on your Studio settings (see the **Quality Level** settings in **Rendering** → **Performance**).

For more details on this effect and others, see [[30 Official Roblox Docs/Environment/Post-processing effects|Post-Processing Effects]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BlurEffect#Size\|Size]] | float | Determines the blur radius. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Size

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Size controls the blur radius, measured in pixels. The larger the size, the blurrier the screen will become.

---
*Source: [BlurEffect](https://create.roblox.com/docs/reference/engine/classes/BlurEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
