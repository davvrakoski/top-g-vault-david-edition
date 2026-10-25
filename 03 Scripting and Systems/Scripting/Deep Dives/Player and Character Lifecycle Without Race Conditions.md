---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Player and Character Lifecycle Without Race Conditions"
tags: [deep-dive, roblox, players, characters, lifecycle, race-conditions]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Player and Character Lifecycle Without Race Conditions

**Why this matters:** "works in Studio, breaks for 1 in 50 live players" is almost always a lifecycle race: a player who joined before your script connected, a character that spawned before data loaded, or a player who left in the middle of a save.
This note lists the exact event order the engine gives you, the races that follow from it, and a single lifecycle module that makes every system immune to them.

---

## 1. The event order (server)

For a normal join with `Players.CharacterAutoLoads = true`:

1. `Players.PlayerAdded(player)` fires.
2. The engine loads the character. `Player.CharacterAdded(character)` fires **soon after `Player.Character` is set, and before the character is parented to Workspace** (Roblox reference docs).
3. At that moment the **Humanoid and default body parts exist on the server**, but clothing and accessories can take seconds to arrive. `Player.CharacterAppearanceLoaded` fires when the appearance is complete.
4. The character is parented to Workspace.
5. On death: `Humanoid.Died`, then after `Players.RespawnTime` the next character loads; `Player.CharacterRemoving(oldCharacter)` fires right before the old one is removed, then `CharacterAdded(newCharacter)`.
6. On leave: `Players.PlayerRemoving(player, reason)` fires (the second argument is an `Enum.PlayerExitReason`). Then the player is removed from `Players`.
7. On shutdown: `game:BindToClose` callbacks run; PlayerRemoving may or may not have fired for everyone yet ([[BindToClose and Server Shutdown Save Flush]]).

On the **client**, `Players.LocalPlayer` is available immediately in LocalScripts, but character parts arrive by replication and may lag behind `CharacterAdded`; with StreamingEnabled, other players' characters stream like any other content.

`Player:LoadCharacter()` is now **deprecated** in favour of `Player:LoadCharacterAsync()`. The docs advise not calling it again for the same player until `CharacterAppearanceLoaded` has fired.

---

## 2. The six races that cause real bugs

| # | Race | Symptom | Fix |
| --- | --- | --- | --- |
| 1 | Player joined **before** your `PlayerAdded` connection (common in Studio and when modules load slowly) | Player never gets data, leaderstats or UI | Loop `Players:GetPlayers()` after connecting |
| 2 | Character spawned **before** your `CharacterAdded` connection | First life has no health regen, no weapon, no nametag | Check `player.Character` after connecting |
| 3 | Character spawns **before player data has loaded** | Spawns with default loadout, then "pops" to saved loadout; or spawn logic reads nil data | `CharacterAutoLoads = false`, load data, then `LoadCharacterAsync` |
| 4 | Player **leaves during** data load (`GetAsync`/`UpdateAsync` yielding) | Session lock acquired for a gone player; an autosave loop starts for nobody | Re-check `player.Parent` after every yield; release the lock |
| 5 | Client fires remotes **before** the server has loaded their data | "attempt to index nil" in remote handlers; purchases against empty inventory | Server-side `isReady(player)` gate in every handler |
| 6 | Code still holds the **old character** after respawn | Damage applied to a dead model; effects attached to nothing; leaks | Per-life cleanup container; never cache `player.Character` long term |

---

## 3. One lifecycle module, every system uses it

Instead of 15 systems each connecting `PlayerAdded` and `CharacterAdded` (and each getting races 1, 2 and 6 subtly wrong), centralise it:

```luau
--!strict
-- ServerScriptService/Services/PlayerLifecycle.luau
local Players = game:GetService("Players")
local Trove = require(game:GetService("ReplicatedStorage").Shared.Util.Trove)

type PlayerHook = (player: Player, playerTrove: any) -> ()
type CharacterHook = (player: Player, character: Model, lifeTrove: any) -> ()

local PlayerLifecycle = {}

local playerHooks: { PlayerHook } = {}
local characterHooks: { CharacterHook } = {}
local playerTroves: { [Player]: any } = {}
local lifeTroves: { [Player]: any } = {}
local readyPlayers: { [Player]: boolean } = {}

local function runCharacterHooks(player: Player, character: Model)
	-- End the previous life first (race 6).
	local oldLife = lifeTroves[player]
	if oldLife then
		oldLife:Destroy()
	end
	local life = Trove.new()
	lifeTroves[player] = life
	life:AttachToInstance(character)

	for _, hook in characterHooks do
		task.spawn(hook, player, character, life)
	end
end

local function onPlayerAdded(player: Player)
	if playerTroves[player] then
		return -- already handled (race 1 double-call guard)
	end
	local trove = Trove.new()
	playerTroves[player] = trove

	trove:Connect(player.CharacterAdded, function(character)
		runCharacterHooks(player, character)
	end)

	for _, hook in playerHooks do
		task.spawn(hook, player, trove)
	end

	-- Race 2: character may already exist.
	if player.Character then
		runCharacterHooks(player, player.Character)
	end
end

local function onPlayerRemoving(player: Player)
	readyPlayers[player] = nil
	local life = lifeTroves[player]
	if life then
		life:Destroy()
		lifeTroves[player] = nil
	end
	local trove = playerTroves[player]
	if trove then
		trove:Destroy()
		playerTroves[player] = nil
	end
end

-- Public API ---------------------------------------------------------------

-- Register before Start() runs; hooks also run for players already present.
function PlayerLifecycle.OnPlayer(hook: PlayerHook)
	table.insert(playerHooks, hook)
end

function PlayerLifecycle.OnCharacter(hook: CharacterHook)
	table.insert(characterHooks, hook)
end

function PlayerLifecycle.MarkReady(player: Player)
	if player.Parent == Players then
		readyPlayers[player] = true
	end
end

function PlayerLifecycle.IsReady(player: Player): boolean
	return readyPlayers[player] == true
end

function PlayerLifecycle.Start()
	Players.PlayerAdded:Connect(onPlayerAdded)
	Players.PlayerRemoving:Connect(onPlayerRemoving)
	for _, player in Players:GetPlayers() do -- race 1
		task.spawn(onPlayerAdded, player)
	end
end

return PlayerLifecycle
```

The Trove used here is the one from [[Signals, Connections and Leak-Proof Cleanup]]. Every system now writes:

```luau
PlayerLifecycle.OnCharacter(function(player, character, life)
	local humanoid = character:WaitForChild("Humanoid", 10) :: Humanoid?
	if not humanoid then
		return
	end
	life:Connect(humanoid.Died, function()
		-- death handling
	end)
	-- anything added to `life` is cleaned on respawn, removal or leave
end)
```

Registration order matters: all `OnPlayer`/`OnCharacter` calls happen in services' `Init`, and `PlayerLifecycle.Start()` runs in the Start phase, so no hook misses an early player ([[Module Architecture for a 50k-Line Roblox Game]]).

---

## 4. Data before character (race 3)

```luau
--!strict
-- Somewhere in DataService.Start / a spawn service
local Players = game:GetService("Players")
-- Better: untick CharacterAutoLoads on Players in Studio, so it is already off
-- before the first player joins. Setting it here is a safety net.
Players.CharacterAutoLoads = false

PlayerLifecycle.OnPlayer(function(player, trove)
	local profile = DataService.LoadAsync(player) -- yields: session lock + read

	-- Race 4: the player may have left while we yielded.
	if player.Parent ~= Players then
		if profile then
			DataService.Release(player, profile) -- free the lock immediately
		end
		return
	end

	if not profile then
		player:Kick("Your data could not be loaded. Please rejoin in a moment.")
		return
	end

	PlayerLifecycle.MarkReady(player)

	-- Respawn manually because auto-loading is off.
	-- Connect BEFORE the first load so the first life is covered too.
	trove:Connect(player.CharacterAdded, function(character)
		local humanoid = character:WaitForChild("Humanoid") :: Humanoid
		humanoid.Died:Once(function()
			task.wait(Players.RespawnTime)
			if player.Parent == Players then
				player:LoadCharacterAsync()
			end
		end)
	end)

	player:LoadCharacterAsync()
end)
```

