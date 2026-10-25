---
title: "CompressorSoundEffect"
description: "Adjusts the dynamic range of audio."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CompressorSoundEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Adjusts the dynamic range of audio.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect|CompressorSoundEffect]] is used to reduce the dynamic range of audio by moving the highs and lows of a signal closer together. It does this by lowering the volume of the highest parts of a source while at the same time raising the overall volume. This type of effect is useful when you have many sounds playing and you want to make sure the quieter ones are still audible. This effect can be applied to either an individual [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] by parenting it to the desired instance.

A compressor has several properties which determine how it works. The [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Threshold|Threshold]] is the audio level where the compressor will start to lower the volume. As soon as the source goes below the threshold, the compressor will stop lowering the volume.

The [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Attack|Attack]] determines how long it takes for the compressed effect to fully apply. After the threshold has been crossed the compressor will lower the volume over time until the desired ratio has been reached. It will take the time specified by [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Attack|Attack]] to reach this ratio.

The [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Release|Release]] determines how long it takes for the compressor to remove its effect. After the volume of the source is under the threshold, the compressor will restore the volume back to the original over the time specified by [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Release|Release]].

Along with lowering the volume when the sound has passed the threshold, a compressor will also amplify the entire sound (after any threshold lowering has taken effect). This allows quieter sounds to be amplified while louder sounds can stay about the same. The [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#GainMakeup|GainMakeup]] determines how much the effect amplifies the sound.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Attack\|Attack]] | float | The time the effect takes to become active after its [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Threshold\|Threshold]] has been reached. |
| [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#GainMakeup\|GainMakeup]] | float | The overall amplification applied to the effect's [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup\|SoundGroup]] after attenuation of sounds above the threshold. |
| [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Ratio\|Ratio]] | float | The ratio between the [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#SideChain\|SideChain]] sound effect, and this sound effect. |
| [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Release\|Release]] | float | The time the effect takes to become inactive after its sound is below the [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Threshold\|Threshold]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#SideChain\|SideChain]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Applies a ducking effect to the compressor sound effect. The behavior of the sidechain depends on the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup\|SoundGroup]] linked to it. |
| [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Threshold\|Threshold]] | float | Volume level at which point the compressor applies its effect. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Attack

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

The time the effect takes to become active after its [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Threshold|Threshold]] has been reached. Range is `0.1` to `1` (default `0.1`), measured in seconds.

### GainMakeup

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

The overall amplification applied to the effect's [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] after attenuation of sounds above the threshold. Keep in mind this amplification will occur as long as the effect is active, regardless of whether the [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Threshold|Threshold]] has been reached or not. Range is `-30` to `30` (default `0`), measured in dB.

### Ratio

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

The ratio between the [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#SideChain|SideChain]] sound effect, and this sound effect.

### Release

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

The time the effect takes to become inactive after its sound is below the [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#Threshold|Threshold]]. Range is `0` to `5` (default `0.1`), measured in seconds.

### SideChain

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Applies a ducking effect to the compressor sound effect. The behavior of the sidechain depends on the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] linked to it.

### Threshold

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

Volume level at which point the compressor applies its effect. If the effect's [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] is below the effect will not attenuate the sound, although the [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect#GainMakeup|GainMakeup]] will still be applied. Range is `-80` to `0` (default `0`), measured in dB.

---
*Source: [CompressorSoundEffect](https://create.roblox.com/docs/reference/engine/classes/CompressorSoundEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
