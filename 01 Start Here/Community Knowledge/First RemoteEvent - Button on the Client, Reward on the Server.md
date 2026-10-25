---
area: "01 Start Here"
cluster: "Start Here"
title: "First RemoteEvent - Button on the Client, Reward on the Server"
tags: [roblox, community-knowledge, start-here, remote-events, networking, security]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/events/remote
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://devforum.roblox.com/t/remote-events-in-a-nutshell/3051312
  - https://devforum.roblox.com/t/how-would-i-use-a-remote-event/751447
  - https://devforum.roblox.com/t/remote-event-not-firing/789423
---
# First RemoteEvent - Button on the Client, Reward on the Server

Sooner or later a player presses something on their screen (a GUI button, a key) and the result must be real for everyone: coins, a door opening, an attack. Clients cannot do that alone, so they **ask** the server through a **RemoteEvent**, and the server checks and acts. Getting this one pattern right also gets your first anti-exploit habit right: never trust what the client sends.

## The three pieces

```
ReplicatedStorage
└─ ClaimReward        (RemoteEvent)    -- both sides can see it
StarterGui/MainGui/ClaimButton
└─ LocalScript                         -- asks
ServerScriptService
└─ RewardServer       (Script)         -- decides
```

## Client: ask

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local claimReward = ReplicatedStorage:WaitForChild("ClaimReward")

script.Parent.Activated:Connect(function()
	claimReward:FireServer()
end)
```

## Server: check, then act

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local claimReward = ReplicatedStorage:WaitForChild("ClaimReward")

local REWARD = 25
local COOLDOWN = 60
local lastClaim = {}

claimReward.OnServerEvent:Connect(function(player)
	local now = os.clock()
	if lastClaim[player] and now - lastClaim[player] < COOLDOWN then
		return -- too soon: ignore (spam or exploit)
	end
	lastClaim[player] = now
	player.leaderstats.Coins.Value += REWARD
end)

game:GetService("Players").PlayerRemoving:Connect(function(player)
	lastClaim[player] = nil
end)
```

Notice the server handler's **first parameter is `player`**. Roblox adds it automatically; you cannot fake it. Anything you pass in `FireServer(a, b)` arrives after it: `function(player, a, b)`. Missing this parameter shifts every argument by one, the most common "remote not working" help-thread cause.

## The trust rule

| Bad (client decides) | Good (client asks, server decides) |
| --- | --- |
| `FireServer(500)` "give me 500 coins" | `FireServer()` "I claimed"; server knows the amount |
| `FireServer(target, 9999)` damage | `FireServer(target)`; server checks range, cooldown and weapon damage |
| `FireServer("Sword")` "give me Sword" | Server checks the player owns or can afford it |

Exploiters can fire any RemoteEvent with any arguments at any rate. So the server should check:
1. **Type**: is the argument the type you expect (`typeof(x) == "Instance"`, a number in range)?
2. **Permission**: may this player do this (owns it, alive, on the right team)?
3. **Distance**: is the player close enough to the thing?
4. **Rate**: cooldown or rate limit.

Deeper: [[Remote Payload Validation]] and [[Remote Rate Limiting Pattern]].

## Server to client

```lua
-- server
notify:FireClient(player, "Daily reward claimed!")
announce:FireAllClients("Round starts in 10")
-- client
notify.OnClientEvent:Connect(function(message)
	label.Text = message
end)
```

Client handlers do **not** get a player argument (the server is the only sender).

## Other remote types, briefly

| Object | Use |
| --- | --- |
| `RemoteEvent` | One-way message, most cases |
| `UnreliableRemoteEvent` | Frequent, losable updates (cosmetic positions, effects) |
| `RemoteFunction` | Client asks and waits for an answer (`InvokeServer`). Never `InvokeClient` from the server: a client can hang it forever |

Comparison: [[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]].

## Pitfalls

- Remote in `ServerStorage`: the client cannot see it. Use `ReplicatedStorage`.
- Creating the RemoteEvent from a script after clients already looked for it: create it in Studio, or have clients `WaitForChild`.
- One remote per button is fine at first; later group them per feature.
- Firing every frame: use `UnreliableRemoteEvent` or send less often.

## Related
[[00 START HERE - Top G Vault]] · [[Client and Server in Plain Words]] · [[Remote Payload Validation]] · [[Security and Anti-exploit Design]] · [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote events and callbacks (official)]]
