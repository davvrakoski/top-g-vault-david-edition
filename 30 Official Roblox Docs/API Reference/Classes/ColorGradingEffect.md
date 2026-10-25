---
title: "ColorGradingEffect"
description: "Modifies how color values calculated by the renderer should be converted to the screen's color range."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ColorGradingEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Modifies how color values calculated by the renderer should be converted to the screen's color range.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **ColorGradingEffect** effect modifies how color values calculated by the renderer should be converted to the screen's color range, impacting the mood and appearance of your place.

**ColorGradingEffect** is expected to be parented to [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] and will be ignored if parented elsewhere. Multiple instances cannot be combined and only the most recently parented instance to [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] will be applied.

For more details on this effect and others, see [[30 Official Roblox Docs/Environment/Post-processing effects|Post-Processing Effects]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ColorGradingEffect#TonemapperPreset\|TonemapperPreset]] | [[30 Official Roblox Docs/API Reference/Enums/TonemapperPreset\|TonemapperPreset]] | Specifies which tone mapper preset to use. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### TonemapperPreset

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TonemapperPreset|TonemapperPreset]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Specifies which [[30 Official Roblox Docs/API Reference/Enums/TonemapperPreset|Enum.TonemapperPreset]] to use. [[30 Official Roblox Docs/API Reference/Enums/TonemapperPreset|Enum.TonemapperPreset.Retro]] is meant to imitate the look of the pre‑2019 Roblox lighting system.

---
*Source: [ColorGradingEffect](https://create.roblox.com/docs/reference/engine/classes/ColorGradingEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
