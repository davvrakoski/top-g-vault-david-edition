---
title: "FlangeSoundEffect"
description: "Creates a sweeping or swooshing effect on a sound."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/FlangeSoundEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Creates a sweeping or swooshing effect on a sound.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The FlangeSoundEffect creates a sweeping or swooshing effect on the Sound or SoundGroup it is applied to. It does this by copying the original audio signal and playing on top of the original but slightly offset and modulated.

Like all other [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], a FlangeSoundEffect can be applied either to a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] by being parented to either.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FlangeSoundEffect#Depth\|Depth]] | float | The intensity of the effect. |
| [[30 Official Roblox Docs/API Reference/Classes/FlangeSoundEffect#Mix\|Mix]] | float | Percentage of the original sound that will be applied to the filter. |
| [[30 Official Roblox Docs/API Reference/Classes/FlangeSoundEffect#Rate\|Rate]] | float | The frequency that the effect oscillates at. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Depth

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0.01 to 1 (default 0.45) The intensity of the effect. This value determines how offset the duplicated signal will be from the original. This value is the percentage of the max offset (40ms).

### Mix

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 1 (default 0.85) Percentage of the original sound that will be applied to the filter. Raising this value will make the effect sound louder and be more apparent.

### Rate

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 20 (default 5) The frequency that the effect oscillates at. Measured in Hz.

---
*Source: [FlangeSoundEffect](https://create.roblox.com/docs/reference/engine/classes/FlangeSoundEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
