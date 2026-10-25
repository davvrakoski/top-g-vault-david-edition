---
title: "Sound objects"
description: "Sound objects are legacy instances that emit sound within a game."
area: "30 Official Roblox Docs"
cluster: "Sound"
source: "https://create.roblox.com/docs/sound/objects"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Sound objects are legacy instances that emit sound within a game.*

> [!warning]
> There is a newer set of [[30 Official Roblox Docs/Audio/Audio objects|audio objects]] that offer more control and address robust use cases. For more information, see [[30 Official Roblox Docs/Audio/Audio|Audio]].

Audio playback occurs through [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects which emit audio within a game. Roblox assigns each [[30 Official Roblox Docs/Audio/Audio assets|audio asset]] a unique ID that you can assign to [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects to play a specific sound effect or music track. You can either set this audio to play automatically at runtime, or trigger it to [[30 Official Roblox Docs/Sound/Sound objects#Script sound objects|play from scripts]].

To modify playback of multiple [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects, you can assign them to a [[30 Official Roblox Docs/Sound/Sound groups|sound group]] and control the entire group's volume, as well as apply [[30 Official Roblox Docs/Sound/Dynamic effects|dynamic effects]].

## Create sound objects

There are three locations you can create a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object, and each location determines how audio emits and volume changes in relation to the user's position within the game.

| Location | How audio emits | How volume changes |
| --- | --- | --- |
| Child of a block, sphere, or cylinder [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]. | Audio emits outward from the entire surface of the part. | Volume changes depending on the distance between the user's sound listener and the position of the part, as well as its size. |
| Child of an [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]], [[30 Official Roblox Docs/API Reference/Classes/TrussPart\|TrussPart]], [[30 Official Roblox Docs/API Reference/Classes/WedgePart\|WedgePart]], or [[30 Official Roblox Docs/API Reference/Classes/CornerWedgePart\|CornerWedgePart]]. | Audio emits outward from the single attachment point or part center. | Volume changes depending on the distance between the user's sound listener and the attachment/part position. |
| Within [[30 Official Roblox Docs/API Reference/Classes/SoundService\|SoundService]] or [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. | Audio emits throughout the game. | Volume and pan position remain the same regardless of the user's sound listener position or rotation. |

### Positional audio

Positional audio is audio that users can only hear near a specific position within the game. There are two types of positional audio you can utilize: volumetric and point source.

#### Volumetric

Volumetric audio is the most realistic audio option, as it dynamically changes depending on the user's position to the audio source. For example, if the user is within a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] with a child [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object, audio plays all around the user, similar to music in headphones playing at the same volume in each speaker. When the user exits the part, audio gradually decreases in volume and becomes more directional per speaker, moving around the user's head when their listener rotates. For information on the properties that control how loud your audio is at different distances from the part, see [[30 Official Roblox Docs/Sound/Sound objects#RollOffMinDistance and RollOffMaxDistance|RollOffMinDistance and RollOffMaxDistance]].

The size of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] also affects the audio's volume, as larger [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] produce a wider area in which users can hear the audio and when a user navigates away from a large [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], volume decreases slower. The following example displays a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that is the size of a city with a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object playing ambient audio. Users A and B experience the audio differently: user B is closer to the large [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], and they mostly hear the audio around the same loudness in both speakers. Conversely, user A is further away from the city, so the audio they hear is quieter and more directional than user B, playing at differing loudness in each of their speakers.

*(image in the full Top G Vault)*

Volumetric audio is useful for any audio that needs to be immersive around a user and change dynamically depending on the user's position, such as a concert stage or ambience zones like rainfall. When you experiment with placing a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object on [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] of different sizes and positions from users, you can hear how immersive volumetric audio can be.

[Video: Volumetric-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/sound-objects/Volumetric-Demo.mp4)

To create a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object for volumetric audio:

1. In the **Explorer** window, select **SoundService**.
2. In the **Properties** window, navigate to the **VolumetricAudio** property, then set it to **Enabled**.
3. In the **Explorer** window, hover over a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], then click the ⊕ button. A contextual menu displays.
4. From the menu, insert a **Sound**.
5. In the **Properties** window, navigate to the **SoundId** property and input a valid [[30 Official Roblox Docs/Audio/Audio assets|audio asset ID]].

   *(image in the full Top G Vault)*

6. **OPTIONAL** If you want the audio to start playing when the game begins, enable the **Playing** property.

#### Point source

Contrary to volumetric audio, point source audio only emits from a single point source. This type of audio is useful for explosions, impact noises, electronic devices, and dialogue.

[Video: Sound-Point-Source.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/sound-objects/Sound-Point-Source.mp4)

To create a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object for point source audio:

1. In the **Explorer** window, hover over an attachment, truss, wedge, or corner wedge, then click the ⊕ button. A contextual menu displays.
2. From the menu, insert a **Sound**.
3. In the **Properties** window, navigate to the **SoundId** property and input a valid [[30 Official Roblox Docs/Audio/Audio assets|audio asset ID]].
4. **OPTIONAL** If you want the audio to start playing when the game begins, enable the **Playing** property.

### Background audio

Background audio plays at the same volume no matter where the user travels within your game. This type of audio is useful for music that you want to play for users, especially when you want to create a soundtrack of multiple audio files.

It's best to keep all [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects for background audio in a single location of the Workspace for organization purposes as you continue to add and edit audio within your game. The following example stores the new [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object under the [[30 Official Roblox Docs/API Reference/Classes/SoundService|SoundService]] container, as this service determines how [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects play in games.

To create a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object for background audio:

1. In the **Explorer** window, hover over **SoundService**, then click the ⊕ button. A contextual menu displays.
2. From the menu, insert a **Sound**.
3. In the **Properties** window, navigate to the **SoundId** property and input a valid [[30 Official Roblox Docs/Audio/Audio assets|audio asset ID]].
4. **OPTIONAL** If you want the audio to start playing when the game begins, enable the **Playing** property.
5. **OPTIONAL** If this [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object is the only track you want to play in the place, enable its **Looped** property.

## Customize sound objects

[[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object properties work together to influence how users experience your audio, such as:

- How loud they hear specific audio individually and in relation to one another ([[30 Official Roblox Docs/Sound/Sound objects#Volume|Volume]]).
- How they perceive volume when they move away from the audio source ([[30 Official Roblox Docs/Sound/Sound objects#RollOffMinDistance and RollOffMaxDistance|RollOffMinDistance]], [[30 Official Roblox Docs/Sound/Sound objects#RollOffMinDistance and RollOffMaxDistance|RollOffMaxDistance]], and [[30 Official Roblox Docs/Sound/Sound objects#RollOffMode|RollOffMode]])
- What part of the audio they can listen to ([[30 Official Roblox Docs/Sound/Sound objects#TimePosition|TimePosition]]).
- How fast and at what pitch they hear it ([[30 Official Roblox Docs/Sound/Sound objects#PlaybackSpeed|PlaybackSpeed]]).
- If the audio automatically replays upon completion ([[30 Official Roblox Docs/Sound/Sound objects#Looped|Looped]]).

### Volume

The [[30 Official Roblox Docs/API Reference/Classes/Sound#Volume|Volume]] property allows you to set the volume of your audio anywhere from `0` (silence) to `10` (booming). If you want to change the volume of multiple [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects at once, parent them under a [[30 Official Roblox Docs/Sound/Sound groups|sound group]].

> [!warning]
> If your source audio is sufficiently loud, you likely don't need to increase the volume to more than `2`, as this property is multiplicative. For example: a [[30 Official Roblox Docs/API Reference/Classes/Sound#Volume|Volume]] value of `4` is four times as loud than a [[30 Official Roblox Docs/API Reference/Classes/Sound#Volume|Volume]] value of `1`, so if your source audio was already loud, the audio might become overwhelming to users.

### RollOffMinDistance and RollOffMaxDistance

[[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance|RollOffMinDistance]] and [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance|RollOffMaxDistance]] determine the range of how a user perceives volume from positional audio. For volumetric audio, [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance|RollOffMinDistance]] is the minimum distance in studs that audio begins to decrease in volume when the client's listener **moves away** from the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], and [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance|RollOffMaxDistance]] property is the maximum distance in studs that a client's listener can hear audio from the surface of the object.

*(image in the full Top G Vault)*

For point source audio, [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance|RollOffMinDistance]] and [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance|RollOffMaxDistance]] work similarly to volumetric audio, but the roll off distance these properties control doesn't surround the object, it only influences the distance outward from the point source.

*(image in the full Top G Vault)*

### RollOffMode

The [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMode|RollOffMode]] property allows you to decide how audio fades as the distance between the user's listener and the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object's parent increases. You can set this property to one of four values of the [[30 Official Roblox Docs/API Reference/Enums/RollOffMode|Enum.RollOffMode]] enum.

*(image in the full Top G Vault)*

| RollOffMode | Description |
| --- | --- |
| `Inverse` (default) | Volume initially fades abruptly from [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|RollOffMinDistance]], but volume fading becomes more gradual the closer a user is to reaching the [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|RollOffMaxDistance]]. Once they reach the [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|RollOffMaxDistance]], the audio falls silent. |
| `Linear` | Volume fades linearly between [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|RollOffMinDistance]] and [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|RollOffMaxDistance]]. Once a user reaches the [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|RollOffMaxDistance]], the audio falls silent. |
| `InverseTapered` | Volume follows the inverse model when close to [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|RollOffMinDistance]] and the linear square model when a user is close to [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|RollOffMaxDistance]]. Audio approaches silence at the maximum distance point. |
| `LinearSquare` | Volume fades between [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|RollOffMinDistance]] and [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|RollOffMaxDistance]] with a linear squared relationship. Audio approaches silence at the maximum distance point. |

> [!warning]
> For most `Inverse` and `Linear` [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMode|RollOffMode]] types, low [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance|RollOffMaxDistance]] values cause audio to abruptly cut off when the listener reaches the [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance|RollOffMaxDistance]]. If you want your audio to gradually decrease in volume, set a higher [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance|RollOffMaxDistance]] value.

### PlaybackSpeed

The [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackSpeed|PlaybackSpeed]] property allows you to determine the speed your audio plays. For example, if you set the [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackSpeed|PlaybackSpeed]] to a value of **2**, your audio plays twice as fast and one octave higher in pitch. Similarly, if you set it to a value of **0.5**, your audio plays twice as slow and one octave lower in pitch.

| | | |
| --- | --- | --- |
| [Audio: CarHorn_HalfSpeed.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/sound-objects/CarHorn_HalfSpeed.mp3) | [Audio: CarHorn_NormalSpeed.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/sound-objects/CarHorn_NormalSpeed.mp3) | [Audio: CarHorn_DoubleSpeed.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/audio/sound-objects/CarHorn_DoubleSpeed.mp3) |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackSpeed\|PlaybackSpeed]] = 0.5 | [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackSpeed\|PlaybackSpeed]] = 1.0 | [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackSpeed\|PlaybackSpeed]] = 2.0 |

