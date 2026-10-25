---
title: "Friends Locator"
description: "The Friends Locator module lets players easily find and teleport to their friends inside a place."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/modules/friends-locator"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Friends Locator module lets players easily find and teleport to their friends inside a place.*

It can be challenging to locate friends in-game. The **FriendsLocator** [[30 Official Roblox Docs/Resources/Modules/Developer modules|developer module]] lets players easily find and teleport to their friends inside a place.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/developer-modules/friends-locator/Showcase.mp4)

## Module usage

### Installation

To use the **FriendsLocator** module in a game:

1. From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) and select the **Creator Store** tab.

   *(image in the full Top G Vault)*

1. Make sure the **Models** sorting is selected, then click the **See All** button for **Categories**.

   *(image in the full Top G Vault)*

1. Locate and click the **Packages** tile.

1. Locate the **Friends Locator** module and click it, or drag-and-drop it into the 3D view.

   *(image in the full Top G Vault)*

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, move the entire **FriendsLocator** model into [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. Upon running the game the module will begin running.

### Test in Studio

To test the module in Studio, the **FriendsLocator** module must be run in a multi-client simulation, since no friends will be present in a solo playtest.

1. In **StarterPlayerScripts**, create a new [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] and rename it **ConfigureFriendsLocator**.

   *(image in the full Top G Vault)*

1. Paste the following code into the new **ConfigureFriendsLocator** script. The `showAllPlayers` setting within the [[30 Official Roblox Docs/Resources/Modules/Friends Locator#configure|configure]] function ensures that locators are shown for all users while testing in Studio, but not in a published place.

   ```lua title="LocalScript - ConfigureFriendsLocator"
   local RunService = game:GetService("RunService")
   local ReplicatedStorage = game:GetService("ReplicatedStorage")

   local FriendsLocator = require(ReplicatedStorage.FriendsLocator)

   FriendsLocator.configure({
   	showAllPlayers = RunService:IsStudio(), -- Allows for debugging in Studio
   })
   ```

1. From Studio's mezzanine, start a [[30 Official Roblox Docs/Studio/Studio testing modes#Multi-client simulation|multi-client simulation]] with 2 clients. Three new instances of Studio will open; one simulated server and two simulated clients.

   *(image in the full Top G Vault)*

1. Go into either of the **client** Studio instances, move a distance of 100 studs away from the other character, and you should see a **locator icon** appear over its head.

   *(image in the full Top G Vault)*

   > [!info]
   > Due to the way user IDs are handled in Studio, avatar images will not appear on the locator icons during testing.

   > [!warning]
   > By default, clicking/tapping a friends's icon will teleport your character to that character's location. If you keep this default behavior and you find that streaming pause is occurring under the [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|instance streaming]] architecture, you may want to [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Proactive streaming|request area streaming]] around the teleport location as shown in the [[30 Official Roblox Docs/Resources/Modules/Friends Locator#clicked|clicked]] event code sample.

### Connect to events

The **FriendsLocator** module exposes [[30 Official Roblox Docs/Resources/Modules/Friends Locator#Events|events]] so that you can introduce custom behaviors when users interact with a locator icon.

1. Make sure that you've created the **ConfigureFriendsLocator** script outlined in [[30 Official Roblox Docs/Resources/Modules/Friends Locator#Test in Studio|testing in Studio]].
2. Add lines 8 and 11-13 to the script:

   ```lua title="LocalScript - ConfigureFriendsLocator" highlight="8,11-13"
   local RunService = game:GetService("RunService")
   local ReplicatedStorage = game:GetService("ReplicatedStorage")

   local FriendsLocator = require(ReplicatedStorage.FriendsLocator)

   FriendsLocator.configure({
   	showAllPlayers = RunService:IsStudio(), -- Allows for debugging in Studio
   	teleportToFriend = false, -- Prevent teleport on icon click/tap
   })

   FriendsLocator.clicked:Connect(function(player, playerCFrame)
   	print("You clicked on locator icon for", player.DisplayName)
   end)
   ```

3. Conduct a [[30 Official Roblox Docs/Resources/Modules/Friends Locator#Test in Studio|multi-client test]] and click on another character's locator icon. Notice that your character does not teleport to that location, and the event triggers to allow for custom handling of icon clicks.

### Custom locator UI

If the default style does not fit your game, you can replace the default avatar portrait UI with your own UI.

*(image in the full Top G Vault)*

To replace the default UI:

1. Create a new [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] instance inside the **StarterGui** container.

   *(image in the full Top G Vault)*

1. Create a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] instance named **FriendLocator** as a child of the new [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], then add elements like [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabels]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabels]] to design your custom UI.

   *(image in the full Top G Vault)*

1. When finished, **disable** the parent [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] so that the module doesn't show the custom locator UI until needed.

   *(image in the full Top G Vault)*

1. **OPTIONAL** If you want the friend's avatar portrait and [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName|DisplayName]] to show up somewhere in the custom UI, you can place the following instances inside the **FriendLocator** frame.

   - An [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] of the name **Portrait**.
   - A [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] of the name **DisplayName**.

   *(image in the full Top G Vault)*

   The module will look for these items and display the friend's avatar portrait and/or display name respectively.

## API reference

### Functions

#### configure

*configure(config: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Overrides default configuration options through the following keys/values in the `config` table.

| Key | Description | Default |
| --- | --- | --- |
| `alwaysOnTop` | If `true`, shows locator icons on top of everything, preventing them from being blocked by 3D world objects. | true |
| `showAllPlayers` | If `true`, shows locations for all players, not just friends; this can help verify the module's functionality in Studio. | false |
| `teleportToFriend` | Teleports player character to the friend's location when their locator icon is clicked or tapped. | true |
| `thresholdDistance` | Camera distance threshold at which locator icons appear; friends closer than this distance will not display icons. | 100 |
| `maxLocators` | Maximum number of locator icons shown at any given time. | 10 |

```lua title="LocalScript - ConfigureFriendsLocator" highlight="5-11"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FriendsLocator = require(ReplicatedStorage.FriendsLocator)

FriendsLocator.configure({
	alwaysOnTop = true,
	showAllPlayers = false,
	teleportToFriend = true,
	thresholdDistance = 100,
	maxLocators = 10
})
```

### Events

#### clicked

Fires when a locator icon is clicked/activated by the local player. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

| Parameters |  |
| --- | --- |
| player: [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | Player that the locator icon belongs to. |
| playerCFrame: [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the player's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart\|Humanoid.RootPart]] that the locator icon belongs to. |

```lua title="LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local FriendsLocator = require(ReplicatedStorage.FriendsLocator)

local localPlayer = Players.LocalPlayer

FriendsLocator.clicked:Connect(function(player, playerCFrame)
	-- Request streaming around target location
	if Workspace.StreamingEnabled then
		local success, errorMessage = pcall(function()
			localPlayer:RequestStreamAroundAsync(playerCFrame.Position)
		end)
		if not success then
			print(errorMessage)
		end
	end

	print("You clicked on locator icon for", player.DisplayName, "at position", playerCFrame.Position)
end)
```

#### visibilityChanged

Fires when a locator icon is shown/hidden on the local player's screen. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

| Parameters |  |
| --- | --- |
| player: [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] object that the locator icon belongs to. |
| playerCFrame: [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the player's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart\|Humanoid.RootPart]] that the locator icon belongs to. |
| isVisible: `boolean` | Whether the locator icon is currently visible on the local player's screen. Note that this will still be `true` if `alwaysOnTop` is `false` and the locator renders behind an object in the 3D world. |

```lua title="LocalScript" highlight="5-7"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FriendsLocator = require(ReplicatedStorage.FriendsLocator)

FriendsLocator.visibilityChanged:Connect(function(player, playerCFrame, isVisible)
	print("Visibility of locator icon for", player.DisplayName, ":", isVisible)
end)
```

---
*Source: [Friends Locator](https://create.roblox.com/docs/resources/modules/friends-locator) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
