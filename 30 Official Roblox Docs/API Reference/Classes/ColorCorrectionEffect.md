---
title: "ColorCorrectionEffect"
description: "Adjusts color-related properties of the rendered world like saturation, tint, brightness, and contrast."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ColorCorrectionEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Adjusts color-related properties of the rendered world like saturation, tint, brightness, and contrast.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect|ColorCorrectionEffect]] can be used to adjust several color-related properties at once, including [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#Saturation|Saturation]], [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#TintColor|TintColor]], [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#Brightness|Brightness]] and [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#Contrast|Contrast]]. It's useful for fine-tuning the visual aesthetic of a world or communicating status effects to the player. Multiple [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect|ColorCorrectionEffect]] objects can be applied at the same time and they will compose their effects together.

Like other [[30 Official Roblox Docs/Environment/Post-processing effects|post-processing effects]], [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect|ColorCorrectionEffect]] will only work while [[30 Official Roblox Docs/API Reference/Classes/PostEffect#Enabled|Enabled]] and when parented to [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] or [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]]. Also, it may render differently depending on your Studio settings (see **Editor Quality Level** in **Rendering**).

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#Brightness\|Brightness]] | float | Determines by how much the brightness of pixel colors will be shifted. |
| [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#Contrast\|Contrast]] | float | Determines the change in separation between the dark and light colors. |
| [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#Saturation\|Saturation]] | float | Determines the change in intensity of colors. |
| [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#TintColor\|TintColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines by how much the RGB channels of pixels are scaled. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Brightness

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

This property determines by how much the colors of pixels will be shifted. A value of `-1` will cause all pixels to be completely black while a value of `1` will cause them to be white.

### Contrast

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

This property determines the separation between the dark and light colors. Values less than `0` have reduced contrast while values greater than `0` have increased contrast.

### Saturation

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

This property determines the change in intensity of pixel colors. Values above `1` will cause colors to be more vivid while values below `0` will make colors more dull, eventually reaching full desaturation at `-1`.

### TintColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

This property determines by what factors the RGB channels of pixel colors are scaled. The effect is multiplicative, so changing this to

`[255, 0, 0]`

 (red) would cause the green and blue channels to be multiplied by `0`.

---
*Source: [ColorCorrectionEffect](https://create.roblox.com/docs/reference/engine/classes/ColorCorrectionEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
