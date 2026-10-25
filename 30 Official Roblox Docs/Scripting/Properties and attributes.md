---
title: "Properties and attributes"
description: "How to use scripts to manipulate object properties and attributes."
area: "30 Official Roblox Docs"
cluster: "Scripting"
source: "https://create.roblox.com/docs/scripting/attributes"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*How to use scripts to manipulate object properties and attributes.*

Making games interactive often means manipulating object properties and attributes:

- Properties are part of the object class. For example, the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|BasePart.Anchored]] property controls physics for the part. In a track and field game, you might want to anchor a discus or javelin the instant it lands so that players have a visual indicator of how far it traveled.

- Attributes are essentially custom properties that you define. For example, the [[30 Official Roblox Docs/Resources/Plant reference project|Plant]] reference project uses attributes to set the purchase price for seeds and the maximum plant size that a pot can hold.

## Replication order

Before you begin retrieving and manipulating objects, you must have an understanding of replication order.

The Roblox Engine doesn't guarantee the order in which objects (and changes to objects) are replicated from the server to the client, which makes the [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|Instance:WaitForChild()]] method essential for accessing objects in client scripts, particularly objects in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

For example, if a server script changes a property of some instance in the Workspace and then calls [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireAllClients|RemoteEvent:FireAllClients()]], the property change might replicate to the client before or after [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent|RemoteEvent.OnClientEvent]] fires. Use the available methods and events to [[30 Official Roblox Docs/Scripting/Properties and attributes#Detect changes|detect changes]] rather than assuming a change has replicated. Changes of the same type, such as two attribute changes, generally **do** arrive in order.

When clients first launch a game, some aspects of replication and script execution are predictable:

1. The client loads the contents of [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]], such as a loading screen, assets, and scripts.
1. [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] (and [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] with a [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]]) in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] run. These scripts can safely get objects from [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] without using [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|Instance:WaitForChild()]]:

   ```lua
   -- Safe
   local ReplicatedFirst = game:GetService("ReplicatedFirst")
   local LoadingScreen = require(ReplicatedFirst.LoadingScreen)
   ```

   These scripts **can't** safely get objects from other [[30 Official Roblox Docs/Scripting/Services|services]], because they might not have loaded yet:

   ```lua
   -- Not safe
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
   local PickupManager = require(ReplicatedStorage.PickupManager)
   ```

   You **can** use [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] in these scripts to get objects from other services, but doing so negates the benefits of using [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]].

1. The client continues loading the rest of the game.

1. When it finishes, the [[30 Official Roblox Docs/API Reference/Classes/DataModel#Loaded|Loaded]] event fires and [[30 Official Roblox Docs/API Reference/Classes/DataModel#IsLoaded|IsLoaded()]] returns true.

1. [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] in `Players.[Player].PlayerScripts` (copied from [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]]) run, as well as client [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. These scripts can safely get objects from [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] without using [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]].

1. The player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] model spawns in the game.

1. [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] in `Workspace.[Character]` (copied from [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]]) run.

If your game uses [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|instance streaming]] ([[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]]), some or most objects might not have loaded into the workspace, so using [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] to access workspace objects becomes an even more important safety measure. In particular, see [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Stream in|stream in]] and [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|per-model streaming controls]] for additional information on loading and tuning streaming behavior.

## Get objects

The first step to modifying object properties and attributes is to get a reference to the object. The simplest solution is to make the script a child of the object in the **Explorer** and use `script.Parent` to reference the object.

*(image in the full Top G Vault)*

```lua
local sign = script.Parent
```

The more universal solution is to get the object from a [[30 Official Roblox Docs/Scripting/Services|service]] using methods like [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|Instance:FindFirstChild()]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|Instance:WaitForChild()]].

*(image in the full Top G Vault)*

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local signsFolder = ReplicatedStorage:WaitForChild("Signs")
local sign = signsFolder:WaitForChild("InteractiveSign")
```

## Modify properties

Properties are straightforward to access — just use a `.` after the object reference — although if you're working with a model, you might need to choose an individual part rather than the model itself.

*(image in the full Top G Vault)*

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local chair = ReplicatedStorage:WaitForChild("Chair")

chair.LeftArmRest.Size = Vector3.new(10, 1, 10)
```

