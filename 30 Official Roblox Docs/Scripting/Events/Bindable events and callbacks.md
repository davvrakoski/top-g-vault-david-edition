---
title: "Bindable events and callbacks"
description: "Bindable events and callbacks allow for back-and-forth communication on the same side of the client-server boundary."
area: "30 Official Roblox Docs"
cluster: "Scripting"
source: "https://create.roblox.com/docs/scripting/events/bindable"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Bindable events and callbacks allow for back-and-forth communication on the same side of the client-server boundary.*

[[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] and [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]] objects let you bind behaviors between scripts **on the same side** of the [[30 Official Roblox Docs/Projects/Client-server runtime|client-server]] boundary and communicate a specific desired outcome for in-game actions.

The most common use case for bindable events is for games that have a round-based structure. For example, you might have a "match started" event that lets other scripts start a timer and display a leaderboard, with a corresponding "match ended" event that lets other scripts know when to move players back into a lobby and display the winners.

Because they coordinate activities between scripts, bindable events are typically used on the server, but you can use them on the client, too.

Depending on how your game works, bindable events can help make your code more modular, but [[30 Official Roblox Docs/Scripting/Reuse code|module scripts]] are often a better alternative for situations in which you need to share data between scripts. You can also use bindable events in conjunction with module scripts for a cleaner syntax, as noted in [[30 Official Roblox Docs/Scripting/Reuse code#Custom events|Custom events]].

> [!info]
> To communicate between scripts **across** the client-server boundary, see [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote events]].

## Bindable events

The [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] object enables custom events through asynchronous, one-way communication between scripts.

When you fire a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] through the [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Fire|Fire()]] method, the firing script does **not** yield, and the target function receives the passed arguments with certain [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks#Argument limitations|limitations]]. Like all events, [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvents]] create threads of each connected function, so even if one errors, others continue.

To create a new [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] using the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window in Studio:

1. Hover over the container into which you want to insert the [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]]. We recommend using [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] for communication between server scripts and [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] for communication between client scripts.
2. Click the **⊕** button that appears to the right of the container's name and insert a **BindableEvent** instance.
3. Rename the instance to `TestBindableEvent`.

After you've created a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]], connect a function to its [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Event|Event]] event in one script, and then [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Fire|Fire()]] the event from another script.

```lua title="Event Connection"
local ServerScriptService = game:GetService("ServerScriptService")

-- Get reference to bindable event instance
local bindableEvent = ServerScriptService:WaitForChild("TestBindableEvent")

-- Connect anonymous function to event
bindableEvent.Event:Connect(function(data)
	print(data)  --> Round started!
end)
```

```lua title="Event Firing"
local ServerScriptService = game:GetService("ServerScriptService")

-- Get reference to bindable event instance
local bindableEvent = ServerScriptService:WaitForChild("TestBindableEvent")

-- Fire bindable event
bindableEvent:Fire("Round started!")
```

> [!warning]
> You can connect multiple functions to the same [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]], but Luau executes them in an unpredictable order. To ensure that functions execute in a particular order, combine them into a single function and connect it to the event.

## Custom callbacks

The [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]] object allows for synchronous, two-way communication between scripts. You can use it to define a custom callback function and invoke it manually by calling [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke|BindableFunction:Invoke()]]. The code invoking the function **yields** until the corresponding callback is found, and the callback receives the arguments that you passed to [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke|Invoke()]]. If the callback was never set, the script that invokes it doesn't resume execution.

To create a new [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]] using the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window in Studio:

1. Hover over the container into which you want to insert the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]]. We recommend using [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] for communication between server scripts and [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] for communication between client scripts.
1. Click the **⊕** button that appears to the right of the container's name and insert a **BindableFunction** instance.
1. Rename the instance to `TestBindableFunction`.

Once you've created a [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]], you can connect to its [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#OnInvoke|OnInvoke]] callback in one script, then [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke|Invoke()]] the callback function from another script.

```lua title="Callback Connection"
local ServerScriptService = game:GetService("ServerScriptService")

-- Get reference to bindable function
local bindableFunction = ServerScriptService:WaitForChild("TestBindableFunction")

-- Callback function
local function addTwoNumbers(a, b)
	return a + b
end

-- Set function as bindable function's callback
bindableFunction.OnInvoke = addTwoNumbers
```

```lua title="Event Invocation"
local ServerScriptService = game:GetService("ServerScriptService")

-- Get reference to bindable function
local bindableFunction = ServerScriptService:WaitForChild("TestBindableFunction")

-- Invoke callback function and output returned value
local sum = bindableFunction:Invoke(2, 4)
print(sum)  --> 6
```

