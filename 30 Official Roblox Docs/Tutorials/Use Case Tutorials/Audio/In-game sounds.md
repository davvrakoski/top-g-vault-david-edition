---
title: "In-game sounds"
description: "The process for creating positional and feedback sounds to enhance a game."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/audio/in-game-sounds"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The process for creating positional and feedback sounds to enhance a game.*

In addition to background music, in-game audio can enhance a player's experience. This tutorial will cover two forms of in-game sounds: **positional** and **feedback** sounds.

For the first example, you'll create a positional sound for a waterfall. In the second example, a script will be used to play a jingle when players touch a collectable.

## Positional sounds

When a **Sound** object is parented to a part or attachment, it becomes positional. Audio will emit from its location and grow louder as players get closer, as in the case of this waterfall.

[Video: ingameSounds-waterfall-web.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/in-game-sounds/ingameSounds-waterfall-web.mp4)

### Create a sound

1. In any desired part, create a new **Sound** object named **WaterfallSound**.

   *(image in the full Top G Vault)*
   *(image in the full Top G Vault)*

2. In the properties, find **SoundId** and change it to this waterfall ambience: `rbxassetid://6564308795`.

   *(image in the full Top G Vault)*

   > [!info]
   > Custom sounds can be imported using the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md). Additionally, free sounds uploaded by Roblox and the community can be found using the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md).

3. For continuous playback when the game starts, toggle **Playing** and **Looped** to be **on**.

   *(image in the full Top G Vault)*

4. Playtest the game to confirm you hear the waterfall ambience.

### Adjust sound distance

Notice when testing, the audio plays immediately, even if the player is far away from the object. Using the roll-off properties, you can modify the distance at which a player hears a sound to create fading effects.

1. Change the [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance|RollOffMaxDistance]] to **30**. This property is measured in studs.

   *(image in the full Top G Vault)*

2. For a smoother fade, change the **RollOffMode** to **InverseTapered**. This makes approaching the sound feel less sudden.

   *(image in the full Top G Vault)*

3. Run the project. Notice how sound is only heard near the object.

   [Video: ingameSounds-waterfall-web.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/in-game-sounds/ingameSounds-waterfall-web.mp4)

### Fine tune the roll off

Depending on your needs, you may want to adjust different properties for special effects or increased realism. See the following properties:

- [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance|RollOffMinDistance]] - Minimum distance (in studs) a sound decreases in volume.
- [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] - Used to adjust and balance volume between groups of sounds, like background music and in-game effects.

## Feedback sounds

Sounds can be played on command using scripts. You can link sounds to events, such as players touching a part or interacting with a menu. Here, you'll create a script that plays a chime whenever players touch collectable objects.

[Video: ingameSounds-collectables.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/in-game-sounds/ingameSounds-collectables.mp4)

### Set up collectables

The remainder of this tutorial uses a pre-made model. This model includes parts and scripts so players can collect gemstones.

1. In a browser, open the [Collectable Gems Model](https://www.roblox.com/library/6564500052/Collectable-Gems) page, and click the **Get** button.

   *(image in the full Top G Vault)*

- From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) and select the **Inventory** tab.
- Make sure the dropdown is on **My Models**.
- Select the **Collectable Gems** model to add it into the game.

1. In **SoundService**, create a new **Sound** named **FeedbackSound**.

   *(image in the full Top G Vault)*

2. In FeedbackSound, set the **SoundId** to `rbxassetid://4110925712`- the SoundId of the simple chime downloaded from the model page.

   *(image in the full Top G Vault)*

### Set up the script

1. In **StarterPlayer** ⟩ **StarterPlayerScripts**, create a new local script named **CollectableSounds**.

2. The code below will run the `partTouched` function whenever the player touches a collectable. Copy the code into your script.

   ```lua
   local pickupObjects = workspace.Collectables.Objects
   local objectsArray = pickupObjects:GetChildren()

   local function partTouched(otherPart, objectPart)
   	local whichCharacter = otherPart.Parent
   	local humanoid = whichCharacter:FindFirstChildWhichIsA("Humanoid")

   	if humanoid and objectPart.CanCollide == true then

   	end
   end

   -- Binds every object part to the touch function so it works on all parts
   for objectIndex = 1, #objectsArray do
   	local objectPart = objectsArray[objectIndex]
   	objectPart.Touched:Connect(function(otherPart)
   		partTouched(otherPart, objectPart)
   	end)
   end
   ```

### Play a sound

1. Create a variable for **SoundService**, then another variable to store the **feedback sound**.

   ```lua
   local pickupObjects = workspace.Collectables.Objects
   local objectsArray = pickupObjects:GetChildren()

   local SoundService = game:GetService("SoundService")
   local feedbackSound = SoundService:FindFirstChild("FeedbackSound")

   local function partTouched(otherPart, objectPart)
   ```

2. To play the chime, find the function `partTouched`. Within the if statement, call `feedbackSound:Play()` to play the sound.

   ```lua
   local function partTouched(otherPart, objectPart)
   	local whichCharacter = otherPart.Parent
   	local humanoid = whichCharacter:FindFirstChildWhichIsA("Humanoid")

   	-- Play the sound, once finished, destroy the object
   	if humanoid and objectPart.CanCollide == true then
   		feedbackSound:Play()
   	end
   end
   ```

3. Playtest the game to confirm that when the player touches a collectable, it both disappears and plays a sound.

   [Video: ingameSounds-collectables.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/in-game-sounds/ingameSounds-collectables.mp4)

---
*Source: [In-game sounds](https://create.roblox.com/docs/tutorials/use-case-tutorials/audio/in-game-sounds) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
