---
title: "Users and players"
description: "How users, players, and characters work together in a Roblox game."
area: "30 Official Roblox Docs"
cluster: "Players"
source: "https://create.roblox.com/docs/players"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*How users, players, and characters work together in a Roblox game.*

When a Roblox user joins a game, they are represented as a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. This [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object contains information about the user that's universal across games, such as their username, friend list, and saved [[30 Official Roblox Docs/Characters/Characters#Player characters|avatar character]], as well as properties, methods, and events that affect the user's [[30 Official Roblox Docs/Players/Users and players#Lifecycle|lifecycle]] between joining and leaving the game. Each [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object also parents four important [[30 Official Roblox Docs/Players/Users and players#Containers|containers]] that you can use to customize a user's experience: [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]], [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]], [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]], and [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]].

Each [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] also exposes a [[30 Official Roblox Docs/API Reference/Classes/Player#User|Player.User]] property, which is a [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] that represents the player's identity within the current game's domain. The [[30 Official Roblox Docs/API Reference/Datatypes/User#Id|Id]] property is always that user's [[30 Official Roblox Docs/Players/Users and scoped user IDs#Effective user IDs and domains|effective user ID]] for the associated domain. For more information on effective user IDs, see [[30 Official Roblox Docs/Players/Users and scoped user IDs|Users and scoped user IDs]].

*(image in the full Top G Vault)*

## Lifecycle

The [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] service contains all the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] instances in a game. Client and server-side scripts can both connect to the [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|Players.PlayerAdded]] and [[30 Official Roblox Docs/API Reference/Classes/Players|Players.PlayerRemoved]] events to perform actions in response to the lifecycle of a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object. Scripts can also connect to the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|Player.CharacterAdded]] and [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterRemoving|Player.CharacterRemoving]] events to perform gameplay-related actions for when the character spawns or despawns.

### User join

When a user client connects to a game, the [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|Players.PlayerAdded]] event fires and passes the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object of the user who joins; you can use this object for numerous purposes such as loading [[30 Official Roblox Docs/Cloud Services/Choose between cloud services|user data]] from a data store or assigning the player to a [[30 Official Roblox Docs/Players/Implement teams|team]].

For example, to load a user's data when they join a game, use the [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|PlayerAdded]] event in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] to retrieve the user's data stored in a data store under their user ID:

```lua title="Script in ServerScriptService"
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local playerDataStore = DataStoreService:GetDataStore("PlayerData")

Players.PlayerAdded:Connect(function(player)
	local userId = player.UserId

	-- Read data store key
	local getSuccess, currentData = pcall(function()
		return playerDataStore:GetAsync(userId)
	end)

	if getSuccess then
		print(currentData)
	end

	-- Do further actions with currentData
end)
```

### Character spawn

By default, a user's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] model represents their platform avatar and [[30 Official Roblox Docs/API Reference/Classes/Players#CharacterAutoLoads|Players.CharacterAutoLoads]] is `true`, meaning the character model automatically spawns when the user joins a game.

When a user's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] spawns, [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] and [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] in [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]] clone into the character model and the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|Player.CharacterAdded]] event fires.
This event passes the new character model to its listeners which you can use to find the character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] object and modify its behavior. For example, you can use [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescription|Humanoid:ApplyDescription()]] to change the outfit of the avatar.

### Character despawn

When the player's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] dies, the server automatically removes the character model after the amount of time specified by [[30 Official Roblox Docs/API Reference/Classes/Players#RespawnTime|Players.RespawnTime]]. You can then use the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterRemoving|Player.CharacterRemoving]] event to reset other objects or update data associated with the character.

### User leave

When a user client disconnects from a game, the server destroys its associated [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object inside the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] service. At this point, the [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerRemoving|Players.PlayerRemoving]] event fires and passes the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object of the user who disconnected. You can use this for numerous purposes such as saving user data, removing player stats from a scoreboard, or destroying player‑created models in the game.

The following example [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] listens to the [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerRemoving|PlayerRemoving]] event and attempts to save the user's data in a data store under their user ID:

```lua title="Script in ServerScriptService"
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local playerDataStore = DataStoreService:GetDataStore("PlayerData")

Players.PlayerRemoving:Connect(function(player)
	local userId = player.UserId

	-- Get the player's data state in the game
	local currentData = getCurrentData(player)

	-- Save to data store
	local setSuccess, errorMessage = pcall(function()
	    playerDataStore:SetAsync(userId, currentData)
	end)

	if not setSuccess then
	    warn(errorMessage)
	end
end)
```

## Containers

Each [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object representing a user's client stores several important containers: [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]], [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]], [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]], and [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]]. At game runtime, several containers in the "edit" data model copy their contents over to these [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] containers, including [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] to [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]], [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] to [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]], and [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] to [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]].

*(image in the full Top G Vault)*

### Backpack

[[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] objects in the [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] make up the player's inventory and display as icon buttons at the bottom of the screen. See [[30 Official Roblox Docs/Players/In-game tools|in‑game tools]] for more information.

As illustrated above, the contents of [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] and the player's [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]] clone to [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] when a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] spawns. When the character dies, the client destroys the [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] and replaces it with a new one.

To disable the default Roblox inventory GUI and replace it with your own, call [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|StarterGui:SetCoreGuiEnabled()]] in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] as outlined in [[30 Official Roblox Docs/Players/Disable default UI|disable default UI]].

