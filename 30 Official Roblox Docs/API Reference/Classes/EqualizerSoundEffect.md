---
title: "EqualizerSoundEffect"
description: "Controls the volume of incoming audio across three frequency ranges."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/EqualizerSoundEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Controls the volume of incoming audio across three frequency ranges.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An equalizer allows for control of the volume of various frequency ranges for the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] the effect is parented to. This can be used to highlight particular elements of audio or minimize or outright eliminate others. The [[30 Official Roblox Docs/API Reference/Classes/EqualizerSoundEffect|EqualizerSoundEffect]] gives control over three ranges of frequency: Low, Mid, and High. Their specific frequencies are as follows:

- Low: 0 - 400 Hz
- Mid: 400 - 4000 Hz
- High: 4000+ Hz

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EqualizerSoundEffect#HighGain\|HighGain]] | float | The output volume of frequencies greater than 4000 Hz. |
| [[30 Official Roblox Docs/API Reference/Classes/EqualizerSoundEffect#LowGain\|LowGain]] | float | The output volume of frequencies lower than 400 Hz. |
| [[30 Official Roblox Docs/API Reference/Classes/EqualizerSoundEffect#MidGain\|MidGain]] | float | The output volume of frequencies between 400 and 4000 Hz. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### HighGain

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: -80 to 10 (default 0) The output volume of frequencies greater than 4000 Hz. Measured in dB.

### LowGain

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: -80 to 10 (default 0) The output volume of frequencies lower than 400 Hz. Measured in dB.

### MidGain

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: -80 to 10 (default 0) The output volume of frequencies between 400 and 4000 Hz. Measured in dB.

---
*Source: [EqualizerSoundEffect](https://create.roblox.com/docs/reference/engine/classes/EqualizerSoundEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
