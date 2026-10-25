---
title: "PitchShiftSoundEffect"
description: "Adjusts the pitch of a sound without changing its playback speed."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PitchShiftSoundEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Adjusts the pitch of a sound without changing its playback speed.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The PitchShiftSoundEffect raises or lowers the pitch of the associated Sound or SoundGroup without changing the playback speed of the audio. This effect can be computationally expensive.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PitchShiftSoundEffect#Octave\|Octave]] | float | The percentage to shift the original pitch. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Octave

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0.5 to 2 (default 1.25) The percentage to shift the original pitch. Setting this to its minimum (0.5) lowers the octave by 1, setting this to its maximum (2) increases the octave by 1.

---
*Source: [PitchShiftSoundEffect](https://create.roblox.com/docs/reference/engine/classes/PitchShiftSoundEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
