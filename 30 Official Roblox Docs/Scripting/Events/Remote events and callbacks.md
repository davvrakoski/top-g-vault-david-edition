---
title: "Remote events and callbacks"
description: "Remote network events and callbacks allow for back-and-forth communication across the client-server boundary."
area: "30 Official Roblox Docs"
cluster: "Scripting"
source: "https://create.roblox.com/docs/scripting/events/remote"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Remote network events and callbacks allow for back-and-forth communication across the client-server boundary.*

Roblox games are multiplayer by default, so all games inherently communicate between the server and the players' connected clients. In the simplest case, as players move their characters, certain [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] properties, such as states, are communicated to the server, which passes this information to other connected clients.

Remote events and callbacks let you communicate **across** the client-server boundary:

- [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvents]] enable one-way communication (sending a request and **not** yielding for a response).
- [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvents]] enable one-way communication for data that changes continuously or isn't critical to the game's state. These events trade ordering and reliability for improved network performance.
- [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunctions]] enable two-way communication (sending a request and yielding until a response is received from the recipient).

Unlike [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks|bindable events]], which have more limited utility, the use cases for remote events and functions are too numerous to list:

- **Gameplay** - Basic gameplay, such as a player reaching the end of a level, can require a remote event. A client script notifies the server, and server scripts reset the player's position.
- **Server verification** - If a player tries to drink a potion, do they actually _have_ that potion? To ensure fairness, the server has to be the source of truth for a game. A client script can use a remote event to notify the server that the player is drinking a potion, and then server scripts can decide whether the player actually has that potion and whether to confer any benefits.
- **User interface updates** - As the game's state changes, server scripts can use remote events to notify clients of changes to scores, objectives, etc.
- **In-game Marketplace purchases** - For an example implementation that uses remote functions, see [[30 Official Roblox Docs/Production/Monetization/Subscriptions#Prompt subscription purchases|Prompt subscription purchases]].

## Quick reference

The following tables serve as a quick reference for how to use [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvents]] and [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunctions]] to communicate between the client and server.

### Remote events

| [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Client → server\|Client → Server]] |  |
| --- | --- |
| Client | `RemoteEvent:FireServer(args)` |
| Server | `RemoteEvent.OnServerEvent:Connect(function(player, args))` |
| **[[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Server → client\|Server → Client]]** |  |
| Server | `RemoteEvent:FireClient(player, args)` |
| Client | `RemoteEvent.OnClientEvent:Connect(function(args))` |
| **[[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Server → all clients\|Server → All Clients]]** |  |
| Server | `RemoteEvent:FireAllClients(args)` |
| Client | `RemoteEvent.OnClientEvent:Connect(function(args))` |

### Remote functions

| [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Client → server → client\|Client → Server → Client]] |  |
| --- | --- |
| Client | `serverResponse = RemoteFunction:InvokeServer(args)` |
| Server | `RemoteFunction.OnServerInvoke = function(player, args)` |
| **[[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Server → client → server\|Server → Client → Server]]** |  |
| See [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Server → client → server\|risks]]. |  |

## Remote events

A [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] object facilitates asynchronous, one-way communication across the client-server boundary without yielding for a response.

To create a new [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] via the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window in Studio:

1. Hover over the container into which you want to insert the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]]. In order to ensure both server and client access, it must be in a place where both sides can see it, such as [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], although in some cases it's appropriate to store it in [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or inside a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]].
1. Click the **⊕** button that appears to the right of the container's name and insert a **RemoteEvent** instance.
1. Rename the instance to describe its purpose.

Once you've created a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]], it can facilitate one-way communication from [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Client → server|client to server]], from [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Server → client|server to client]], or from the [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Server → all clients|server to all clients]].

*(image in the full Top G Vault)*

*Client → Server*

*(image in the full Top G Vault)*

*Server → Client*

*(image in the full Top G Vault)*

*Server → All Clients*

> [!info]
> Clients cannot communicate directly with other clients, although you can effectively dispatch an event from one client to another by using the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer|RemoteEvent:FireServer()]] method, then calling [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient|FireClient()]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireAllClients|FireAllClients()]] in the event handler for [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnServerEvent|OnServerEvent]].

