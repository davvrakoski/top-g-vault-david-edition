---
title: "Reuse code"
description: "How to use module scripts to reuse code."
area: "30 Official Roblox Docs"
cluster: "Scripting"
source: "https://create.roblox.com/docs/scripting/module"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*How to use module scripts to reuse code.*

After creating a few scripts, it's never long before you want to reuse some code between them. Depending on [[30 Official Roblox Docs/Scripting/Script types and locations|location]], [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] let you reuse code between scripts on different sides of the client-server boundary or the same side of the boundary.

You can put module scripts anywhere that you put scripts, but [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] is a popular location; storing module scripts here lets you reuse code between the server and clients.

## Anatomy of a module script

In Roblox Studio, add a module script to **ReplicatedStorage** and rename it to `PickupManager`. Each [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] starts with the following code:

```lua
local module = {}

return module
```

This code creates an empty Luau [[30 Official Roblox Docs/Luau/Tables|table]] and returns it to any script that requires the module script.

The return value can be any [[30 Official Roblox Docs/API Reference/Datatypes/_Index - Datatypes|data type]] except for `nil`, but most module scripts return a function, a table, or a table of functions. To generate its return value, module scripts can of course run arbitrary code, which includes requiring other module scripts.

> [!info]
> Be careful not to have module scripts require each other in a circular manner, which results in a `Requested module was required recursively` error.

The following example returns a table with a single function called `getPickupBonus`. Paste it into the new module script:

```lua
-- ModuleScript in ReplicatedStorage
local PickupManager = {}

local defaultMultiplier = 1.25
local rarityMultipliers = {
	common = 10,
	uncommon = 20,
	rare = 50,
	legendary = 100
}

-- Add the getPickupBonus function to the PickupManager table
PickupManager.getPickupBonus = function(rarity)
	local bonus = rarityMultipliers[rarity] * defaultMultiplier
	return bonus
end

return PickupManager
```

Adding the function to a table isn't strictly necessary—you could just return the function itself—but it's a good pattern to follow; it gives you an easy-to-understand syntax when you call the function from another script and lets you easily add more functions to the module script over time.

## Require module scripts

To load a module script, you call the [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] function. In `ReplicatedStorage`, add a new script, and change its `RunContext` to `Client`. Then add the following code to call the `PickupManager.getPickupBonus` function:

```lua title="Client script in ReplicatedStorage"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get the value returned by the ModuleScript
local PickupManager = require(ReplicatedStorage:WaitForChild("PickupManager"))

-- Call a ModuleScript function
local bonus = PickupManager.getPickupBonus("legendary")
print(bonus)  --> 125
```

> [!info]
> The [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|Instance:WaitForChild()]] pattern is an important safety measure in client scripts. For more information, see [[30 Official Roblox Docs/Scripting/Properties and attributes#Replication order|Replication order]].

Storing module scripts in `ReplicatedStorage` lets you share code between the server and client, so you can use the same code to require the script from `ServerScriptService`:

```lua title="Script in ServerScriptService"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PickupManager = require(ReplicatedStorage:WaitForChild("PickupManager"))
```

When you call [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] on a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]], it runs once and returns a single item as a reference. Calling [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] again returns the exact same reference, meaning that if you modify a returned [[30 Official Roblox Docs/Luau/Tables|table]] or [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], subsequent [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] calls return that modified reference. The module itself doesn't run multiple times.

If you require a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] from both sides of the client-server boundary, as in the example above, the [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] returns a unique reference for each side.

## Patterns

Module scripts have some common patterns that you can use to simplify your code and avoid pitfalls as your game grows in size and complexity.

> [!success]
> Most of these patterns require an understanding of events. If you're not familiar with them, see [[30 Official Roblox Docs/Scripting/Events/Events|Events]].

### Data sharing

To associate data with individual objects, you can assign attributes to them or create [[30 Official Roblox Docs/API Reference/Classes/Configuration|Configuration]] folders with value objects such as [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]] or [[30 Official Roblox Docs/API Reference/Classes/IntValue|IntValue]]. However, both approaches are troublesome if you want to add or modify dozens of objects or data values. They also don't store tables or functions.

If you want to modify the same data for multiple copies of the same
object or reuse the same data for different objects, store the data in
[[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]]. It's an easier way for you to reuse the data in other scripts, and you can store tables and functions.

The following example [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] stores the configuration values for a generic gun:

```lua title="ModuleScript in ReplicatedStorage"
local GunConfig = {}

GunConfig.MagazineSize = 20
GunConfig.AmmoCount = 100
GunConfig.Firerate = 600
GunConfig.Damage = {
  ["Head"] = 50;
  ["Torso"] = 40;
  ["Body"] = 25;
}

return GunConfig
```

### Custom events

Custom events enable scripts to communicate with each other, but having to keep track of references to individual [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] objects can clutter your code.

You can use [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] to store
[[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvents]] and provide
custom event handlers that are directly tied to the methods of [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]].

The following [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] has a custom event that fires when the switch changes state:

```lua title="ModuleScript in ReplicatedStorage"
local Switch = {}

-- Creating bindable so any script can listen to when the switch was changed
local bindableEvent = Instance.new("BindableEvent")
Switch.Changed = bindableEvent.Event

local state = false
function Switch.flip()
  state = not state
  bindableEvent:Fire(state)
end

return Switch
```

The following client script in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] connects a function to call when the `Switch.Changed` event fires.

```lua title="Script in ReplicatedStorage"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Switch = require(ReplicatedStorage:WaitForChild("Switch"))

Switch.Changed:Connect(function(newState)
  print("Switch state is now", newState)
end)

-- Test the flipping a few times
task.wait(1)
Switch.flip()
task.wait(1)
Switch.flip()
```

### Encapsulation

Encapsulation is the practice of creating a layer of abstraction around objects or scripting logic to hide complexity. You can use [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] to encapsulate Roblox objects with custom Luau functions to simplify code.

For example, you can use encapsulation to:

- Simplify cross-network communication with a single [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] object.
- Wrap error handling code around sensitive services such as [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]].
- Define custom methods to control or extend Roblox object features.

It's difficult to keep track of dozens of individual [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] objects to implement networking in a game. You can use a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] to encapsulate a single [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] to help simplify this problem. By including a unique `id` argument, you can still send different network messages while only using a single [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]].

In the example below, the [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] named `NetworkManagerClient` encapsulates the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer|RemoteEvent:FireServer()]] method to include this extra `id` argument. Additionally, this [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] references the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] object itself so you don't have to reference it in other parts of your code. You only need to require this [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] to send network messages and don't need to deal with [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] objects in the rest of your codebase.

The following [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] provides an encapsulated function that you can call on your client scripts to send a network message:

```lua title="Network Module"
-- ModuleScript in ReplicatedFirst named NetworkManagerClient
local NetworkManagerClient = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")

-- Encapsulating the remote object's FireServer function
function NetworkManagerClient.FireServer(id, ...)
  remoteEvent:FireServer(id, ...)
end

return NetworkManagerClient

```

The following [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] in [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] uses [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvents]] for every script to connect to a specific ID. When a client sends a network message, each [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] associated with the specified ID fires.

```lua
-- ModuleScript in ServerScriptService named NetworkManagerServer
local NetworkManagerServer = {}

local networkSignalList = {}
function NetworkManagerServer.GetServerEventSignal(id)
	local bindableEvent = Instance.new("BindableEvent")
	-- Linking the new BindableEvent to the id
	table.insert(networkSignalList, {
		id = id,
		bindableEvent = bindableEvent,
	})
	return bindableEvent.Event
end

-- Connecting to
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")
remoteEvent.OnServerEvent:Connect(function(player, id, ...)
	-- Finding every bindable event that matches the ID of the received remote event
	for _, signal in networkSignalList do
		if signal.id == id then
			signal.bindableEvent:Fire(player, ...)
		end
	end
end)

return NetworkManagerServer
```

The following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] sends a message with the ID `RequestA` with an optional `Hello` argument.

```lua
-- LocalScript in ReplicatedFirst
local ReplicatedFirst = game:GetService("ReplicatedFirst")

local NetworkManagerClient = require(ReplicatedFirst:WaitForChild("NetworkManagerClient"))
NetworkManagerClient.FireServer("RequestA", "Hello")
```

The following [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] connects to the network message ID `RequestA` and prints out a statement with any additional parameters when it receives the request.

```lua
-- Script in ServerScriptService
local ServerScriptService = game:GetService("ServerScriptService")

local NetworkManagerServer = require(ServerScriptService:WaitForChild("NetworkManagerServer"))
NetworkManagerServer.GetServerEventSignal("RequestA"):Connect(function(player, ...)
	print("Received RequestA from", player, ...)
end)
```

---
*Source: [Reuse code](https://create.roblox.com/docs/scripting/module) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
