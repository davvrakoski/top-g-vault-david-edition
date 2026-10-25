---
title: "Audio objects"
description: "An overview of modular audio objects on Roblox."
area: "30 Official Roblox Docs"
cluster: "Audio"
source: "https://create.roblox.com/docs/audio/objects"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An overview of modular audio objects on Roblox.*

Roblox's modular audio objects allow you to have dynamic control over sound and voice chat in your experiences. Almost every audio object corresponds to a real-world audio device, and they all function together to capture and play audio like their physical counterparts.

For example, every audio object conceptually falls into the following categories:

- Objects that **produce** audio streams, such as audio players.
- Objects that **consume** audio streams, such as audio emitters.
- Objects that **modify** audio streams, such as audio effects.
- Objects that **carry** audio streams from one audio object to another, such as wires.

As you read through this guide and learn about how all of these audio objects work together to emit sound, you will learn how to accurately capture and feed music, sound effects, and the human voice from the experience to the player and vice-versa.

> [!info]
> [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]], [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]], and [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffect]] objects are now discouraged in favor of the more robust functionality of audio objects.

## Play audio

To play audio within your experience, it's important to understand the role of each available audio object:

- An [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] loads and plays the **audio file** using a set audio asset ID.
- An [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] is a **virtual speaker** that emits audio into the 3D environment.
- An [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] is a **virtual microphone** that picks up audio from the 3D environment.
- An [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] is a **physical hardware device** within the real world, such as a speaker or headphones.
- An [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] is a **physical microphone** within the real world.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object converts **text to audio** using an artificial human voice.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]] object converts **spoken audio to text**.
- A [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] **carries audio streams** from one audio object to another.

How you pair these audio objects together depends on if you want to emit audio directly to the player's speaker or headphones or from objects in the 3D space. The following sections detail both scenarios.

### 2D audio

**2D audio** is non-directional sound that plays from no particular location, remaining at the same volume regardless of the player's position or orientation in the 3D space. This type of audio requires three audio objects:

- An audio player to produce an audio stream.
- A physical hardware device to play the audio stream in the real world.
- A wire to carry the audio stream from the audio player to the output device.

To demonstrate how to configure these audio objects in Studio for 2D audio, the following diagram compares each object with their real world audio device counterpart. In summary:

- The [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] loads and plays your audio asset with specified settings.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] allows the player to hear the audio through their speaker or headphones.
- The [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] connects to the audio player with its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|SourceInstance]] property, and to the physical hardware device with its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|TargetInstance]] property. It then acts as a bridge to carry the audio stream from the audio player to the player's output device.

*(image in the full Top G Vault)*

To play non-directional audio:

1. In the **Explorer** window, go to **SoundService** and insert the following:
   1. An **AudioPlayer** object to create an audio source.
   1. An **AudioDeviceOutput** object to create a speaker that plays throughout the experience.
   1. A **Wire** object to connect the stream from the audio player to the speaker.
1. In the **Properties** window of the **AudioPlayer** object:
   1. Set **AssetID** to a valid audio asset ID. If you don't have your own custom audio, you can find free-to-use audio assets in the Creator Store.
   1. Enable **Looping** if you want your audio to continuously repeat.
   1. Set **Volume** to the unit of amplitude you want to play your audio.
1. In the **Properties** window of the **Wire** object:
   1. Set **SourceInstance** to the **AudioPlayer** to specify that you want to play the audio within this specific audio player.
   1. Set **TargetInstance** to the **AudioDeviceOutput** to specify that you want to play the audio from this specific speaker.

From here, you can trigger your non-directional audio with scripts to either play as players join the experience or as a result of a gameplay event or UI interaction. For code sample references for these use cases, see the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add 2D audio|Add 2D audio]] tutorial.

### 3D audio

**3D audio** is directional sound that plays from a particular location in the 3D space, increasing or decreasing in volume depending on the player's position and orientation to the sound. This type of audio requires six audio objects:

- An audio player to produce an audio stream.
- An audio emitter to emit the audio stream within the environment.
- A listener to pick up the audio stream from the environment.
- A physical hardware device to play the audio stream in the real world.
- Two wires: one to carry the audio stream from the audio player to the emitter, and another to carry it from the listener to the output device.

To demonstrate how to configure these audio objects in Studio for 3D audio, the following diagram compares each object with their real world audio device counterpart. In summary:

- The [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] loads and plays your audio asset with specified settings.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]]'s parent position in the 3D space determines where that audio emits within the environment.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] either picks up audio from the emitter from the local camera or within the player character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart|Humanoid.RootPart]], depending on where you set the default listener position.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] allows the player to hear the audio through their speaker or headphones.
- The first [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] connects to the audio player with its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|SourceInstance]] property, and to the emitter with its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|TargetInstance]] property. It then acts as a bridge to carry the audio stream from the audio player to the emitter.
- The second [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] connects to the listener with its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|SourceInstance]] property, and to the physical hardware device with its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|TargetInstance]] property. It then acts as a bridge to carry the audio stream from the listener to the player's output device.

*(image in the full Top G Vault)*

To play positional audio:

1. Choose where you want to create an **AudioListener** when players spawn into the experience.
   1. In the **Explorer** window, select **SoundService**.
   1. In the **Properties** window, set **ListenerLocation** to one of the following:
      - **Default** - Creates and parents the listener to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] in experiences that enable voice chat.
      - **None** - Does not create a listener. This option is useful if you want to create a listener through a script.
      - **Character** - Creates and parents a listener to the local player's character.
      - **Camera** - Creates and parents the listener to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]].

   > [!info]
   > When you set **ListenerLocation** to either **Character** or **Camera**, the engine automatically creates an [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] object under [[30 Official Roblox Docs/API Reference/Classes/SoundService|SoundService]] at runtime.

1. In the **Explorer** window, go to the 3D object that you want to emit audio and insert the following:
   1. An **AudioPlayer** object to create an audio source.
   1. An **AudioEmitter** object to emit a positional stream from the 3D object.
   1. A **Wire** object to connect the stream from the audio player to the audio emitter.
1. In the **Properties** window of the **AudioPlayer** object:
   1. Set **AssetID** to a valid audio asset ID. If you don't have your own custom audio, you can find free-to-use audio assets in the Creator Store.
   1. Enable **Looping** if you want your audio to continuously repeat.
   1. Set **Volume** to the unit of amplitude you want to play your audio.
1. In the **Properties** window of the **AudioEmitter** object, set **DistanceAttenuation** to a volume-over-distance curve that determines how loudly the listener hears the emitter according to the distance between them.

   For example, the following curve decreases the audio's volume in half when the listener is 50 studs away from the emitter, then it sharply decreases the volume to zero when the listener is 70 studs away.

   *(image in the full Top G Vault)*

1. In the **Properties** window of the **Wire** object:
   1. Set **SourceInstance** to the **AudioPlayer** to specify that you want to play the audio within this specific audio player.
   1. Set **TargetInstance** to the **AudioEmitter** to specify that you want to play the audio from this specific audio emitter.

From here, you can trigger your directional audio with scripts to either play as players join the experience or as a result of a gameplay event or UI interaction. For code sample references for these use cases, see the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add 3D audio|Add 3D audio]] tutorial.

### Text-to-speech

> [!warning]
> All text for [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] objects must adhere to Roblox's [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards) and [Terms of Use](https://en.help.roblox.com/hc/articles/115004647846).

**Text-to-speech** (**TTS**) is a form of assistive technology that converts text strings into speech sounds using an artificial voice. This type of audio requires five audio objects:

- An audio speech generator to load and convert text into audio.
- An audio emitter to emit the audio stream within the environment.
- A listener to pick up the audio stream from the environment.
- A physical hardware device to play the audio stream in the real world.
- For 2D audio - A wire to carry the audio stream from the audio speech generator to the output device.
- For 3D audio - Two wires: one to carry the audio stream from the audio speech generator to the emitter, and another to carry it from the listener to the output device.

How you configure these objects depends on if you want to create 2D TTS audio or 3D TTS audio. For more details on either process, click between the following tabs.

#### 2D Text-to-Speech

To demonstrate how to configure these audio objects in Studio for 2D TTS audio, the following diagram compares each object with their real world audio device counterpart. In summary:

- The [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object loads and converts text strings into speech sounds.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] allows the player to hear the audio through their speaker or headphones.
- The [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] connects to the audio speech generator with its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|SourceInstance]] property, and to the physical hardware device with its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|TargetInstance]] property. It then acts as a bridge to carry the audio stream from the audio speech generator to the player's output device.

*(image in the full Top G Vault)*

