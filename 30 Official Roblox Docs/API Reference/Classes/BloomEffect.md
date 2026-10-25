---
title: "BloomEffect"
description: "Simulates the camera viewing a very bright light."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BloomEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Simulates the camera viewing a very bright light.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **BloomEffect** simulates the camera viewing a very bright light. It causes brighter colors to glow, similar to applying the neon [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]] to everything, including the [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]]. Multiple **BloomEffect** objects can be applied at once and they will compose their effects together.

Like other post-processing effects, **BloomEffect** will only work while [[30 Official Roblox Docs/API Reference/Classes/PostEffect#Enabled|Enabled]] and when parented to [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] or [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]]. Also, it may render differently depending on your Studio settings (see the **Quality Level** settings in **Rendering** → **Performance**).

For more details on this effect and others, see [[30 Official Roblox Docs/Environment/Post-processing effects|Post-Processing Effects]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BloomEffect#Intensity\|Intensity]] | float | Determines the additive blending intensity. |
| [[30 Official Roblox Docs/API Reference/Classes/BloomEffect#Size\|Size]] | float | Determines the radius of the bloom in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/BloomEffect#Threshold\|Threshold]] | float | Determines how bright a color must be before it blooms. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Intensity

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Intensity determines how intensely the colors that bloom (determined by the [[30 Official Roblox Docs/API Reference/Classes/BloomEffect#Threshold|Threshold]]) will additively blend with themselves. Higher values will produce brighter colors.

### Size

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Size determines the radius of the bloom effect in pixels in a similar manner to [[30 Official Roblox Docs/API Reference/Classes/BlurEffect#Size|BlurEffect.Size]]. Larger values create a wider bloom effect, and a value of 0 will disable the bleed (but not the color adjustment).

### Threshold

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Threshold determines how bright a color can be before it blooms. If set to 1, only pure white colors will bloom. If set to 0, all colors will bloom.

---
*Source: [BloomEffect](https://create.roblox.com/docs/reference/engine/classes/BloomEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
