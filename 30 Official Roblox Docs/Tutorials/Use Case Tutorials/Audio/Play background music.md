---
title: "Play background music"
description: "The process for creating background music in your game."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/audio/play-background-music"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The process for creating background music in your game.*

Audio in Roblox is created with a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object. Sounds can be positional, such as the sound of a waterfall, or universal for all players. This tutorial will show you how to create a universal sound to play background music.

[Video: introToSound_bgMusic_web.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/playing-background-music/introToSound_bgMusic_web.mp4)

## Play music

You can [[30 Official Roblox Docs/Audio/Audio assets#Import audio|upload]] music or [[30 Official Roblox Docs/Audio/Audio assets#Find audio|obtain it from the marketplace]], which contains thousands of free-to-use tracks. For this tutorial, you need the **asset ID** of a track.

The basic steps are to copy an asset ID, create a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object, and use a script to play the music.

### Sound setup

If a sound object is parented to a part, sound will emit from its position. If a sound object is parented to **SoundService**, it will play at the same volume at every point in the 3D world. This makes SoundService ideal for storing background music.

1. In **SoundService**, insert a **Sound** object named **BackgroundMusic**.

   *(image in the full Top G Vault)*

2. In the newly created sound, find the **SoundId** property. Paste in the previously copied sound ID (or use one below) and press <kbd>Enter</kbd>.

   *(image in the full Top G Vault)*

3. Test that the sound works by clicking the Preview button.

   *(image in the full Top G Vault)*

Here are some sample music IDs you can use:

- **Creepy Organ/Dungeon** - `rbxassetid://1843463175`
- **Upbeat Electronica** - `rbxassetid://1837849285`
- **Grandiose Fantasy** - `rbxassetid://1848183670`

### Play the song

Background music can be played through a script.

1. In **StarterPlayer** ⟩ **StarterPlayerScripts**, create a **LocalScript** named **MusicPlayer**.

   *(image in the full Top G Vault)*

2. In the script, create variables to store **SoundService** and the **BackgroundMusic** object.

   ```lua
   local SoundService = game:GetService("SoundService")
   local backgroundMusic = SoundService.BackgroundMusic
   ```

3. Sounds are played using the [[30 Official Roblox Docs/API Reference/Classes/Sound#Play|Play]] function. In a new line, call it on the `backgroundMusic` variable.

   ```lua
   local SoundService = game:GetService("SoundService")
   local backgroundMusic = SoundService.BackgroundMusic

   backgroundMusic:Play()
   ```

4. Playtest the game and confirm that the music is audible.

### Audio properties

Currently, the music doesn't loop. Additionally, the original sound file may be too loud for background music. These settings can be changed through two properties.

1. In the **BackgroundMusic** properties, toggle **Looped** to be **on**.

   *(image in the full Top G Vault)*

2. Lower the **Volume** to around **0.25**.

   *(image in the full Top G Vault)*

With this project done, explore using scripts to implement other features in music. For instance, try using a script to shuffle songs in a soundtrack or play songs in different areas of your 3D world.

For more on sounds and background music, see [[30 Official Roblox Docs/Sound/Sound|Audio]].

---
*Source: [Play background music](https://create.roblox.com/docs/tutorials/use-case-tutorials/audio/play-background-music) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