To play 2D text-to-speech audio:

1. In the **Explorer** window, go to **SoundService** and insert the following:
   1. An **AudioTextToSpeech** object to create an audio speech generator.
   1. An **AudioDeviceOutput** object to create a speaker that plays throughout the experience.
   1. A **Wire** object to connect the stream from the audio speech generator to the speaker.
1. In the **Properties** window of the **AudioTextToSpeech** object:
   1. Set **Text** to anything you want the voice to say. There is a limit of 300 characters per request.
   1. Set **VoiceId** to the number of the artificial voice you want to use. For a full list of available voices, see the [[30 Official Roblox Docs/Audio/Audio objects#List of artificial voices|list of artificial voices]].
   1. Set **Volume** to the unit of amplitude you want to play your audio.
1. In the **Properties** window of the **Wire** object:
   1. Set **SourceInstance** to the **AudioTextToSpeech** to specify that you want to play the audio within this specific audio speech generator.
   1. Set **TargetInstance** to the **AudioDeviceOutput** to specify that you want to play the audio from this specific speaker.

#### 3D Text-to-Speech

To demonstrate how to configure these audio objects in Studio for 3D TTS audio, the following diagram compares each object with their real world audio device counterpart. In summary:

- The [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object loads and converts text strings into speech sounds.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]]'s parent position in the 3D space determines where that audio emits within the environment.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] either picks up audio from the emitter from the local camera or within the player character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart|Humanoid.RootPart]], depending on where you set the default listener position.
- The [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] allows the player to hear the audio through their speaker or headphones.
- The first [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] connects to the audio speech generator with its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|SourceInstance]] property, and to the emitter with its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|TargetInstance]] property. It then acts as a bridge to carry the audio stream from the audio speech generator to the emitter.
- The second [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] connects to the listener with its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|SourceInstance]] property, and to the physical hardware device with its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|TargetInstance]] property. It then acts as a bridge to carry the audio stream from the listener to the player's output device.

*(image in the full Top G Vault)*

To play 3D text-to-speech audio:

1. Choose where you want to create an **AudioListener** when players spawn into the experience.
   1. In the **Explorer** window, select **SoundService**.
   1. In the **Properties** window, set **ListenerLocation** to one of the following:
      - **Default** - Creates and parents the listener to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] in experiences that enable voice chat.
      - **None** - Does not create a listener. This option is useful if you want to create a listener through a script.
      - **Character** - Creates and parents a listener to the local player's character.
      - **Camera** - Creates and parents the listener to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]].

   > [!info]
   > When you set **ListenerLocation** to either **Character** or **Camera**, the engine automatically creates an [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] object under [[30 Official Roblox Docs/API Reference/Classes/SoundService|SoundService]] at runtime.

1. In the **Explorer** window, go to the 3D object that you want to emit audio and insert the following:
   1. Aan **AudioTextToSpeech** object to create an audio speech generator.
   1. An **AudioEmitter** object to emit a positional stream from the 3D object.
   1. A **Wire** object to connect the stream from the audio speech generator to the audio emitter.
1. In the **Properties** window of the **AudioTextToSpeech** object:
   1. Set **Text** to anything you want the voice to say. There is a limit of 300 characters per request.
   1. Set **VoiceId** to the number of the artificial voice you want to use. For a full list of available voices, see the [[30 Official Roblox Docs/Audio/Audio objects#List of artificial voices|list of artificial voices]].
   1. Set **Volume** to the unit of amplitude you want to play your audio.
1. In the **Properties** window of the of the **AudioEmitter**, set **DistanceAttenuation** to a volume-over-distance curve that determines how loudly the listener hears the emitter according to the distance between them.

   For example, the following curve decreases the audio's volume in half when the listener is 50 studs away from the emitter, then it sharply decreases the volume to zero when the listener is 70 studs away.

   *(image in the full Top G Vault)*

1. In the **Properties** window of the **Wire** object:
   1. Set **SourceInstance** to the **AudioTextToSpeech** to specify that you want to play the audio within this specific audio speech generator.
   1. Set **TargetInstance** to the **AudioEmitter** to specify that you want to play the audio from this specific audio emitter.

From here, you can trigger your TTS audio with scripts. For code sample references for TTS audio, including how to configure context-aware TTS that adapts in relation to the player, the state of their environment, or gameplay status, see the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add text-to-speech|Add text-to-speech]] tutorial.