### Client → server

You can use a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] to trigger an event on the [[30 Official Roblox Docs/Projects/Client-server runtime|server]] by calling the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer|FireServer()]] method on a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]]. If you pass arguments to [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer|FireServer()]], they pass to the event handler on the server with certain [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Argument limitations|limitations]]. Note that the first parameter of the event handler on the server is always the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object of the client that calls it, and additional parameters follow.

| | |
| --- | --- |
| Client | `RemoteEvent:FireServer(args)` |
| Server | `RemoteEvent.OnServerEvent:Connect(function(player, args))` |

The following [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] connects an event handler to [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnServerEvent|OnServerEvent]] that creates a new [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] on the server. The accompanying [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] then calls [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer|FireServer()]] on the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] instance with the desired [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]] for the part.

```lua title="Event Connection - Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Get reference to remote event instance
local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

local function onCreatePart(player, partColor, partPosition)
	print(player.Name .. " fired the RemoteEvent")
	local newPart = Instance.new("Part")
	newPart.Color = partColor
	newPart.Position = partPosition
	newPart.Parent = Workspace
end

-- Connect function to event
remoteEvent.OnServerEvent:Connect(onCreatePart)
```

```lua title="Event Firing - LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get reference to remote event instance
local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

-- Fire the remote event and pass additional arguments
remoteEvent:FireServer(Color3.fromRGB(255, 0, 0), Vector3.new(0, 25, -20))
```

### Server → client

You can use a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] to trigger an event on a [[30 Official Roblox Docs/Projects/Client-server runtime|client]] by calling the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient|FireClient()]] method on a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]]. The first argument for [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient|FireClient()]] is the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object of the client that you want to respond to the event, and additional arguments pass to the client with certain [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Argument limitations|limitations]]. Note that the event handler doesn't need to include the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object as its first argument because you can determine the player on the client with [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]].

| | |
| --- | --- |
| Server | `RemoteEvent:FireClient(player, args)` |
| Client | `RemoteEvent.OnClientEvent:Connect(function(args))` |

The following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] connects an event handler to the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent|OnClientEvent]] event. The accompanying [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] then listens for incoming players to the server and calls [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient|FireClient()]] for each with arbitrary data.

```lua title="Event Connection - LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Get reference to remote event instance
local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

local player = Players.LocalPlayer

local function onNotifyPlayer(maxPlayers, respawnTime)
   print("[Client] Event received by player", player.Name)
   print(maxPlayers, respawnTime)
end

-- Connect function to event
remoteEvent.OnClientEvent:Connect(onNotifyPlayer)
```

```lua title="Event Firing - Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Get reference to remote event instance
local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

-- Listen for incoming players and dispatch remote event to each
local function onPlayerAdded(player)
   print("[Server] Firing event to player", player.Name)
   remoteEvent:FireClient(player, Players.MaxPlayers, Players.RespawnTime)
end
Players.PlayerAdded:Connect(onPlayerAdded)
```

### Server → all clients

You can use a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] to trigger an event on all clients by calling the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireAllClients|FireAllClients()]] method on a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]]. Unlike [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient|FireClient()]], the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireAllClients|FireAllClients()]] method doesn't require a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object because it fires the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] to all clients.

| | |
| --- | --- |
| Server | `RemoteEvent:FireAllClients(args)` |
| Client | `RemoteEvent.OnClientEvent:Connect(function(args))` |

The following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] connects an event handler to the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent|OnClientEvent]] event which outputs a remaining countdown time. The accompanying [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] then calls [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireAllClients|FireAllClients()]] in a loop every second to fire the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] for all clients.

```lua title="Event Connection - LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get reference to remote event instance
local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

local function onTimerUpdate(seconds)
	print(seconds)
end

-- Connect function to event
remoteEvent.OnClientEvent:Connect(onTimerUpdate)
```

