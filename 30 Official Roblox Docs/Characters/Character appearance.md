---
title: "Character appearance"
description: "Customize your in-game character appearance and properties."
area: "30 Official Roblox Docs"
cluster: "Characters"
source: "https://create.roblox.com/docs/characters/appearance"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Customize your in-game character appearance and properties.*

Most games let players use their own Roblox avatar, although some implement an in-game customization system like the [[30 Official Roblox Docs/Resources/Templates#UGC Homestore|UGC Homestore]] template. Other games make limited [[30 Official Roblox Docs/Characters/Character appearance|modifications]] to player avatars such as helmets, wings, or accessories that match the genre.

To create a unique game that alters the appearance of your users, you can customize the default character properties through [[30 Official Roblox Docs/Characters/Character appearance#Global avatar settings|avatar settings]] or a [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|manually modify appearance]].

## Global avatar settings

Studio's **File** ⟩ **Avatar Settings** allows you to quickly set several global player character properties in your game. These settings apply globally to all player character models joining your game. To modify specific characters, such as non-player character models, see [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|manually modify appearance]].

In this window, you can set various presets for clothing, accessories, body parts, collision behavior, animations and more. When editing these settings, a preview of the applied settings displays in the workspace.

For more information, see [[30 Official Roblox Docs/Studio/Avatar Settings|Avatar Settings]].

## Manually modify appearance

Character models contain a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] object that gives the model special characteristics, such as walking, jumping, equipping items, and interacting with the environment.

You can programmatically modify a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] by updating [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]]. This includes player character models or non-player character models in your game.

You can adjust the following character properties in your game using [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]]:

| Character property | Description |
| --- | --- |
| Scale | Number values for physical traits [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeightScale\|height]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WidthScale\|width]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadScale\|head]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BodyTypeScale\|body type]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ProportionScale\|proportion]]. This doesn't affect R6 body types. |
| Accessories | The asset IDs of  [[30 Official Roblox Docs/API Reference/Classes/Accessory\|accessories]] equipped by a character. |
| Classic Clothing | The asset IDs of the [[30 Official Roblox Docs/API Reference/Classes/Shirt\|Shirt]], [[30 Official Roblox Docs/API Reference/Classes/Pants\|Pants]], and [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic\|ShirtGraphic]] image textures that you can apply to the character. |
| Body Part | The asset IDs of the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Face\|Face]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Head\|Head]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#Torso\|Torso]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightArm\|RightArm]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftArm\|LeftArm]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#RightLeg\|RightLeg]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#LeftLeg\|LeftLeg]] parts of a character. |
| Body Colors | The [[30 Official Roblox Docs/API Reference/Classes/BodyColors\|BodyColors]] of the character's individual parts. |
| Animations | The asset IDs of [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animations]] you can use on a character. |

<br>

Customize a character with [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] using the following steps:

1. [[30 Official Roblox Docs/Characters/Character appearance#Create HumanoidDescription|Create a description]] from the user's character, a specific Outfit ID, or from a specific User ID.
2. [[30 Official Roblox Docs/Characters/Character appearance#Modify HumanoidDescription|Modify the description]] to customize the properties that you want to apply to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] character.
3. [[30 Official Roblox Docs/Characters/Character appearance#Apply HumanoidDescription|Apply the description]] on either a single character, all player characters, or even on all spawning characters.

> [!warning]
> When updating a character's properties through [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], it is important to use an up-to-date [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] of that specific [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetAppliedDescription|Humanoid:GetAppliedDescription()]].

### Create HumanoidDescription

You can create a new [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] instance directly within the **Explorer** hierarchy or within a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with the following code:

```lua title="Create new HumanoidDescription instance"
local humanoidDescription = Instance.new("HumanoidDescription")
```

In most cases, you should use an existing [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] instead of a default new [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] by referencing an existing player character, avatar outfit, or user ID.

<br>

#### From the player character

Use the following code sample to create a new [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] based on the player character's current properties:

```lua title="Generate a HumanoidDescription from a player character"
local humanoid = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")

local humanoidDescription = Instance.new("HumanoidDescription")

if humanoid then
	humanoidDescription = humanoid:GetAppliedDescription()
end
```

#### From an existing outfit

Use the following sample code to create a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] from an outfit ID using [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromOutfitId|Players.GetHumanoidDescriptionFromOutfitID]]:

```lua title="Generate a HumanoidDescription from an Outfit ID"
local Players = game:GetService("Players")

local outfitId = 480059254

local humanoidDescriptionFromOutfit = Players:GetHumanoidDescriptionFromOutfitId(outfitId)
```

#### From a specific user

Use the following sample code to create a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] from a user ID using [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromUserId|Players:GetHumanoidDescriptionFromUserId()]]:

```lua title="Generate a HumanoidDescription from a user ID"
local Players = game:GetService("Players")

local userId = 491243243

local humanoidDescriptionFromUser = Players:GetHumanoidDescriptionFromUserId(userId)
```

### Modify HumanoidDescription

To customize [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] properties, set them directly on the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] or use a specified method before applying the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] to a character.

The following code sample provides examples of setting the different types of [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] properties:

```lua title="Update various HumanoidDescription properties"
local humanoidDescription = Instance.new("HumanoidDescription")
humanoidDescription.HatAccessory = "2551510151,2535600138"
humanoidDescription.BodyTypeScale = 0.1
humanoidDescription.ClimbAnimation = 619521311
humanoidDescription.Face = 86487700
humanoidDescription.GraphicTShirt = 1711661
humanoidDescription.HeadColor = Color3.new(0, 1, 0)
```

#### Set multiple accessories