#### Creating text-to-speech assets

In some cases, you might want to reuse the same speech multiple times. Instead of calling the API every time, you can generate a text-to-speech audio asset to use in your game using [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateAssetAsync|AssetService:CreateAssetAsync()]].

#### List of artificial voices

| VoiceID | Voice Description | Audio Example |
| --- | --- | --- |
| 1 | British male | [Audio: British-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/British-Male-Voice.wav) |
| 2 | British female | [Audio: British-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/British-Female-Voice.wav) |
| 3 | United States male #1 | [Audio: US-Male-Voice-1.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/US-Male-Voice-1.wav) |
| 4 | United States female #1 | [Audio: US-Female-Voice-1.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/US-Female-Voice-1.wav) |
| 5 | United States male #2 | [Audio: US-Male-Voice-2.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/US-Male-Voice-2.wav) |
| 6 | United States female #2 | [Audio: US-Female-Voice-2.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/US-Female-Voice-2.wav) |
| 7 | Australian male | [Audio: Australian-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Australian-Male-Voice.wav) |
| 8 | Australian female | [Audio: Australian-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Australian-Female-Voice.wav) |
| 9 | Retro voice #1 | [Audio: Retro-Voice-1.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Retro-Voice-1.wav) |
| 10 | Retro voice #2 | [Audio: Retro-Voice-2.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Retro-Voice-2.wav) |
| 11 | Host voice | [Audio: Narrator-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Narrator-Voice.wav) |
| 101 | Spanish male | [Audio: Spanish-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Spanish-Male-Voice.wav) |
| 102 | Spanish female | [Audio: Spanish-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Spanish-Female-Voice.wav) |
| 201 | German male | [Audio: German-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/German-Male-Voice.wav) |
| 202 | German female | [Audio: German-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/German-Female-Voice.wav) |
| 301 | Italian male | [Audio: Italian-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Italian-Male-Voice.wav) |
| 302 | Italian female | [Audio: Italian-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Italian-Female-Voice.wav) |
| 401 | French male | [Audio: French-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/French-Male-Voice.wav) |
| 402 | French female | [Audio: French-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/French-Female-Voice.wav) |
| 501 | Chinese (Mandarin) male | [Audio: Chinese-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Chinese-Male-Voice.wav) |
| 502 | Chinese (Mandarin) female | [Audio: Chinese-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Chinese-Female-Voice.wav) |
| 601 | Hindi male | [Audio: Hindi-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Hindi-Male-Voice.wav) |
| 602 | Hindi female | [Audio: Hindi-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Hindi-Female-Voice.wav) |
| 701 | Japanese male | [Audio: Japanese-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Japanese-Male-Voice.wav) |
| 702 | Japanese female | [Audio: Japanese-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Japanese-Female-Voice.wav) |
| 801 | Arabic male | [Audio: Arabic-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Arabic-Male-Voice.wav) |
| 802 | Arabic female | [Audio: Arabic-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Arabic-Female-Voice.wav) |
| 901 | Korean male | [Audio: Korean-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Korean-Male-Voice.wav) |
| 902 | Korean female | [Audio: Korean-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Korean-Female-Voice.wav) |
| 1001 | Portuguese male | [Audio: Portuguese-Male-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Portuguese-Male-Voice.wav) |
| 1002 | Portuguese female | [Audio: Portuguese-Female-Voice.wav](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/audio-objects/Portuguese-Female-Voice.wav) |

#### Supported languages

By default, Roblox automatically translates text inputs into the player's language and routes the translated text to the appropriate voice ID. Learn more about how this works in [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#AutoLocalize|AudioTextToSpeech.AutoLocalize]].

### Speech-to-text

> [!warning]
> All audio for [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]] objects must adhere to Roblox's [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards) and [Terms of Use](https://en.help.roblox.com/hc/articles/115004647846).

**Speech-to-text** (**STT**) is a form of technology that automatically generates text strings from speech sounds. This type of audio requires three audio objects:

- A text generator to load and convert audio into text.
- A physical hardware device like a microphone to capture the audio input.
- A wire to carry the audio stream from the input device to the text generator.

All of these audio objects work together to generate STT text in response to player actions. For example, if the player is wearing a headset while playing an experience with their laptop:

