---
title: "Dynamic effects"
description: "Legacy effects that modify or enhance Sound objects in your games."
area: "30 Official Roblox Docs"
cluster: "Sound"
source: "https://create.roblox.com/docs/sound/dynamic-effects"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Legacy effects that modify or enhance Sound objects in your games.*

> [!warning]
> There is a newer set of audio effects that offer more control and address robust use cases. For more information, see [[30 Official Roblox Docs/Audio/Audio effects|Audio effects]].

Dynamic effects modify or enhance the audio of individual [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects or an entire [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]]. You can apply these effects to make your audio more immersive within your game, such as using [[30 Official Roblox Docs/API Reference/Classes/ReverbSoundEffect|ReverbSoundEffect]] in large rooms to make them feel massive.

## Apply dynamic effects

Each dynamic effect you apply has additional properties you can adjust until you achieve the type of sound you desire. For more information on these properties, see each dynamic effect's API page.

To apply a dynamic effect:

1. In the **Explorer** window, insert a new dynamic effect into a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] object.

   1. Hover over the object and click the ⊕ button. A contextual menu displays.
   2. From the menu, insert a **dynamic effect**.

      *(image in the full Top G Vault)*

2. **OPTIONAL** In the **Properties** window, select the new dynamic effect and adjust its properties.

   *(image in the full Top G Vault)*

## Types

### Equalizer

The [[30 Official Roblox Docs/API Reference/Classes/EqualizerSoundEffect|EqualizerSoundEffect]] allows for control of the volume of various frequency ranges. This dynamic effect is useful to highlight or minimize particular elements of audio, such as muffling all audio in your game when a player goes underwater.

| | |
| --- | --- |
| [Audio: no-effect.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/no-effect.mp3) | [Audio: equalizer.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/equalizer.mp3) |
| Audio without effect | Audio with equalizer |

### Compressor

The [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect|CompressorSoundEffect]] reduces the dynamic range of audio by lowering the volume of the highest parts of a source while at the same time raising the overall volume. This dynamic effect is useful to set a consistent volume for users to hear even if you record audio while whispering or speaking loudly. You can also use this dynamic effect to prioritize sounds from one [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] over another through the process of ducking. For more information, see [[30 Official Roblox Docs/Sound/Sound groups#Ducking|Ducking]].

| | |
| --- | --- |
| [Audio: no-effect.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/no-effect.mp3) | [Audio: compressor.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/compressor.mp3) |
| Audio without effect | Audio with compressor |

### Reverb

The [[30 Official Roblox Docs/API Reference/Classes/ReverbSoundEffect|ReverbSoundEffect]] simulates the effect of sounds bouncing off of several surfaces. This dynamic effect is useful to simulate more realistic reflections of sounds in interior spaces, such as bouncing a basketball inside a gymnasium, or playing rock music in a stadium.

| | |
| --- | --- |
| [Audio: no-effect.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/no-effect.mp3) | [Audio: reverb.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/reverb.mp3) |
| Audio without effect | Audio with reverb |

### Chorus

The [[30 Official Roblox Docs/API Reference/Classes/ChorusSoundEffect|ChorusSoundEffect]] simulates the effect of multiple vocals or instruments playing simultaneously by taking the original sound and overlaying copies, each with slight variations in pitch. This dynamic effect is useful for simulating a robotic or futuristic quality to your audio.

| | |
| --- | --- |
| [Audio: no-effect.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/no-effect.mp3) | [Audio: chorus.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/chorus.mp3) |
| Audio without effect | Audio with chorus |

### Distortion

The [[30 Official Roblox Docs/API Reference/Classes/DistortionSoundEffect|DistortionSoundEffect]] simulates the effect that would occur when overdriving older style audio equipment. This dynamic effect causes clipping in the sound and adds a general "fuzziness", which is useful for either adding intensity and character to musical instruments.

| | |
| --- | --- |
| [Audio: no-effect.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/no-effect.mp3) | [Audio: distortion.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/distortion.mp3) |
| Audio without effect | Audio with distortion |

### Echo

The [[30 Official Roblox Docs/API Reference/Classes/EchoSoundEffect|EchoSoundEffect]] causes a sound to repeat on a delay with diminishing volume, simulating the real effect of an echo that bounces off of hard surfaces, such as walls and caves.

| | |
| --- | --- |
| [Audio: no-effect.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/no-effect.mp3) | [Audio: echo.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/echo.mp3) |
| Audio without effect | Audio with echo |

### Flange

The [[30 Official Roblox Docs/API Reference/Classes/FlangeSoundEffect|FlangeSoundEffect]] creates a sweeping or whooshing effect by copying the original audio signal and playing it slightly offset and modulated on top of the original. This dynamic effect is useful for adding strange, otherworldly digital quality to your audio. For example, you can use it on an air conditioner recording to make a sci-fi spaceship engine rumble.

| | |
| --- | --- |
| [Audio: no-effect.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/no-effect.mp3) | [Audio: flange.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/flange.mp3) |
| Audio without effect | Audio with flange |

### Pitch Shift

The [[30 Official Roblox Docs/API Reference/Classes/PitchShiftSoundEffect|PitchShiftSoundEffect]] raises or lowers pitch without changing the playback speed. This dynamic effect is useful for changing the scale of your sounds. You can use it to make small sounds feel huge by pitching them down or conversely pitch sounds up to make an explosion sound more like a balloon pop.

| | |
| --- | --- |
| [Audio: no-effect.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/no-effect.mp3) | [Audio: pitch-shift.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/pitch-shift.mp3) |
| Audio without effect | Audio with pitch shift |

### Tremolo

The [[30 Official Roblox Docs/API Reference/Classes/TremoloSoundEffect|TremoloSoundEffect]] creates a trembling effect on a sound by varying its volume up and down. This dynamic effect is useful to transform instrument sounds into a wavy, dreamlike quality, or to create swells and dips in weather-related audio.

| | |
| --- | --- |
| [Audio: no-effect.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/no-effect.mp3) | [Audio: tremolo.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/dynamic-effects/tremolo.mp3) |
| Audio without effect | Audio with tremolo |

---
*Source: [Dynamic effects](https://create.roblox.com/docs/sound/dynamic-effects) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