```lua title="Event Firing - Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get reference to remote event instance
local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

local countdown = 5

-- Fire the RemoteEvent every second until time expires
for timeRemaining = -1, countdown do
	remoteEvent:FireAllClients(countdown - timeRemaining)
	task.wait(1)
end
```

## Remote callbacks

A [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] object facilitates synchronous, two-way communication across the client-server boundary. The sender of a remote function will yield until it receives a response from the recipient.

To create a new [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] via the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window in Studio:

1. Hover over the container into which you want to insert the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]]. In order to ensure both server and client access, it must be in a place where both sides can see it, such as [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], although in some cases it's appropriate to store it in [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or inside a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]].
1. Click the **⊕** button that appears to the right of the container's name and insert a **RemoteFunction** instance.
1. Rename the instance to describe its purpose.

Once you've created a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]], it can facilitate two-way communication between [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Client → server → client|client and server]] or between [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Server → client → server|server and client]].

*(image in the full Top G Vault)*

*Client → Server → Client*

*(image in the full Top G Vault)*

*Server → Client → Server*

### Client → server → client

You can use a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] to call a function on the [[30 Official Roblox Docs/Projects/Client-server runtime|server]] by calling the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer|InvokeServer()]] method on a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]]. Unlike a [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Remote events|remote event]], the [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] that invokes the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] yields until the callback returns. Arguments that you pass to [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer|InvokeServer()]] pass to the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnServerInvoke|OnServerInvoke]] callback of the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] with certain [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Argument limitations|limitations]]. Note that if you define multiple callbacks to the same [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]], only the last definition executes.

| | |
| --- | --- |
| Client | `RemoteFunction:InvokeServer(args)` |
| Server | `RemoteFunction.OnServerInvoke = function(player, args)` |

The following [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] defines the callback function via [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnServerInvoke|OnServerInvoke]] and returns the requested [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] through its `return` value. The accompanying [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] then calls [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer|InvokeServer()]] with extra arguments defining the requested part color and position.

```lua title="Callback Connection - Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Get reference to remote function instance
local remoteFunction = ReplicatedStorage:FindFirstChildOfClass("RemoteFunction")

-- Callback function
local function createPart(player, partColor, partPosition)
	print(player.Name .. " requested a new part")
	local newPart = Instance.new("Part")
	newPart.Color = partColor
	newPart.Position = partPosition
	newPart.Parent = Workspace
	return newPart
end

-- Set function as remote function's callback
remoteFunction.OnServerInvoke = createPart
```

```lua title="Event Invocation - LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get reference to remote function instance
local remoteFunction = ReplicatedStorage:FindFirstChildOfClass("RemoteFunction")

-- Pass a color and position when invoking the callback
local newPart = remoteFunction:InvokeServer(Color3.fromRGB(255, 0, 0), Vector3.new(0, 25, -20))

-- Output the returned part reference
print("The server created the requested part:", newPart)
```

### Server → client → server

You can use a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] to call a function on the client by calling the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeClient|InvokeClient()]] method on a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]], but it has serious risks as follows:

- If the client throws an error, the server throws the error too.
- If the client disconnects while it's being invoked, [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeClient|InvokeClient()]] throws an error.
- If the client doesn't return a value, the server yields forever.

For actions that don't require two-way communications, such as updating a GUI, use a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] and communicate from [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Server → client|server to client]].

## Delivery guarantees

Each remote type makes different promises about whether a message arrives and in what order. These promises only apply to a single connection in a single direction, meaning from the server to one specific client, or from one specific client to the server.

### RemoteEvents

[[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvents]] are reliable and ordered:

- If a message is lost in transit, Roblox retransmits it until it arrives, as long as the recipient stays connected.
- Messages arrive in the order you fire them, **including across different [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] instances**. For example, if the server fires event **A**, then **B**, then **A** again to the same client, that client receives **A**, **B**, **A**. This applies whether you use [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient|FireClient()]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireAllClients|FireAllClients()]].
- If a client fires events faster than the [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Throttling and size limits|throttling]] limit, the server processes the excess events later instead of dropping them, and they keep their order.

A reliable, ordered message can still fail to reach your code in the following cases:

- **No handler is connected.** If nothing is connected to [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnServerEvent|OnServerEvent]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent|OnClientEvent]] when a message arrives, Roblox queues it and delivers it, in order, as soon as a handler connects. The queue is limited in both count and memory. Once it's full, Roblox discards further messages and logs a `Remote event invocation` error to the [[30 Official Roblox Docs/Studio/Output|Output]] window.
- **The recipient disconnects.** Messages that haven't been delivered when a client leaves are lost.

Ordering applies to when each handler **starts**, not when it finishes. If a handler yields, such as by calling [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]], Roblox can start handling the next message before the earlier handler resumes.

### RemoteFunctions

[[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunctions]] send invocations and responses reliably, so Roblox retransmits lost messages as long as both sides stay connected. Because [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer|InvokeServer()]] and [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeClient|InvokeClient()]] yield until a response arrives, a single thread can't have more than one invocation in flight. Separate threads can invoke at the same time, though, and if a callback yields, responses can come back in a different order than the invocations were sent.

If no callback is assigned to [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnServerInvoke|OnServerInvoke]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnClientInvoke|OnClientInvoke]], Roblox queues invocations until one is. This queue has the same kind of limits as the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] queue.

> [!warning]
> Roblox doesn't guarantee the relative order of [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] invocations and [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] messages. They often arrive in the order you send them, but they're queued separately while no handler is connected, and a yielding callback can delay a response. If your code depends on strict ordering, send all related messages through the same remote type or include your own sequence number.

### UnreliableRemoteEvents

[[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvents]] guarantee neither delivery nor order. They also have no ordering relationship with [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvents]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunctions]]. Roblox might drop a message in any of the following cases, without resending it:

- The message is lost in transit.
- The network is congested and the message waits too long to send.
- The payload is larger than 1,000 bytes.
- The client fires faster than the [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Throttling and size limits|throttling]] limit. Unlike a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]], the server drops the excess messages instead of delaying them.
- Nothing is connected to [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnServerEvent|OnServerEvent]] or [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnClientEvent|OnClientEvent]] when the message arrives. Unlike a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]], Roblox discards the message immediately instead of queuing it.

Roblox also doesn't wait for an earlier message to arrive before processing a later one, so messages can arrive out of order. If order matters, include a timestamp or sequence number in each message and ignore messages older than the latest one you've handled.

### Throttling and size limits

Client-to-server messages are subject to a rate limit that each remote type shares across all of its instances. For current limits, see the **Throttling** section of [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] and the payload limits in [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]].

## Argument limitations

When you fire a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] or invoke a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]], it forwards any arguments that you pass with the event or to the callback function. Any type of Roblox object such as an [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], or others can be passed, as well as Luau types such as numbers, strings, and booleans, although you should carefully explore the following limitations.

### Non-string indices

If any **indices** of a passed table are non-string types such as an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/Luau/Userdata|userdata]], or [[30 Official Roblox Docs/Luau/Functions|function]], Roblox automatically converts those indices to strings.

```lua title="Event Connection - LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

local function onEventFire(passedTable)
	for k, v in passedTable do
		print(typeof(k))  --> string
	end
end

-- Connect function to event
remoteEvent.OnClientEvent:Connect(onEventFire)
```

```lua title="Event Firing - Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

-- Listen for incoming players and dispatch remote event to each
local function onPlayerAdded(player)
	remoteEvent:FireClient(player,
		{
			[Workspace.Baseplate] = true
		}
	)
end
Players.PlayerAdded:Connect(onPlayerAdded)
```

### Passed functions

Functions included as arguments for a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] will **not** be replicated across the [[30 Official Roblox Docs/Projects/Client-server runtime|client-server]] boundary, making it impossible to pass functions remotely. Instead, the resulting argument on the receiving side will be `nil`.

```lua title="Event Connection - LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

local function onClientEvent(func)
	print(func)  --> nil
end

remoteEvent.OnClientEvent:Connect(onClientEvent)
```