## Create attributes

Although you can create attributes programmatically, the more common solution is to create them with default values in the Studio user interface. Then you can use scripts to modify their values in response to player actions.

*(image in the full Top G Vault)*

For information on creating attributes in Studio, see [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|instance attributes]].

## Set attributes

To modify an attribute's value, call [[30 Official Roblox Docs/API Reference/Classes/Instance#SetAttribute|Instance:SetAttribute()]] with a name and value.

```lua title="Create or Modify Attribute"
local cabbage = script.Parent

cabbage:SetAttribute("Harvestable", true)
```

If the attribute doesn't already exist, this method creates it.

## Get attribute values

To get the value of one existing attribute, call [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttribute|Instance:GetAttribute()]] on the instance.

```lua title="Get Attribute Value"
local cabbage = script.Parent

cabbage:SetAttribute("Harvestable", true)

local isHarvestable = cabbage:GetAttribute("Harvestable")
print(isHarvestable) --> true
```

Similarly, you can get all attributes by calling [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributes|Instance:GetAttributes()]]. This method returns a dictionary of key-value pairs.

```lua title="Get All Attributes"
local cabbage = script.Parent

local cabbageAttributes = cabbage:GetAttributes()

print(cabbageAttributes.GrowthRate) --> 2

for k, v in cabbageAttributes do
	print(k, v)
end
```

## Delete attributes

To delete an attribute, set its value to `nil`.

```lua title="Delete Attribute"
local cabbage = script.Parent

cabbage:SetAttribute("GrowthRate", nil)
```

## Detect changes

There are several ways to listen for changes to properties and attributes:

- The [[30 Official Roblox Docs/API Reference/Classes/Instance#AttributeChanged|Instance.AttributeChanged]] event listens for changes to any attribute and passes the name of the changed attribute as a parameter.
- The [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Instance:GetPropertyChangedSignal()]] method lets you listen for changes to one property and passes no parameters.
- The [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributeChangedSignal|Instance:GetAttributeChangedSignal()]] method lets you listen for changes to one attribute and passes no parameters.

Due to the minimal information that these events and methods pass as parameters, all of them are a good fit for anonymous functions, particularly [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Instance:GetPropertyChangedSignal()]] and [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributeChangedSignal|Instance:GetAttributeChangedSignal()]]. To learn more about anonymous functions and working with events, see [[30 Official Roblox Docs/Scripting/Events/Events|Events]].

```lua title="Listen for Changes"
local cabbage = script.Parent

-- Local functions
local function onAnyPropertyChange(property)
	-- Ignore changes to attributes
	if property ~= "Attributes" then
		print(property) --> Name
		print(cabbage[property]) --> Cabbage1
	end
end

local function onAnyAttributeChange(attribute)
	print(attribute) --> Grow, GrowthRate
	print(cabbage:GetAttribute(attribute)) --> false, 3
end

-- Listen for changes and connect to local functions
cabbage.Changed:Connect(onAnyPropertyChange)
cabbage.AttributeChanged:Connect(onAnyAttributeChange)

-- Listen for changes and connect to anonymous functions
cabbage:GetPropertyChangedSignal("Name"):Connect(function()
	print(cabbage.Name) --> Cabbage1
end)
cabbage:GetAttributeChangedSignal("GrowthRate"):Connect(function()
	print(cabbage:GetAttribute("GrowthRate")) --> 3
end)

-- Fires Changed and GetPropertyChangedSignal()
cabbage.Name = "Cabbage1"

-- Fires Changed and AttributeChanged
cabbage:SetAttribute("Grow", false)

-- Fires Changed, AttributeChanged, and GetAttributeChangedSignal()
cabbage:SetAttribute("GrowthRate", 3)
```

---
*Source: [Properties and attributes](https://create.roblox.com/docs/scripting/attributes) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