- The [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] captures the player's speech, as spoken into their microphone and as a stream of audio.
- A [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] carries the audio stream from the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] to the [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]].
- The [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]] converts the player's speech into text.
- The experience reads this text and performs an action, such as displaying the spoken text on the screen or opening a door at the player's command.

*(image in the full Top G Vault)*

To implement speech-to-text in your experience:

1. Enable the use of the latest API for voice.
   1. In the **Explorer** window, select the **VoiceChatService**.
   2. In the **Properties** window, set **UseAudioApi** to **Enabled**.
2. In the **Explorer** window, go to **SoundService** and insert the following:
   1. An **AudioDeviceInput** to capture speech.
   2. An **AudioSpeechToText** to convert the speech into text.
   3. A **Wire** to carry the stream from the audio device input to the STT instance.
3. In the **Properties** window of the **AudioSpeechToText** object, set the **Enabled** state to on.
4. In the **Properties** window of the **Wire** object:
   1. Set **SourceInstance** to your new **AudioDeviceInput** to specify that you want the wire to carry audio from this specific audio instance.
   2. Set **TargetInstance** to your new **AudioSpeechToText** to specify that you want the wire to carry audio to this specific audio instance.
5. Set the **Player** property of the audio device input to the local player at runtime with `audioDeviceInput.Player = game.Players.LocalPlayer`. This tells Roblox which user's microphone to capture audio from.

> [!info]
> By default, enabling the microphone also enables spatial voice chat in your experience. If you want players to use speech-to-text without broadcasting their voice to other players, turn off the **EnableDefaultVoice** property under **VoiceChatService**.

After setting up STT in your experience, you can trigger it with scripts. For code sample references, see the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add speech-to-text|Add speech-to-text]] tutorial.

#### Supported languages

No configuration is required to enable supported languages. Roblox automatically detects the spoken language from the audio and transcribes it.

STT supports the following languages:

- Arabic
- Chinese (Simplified)
- Chinese (Traditional)
- English
- French
- German
- Indonesian
- Italian
- Japanese
- Korean
- Polish
- Portuguese
- Spanish
- Russian
- Turkish
- Thai
- Vietnamese

#### Filter for similar words

When you implement STT in your experience, you might want to improve matching accuracy by filtering for words that sound similar to the words you actually want the player to say. To do this, you can compare the words recognized by `AudioSpeechToText` with known word lists:

1. Sanitize and tokenize the `Text` output of `AudioSpeechToText` to create a table of lowercase strings that can be parsed and compared.
   1. Remove punctuation characters.
   2. Convert the entire string to lowercase.
   3. Split the string by whitespace to produce a table of words.
2. Generate candidate tables to prepare your strings for comparison.
   1. Sanitize and tokenize each reference string.
   2. Store these processed words in a separate table.
3. Compare and match the words in both tables to recognize the speech inputs that are close to your target phrases, even if they include small variations.
   - For simple checks, check if the strings are the exact same.
   - For more flexible matching, you can write custom logic to accept substitutions (like "colour" instead of "color") or match a subset of words and calculate a similarity score.

## Customize audio

Audio effects allow you to non-destructively modify or enhance audio streams before they reach a player's ears. You can apply these effects to make your audio more immersive within experiences, such as using an [[30 Official Roblox Docs/API Reference/Classes/AudioEqualizer|AudioEqualizer]] object to make rain sound muffled, [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor|AudioCompressor]] object to control a sound's maximum volume, or [[30 Official Roblox Docs/API Reference/Classes/AudioReverb|AudioReverb]] to add more realistic reflections of sound in interior spaces.

For instructions on how to configure audio effects, as well as side-by-side comparisons of before and after you customize your audio, see [[30 Official Roblox Docs/Audio/Audio effects|Audio effects]].

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

## Trigger audio

You can trigger audio contextually from a script by calling [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Play|Play()]] on an [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] object that's correctly wired up. For example, if you parent a script to an audio player, you can trigger the audio asset through something like this:

```lua
local audio = script.Parent
local something = ...
something.SomeEvent:Connect(function()
    audio:Play()
end)
```

For more complex code samples to trigger audio, such as for gameplay feedback, UI interactions, and looping background noise, see the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add 2D audio|Add 2D audio]], [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add 3D audio|Add 3D audio]], and [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add text-to-speech|Add text-to-speech]] tutorials.

---
*Source: [Audio objects](https://create.roblox.com/docs/audio/objects) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
