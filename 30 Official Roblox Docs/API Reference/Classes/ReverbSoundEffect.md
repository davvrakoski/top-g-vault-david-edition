---
title: "ReverbSoundEffect"
description: "Reverberates audio, simulating the effect of bouncing off walls in a room."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ReverbSoundEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Reverberates audio, simulating the effect of bouncing off walls in a room.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **ReverbSoundEffect** simulates the effect of sounds bouncing off of several surfaces (such as walls in a room), which causes several overlapping echoes that arrive at the listener at slightly offset times.

Like all other [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffects]], a [[30 Official Roblox Docs/API Reference/Classes/ReverbSoundEffect|ReverbSoundEffect]] can be applied either to a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] by being parented to either.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ReverbSoundEffect#DecayTime\|DecayTime]] | float | Sets how long it takes for the reverberating echoes to fade out completely. |
| [[30 Official Roblox Docs/API Reference/Classes/ReverbSoundEffect#Density\|Density]] | float | Controls how many reflections are generated. |
| [[30 Official Roblox Docs/API Reference/Classes/ReverbSoundEffect#Diffusion\|Diffusion]] | float | Controls how smooth and reflective the simulated surfaces are. |
| [[30 Official Roblox Docs/API Reference/Classes/ReverbSoundEffect#DryLevel\|DryLevel]] | float | The output volume of the original sound. |
| [[30 Official Roblox Docs/API Reference/Classes/ReverbSoundEffect#WetLevel\|WetLevel]] | float | The output volume of the echoed effect. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### DecayTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0.1 to 20 (default 1.5) Sets how long it takes for the reverberating echoes to fade out completely. Larger decay times simulate larger (empty) spaces

### Density

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 1 (default 1) Controls how many reflections are generated.

### Diffusion

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 1 (default 1) Controls how smooth and reflective the simulated surfaces are. The lower this value, the more discrete the echoes are. At higher levels the echos will blend more.

### DryLevel

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: -80 to 10 (default -6) The output volume of the original sound.

### WetLevel

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: -80 to 10 (default 0) The output volume of the echoed effect.

---
*Source: [ReverbSoundEffect](https://create.roblox.com/docs/reference/engine/classes/ReverbSoundEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
