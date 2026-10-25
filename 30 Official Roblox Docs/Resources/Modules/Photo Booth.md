---
title: "Photo Booth"
description: "The Photo Booth module lets players strike a unique pose with a background."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/modules/photo-booth"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Photo Booth module lets players strike a unique pose with a background.*

Taking a photo is a perfect way to commemorate a great game. The **PhotoBooth** [[30 Official Roblox Docs/Resources/Modules/Developer modules|developer module]] is an easy-to-use photo staging tool which lets the players strike a unique pose with a background that represents their experience.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/developer-modules/photo-booth/Showcase.mp4)

## Module usage

### Installation

To use the **PhotoBooth** module in a game:

1. From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) and select the **Creator Store** tab.

   *(image in the full Top G Vault)*

1. Make sure the **Models** sorting is selected, then click the **See All** button for **Categories**.

   *(image in the full Top G Vault)*

1. Locate and click the **Packages** tile.

1. Locate the **Photo Booth** module and click it, or drag-and-drop it into the 3D view.

   *(image in the full Top G Vault)*

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, move the entire **PhotoBooth** model into [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. Upon running the game the module will begin running.

### Position the booth

The module comes with one **PhotoBooth** model that you can position in the 3D world. This model is what players will interact with to set up a photo.

1. Locate the **PhotoBooth** mesh inside the **Workspace** folder of the module's main folder.

   *(image in the full Top G Vault)*

1. Move it into the top-level **Workspace** hierarchy and position it where desired.

   *(image in the full Top G Vault)*

> [!info]
> It is not required that you use the packaged mesh for triggering photo printouts. The module uses [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] to locate parts tagged as `PhotoBooth` and make them operate as photo booths. If desired, the [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] tag name to search for can be changed by setting a different value for `photoboothTag` in a [[30 Official Roblox Docs/Resources/Modules/Photo Booth#configure|configure]] call.

### Configuration

The module is preconfigured to work for most use cases, but it can be easily customized through the [[30 Official Roblox Docs/Resources/Modules/Photo Booth#configure|configure]] function. For example, to change the default message at the bottom of the photo:

1. In **StarterPlayerScripts**, create a new [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] and rename it to **ConfigurePhotoBooth**.

   *(image in the full Top G Vault)*

1. Paste the following code into the new script.

   ```lua title="LocalScript - ConfigurePhotoBooth"
   local ReplicatedStorage = game:GetService("ReplicatedStorage")

   local PhotoBooth = require(ReplicatedStorage.PhotoBooth)

   PhotoBooth.configure({
   	frameMessage = "First Photo Booth Capture!",
   })
   ```

   *(image in the full Top G Vault)*

### Connect to events

Every time the photo booth displays a new screen to a local client, a corresponding event is fired. These events can be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] so that you can respond with your own custom logic.

```lua title="LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PhotoBooth = require(ReplicatedStorage.PhotoBooth)

PhotoBooth.countdownStarted:Connect(function()
	print("The countdown has started")
end)

PhotoBooth.printoutShown:Connect(function()
	print("The printout is showing")
end)

PhotoBooth.promptShown:Connect(function()
	print("The camera prompt is showing")
end)
```

### GUI visibility

By default, the photo booth hides all [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGuis]] and [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGuis]] when a photo is staged. If you want to override this auto-hiding behavior and programmatically decide which GUIs should remain visible, include the [[30 Official Roblox Docs/Resources/Modules/Photo Booth#hideOtherGuis|hideOtherGuis]] and [[30 Official Roblox Docs/Resources/Modules/Photo Booth#showOtherGuis|showOtherGuis]] callbacks and respond with your own custom logic.

```lua title="LocalScript"
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local PhotoBooth = require(ReplicatedStorage.PhotoBooth)

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local hiddenInstances = {}

-- Create a screen GUI that will not be hidden
local specialGuiInstance = Instance.new("ScreenGui")
-- Draw the screen GUI above the photo booth GUI
specialGuiInstance.DisplayOrder = 1
specialGuiInstance.Parent = playerGui
-- Set attribute on screen GUI to prevent hiding
specialGuiInstance:SetAttribute("ShowInPhotoBooth", true)
-- Add text label to the GUI
local specialLabel = Instance.new("TextLabel")
specialLabel.Size = UDim2.fromScale(1, 0.1)
specialLabel.Text = "Remains visible when taking a photo"
specialLabel.Font = Enum.Font.GothamMedium
specialLabel.TextSize = 24
specialLabel.Parent = specialGuiInstance

PhotoBooth.hideOtherGuis(function()
	-- Hide all developer-defined screen GUIs except those marked with attribute
	local instances = playerGui:GetChildren()
	for _, instance in instances do
		if instance:IsA("ScreenGui") and not instance:GetAttribute("ShowInPhotoBooth") and instance.Enabled then
			instance.Enabled = false
			table.insert(hiddenInstances, instance)
		end
	end
	-- Hide specific core GUIs
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
end)

PhotoBooth.showOtherGuis(function()
	-- Show all developer-defined screen GUIs that were hidden
	for _, instance in hiddenInstances do
		instance.Enabled = true
	end
	hiddenInstances = {}
	-- Show specific core GUIs that were hidden
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
end)
```

## API reference

### Functions

#### configure

*configure(config: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Overrides default configuration options through the following keys/values in the `config` table. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

##### Appearance

| Key | Description | Default |
| --- | --- | --- |
| `frameMessage` | Message that is shown at the bottom of the photo. Its duration can be controlled via the `fadeUiDelay` property. | "Use your device to take a screenshot and share!" |
| `fadeUiDelay` | Time to show the frame message before it fades out, in seconds. Set to a negative number to never fade. | 3 |
| `closeButtonImage` | Image to use for the close photo button, placed overtop the `closeButtonBackgroundImage` image. | "rbxassetid://7027440823" |
| `closeButtonBackgroundImage` | Background image to use for the close photo button. | "rbxassetid://7027440891" |
| `cameraLandscapePosition` | Distance of the photo booth's camera, in front and upward from the character, when taking a photo in landscape mode ([[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]). | (5, 2) |
| `cameraPortraitPosition` | Distance of the photo booth's camera, in front and upward from the character, when taking a photo in portrait mode ([[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]). | (10, 1) |
| `countdownFont` | Font to use for the numbers in the countdown ([[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]]). | [[30 Official Roblox Docs/API Reference/Enums/Font\|GothamBlack]] |
| `countdownTextColor` | Color of the numbers in the countdown ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [255, 255, 255] |
| `printoutCharacterPosition` | Position of the character on the screen when the printout is showing ([[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]]). | (0.5, 0, 0.5, 0) |
| `printoutCharacterSize` | Amount of screen space the character takes up in the printout ([[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]]). | (1, 0, 1, 0) |
| `characterAnimation` | Asset ID of the animation the character takes in the photo, paused at its starting frame. | "rbxassetid://6899663224" |
| `filterImage` | Image to apply over the photo as a filter. If `nil`, a default filter that darkens the image edges will be used. | `nil` |

##### Behavior

| Key | Description | Default |
| --- | --- | --- |
| `maxActivationDistance` | Maximum distance, in studs, a player's character can be from the photo booth for the prompt to appear. | 10 |
| `countdownBeepSound` | Asset ID of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] to play for each number shown in the countdown. | "rbxassetid://7743999789" |
| `countdownFlashSound` | Asset ID for the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] to play when the flash effect is shown. | "rbxassetid://7744000850" |
| `countdownSeconds` | Number of seconds to count down for. | 3 |
| `photoboothTag` | Tag used by [[30 Official Roblox Docs/API Reference/Classes/CollectionService\|CollectionService]] to find all "booths" in the place. | "PhotoBooth" |

```lua title="LocalScript - ConfigurePhotoBooth"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PhotoBooth = require(ReplicatedStorage.PhotoBooth)

PhotoBooth.configure({
	frameMessage = "What a cool pose!",
	fadeUiDelay = 5,
	maxActivationDistance = 5,
	printoutCharacterSize = UDim2.fromScale(1.5, 1.5),
})
```

#### setBackgrounds

*setBackgrounds(backgrounds: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Overrides the default backgrounds provided by the photo booth. Background images should be at 16:9 aspect ratio (1024×576) for an optimal experience and their asset IDs should be included in the backgrounds array. 1–4 (inclusive) backgrounds can be provided.

```lua title="LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PhotoBooth = require(ReplicatedStorage.PhotoBooth)

PhotoBooth.setBackgrounds({
    "rbxassetid://7018713114",
    "rbxassetid://950538356",
})
```

### Events

#### countdownStarted

Fires when the countdown starts. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PhotoBooth = require(ReplicatedStorage.PhotoBooth)

PhotoBooth.countdownStarted:Connect(function()
	print("The countdown has started")
end)
```

#### printoutShown

Fires when the printout is shown to the user. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PhotoBooth = require(ReplicatedStorage.PhotoBooth)

PhotoBooth.printoutShown:Connect(function()
	print("The printout is showing")
end)
```

#### promptShown

Fires when the printout is closed and the camera button is showing again. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PhotoBooth = require(ReplicatedStorage.PhotoBooth)

PhotoBooth.promptShown:Connect(function()
	print("The camera prompt is showing")
end)
```

### Callbacks

#### hideOtherGuis

*hideOtherGuis(callback: `function`)*

This callback runs immediately before the printout is displayed, letting you disable entire [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGuis]] or elements within them before the printout is shown. GUIs used by the photo booth have the attribute **ShowInPhotoBooth** set to **true**. See [[30 Official Roblox Docs/Resources/Modules/Photo Booth#GUI visibility|GUI Visibility]] for details and sample code.

#### showOtherGuis

*showOtherGuis(callback: `function`)*

This callback runs after the printout has been closed, letting you reenable entire [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGuis]] or elements within them. GUIs used by the photo booth have the attribute **ShowInPhotoBooth** set to **true**. See [[30 Official Roblox Docs/Resources/Modules/Photo Booth#GUI visibility|GUI Visibility]] for details and sample code.

---
*Source: [Photo Booth](https://create.roblox.com/docs/resources/modules/photo-booth) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
