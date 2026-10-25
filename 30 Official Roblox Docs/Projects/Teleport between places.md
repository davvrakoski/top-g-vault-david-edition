---
title: "Teleport between places"
description: "Explains how to use TeleportService to teleport users between different places in your game."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/teleport"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to use TeleportService to teleport users between different places in your game.*

Many games are subdivided into multiple [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places#Create additional places|places]], such as a fantasy world with towns, castles, dungeons, and a vast forest. Use [[30 Official Roblox Docs/API Reference/Classes/TeleportService|TeleportService]] to teleport users between places, to different servers, or even to other games.

> [!warning]
> [[30 Official Roblox Docs/API Reference/Classes/TeleportService|TeleportService]] doesn't support playtesting in Roblox Studio. You must publish the game and test in the Roblox client.

## Teleport players

To teleport players, use [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]]. This method accepts three parameters:

- The [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId|PlaceId]] for users to teleport to.
- An array containing the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] instances you want to teleport.
- An optional [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions|TeleportOptions]] instance that contains custom properties for the [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]] call.

```lua
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local TARGET_PLACE_ID = 12345678901234 -- replace with your own
local playerToTeleport = Players:GetPlayers()[1] -- get the first user in the game

TeleportService:TeleportAsync(TARGET_PLACE_ID, {playerToTeleport})
```

