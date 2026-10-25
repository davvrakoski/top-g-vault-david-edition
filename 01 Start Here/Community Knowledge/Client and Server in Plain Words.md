---
area: "01 Start Here"
cluster: "Start Here"
title: "Client and Server in Plain Words"
tags: [roblox, community-knowledge, start-here, networking, client-server, beginner]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/client-server
  - https://create.roblox.com/docs/scripting/locations
  - https://create.roblox.com/docs/scripting/events/remote
  - https://devforum.roblox.com/t/remote-events-in-a-nutshell/3051312
  - https://devforum.roblox.com/t/how-would-i-use-a-remote-event/751447
---
# Client and Server in Plain Words

Every Roblox game is multiplayer, even when only one person is in it. That single fact explains most "it works for me but not for my friend" bugs. Once you can say, for any line of code, "this runs on the server" or "this runs on one player's device", Roblox stops feeling random.

## The restaurant picture

- The **server** is the kitchen. There is one per running game instance, it lives in Roblox's data centre, and it holds the real version of the world: who has how many coins, where every part is, who is alive.
- Each **client** is one diner's table: the Roblox app on a phone, PC or console. It draws the world, reads the player's input, plays sounds and shows UI.
- **Replication** is the waiters. The server keeps sending changes to every client so all tables see the same meal. When the server moves a part, everyone sees it move.

When a game starts, Roblox copies the place you published into a "runtime" data model on the server. Each joining client receives a copy (with StreamingEnabled, only the nearby part of the world at first).

## The one rule that matters

**Changes made on the server reach everyone. Changes a client makes to the world mostly stay on that client.**

If a LocalScript deletes a wall, only that player's wall disappears; everyone else still bumps into it. If a LocalScript gives the player 1000 coins by changing a leaderstats value, the server never hears about it and the coins are not real.

(The exception is physics on parts the client "owns", such as your own character. The engine trusts the client for its own movement, which is why speed hacks exist. See [[Client - Server Architecture]].)

## Who does what

| Job | Where it belongs | Why |
| --- | --- | --- |
| Coins, XP, inventory, damage | Server | Players can edit anything on their own device |
| Saving data (DataStores) | Server | Clients are blocked from DataStores |
| Reading keyboard, mouse, touch | Client | Only the device knows its input |
| UI, camera, local sounds, effects | Client | Smooth and per-player |
| Spawning shared objects | Server | So everyone sees them |

## How the two talk: RemoteEvents

Put a `RemoteEvent` in `ReplicatedStorage` (both sides can see it).
- Client to server: `remote:FireServer(args)`; the server listens with `remote.OnServerEvent:Connect(function(player, args) ... end)`. The **first parameter is always the player who fired it**, added automatically. Forgetting it is one of the most common help-thread bugs.
- Server to client: `remote:FireClient(player, args)` or `remote:FireAllClients(args)`; the client listens with `OnClientEvent`.

```lua
-- Server: the client only ASKS; the server decides the amount
local remote = game:GetService("ReplicatedStorage"):WaitForChild("ClaimDaily")
remote.OnServerEvent:Connect(function(player)
	local coins = player.leaderstats.Coins
	coins.Value += 50 -- never take the amount from the client
end)
```

Never send "give me 500 coins" from the client. Send "I pressed claim" and let the server check whether that is allowed. Walkthrough: [[First RemoteEvent - Button on the Client, Reward on the Server]].

## See it yourself in Studio

Press **Test** (F5) and click the **Client/Server** toggle. Blue border = you are viewing the client, green = the server. Delete a part while on Client, switch to Server: the part still exists there. Output lines are also tagged blue or green by origin.

## Pitfalls

- Using `game.Players.LocalPlayer` in a server Script: it is `nil` there. Servers get the player from event arguments.
- Putting secrets or admin code in ReplicatedStorage: every client downloads it.
- Using `WaitForChild` everywhere on the server: server-side objects are usually already there; it is mainly needed on clients.

## Related
[[00 START HERE - Top G Vault]] · [[Client - Server Architecture]] · [[Where Scripts Go - Containers, Script Types and RunContext]] · [[Remote Payload Validation]] · [[30 Official Roblox Docs/Projects/Client-server runtime|Client-server runtime (official)]]
