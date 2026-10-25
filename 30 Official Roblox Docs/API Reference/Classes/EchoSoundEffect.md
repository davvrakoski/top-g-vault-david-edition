---
title: "EchoSoundEffect"
description: "Adds delayed repetitions of a sound with diminishing volume."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/EchoSoundEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Adds delayed repetitions of a sound with diminishing volume.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An echo effect causes a sound to repeat on a delay with diminishing volume, simulating the real effect of an echo. This effect can be applied to either an individual sound or to a sound group by parenting it to the desired instance.

The effect is controlled by several properties. First, the Delay is how long the effect will wait to play the echoed sound. Feedback determines how much the original signal is diminished to play as the echoed sound. Note that this echoed sound also goes through the echo effect which will wait another delay and play another echo. This process will repeat until the volume of the echoed sound is negligible.

You can also adjust the wet/dry mix of the effect. The dry component of the sound is the original sound that the effect is being applied to. You can adjust the volume of the dry sound by adjusting the DryLevel. The wet sound is the echoed effect itself, and its volume can be adjusted with WetLevel.

It is recommended to only use the EchoSoundEffect with sound groups. If an echo effect is applied to a regular Sound, once that sound stops playing the echo effect will also be cut off. When applied to a SoundGroup, the echo effect will continue playing even if the original source sound has stopped.Like all other [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], a EchoSoundEffect can be applied either to a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] by being parented to either.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EchoSoundEffect#Delay\|Delay]] | float | The amount of time between echoes. |
| [[30 Official Roblox Docs/API Reference/Classes/EchoSoundEffect#DryLevel\|DryLevel]] | float | The output volume of the original sound. |
| [[30 Official Roblox Docs/API Reference/Classes/EchoSoundEffect#Feedback\|Feedback]] | float | The echo decay every time the echo plays. |
| [[30 Official Roblox Docs/API Reference/Classes/EchoSoundEffect#WetLevel\|WetLevel]] | float | The output volume of the echoed effect. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Delay

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0.01 to 5 (default 1) The amount of time between echoes. Measured in seconds.

If a EchoSoundEffect is applied to a singular sound instead of a sound group, if the sound stops playing before the delay causes an echo, the echo will not play. Because of this, it is recommended to apply echo effects to SoundGroups and not Sounds.

### DryLevel

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: -80 to 10 (default 0) The output volume of the original sound.

### Feedback

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 1 (default 0.5) The echo decay every time the echo plays. Setting this at it's minimum (0) will cause no feedback, meaning the echo won't be audible at all. Setting this at the maximum (1) will have no decay, meaning the echoed sound will play at the level of the original and will not diminish over time.

### WetLevel

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: -80 to 10 (default 0) The output volume of the echoed effect.

---
*Source: [EchoSoundEffect](https://create.roblox.com/docs/reference/engine/classes/EchoSoundEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
