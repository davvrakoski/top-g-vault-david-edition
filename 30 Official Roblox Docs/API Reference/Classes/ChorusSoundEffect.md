---
title: "ChorusSoundEffect"
description: "Makes audio more voluminous by simulating multiple voices playing the same part."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ChorusSoundEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Makes audio more voluminous by simulating multiple voices playing the same part.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A ChorusSoundEffect simulates the effect of multiple vocals or instruments playing the same part. It does this by taking the original sound and overlaying copies of that sound. These copies are not exact matches to the original but instead vary in pitch slightly. This simulates a real chorus, as different singers or instruments will have slight variations. This effect can be applied to either an individual sound or to a sound group by parenting it to the desired instance.

Like all other [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], a ChorusSoundEffect can be applied either to a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] by being parented to either.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChorusSoundEffect#Depth\|Depth]] | float | Controls how intense the effect is. |
| [[30 Official Roblox Docs/API Reference/Classes/ChorusSoundEffect#Mix\|Mix]] | float | Percentage of the original sound that will be applied to the filter. |
| [[30 Official Roblox Docs/API Reference/Classes/ChorusSoundEffect#Rate\|Rate]] | float | How frequently the pitch variation changes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Depth

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 1 (default 0.15) Controls how intense the effect is.

### Mix

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 1 (default 0.5) Percentage of the original sound that will be applied to the filter. Raising this value will make the effect sound louder and be more apparent.

### Rate

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 20 (default 0.5) How frequently the pitch variation changes. Measured in Hz.

---
*Source: [ChorusSoundEffect](https://create.roblox.com/docs/reference/engine/classes/ChorusSoundEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