> [!warning]
> Each [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]] can only utilize one [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#OnInvoke|OnInvoke]] callback. If you make multiple definitions, only the last one assigned runs. Also note that if the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#OnInvoke|OnInvoke]] callback does not have a `return` statement, the invocation returns `nil`.

## Argument limitations

When you fire a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] or invoke a [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]], it forwards any arguments that you pass with the event or to the callback function. You can pass any type of Roblox object ([[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], etc.), as well as Luau types like numbers, strings, and booleans, although you should carefully consider the following limitations.

### Non-string indices

If any **indices** of a passed table are non-string types, such as an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/Luau/Userdata|userdata]], or [[30 Official Roblox Docs/Luau/Functions|function]], Roblox automatically converts those indices to strings.

```lua title="Event Connection"
local ServerScriptService = game:GetService("ServerScriptService")

local bindableEvent = ServerScriptService:WaitForChild("TestBindableEvent")

local function onEventFire(passedTable)
	for k, v in passedTable do
		print(typeof(k))  --> string
	end
end

-- Connect function to event
bindableEvent.Event:Connect(onEventFire)
```

```lua title="Event Firing"
local ServerScriptService = game:GetService("ServerScriptService")

local bindableEvent = ServerScriptService:WaitForChild("TestBindableEvent")

-- Fire event with table containing a workspace instance as a key
bindableEvent:Fire({
	[workspace.Baseplate] = true
})
```

### Table indexing

If you pass a table of data, do not pass a mixed table of numeric and string keys. Doing so can result in removed elements during the transfer. Instead, pass a table that consists **entirely** of key-value pairs (a dictionary) or **entirely** of numeric indices (an array).

> [!warning]
> In both cases, whether passing a dictionary table or a numerically indexed table, avoid `nil` values for any index.

```lua title="Event Connection"
local ServerScriptService = game:GetService("ServerScriptService")

local bindableEvent = ServerScriptService:WaitForChild("TestBindableEvent")

local function onEventFire(passedTable)
	for k, v in passedTable do
		print(k .. " = " .. v)
		--> 1 = Sword
		--> 2 = Bow
		--> CharName = Diva Dragonslayer
		--> CharClass = Rogue
	end
end

-- Connect function to event
bindableEvent.Event:Connect(onEventFire)
```

```lua title="Event Firing"
local ServerScriptService = game:GetService("ServerScriptService")

local bindableEvent = ServerScriptService:WaitForChild("TestBindableEvent")

-- Numerically indexed table
local inventoryData = {
	"Sword", "Bow"
}
-- Dictionary table
local characterData = {
	CharName = "Diva Dragonslayer",
	CharClass = "Rogue"
}

-- Fire event with consistently-indexed tables
bindableEvent:Fire(inventoryData)
bindableEvent:Fire(characterData)
```

### Table identities

Tables passed as arguments to bindable events and callbacks are copied, meaning they will not be exactly equivalent to those provided when firing the event or invoking the callback. Nor will tables returned to the invoker be exactly equivalent to those provided. You can demonstrate this by running the following script on a [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]] and observing how the table identities differ.

```lua title="Callback Connection"
local ServerScriptService = game:GetService("ServerScriptService")

local bindableFunction = ServerScriptService:WaitForChild("TestBindableFunction")

-- Callback function
local function returnTable(passedTable)
	-- Output table identity on invocation
	print(tostring(passedTable))  --> table: 0x48eb7aead27563d9
	return passedTable
end

-- Set function as bindable function's callback
bindableFunction.OnInvoke = returnTable
```

```lua title="Event Invocation"
local ServerScriptService = game:GetService("ServerScriptService")

local bindableFunction = ServerScriptService:WaitForChild("TestBindableFunction")

local inventoryData = {
	"Sword", "Bow"
}
-- Output original table identity
print(tostring(inventoryData))  --> table: 0x059bcdbb2b576549

local invokeReturn = bindableFunction:Invoke(inventoryData)

-- Output table identity upon return
print(tostring(invokeReturn))  --> table: 0x9fcae7919563a0e9
```

### Metatables

If a table has a metatable, all of the metatable information is lost in the transfer. In the following code sample, the `NumWheels` property is part of the `Car` metatable. When the server receives the following table, the `truck` table has the `Name` property but **not** the `NumWheels` property.

```lua title="Event Connection"
local ServerScriptService = game:GetService("ServerScriptService")

local bindableEvent = ServerScriptService:WaitForChild("TestBindableEvent")

local function onEvent(param)
	print(param)  --> {["Name"] = "MyTruck"}
end

-- Connect function to event
bindableEvent.Event:Connect(onEvent)
```

```lua title="Event Firing"
local ServerScriptService = game:GetService("ServerScriptService")

local bindableEvent = ServerScriptService:WaitForChild("TestBindableEvent")

local Car = {}
Car.NumWheels = 4
Car.__index = Car

local truck = {}
truck.Name = "MyTruck"
setmetatable(truck, Car)

-- Fire event with table including a metatable
bindableEvent:Fire(truck)
```

---
*Source: [Bindable events and callbacks](https://create.roblox.com/docs/scripting/events/bindable) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
