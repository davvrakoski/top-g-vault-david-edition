---
title: "TremoloSoundEffect"
description: "Creates a trembling effect on a sound by varying the volume of the sound up and down."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TremoloSoundEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Creates a trembling effect on a sound by varying the volume of the sound up and down.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The TremoloSoundEffect creates a trembling effect on a sound by varying the volume of the sound up and down.

Like all other [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffects]], a TremoloSoundEffect can be applied either to a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] by being parented to either.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TremoloSoundEffect#Depth\|Depth]] | float | Controls how much the volume will raise and lower. |
| [[30 Official Roblox Docs/API Reference/Classes/TremoloSoundEffect#Duty\|Duty]] | float | Controls how long during one volume oscillation the effect will be active. |
| [[30 Official Roblox Docs/API Reference/Classes/TremoloSoundEffect#Frequency\|Frequency]] | float | Sets how often the effect will oscillate the volume. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Depth

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 1 (default 1) Controls how much the volume will raise and lower. This value ranges between 0 (minimum volume) and 1 (maximum volume). If set to its minimum, the volume will not oscillate at all.

### Duty

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 1 (default 0.5) Controls how long during one volume oscillation the effect will be active, specifically what percentage between 0 (0%) and 1 (100%).

### Frequency

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0.1 to 20 (default 5) Sets how often the effect will oscillate the volume. Measured in Hz.

---
*Source: [TremoloSoundEffect](https://create.roblox.com/docs/reference/engine/classes/TremoloSoundEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