Kicking when data cannot load is deliberate. Letting a player play with default data and then saving it **overwrites their real progress**, the single most damaging bug a Roblox game can ship ([[Save data resets or corrupts]]).

---

## 5. Remote gate (race 5)

Every remote handler starts with the same two lines:

```luau
remote.OnServerEvent:Connect(function(player: Player, payload: unknown)
	if not PlayerLifecycle.IsReady(player) then
		return -- not loaded yet, or already leaving
	end
	-- validate payload, rate limit, then act
end)
```

On the client, mirror it: do not enable shop or trade buttons until the server sends a "ready" event with the initial state. That removes most of these requests at the source, but the server gate is what makes it safe.

---

## 6. Client-side lifetimes you must know

| Container | Runs | Reset on respawn? |
| --- | --- | --- |
| `StarterPlayerScripts` -> `PlayerScripts` | Once per session | No. Put long-lived controllers here. |
| `StarterCharacterScripts` | Copied into each new character | Yes, a fresh copy every life; old copy dies with the character. |
| `StarterGui` -> `PlayerGui` | Copied on spawn | Each `ScreenGui` with `ResetOnSpawn = true` (the default) is **recreated** every respawn. |
| `ReplicatedFirst` LocalScripts | First, before most replication | No. Loading screens. |

The `ResetOnSpawn` default bites controllers: a controller in PlayerScripts that cached a reference to a ScreenGui now points at a destroyed copy after the first death. Either set `ResetOnSpawn = false` on HUD guis your controllers own, or re-acquire the gui on every `CharacterAdded`.

Client character handling should use the same pattern: check `LocalPlayer.Character` immediately, connect `CharacterAdded`, keep a per-life cleanup container, and `WaitForChild` the Humanoid with a timeout.

---

## 7. Leaving and cleanup

- Save logic on `PlayerRemoving` must not depend on the character (it may already be gone) and must not yield before reading the data it needs.
- Remove the player from **every** table keyed by Player. A central lifecycle with troves makes this automatic for anything registered in the trove; audit any module-level `[player] = ...` tables by hand.
- Decide on `Workspace.PlayerCharacterDestroyBehavior`: when enabled, the engine calls `Destroy()` on the old character at respawn and on the Player object when they leave, which disconnects lingering connections. If you leave it off, destroy them yourself after saving.
- `PlayerRemoving`'s `reason` argument lets you log why sessions end (disconnect, kick, teleport), which is useful for spotting crash loops in analytics.

---

## Common mistakes

- Connecting `PlayerAdded` without looping existing players.
- Connecting `CharacterAdded` without checking the current character.
- Reading `player.Character` once and caching it for the session.
- Spawning characters before data is loaded, then saving defaults over real data.
- Not re-checking `player.Parent` after yielding during load.
- Remote handlers that assume data exists.
- Accessing clothing/accessories in `CharacterAdded` instead of waiting for `CharacterAppearanceLoaded`.
- Client controllers holding references to ScreenGuis that reset on spawn.
- Still calling the deprecated `Player:LoadCharacter()` in new code.

## Checklist

- [ ] One lifecycle service owns PlayerAdded/CharacterAdded/PlayerRemoving connections.
- [ ] Existing players and existing characters are handled at startup.
- [ ] Each character life has its own cleanup container, destroyed on respawn and leave.
- [ ] Data loads before the first spawn; failures kick instead of playing on defaults.
- [ ] Every yield in the join path is followed by a "still here?" check.
- [ ] Every remote handler checks `IsReady(player)`.
- [ ] HUD ScreenGuis owned by controllers have `ResetOnSpawn = false` or are re-acquired.
- [ ] `PlayerCharacterDestroyBehavior` decision is documented.

**Related:** [[Scripting - Hub]] · [[Save data resets or corrupts]] · [[Service Controller Reference Architecture]] · [[Memory Leaks and Lifecycle Management]] · [[Interaction Gate]]
