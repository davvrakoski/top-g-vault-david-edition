---
title: "Moods"
description: "Moods are a type of facial animation that loop indefinitely, allowing users to express persistent facial emotion."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/facial-animation/moods"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Moods are a type of facial animation that loop indefinitely, allowing users to express persistent facial emotion.*

A **mood** is a type of facial animation for [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic heads|dynamic heads]] that loops indefinitely, allowing users to express themselves and react to others with a persistent facial emotion. Moods play simultaneously with other character [[30 Official Roblox Docs/Animation/Use animations#Default character animations|default animations]], such as walking, climbing, and swimming, and if the default animation has a facial animation, the default animation blends with the character's mood.

[Video: Overview-Default-Mood.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/moods/Overview-Default-Mood.mp4)

*Default mood*

[Video: Overview-Open-Mouth-Mood.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/moods/Overview-Open-Mouth-Mood.mp4)

*Open mouth mood*

> [!info]
> A mood is a type of facial animation, but not all facial animations are moods. While a mood refers to a specific animation slot that belongs to each character, a facial animation refers to **any** animation that modifies the face channels.

## Create moods

If you have a character model with an animatable head, you can create any mood animation you can think of using the [[30 Official Roblox Docs/Art/Characters/Facial Animation/Animate heads#Use the Face Animation Editor|Face Animation Editor]]. If you don't want to use the [Blocky](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/reference-files/BlockyCharacter.fbx) or [Goblin](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/reference-files/GoblinCharacter.zip) reference character models, you can create or modify an existing model to support animated heads in a third-party modeling software, such as Blender or Maya. For information on how to create an animatable head, see [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads|Create basic heads]].

To create a mood:

1. Add a character model with an animatable head to the viewport.
1. Open the **Face Animation Editor**.

   1. From the toolbar's **Avatar** tab, click **Clip Editor**. The [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] window displays.
   1. In the viewport, select your character model with an animatable head.
   1. In the editor's [[30 Official Roblox Docs/Animation/Animation Editor#Interface|track list]], click the **Face** button. The **Face Animation Editor** displays to the left of the track list.

1. In the **Face Animation Editor**, adjust sliders for the facial parts you want to manipulate. Animation tracks for each facial part you manipulate automatically display in the track list along with keyframes for your current position in the timeline. The character's face also updates in the viewport.

   - To undo a step on a slider, press <kbd>Ctrl</kbd><kbd>Z</kbd> (<kbd>⌘</kbd><kbd>Z</kbd>).
   - To redo a step on a slider, press <kbd>Ctrl</kbd><kbd>Y</kbd> (<kbd>⌘</kbd><kbd>Y</kbd>).
   - To reset a slider to its default value, right click on the slider. A contextual menu displays. Select **Reset Selected**.

1. When you are finished creating your animation, navigate to the **Media and Playback Controls** and click the **…** button. A pop-up menu displays.

   *(image in the full Top G Vault)*

1. Select **Save** or **Save As** to save the mood animation. The animation displays in the **Explorer** window as a child of the **AnimSaves** object (itself a child of the rig).

   *(image in the full Top G Vault)*

1. **OPTIONAL** To assign an asset ID to your mood animation and save it to the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) to use across your games,

   1. In the **Explorer** window, right-click on your new mood animation. A contextual menu displays.
   1. Select **Save to Roblox**. The **Asset Configuration** window displays.
   1. Fill in the following fields:

      - **Title**: A name for your plugin.
      - **Description**: A description that describes what a potential user should expect the plugin to do.
      - **Creator**: The creator you'd like to attribute as the creator of the plugin.

   1. Click the **Submit** button. After a moment, the Asset Configuration dialog displays your mood's [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationID]] that you can use to set the mood to characters within your games.

      *(image in the full Top G Vault)*

## Set moods

Every character with an animatable head has a child **Animate** [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] with a child **mood** [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]] that contains the mood animation that plays on the character's head. The mood animation's default [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationID]] plays a smiling animation, but you can change the character's mood to something else by either directly editing the [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationID]] within the mood [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]], or using the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] system.

*(image in the full Top G Vault)*

> [!warning]
> The code for playing moods doesn't occur in the  **Animate** [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], but in a hidden, internal Roblox script. While you can't edit this internal script, the **mood** [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]] allows you to interact with it in order to customize moods within your games.

### Edit AnimationIds

You can set a specific mood for each character within your game by editing their mood's [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|Animation.AnimationID]] whenever a user triggers an event. For example, the following [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] edits any previously set mood to an animation that [opens the character's mouth](https://www.roblox.com/library/7715145252/moods-11-FaceAnimation) as soon as the user enters the game:

```lua
local Players = game:GetService("Players")

local function onCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")
	local animateScript = character:WaitForChild("Animate")
	animateScript.mood.Animation1.AnimationId = "rbxassetid://7715145252" -- Mood
end

local function onPlayerAdded(player)
	player.CharacterAppearanceLoaded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)
```

### Use the HumanoidDescription

You can also use the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] system to find user characters and edit their [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|AnimationIDs]] for any default animation. For example, the following [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] edits any previously set mood to an animation that gives the character a [half-smile](https://www.roblox.com/catalog/10725833199/Chiseled-Good-Looks-Mood) on the left-side of their face whenever their character is idling:

```lua
local humanoid = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
if humanoid then
	local descriptionClone = humanoid:GetAppliedDescription()
	descriptionClone.IdleAnimation = 10725833199
	-- Apply modified "descriptionClone" to humanoid
	humanoid:ApplyDescription(descriptionClone)
end
```

## Disable moods

To disable moods from your game, you can delete the mood object underneath the **Animate** [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]. For example, the following [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] removes every character's **mood** [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]] as soon as they join the game:

```lua
local Players = game:GetService("Players")

local function onCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")
	local animateScript = character:WaitForChild("Animate")
	animateScript.mood:Destroy()
end

local function onPlayerAdded(player)
	player.CharacterAppearanceLoaded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)
```

---
*Source: [Moods](https://create.roblox.com/docs/art/characters/facial-animation/moods) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