### StarterGear

When a player's character spawns, the contents of that player's [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]] are copied into the [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]]. Additionally, when a player connects to a game that permits gear, all of the appropriate gear [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] that the player owns are inserted into that player's [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]].

Unlike [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]], [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]] isn't a service but rather a child of each [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object, so its contents are player‑specific. To use [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]], navigate to your start place's **Permissions** page and then enable gear by its genre or choose specific types to allow.

> [!warning]
> Always test games after adding gear to them to check that users can't easily abuse them there. Gear may include [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] objects which allow the player to perform actions that you might not consider; for example, navigational gear might allow the player to access a part of the map that you don't want them to, and weapon gear may allow the holder to damage other players, possibly without retribution or retaliation.

### PlayerGui

The [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] container stores objects that create the player's GUI. If a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] is a descendant of [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]], any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] inside that [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] displays on the player's screen.

As illustrated above, the contents of [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] automatically copy into the player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] when their player [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] spawns. If [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ResetPlayerGuiOnSpawn|StarterGui.ResetPlayerGuiOnSpawn]] is set to `true`, all the contents of a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] are cleared and replaced with the contents of [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] every time the player's character respawns.

Note that if [[30 Official Roblox Docs/API Reference/Classes/Players#CharacterAutoLoads|Players.CharacterAutoLoads]] is set to `false`, the character
won't spawn and [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] contents won't copy over until
[[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|Player:LoadCharacterAsync()]] is called.

### PlayerScripts

The [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] container is created automatically when a player
joins the game and its main purpose is to contain client scripts copied from the
[[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] container within the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] service. It is especially useful for scripts that aren't tied to a user's character life cycle, such as the general chat system or player input controls.

Unlike the [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] and [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] containers, the
[[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] container is not accessible to the server and server‑side
[[30 Official Roblox Docs/API Reference/Classes/Script|Script]] objects will not run when parented to [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]].

## Ban users

To ensure civility and fair play in your games, you can ban users who violate rules or community guidelines. You can modify ban durations, ban messages, and even extend bans to potential alternate accounts. When using this feature, you must follow banning [[30 Official Roblox Docs/Players/Users and players#Ban guidelines|guidelines]] and [[30 Official Roblox Docs/Players/Users and players#Message guidelines|messaging]].

You have several options for working with bans:

- Each game page on the [Creator Hub](https://create.roblox.com/) has a [[30 Official Roblox Docs/Production/Bans|Bans]] dashboard.
- For programmatic usage with the engine API, see [[30 Official Roblox Docs/API Reference/Classes/Players#BanAsync|Players:BanAsync()]].
- For Open Cloud, see [bans and blocks](https://create.roblox.com/docs/cloud/features/bans-and-blocks).

### Device blocking

In addition to banning an account, [[30 Official Roblox Docs/API Reference/Classes/Players#BanAsync|Players:BanAsync()]] supports **device blocking** through the `ApplyDeviceBlock` field in its config table. When you ban a user who is currently connected to your game with `ApplyDeviceBlock` set to `true`, the device associated with that user is also blocked from rejoining for 24 hours. This option adds friction against ban evasion; banned players can't immediately rejoin the game from a new account on the same device.

- Device blocking currently only applies to players on desktop (Windows and macOS). It does not apply to mobile devices or consoles.
- The device block does not propagate as a ban to any other accounts that have used the device.
- Calling the unban API on the affected user immediately removes any active device block associated with that user's device, allowing them to rejoin the game.

### Ban guidelines

When implementing bans in your game, adhere to the following guidelines:

- Game rules must not contradict Roblox's [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards) and [Terms of Use](https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use). For example, you cannot create a game rule that excludes someone because of their gender, as this violates [Roblox's Discrimination, Slurs, and Hate Speech policy](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards#discrimination-slurs-and-hate-speech).
- Creators must clearly state their game rules somewhere accessible to all users.
- Creators must apply their game rules fairly and not arbitrarily target certain users.
- Users can appeal to creators directly if they believe their ban was incorrect. Roblox will not mediate these appeals, unless the user believes the creator's game rules or enforcement of their rules violate the [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards).
- Roblox can moderate a game if there is reason to believe that a creator's game rules or enforcement of their rules violate the [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards).

### Message guidelines

When a user is banned, they receive an error modal displaying information such as the ban length and reason. In the text-filtered message, you can include additional information such as appeal or contact information as long as you meet Roblox's [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards).

For example, in your ban messages, you are allowed to reference brand names and platforms:

- "Visit the Discord in my group/game page"
- "Message me on Twitter or X"

Mentions of personal information or direct links are not allowed in this message field. This includes posting a specific username or handle, or providing a direct link to a Discord server or X account.

---
*Source: [Users and players](https://create.roblox.com/docs/players) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
