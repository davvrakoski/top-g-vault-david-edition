---
title: "SoundEffect"
description: "SoundEffect is the base class that all other sound effects derive from. A SoundEffect can be applied to either a `Sound` or `SoundGroup` by being parented to either."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SoundEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*SoundEffect is the base class that all other sound effects derive from. A SoundEffect can be applied to either a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] by being parented to either.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/ChorusSoundEffect|ChorusSoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect|CompressorSoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/DistortionSoundEffect|DistortionSoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/EchoSoundEffect|EchoSoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/EqualizerSoundEffect|EqualizerSoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/FlangeSoundEffect|FlangeSoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/PitchShiftSoundEffect|PitchShiftSoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/ReverbSoundEffect|ReverbSoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/TremoloSoundEffect|TremoloSoundEffect]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

SoundEffect is the base class that all other sound effects derive from. A SoundEffect can be applied to either a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] by being parented to either. Multiple effects can be applied to the same Sound or SoundGroup. The order the effects will be applied in is determined by that effect's Priority.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SoundEffect#Enabled\|Enabled]] | boolean | Toggles the effect on and off. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundEffect#Priority\|Priority]] | int | Determines the order the effect will be applied in relation to other effects. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Toggles the effect on and off. True by default.

### Priority

**Type:** int

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Determines the order the effect will be applied in relation to other effects. Higher priority effects will be applied earlier. The exception is when Priority equals 0 (which is the default). In this case, the base priority for the effect will be used. If the priority of two effects are equal, then the order is undetermined.

---
*Source: [SoundEffect](https://create.roblox.com/docs/reference/engine/classes/SoundEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