### TimePosition

The [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition|TimePosition]] property displays, in seconds, what position within the audio sample a user is currently hearing. This property is useful for either only playing a section of the audio sample, or triggering an event to occur once audio reaches a specific position. For example, the following code sample causes a particle emitter to emit a white ring particle above a part within a limited time range of an audio track.

```lua
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

-- Create a new part
local part = Instance.new("Part")
part.Anchored = true
part.Color = Color3.new(0.75, 0.2, 0.5)
part.Size = Vector3.new(2, 1, 2)
part.Material = Enum.Material.Neon
part.Position = Vector3.new(0, 4, 0)
part.Parent = Workspace

-- Create an attachment on the part
local attachment = Instance.new("Attachment")
attachment.Position = Vector3.new(0, 0.5, 0)
attachment.Parent = part

-- Create a particle emitter on the attachment
local emitter = Instance.new("ParticleEmitter")
emitter.Rate = 5
emitter.Lifetime = NumberRange.new(1.5, 1.5)
emitter.Texture = "rbxassetid://1266170131"
emitter.Speed = NumberRange.new(1, 1)
emitter.Size = NumberSequence.new{NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 6)}
emitter.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.25, 0), NumberSequenceKeypoint.new(1, 1)}
emitter.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
emitter.Parent = attachment

-- Create a sound on the attachment
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://1835405646"
sound.Parent = attachment

-- Play the sound
sound:Play()

-- Start checking if emitter should be enabled
RunService.Heartbeat:Connect(function()
	-- Enable the emitter within a time range of the audio; otherwise disable it
	emitter.Enabled = sound.TimePosition >= 5 and sound.TimePosition < 20
end)
```

