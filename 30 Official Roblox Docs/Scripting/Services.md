---
title: "Services"
description: "Services provide pre-built functionality in the Roblox Engine."
area: "30 Official Roblox Docs"
cluster: "Scripting"
source: "https://create.roblox.com/docs/scripting/services"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Services provide pre-built functionality in the Roblox Engine.*

In [[30 Official Roblox Docs/Scripting/Reuse code|Reuse code]], you might have noticed frequent use of the `game:GetService()` method. Roblox services let you access the built-in features of the engine, like selling in-game items, enabling chat, playing sounds, animating objects, and managing instances.

In fact, services are the first step in **the most fundamental, common pattern of Roblox development**:

1. Get services.
1. Require module scripts.
1. Add local functions.
1. Add the [[30 Official Roblox Docs/Scripting/Events/Events|events]] that trigger those functions.

For example, you might want to save players' positions in the world when they exit your game:

```lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SaveManager = require(ReplicatedStorage:WaitForChild("SaveManager"))

-- Local function that calls a reusable function in the module script.
local function saveProgress(character)
	-- Get the position of the player's character.
	local position = character:FindFirstChild("HumanoidRootPart").Position
	-- Use the saveData function in the module script, which writes to the
	-- DataStoreService.
	SaveManager.saveData(character, position)
end

-- Another local function that calls saveProgress() when a character is removed
-- from the game (in this case, when the player leaves).
local function onPlayerAdded(player)
	player.CharacterRemoving:Connect(saveProgress)
end

-- Calls onPlayerAdded when a player first connects to the game.
Players.PlayerAdded:Connect(onPlayerAdded)
```

Some key details include:

- Because you should only retrieve a service once per script, the convention is to give the variable the same name as the service. This convention applies to module scripts, as well.
- You retrieve services with the global variable [[30 Official Roblox Docs/API Reference/Classes/DataModel|game]], a reference to the root of the data model.
- Roblox doesn't make guarantees around loading order (and [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|instance streaming]] further complicates what is and isn't loaded at any given time), so the use of [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|Instance:WaitForChild()]] is an important safety measure.

Rather than comparing [[30 Official Roblox Docs/API Reference/Libraries/_Index - Libraries|standard libraries]], [[30 Official Roblox Docs/API Reference/Globals/_Index - Globals|global functions and variables]], or third-party libraries, a big part of Roblox development is identifying which of the many, many services can help you add the desired functionality to your games. In the example above, instead of using a standard I/O library to write to disk, you use [[30 Official Roblox Docs/Scripting/Services#Cloud services|cloud services]] to store data.

## Container services

Container services can contain and influence other objects. These container
services reside at the root of the data model and are visible in Studio's
Explorer window. Collectively, these container services
form a structured hierarchy for the data model, so the Roblox Engine can
properly interpret and render your place. The following table includes some common container services.

Service | Description
:--- | :---
[[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] | Contains all objects that render in the 3D world, such as parts and terrain.
[[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] | Contains objects for setting universal lighting effects, such as [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] and [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]].
[[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] and [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] | Contain content and logic that replicates between the server and client.

To further examine the data model, you can use these methods:

- [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#FindService|game:FindService()]] searches for the instance of the specified service.
- [[30 Official Roblox Docs/API Reference/Classes/Instance#GetChildren|game:GetChildren()]] returns an array of all root children of the data model, which are the top-level container services.
- [[30 Official Roblox Docs/API Reference/Classes/Instance#GetDescendants|game:GetDescendants()]] returns an array of all the descendants of the data model, including all container services and their children.

For more information on container services, see the [[30 Official Roblox Docs/Projects/Data model#Object organization|data model]] documentation.

## Scripting services

Scripting services provide standard functionality in the Roblox Engine that you
call within scripts. The following table includes some common scripting services.

Service | Description
:--- | :---
[[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService]] | Used to interpolate numeric properties of other instances from a start to end value, with options for easing direction and style, repeat, and delay.
[[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] | The service responsible for in-game transactions, such as prompting the player to purchase a developer product, subscription, pass, Roblox Premium, etc.
[[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]] | Contains methods and events for frame-by-frame time management, as well as for checking the context (server, client, Studio mode) in which the game is running. Useful for running any process or update on every runtime frame.
[[30 Official Roblox Docs/API Reference/Classes/SoundService|SoundService]] | Controls various global aspects of how audio plays in a game, such as the doppler scale and volumetric audio. Can also contain sound groups to control the volume and dynamic effects properties of multiple audio signals at once.
[[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] | Manages groups (collections) of instances with tags that replicate from the server to the client, letting you more easily assign and work with groups of related instances.

## Cloud services

Roblox also has special cloud services for handling tasks and processes
that occur in the Roblox cloud. The following table includes some common cloud services.

Service | Description
:--- | :---
[[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]] | For storing persistent data across sessions.
[[30 Official Roblox Docs/API Reference/Classes/MemoryStoreService|MemoryStoreService]] | For storing frequent and ephemeral data that change rapidly.
[[30 Official Roblox Docs/API Reference/Classes/MessagingService|MessagingService]] | For communicating between multiple servers during live sessions.

Cloud services also have corresponding web APIs; they're accessible from external scripts or tools. For more information, see [[30 Official Roblox Docs/Cloud/Guides/Open Cloud guides|Open Cloud]].

---
*Source: [Services](https://create.roblox.com/docs/scripting/services) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