For layered or bulk accessory changes, you can use [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#SetAccessories|HumanoidDescription:SetAccessories()]] to make accessory related updates. The following code sample adds a layered sweater and jacket in that order to a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]]:

```lua title="Change multiple accessories at once"
local humanoidDescription = Instance.new("HumanoidDescription")
local accessoryTable = {
	{
		Order = 1,
		AssetId = 6984769289,
		AccessoryType = Enum.AccessoryType.Sweater
	},
	{
		Order = 2,
		AssetId = 6984767443,
		AccessoryType = Enum.AccessoryType.Jacket
	}
}

humanoidDescription:SetAccessories(accessoryTable, false)
```

### Apply HumanoidDescription

Apply [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] to specific [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] characters in your game with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescription|Humanoid:ApplyDescription()]] or [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterWithHumanoidDescription|Humanoid.LoadCharacterWithHumanoidDescription]].

> [!warning]
> Changing the assets on a character while also changing [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] might lead to undefined behavior.

#### On a single character

[[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescription|ApplyDescription()]] can target any [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. Use the following code to add a new pair of sunglasses and a new torso to the player character:

```lua title = "Update HumanoidDescription for a specific player character"
local humanoid = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
if humanoid then
	local descriptionClone = humanoid:GetAppliedDescription()
	descriptionClone.Torso = 86500008
	-- Multiple face accessory assets are allowed in a comma-separated string
	descriptionClone.FaceAccessory = descriptionClone.FaceAccessory .. ",2535420239"
	-- Apply modified "descriptionClone" to humanoid
	humanoid:ApplyDescription(descriptionClone)
end
```

#### On all player characters

Use the following sample code to apply a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] to all current players in the game:

```lua title = "Update HumanoidDescription for all current player characters"
local Players = game:GetService("Players")

for _, player in Players:GetPlayers() do
	local humanoid = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		-- Create a HumanoidDescription
		local humanoidDescription = Instance.new("HumanoidDescription")
		humanoidDescription.HatAccessory = "2551510151,2535600138"
		humanoidDescription.BodyTypeScale = 0.1
		humanoidDescription.ClimbAnimation = 619521311
		humanoidDescription.Face = 86487700
		humanoidDescription.GraphicTShirt = 1711661
		humanoidDescription.HeadColor = Color3.new(0, 1, 0)
		humanoid:ApplyDescription(humanoidDescription)
	end
end
```

#### On all spawning characters

Use the following sample code to set a specific [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] for all spawning player characters:

```lua title = "Update HumanoidDescription for all spawning characters"
local Players = game:GetService("Players")

-- Stop automatic spawning so it can be done in the "PlayerAdded" callback
Players.CharacterAutoLoads = false

local function onPlayerAdded(player)
	-- Create a HumanoidDescription
	local humanoidDescription = Instance.new("HumanoidDescription")
	humanoidDescription.HatAccessory = "2551510151,2535600138"
	humanoidDescription.BodyTypeScale = 0.1
	humanoidDescription.ClimbAnimation = 619521311
	humanoidDescription.Face = 86487700
	humanoidDescription.GraphicTShirt = 1711661
	humanoidDescription.HeadColor = Color3.new(0, 1, 0)

	-- Spawn character with the HumanoidDescription
	player:LoadCharacterWithHumanoidDescription(humanoidDescription)
end

-- Connect "PlayerAdded" event to "onPlayerAdded()" function
Players.PlayerAdded:Connect(onPlayerAdded)
```

If the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] instance was created in the **Explorer** and parented to the workspace, use the following sample code in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] to access the workspace instance:

```lua
local Players = game:GetService("Players")

-- Stop automatic spawning so it can be done in the "PlayerAdded" callback
Players.CharacterAutoLoads = false

local function onPlayerAdded(player)
	-- Spawn character with "workspace.StudioHumanoidDescription"
	player:LoadCharacterWithHumanoidDescription(workspace.StudioHumanoidDescription)
end

-- Connect "PlayerAdded" event to "onPlayerAdded()" function
Players.PlayerAdded:Connect(onPlayerAdded)
```

## Layered accessories on non-R15

Caged accessories, like layered accessories, use [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] and [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] to stretch and wrap over a target [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. Layered accessories can work with both standard [[30 Official Roblox Docs/Characters/Characters#Player characters|player characters]] and non-R15 models.

Custom implementation of layered accessories, such as a model using a unique cage UV map, cannot be uploaded and published to the Marketplace. However, you can [[30 Official Roblox Docs/Art/Modeling/Cage Meshes/Cage meshes|create custom cage meshes]] for in-game assets like buildings, game-specific clothing, and props.

Whether you are implementing layered accessories on an [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|R15 rigging armature]], or using a custom rig, ensure that your accessories and bodies include the following:

- The target model, typically the body, has a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] component on the meshes that additional models are intended to wrap around.
- The layering model, typically the clothing or accessory, has a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] component on the meshes meant to wrap the target model.
- The **outer cage of the target model**, and the **inner and outer cage of the layering model** have matching UV maps.
  - The corresponding vertices on the target cage should have the same UVs as those vertices on the layer cage.
- If your target model is not R15, or doesn't include a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], you must add a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] object to the layering [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].
  - The [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] must have `Part0` and `Part1` set to link the layering MeshPart to the Part hierarchy of the Model. For example, `Part0` refers to the accessory and `Part1` refers to the parent Part.
- If your target model is both R15 and includes a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], this weld is created automatically.

> [!info]
> See the following resources for additional information on layered accessories and caging:
>
> - [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories#Cage meshes|Layered accessories caging overview]]
> - [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices|Layered accessories caging best practices]]
> - [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications#Cage meshes|Layered accessories cage mesh specifications]]
> - [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Outer cages|Avatar body cage specifications]]

---
*Source: [Character appearance](https://create.roblox.com/docs/characters/appearance) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
