---
title: "DistortionSoundEffect"
description: "Distorts audio, making it sound fuzzier and overdriven."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DistortionSoundEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Distorts audio, making it sound fuzzier and overdriven.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A distortion effect is used to simulate the effect that would occur when overdriving older style audio equipment (such as vacuum tubes). This effect causes clipping in the sound and adds a general "fuzziness".

Like all other [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], a DistortionSoundEffect can be applied either to a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] by being parented to either.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DistortionSoundEffect#Level\|Level]] | float | The intensity of the effect. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Level

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Range: 0 to 1 (default 0.5) The intensity of the effect. Setting this property to its minimum (0) will cause no distortion at all.

---
*Source: [DistortionSoundEffect](https://create.roblox.com/docs/reference/engine/classes/DistortionSoundEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
