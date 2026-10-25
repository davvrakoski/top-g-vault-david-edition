---
area: "01 Start Here"
cluster: "Start Here"
title: "First Player Lifecycle - PlayerAdded, CharacterAdded, Died and Leaving"
tags: [roblox, community-knowledge, start-here, players, character, events, respawn]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/DataModel
---
# First Player Lifecycle - PlayerAdded, CharacterAdded, Died and Leaving

Half of beginner bugs are "it worked the first time, then broke after I died" or "it works in my test but not for the second player". Both come from mixing up the **Player** (your account in this server, created once when you join) with the **Character** (the body in the world, destroyed and rebuilt every time you respawn). This note maps the whole lifecycle and gives a server template that hooks each stage correctly.

## The timeline

```
Join  ->  PlayerAdded(player)
            -> CharacterAdded(character)      first spawn
            -> CharacterAppearanceLoaded       clothes/accessories finished
            -> Humanoid.Died                   health hit 0
            -> CharacterRemoving               old body about to go
            -> (RespawnTime seconds)           default 5.0
            -> CharacterAdded(newCharacter)    a NEW body, new Humanoid
Leave ->  PlayerRemoving(player)
Server shutting down -> game:BindToClose(callback)
```

Key fact: after a respawn, **everything inside the character is new**. Connections you made to the old Humanoid are dead, tools held are gone (backpack refills from StarterPack), and any script that saved a reference to the old character now points at a destroyed model.

## Where to put what

| Data or setup | Hook | Why |
| --- | --- | --- |
| leaderstats, loading saved data, perks from passes | `PlayerAdded` | Once per visit |
| WalkSpeed boosts, overhead name tag, death listener | `CharacterAdded` | Must be redone every spawn |
| Accessory checks, avatar-based effects | `CharacterAppearanceLoaded` | Body parts and items exist now |
| Kill credit, drop items, death counter | `Humanoid.Died` | The moment of death |
| Saving data, cleaning per-player tables | `PlayerRemoving` | Last chance while the player exists |
| Final saves when the server closes | `game:BindToClose` | `PlayerRemoving` can be too late on shutdown |

## A server template

```lua
local Players = game:GetService("Players")
local playerState = {} -- keyed by Player; cleaned on leave

local function onCharacterAdded(player: Player, character: Model)
	local humanoid = character:WaitForChild("Humanoid")
	if player:GetAttribute("IsVip") then
		humanoid.WalkSpeed = 20
	end
	humanoid.Died:Once(function()
		local deaths = player.leaderstats:FindFirstChild("Deaths")
		if deaths then deaths.Value += 1 end
	end)
end

local function onPlayerAdded(player: Player)
	if playerState[player] then return end -- already set up (event + loop both ran)
	playerState[player] = { joinedAt = os.time() }
	-- create leaderstats / load data here
	player.CharacterAdded:Connect(function(character)
		onCharacterAdded(player, character)
	end)
	-- the character may already exist by the time this runs
	if player.Character then
		onCharacterAdded(player, player.Character)
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)
-- players who joined before this script connected (common in Studio tests)
for _, player in Players:GetPlayers() do
	task.spawn(onPlayerAdded, player)
end

Players.PlayerRemoving:Connect(function(player)
	-- save data here
	playerState[player] = nil
end)
```

Two lines in there prevent the most common "works sometimes" bugs:

1. **The `GetPlayers` loop.** In Studio, your player can join before the script finishes connecting `PlayerAdded`, so the event never fires for you. Looping over players already present fixes it. The `playerState` guard at the top stops a player being set up twice if both the event and the loop catch them.
2. **The `player.Character` check.** The first character can spawn before `CharacterAdded` is connected. Handle the existing one too.

## On the client

In a LocalScript, wait for your own character safely:

```lua
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
```

Scripts in **StarterCharacterScripts** are copied into each new character and start fresh on every respawn, which is often simpler for per-body logic (camera effects, footstep sounds). Scripts in **StarterPlayerScripts** run once per visit and must reconnect to each new character themselves.

## Controlling respawn

- `Players.RespawnTime` sets the delay (default 5.0 seconds) while `Players.CharacterAutoLoads` is on.
- Turn `CharacterAutoLoads` off to spawn players yourself (a menu first, or round-based games) with `player:LoadCharacterAsync()`. The older `LoadCharacter` is deprecated. Details: [[Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync]].

## Pitfalls

- **Storing the Humanoid in a top-level variable** and using it after a respawn. Look it up from the current character each time.
- **Per-player tables never cleaned.** Always clear them in `PlayerRemoving`, or memory grows with every visitor.
- **Using the player's name as a key.** Names can change; use `player.UserId` for saves. See [[Key Player State by UserId, Not the Player Object]].
- **Long waits inside PlayerAdded** before connecting `CharacterAdded`, so the first spawn is missed. Connect first, then load data.

## Related
[[00 START HERE - Top G Vault]] · [[Events and Connections for Beginners - Connect, Once, Wait and Debounce]] · [[Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync]] · [[Key Player State by UserId, Not the Player Object]] · [[First DataStore Save - Load, Save, Leave and Shutdown]]