### Looped

The [[30 Official Roblox Docs/API Reference/Classes/Sound#Looped|Looped]] property allows you to repeat audio after it has finished playing. When set to `true`, the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object's audio plays again. This is useful to apply to [[30 Official Roblox Docs/Sound/Sound objects#Background audio|background audio]] to ensure your game never has abrupt silence.

## Script sound objects

### Play audio contextually

Aside from auto-playing audio through the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object's [[30 Official Roblox Docs/API Reference/Classes/Sound#Playing|Playing]] property, you can play audio contextually from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] by calling [[30 Official Roblox Docs/API Reference/Classes/Sound#Play|Play()]] on the corresponding [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object. For example:

```lua
local Workspace = game:GetService("Workspace")

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
sound.Looped = true
sound.Parent = Workspace
sound:Play()
```

Alternatively, if the place will feature multiple tracks, you can play a specific track from a client script:

```lua
local SoundService = game:GetService("SoundService")

local musicTrack = SoundService:FindFirstChild("LucidDream")
if musicTrack not musicTrack.IsPlaying then
	musicTrack:Play()
end
```

### Play interface audio

You can play interface audio for [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] such as [[30 Official Roblox Docs/UI/Text & image buttons|buttons]] by hooking up a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object to the [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated|Activated]] event listener. This lets you provide auditory feedback to users, such as when they hover over or press it.

To play a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object's audio when a user activates a [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] or [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]]:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, hover over the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] or [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]], then click the ⊕ button. A contextual menu displays.
2. From the menu, insert either a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]].
3. Paste the following code into the script, then replace `SOUND_NAME` with the name of a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object located inside the [[30 Official Roblox Docs/API Reference/Classes/SoundService|SoundService]] container.

```lua
local SoundService = game:GetService("SoundService")

local button = script.Parent
local sound = SoundService:FindFirstChild("SOUND_NAME")

if not sound.isLoaded then
	sound.Loaded:Wait()
end

local function onButtonActivated()
	if sound and not sound.IsPlaying then
		sound:Play()
	end
end

button.Activated:Connect(onButtonActivated)
```

---
*Source: [Sound objects](https://create.roblox.com/docs/sound/objects) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
