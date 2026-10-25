---
title: "Audio"
description: "An overview of audio features on Roblox."
area: "30 Official Roblox Docs"
cluster: "Audio"
source: "https://create.roblox.com/docs/audio"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An overview of audio features on Roblox.*

Adding audio to your games is crucial for elevating your games to new heights. By strategically using positional and non-positional audio, you can immerse players into your worlds, provide them useful feedback for their actions, and direct their attention to what they need to do to be successful in their objectives.

## Audio assets

You can import [[30 Official Roblox Docs/Audio/Audio assets|audio assets]] that you're certain you have permission to use, such as audio that you make yourself. However, Roblox's [[30 Official Roblox Docs/Production/Creator Store|Creator Store]] provides you a wide variety of free-to-use audio assets, including more than 100,000 professionally-produced sound effects and music tracks from top audio and music partners.

## Audio objects

Roblox offers many different types of [[30 Official Roblox Docs/Audio/Audio objects|audio objects]] that you can use to play and modify your audio until it meets your game's design requirements:

- The [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] object loads and plays the **audio file** using a set [[30 Official Roblox Docs/Audio/Audio assets|audio asset ID]].
- The [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] object is a **virtual speaker** that emits audio into the 3D environment.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] object is a **virtual microphone** that picks up audio from the 3D environment.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] object is a **physical hardware device** within the real world, such as a speaker or headphones.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] object is a **physical microphone** within the real world.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object converts **text to audio** using an artificial voice.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]] object converts **audio to text**.
- [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] carry audio streams from one object to another.

Using these objects, you can either set audio to play automatically at runtime, or trigger it to play from scripts. For practical applications of these audio objects, see the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add 2D audio|Add 2D audio]], [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add 3D audio|Add 3D audio]], [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add text-to-speech|Add text-to-speech]], [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add speech-to-text|Add speech-to-text]], and [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add voice chat|Add voice chat]] tutorials.

## Audio effects

[[30 Official Roblox Docs/Audio/Audio effects|Audio effects]] non-destructively modify or enhance audio streams from [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] objects. You can apply these effects to make your environments more captivating and immersive, such as using a [[30 Official Roblox Docs/API Reference/Classes/AudioEqualizer|AudioEqualizer]] object to make rain sound muffled, [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor|AudioCompressor]] object to control a sound's maximum volume, or [[30 Official Roblox Docs/API Reference/Classes/AudioReverb|AudioReverb]] to add more realistic reflections of sound in interior spaces.

---
*Source: [Audio](https://create.roblox.com/docs/audio) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
