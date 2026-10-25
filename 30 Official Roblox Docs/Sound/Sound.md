---
title: "Sound"
description: "An overview of legacy Sound objects and effects."
area: "30 Official Roblox Docs"
cluster: "Sound"
source: "https://create.roblox.com/docs/sound"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An overview of legacy Sound objects and effects.*

> [!warning]
> There is a newer set of [[30 Official Roblox Docs/Audio/Audio objects|audio objects]] and [[30 Official Roblox Docs/Audio/Audio effects|effects]] that offer more control and address robust use cases. For more information, see [[30 Official Roblox Docs/Audio/Audio|Audio]].

Sound effects and music enhance your games and make them more immersive. You can import your own [[30 Official Roblox Docs/Audio/Audio assets|audio assets]] or search for free-to-use audio in the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]], play audio through [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or objects, and enhance audio playback through [[30 Official Roblox Docs/Sound/Sound#Dynamic effects|dynamic effects]].

## Sound objects

A [[30 Official Roblox Docs/Sound/Sound objects|sound object]] emits audio within a game. Roblox assigns each [[30 Official Roblox Docs/Audio/Audio assets|audio asset]] a unique ID that you can assign to [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects to play a specific sound effect or music track. You can either set this audio to play automatically at runtime, or trigger it to play from scripts.

The location of where you place a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy affects how users hear audio. If you want users to only hear audio near a specific position, you must parent the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object to a 3D object or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] to behave as positional audio. If you want users to hear audio regardless of their position, you must insert the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object directly into [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or [[30 Official Roblox Docs/API Reference/Classes/SoundService|SoundService]] to behave as background audio.

## Sound groups

A [[30 Official Roblox Docs/Sound/Sound groups|sound group]] acts as an audio mixer for multiple audio objects, such as [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects or additional [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroups]], allowing you to control the volume and dynamic effects properties of multiple audio signals at once.

## Dynamic effects

[[30 Official Roblox Docs/Sound/Dynamic effects|Dynamic effects]] modify or enhance the audio of individual [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects or an entire [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]]. You can apply these effects to make audio more immersive within the game, such as using [[30 Official Roblox Docs/API Reference/Classes/EqualizerSoundEffect|EqualizerSoundEffect]] to make rain sound muffled, [[30 Official Roblox Docs/API Reference/Classes/CompressorSoundEffect|CompressorSoundEffect]] to control a sound's maximum volume, or [[30 Official Roblox Docs/API Reference/Classes/ReverbSoundEffect|ReverbSoundEffect]] to add more realistic reflections of sound in interior spaces.

---
*Source: [Sound](https://create.roblox.com/docs/sound) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