```lua title="Event Firing - Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

local function testFunction()
	print("Hello world!")
end

-- Fire remote event with function as an argument
remoteEvent:FireAllClients(testFunction)
```

### Table indexing

If you pass a table of data, do not pass a mixed table of numeric and string keys. Instead, pass a table that consists **entirely** of key-value pairs (dictionary) or **entirely** of numeric indices.

> [!warning]
> Whether passing a dictionary table **or** a numerically indexed table, avoid `nil` values for any index.

```lua title="Event Connection - Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

local function onEventFire(player, passedTable)
	for k, v in passedTable do
		print(k .. " = " .. v)
		--> 1 = Sword
		--> 2 = Bow
		--> CharName = Diva Dragonslayer
		--> CharClass = Rogue
	end
end

-- Connect function to event
remoteEvent.OnServerEvent:Connect(onEventFire)
```

```lua title="Event Firing - LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

-- Numerically indexed table
local inventoryData = {
	"Sword", "Bow"
}
-- Dictionary table
local characterData = {
	CharName = "Diva Dragonslayer",
	CharClass = "Rogue"
}

remoteEvent:FireServer(inventoryData)
remoteEvent:FireServer(characterData)
```

### Table identities

Tables passed as arguments to remote events/callbacks are copied, meaning they will not be exactly equivalent to those provided when firing the event or invoking the callback. Nor will tables returned to the invoker be exactly equivalent to those provided. You can demonstrate this by running the following script on a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] and observing how the table identities differ.

```lua title="Callback Connection - Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteFunction = ReplicatedStorage:FindFirstChildOfClass("RemoteFunction")

-- Callback function
local function returnTable(player, passedTable)
	-- Output table identity on invocation
	print(tostring(passedTable))  --> table: 0x48eb7aead27563d9
	return passedTable
end

-- Set function as remote function's callback
remoteFunction.OnServerInvoke = returnTable
```

```lua title="Event Invocation - LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteFunction = ReplicatedStorage:FindFirstChildOfClass("RemoteFunction")

local inventoryData = {
	"Sword", "Bow"
}
-- Output original table identity
print(tostring(inventoryData))  --> table: 0x059bcdbb2b576549

local invokeReturn = remoteFunction:InvokeServer(inventoryData)

-- Output table identity upon return
print(tostring(invokeReturn))  --> table: 0x9fcae7919563a0e9
```

### Metatables

If a table has a metatable, all of the metatable information is lost in the transfer. In the following code sample, the `NumWheels` property is part of the `Car` metatable. When the server receives the following table, the `truck` table has the `Name` property but **not** the `NumWheels` property.

```lua title="Event Connection - Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

local function onEvent(player, param)
	print(param)  --> {["Name"] = "MyTruck"}
end

-- Connect function to event
remoteEvent.OnServerEvent:Connect(onEvent)
```

```lua title="Event Firing - LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

local Car = {}
Car.NumWheels = 4
Car.__index = Car

local truck = {}
truck.Name = "MyTruck"
setmetatable(truck, Car)

-- Fire event with table including a metatable
remoteEvent:FireServer(truck)
```

### Non-replicated instances

If a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] passes a value that's only visible to the sender, Roblox doesn't replicate it across the client-server boundary and passes `nil` instead of the value. For example, if a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] passes a descendant of [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]], the client listening to the event will receive a `nil` value because that object isn't replicable for the client.

```lua title="Event Firing - Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

-- Will be received as "nil" because client can't access ServerStorage
local storedPart = Instance.new("Part")
storedPart.Parent = ServerStorage

local function onPlayerAdded(player)
	remoteEvent:FireClient(player, storedPart)
end
Players.PlayerAdded:Connect(onPlayerAdded)
```

Similarly, if you create a part in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] and try to pass it to a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], the server will see `nil` because the part isn't replicable for the server.

```lua title="Event Firing - LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

-- Will be received as "nil" because the server doesn't know about this part
local clientPart = Instance.new("Part")
clientPart.Parent = Workspace

remoteEvent:FireServer(clientPart)
```

---
*Source: [Remote events and callbacks](https://create.roblox.com/docs/scripting/events/remote) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