To get the appropriate players to teleport, you might use a [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]] or a [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#Triggered|ProximityPrompt.Triggered]] event to get an individual [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]. Then you can check if the player is part of a team ([[30 Official Roblox Docs/API Reference/Classes/Player#Team|Player.Team]]) or party ([[30 Official Roblox Docs/API Reference/Classes/Player#PartyId|Player.PartyId]]). Finally, you can use [[30 Official Roblox Docs/API Reference/Classes/Team#GetPlayers|Team:GetPlayers()]] or [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetPlayersByPartyId|SocialService:GetPlayersByPartyId()]] if you want to teleport the entire group rather than just the individual.

> [!info]
> To reduce client-side exploits, you can only call [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]] from server scripts. The client-side [[30 Official Roblox Docs/API Reference/Classes/TeleportService#Teleport|Teleport()]] method is deprecated and should not be used for new work, even if your place is configured as "Fully Open." For more information, see [[30 Official Roblox Docs/Projects/Teleport between places#Configure secure teleportation|Configure secure teleportation]].

## Configure secure teleportation

Three settings handle teleport security.

Setting | Description
:--- | :---
(Creator Dashboard) **Audience** > **Access Settings** > **Access Control for Places** | Controls whether players can join any place in your game or must first join the [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places#Create games|start place]].
(Creator Dashboard) **Place** > **Access** > **Direct Access Control** | Overrides your game-level **Access Control for Places** setting for a non-start place.
(Studio) **File** > **Experience Settings** > **Security** > **Allow Third Party Teleports** | Controls teleports from your game to **games that you don't own**. You can leave this setting disabled and still teleport players between published games you own.

**Access Control for Places** controls players teleporting **into** your game and is the most critical setting for preventing teleport-based exploits.

*(image in the full Top G Vault)*

- If you choose **Fully open**, players can join any place in your game through teleports from any game, including deep links, game invites, joining a friend, and more.

  This is a good choice if your game has several places and you want friends to be able to easily join each other no matter which place they're in. If you don't choose this option, players who try to join their friends in non-start places will instead join your game's start place.

- If you choose **Limited to same universe**, players can only join non-start places through teleports within your games. This setting allows both client- and server-initiated teleports.

  This is a good choice if you have a legacy game that you don't want to [[30 Official Roblox Docs/Projects/Teleport between places#Migrate to secure teleports|migrate to secure teleports]].

- If you choose **Secure within universe only**, players can only join non-start places through server-initiated teleports within this game.

  This is a good choice if your game has a strict progression system before players can access certain areas. It's also a good choice if your game has a test place that players shouldn't have access to or for places that exclusively use reserved servers.

> [!success]
> Ultimately, your **Access Control for Places** setting depends on the type of game you want to build. Many games don't need secure teleports.

### Migrate to secure teleports

If you have an existing game that uses client-side teleports and want to require server-initiated teleports, the goal is to move all teleport logic out of client scripts and into server scripts:

1. Find all client scripts that call [[30 Official Roblox Docs/API Reference/Classes/TeleportService#Teleport|Teleport()]].
1. Change these calls to instead fire [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|remote events]]. Alternatively, you can change the calls to instead use [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompts]], [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetectors]], or even just the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]] event.
1. Reimplement the teleport in a server script using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]].
1. When no more [[30 Official Roblox Docs/API Reference/Classes/TeleportService#Teleport|Teleport()]] calls exist, change **Access Control for Places** to **Secure**.

## Create custom teleport screens

When a user triggers a teleport, they see the standard Roblox loading screen as they wait for the new place to load. If desired, you can add a custom teleport screen by calling [[30 Official Roblox Docs/API Reference/Classes/TeleportService#SetTeleportGui|TeleportService:SetTeleportGui()]] on the client.

The following example sets a customized [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] from [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. Any scripts within the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] do **not** run.

```lua
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local teleportGui = ReplicatedStorage.TeleportGui

TeleportService:SetTeleportGui(teleportGui)
```

## Customize teleport options

You can customize teleportations, such as [[30 Official Roblox Docs/Projects/Teleport between places#Teleport to specific servers|teleporting users to a specific server]] and [[30 Official Roblox Docs/Projects/Teleport between places#Send user data along with teleports|sending user data along with teleports]], by setting the [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions|TeleportOptions]] instance and passing it to the [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]] method.

### Teleport to specific servers

To teleport users to specific servers, set the target server using [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions|TeleportOptions]] and pass it to the [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]] method. If you don't specify a server, users are teleported into a public server; the information of the first user in the list is used for matchmaking.

To teleport users to a specific public server, set the [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#ServerInstanceId|TeleportOptions.ServerInstanceId]] property as a valid instance ID, which is a unique identifier for a public server.

```lua
local teleportOptions = Instance.new("TeleportOptions")
teleportOptions.ServerInstanceId = targetServerId
```

To teleport users to a specific reserved server, set a valid [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#ReservedServerAccessCode|TeleportOptions.ReservedServerAccessCode]], which is a unique code for entering a reserved server.

```lua
local teleportOptions = Instance.new("TeleportOptions")
teleportOptions.ReservedServerAccessCode = reservedServerCode
```

To teleport users to a new reserved server, set [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#ShouldReserveServer|TeleportOptions.ShouldReserveServer]] to true.

```lua
local teleportOptions = Instance.new("TeleportOptions")
teleportOptions.ShouldReserveServer = true
```

### Send user data along with teleports

Teleporting a user between places discards any local data associated with that user. You can use the following approaches to handle data persistence between places:

- If your game utilizes **secure** user data like in-game currency or inventory, implement [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|data stores]] or [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores|memory stores]] to maintain data from place to place.

- To send basic **non-secure** data from place to place, call [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#SetTeleportData|TeleportOptions:SetTeleportData()]] before passing it to [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]]. **Don't** pass secure data using this method; the data is visible to the client and unencrypted.

```lua
local teleportData = {
    randomNumber = RNG:NextInteger(1, 100),
}

local teleportOptions = Instance.new("TeleportOptions")
teleportOptions:SetTeleportData(teleportData)
```

To retrieve all data when a user arrives at the new place after a teleport, use the [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|Player:GetJoinData()]] function, which returns a dictionary with a `TeleportData` key.

```lua
local Players = game:GetService("Players")

local function onPlayerAdded(player)
    local joinData = player:GetJoinData()
    local teleportData = joinData.TeleportData
    local randomNumber = teleportData.randomNumber

    print(player.Name .. " joined with the number " .. randomNumber)
end

Players.PlayerAdded:Connect(onPlayerAdded)
```

To retrieve only the teleport data on the client, you can use [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData|TeleportService:GetLocalPlayerTeleportData()]].

## Handle failed teleports

Like any API call that involves network requests, teleports can fail and throw an error. Wrap them in protected calls ([[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]]). Some failures benefit from retries, particularly those involving reserved servers, so we recommend retrying some number of times on failure.

Even if a call succeeds and the teleport initiates, it can still fail at the last moment without throwing an error and leave the user in the server. When this happens, it triggers the [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportInitFailed|TeleportService.TeleportInitFailed]] event.

The following example [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] returns a single `SafeTeleport` function that teleports players in a protected call with retry logic. It also has a `handleFailedTeleport` function to deal with situations in which the call was successful, but the teleport didn't occur.

```lua
local TeleportService = game:GetService("TeleportService")

local ATTEMPT_LIMIT = 5
local RETRY_DELAY = 1
local FLOOD_DELAY = 15

local function SafeTeleport(placeId, players, options)
    local attemptIndex = 0
    local success, result -- define pcall results outside of loop so results can be reported later on

    repeat
        success, result = pcall(function()
            return TeleportService:TeleportAsync(placeId, players, options) -- teleport the user in a protected call to prevent erroring
        end)
        attemptIndex += 1
        if not success then
            task.wait(RETRY_DELAY)
        end
    until success or attemptIndex == ATTEMPT_LIMIT -- stop trying to teleport if call was successful, or if retry limit has been reached

    if not success then
        warn(result) -- print the failure reason to output
    end

    return success, result
end

local function handleFailedTeleport(player, teleportResult, errorMessage, targetPlaceId, teleportOptions)
    if teleportResult == Enum.TeleportResult.Flooded then
        task.wait(FLOOD_DELAY)
    elseif teleportResult == Enum.TeleportResult.Failure then
        task.wait(RETRY_DELAY)
    else
        -- if the teleport is invalid, report the error instead of retrying
        error(("Invalid teleport [%s]: %s"):format(teleportResult.Name, errorMessage))
    end

    SafeTeleport(targetPlaceId, {player}, teleportOptions)
end

TeleportService.TeleportInitFailed:Connect(handleFailedTeleport)

return SafeTeleport
```

The `SafeTeleport` function receives the same arguments as the [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]] function. You can use the following script with the `SafeTeleport` function to perform teleports from anywhere in your game:

```lua
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ServerScriptService = game:GetService("ServerScriptService")

local SafeTeleport = require(ServerScriptService.SafeTeleport)

local PLACE_TO_TELEPORT_TO = 12345678

local function teleport(touchPart)
    local playerToTeleport = game.Players:GetPlayerFromCharacter(touchPart.Parent)

    if playerToTeleport then
        SafeTeleport(PLACE_TO_TELEPORT_TO, {playerToTeleport})
    end
end

script.Parent.Touched:Connect(teleport)
```

---
*Source: [Teleport between places](https://create.roblox.com/docs/projects/teleport) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
