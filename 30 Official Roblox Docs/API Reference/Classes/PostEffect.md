---
title: "PostEffect"
description: "Abstract base class for post-processing effects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PostEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Abstract base class for post-processing effects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/BloomEffect|BloomEffect]], [[30 Official Roblox Docs/API Reference/Classes/BlurEffect|BlurEffect]], [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect|ColorCorrectionEffect]], [[30 Official Roblox Docs/API Reference/Classes/ColorGradingEffect|ColorGradingEffect]], [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect|DepthOfFieldEffect]], [[30 Official Roblox Docs/API Reference/Classes/SunRaysEffect|SunRaysEffect]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

PostEffect is an abstract base class for post-processing effects, such as [[30 Official Roblox Docs/API Reference/Classes/BloomEffect|BloomEffect]] and [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect|ColorCorrectionEffect]]. They change how the world looks **after** it has been rendered. They do not affect [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]]. Objects of this kind should be parented to the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] or the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] in order to work.

It should also be noted that some post-processing effects will work differently or **not at all** when Roblox is set to a low [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#QualityLevel|QualityLevel]] (or [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#EditQualityLevel|EditQualityLevel]] in Studio). On some low-end devices, faster rendering algorithms may be used. By default, these quality settings are set to Automatic, so if you aren't seeing post-processing effects you should check Roblox's settings under the "Rendering" section. It may be necessary to override the automatic behavior temporarily in order to preview post-processing effects.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PostEffect#Enabled\|Enabled]] | boolean | Toggles whether or not the PostEffect is enabled. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Toggles whether or not the PostEffect is enabled.

---
*Source: [PostEffect](https://create.roblox.com/docs/reference/engine/classes/PostEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
