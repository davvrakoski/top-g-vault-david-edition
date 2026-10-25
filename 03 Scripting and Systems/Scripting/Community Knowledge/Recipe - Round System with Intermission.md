---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Round System with Intermission"
tags: [roblox, community-knowledge, scripting, recipe, luau, rounds, intermission, game-loop, attributes, state-machine]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/curriculums/gameplay-scripting/add-rounds
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/scripting/attributes
---
# Recipe - Round System with Intermission

The loop behind minigame, survival and PvP games: wait for enough players, count down an intermission, load a map, teleport everyone in, run the round until time runs out or one player is left, pay the winners, clean up, repeat. The official gameplay-scripting curriculum builds a round system across several lessons; this is a compact single-script version that publishes its state as **attributes holding an end timestamp**, so any client UI can show a smooth countdown without the server firing a remote every second (see [[Recipe - Countdown Timer UI Synced to Server Time]]).

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `RoundSystem` | Script | `ServerScriptService` |
| `RoundState` | Folder (created by the script) | `ReplicatedStorage` |
| maps | Models, each with a `Spawns` folder of Parts | `ServerStorage > Maps` |
| lobby | a normal `SpawnLocation` | `Workspace` |

Published attributes on `ReplicatedStorage.RoundState`:
- `Phase`: `"Waiting"`, `"Intermission"`, `"Playing"`, `"Ending"`
- `EndsAt`: `workspace:GetServerTimeNow()` value when the phase ends
- `Status`: short text such as `"Need 2 players"` or `"Winner: Alex"`

Per-player attribute: `InRound` (boolean).

## The code
```lua
-- ServerScriptService/RoundSystem (Script)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local MIN_PLAYERS = 2
local INTERMISSION = 20
local ROUND_TIME = 120
local ENDING_TIME = 6
local WIN_REWARD = 50

local state = Instance.new("Folder")
state.Name = "RoundState"
state.Parent = ReplicatedStorage
local maps = ServerStorage:WaitForChild("Maps")
local rng = Random.new()

local function setPhase(phase: string, duration: number, status: string?)
	state:SetAttribute("Phase", phase)
	state:SetAttribute("EndsAt", workspace:GetServerTimeNow() + duration)
	state:SetAttribute("Status", status or "")
end

-- waits until the phase ends; returns early (true) if stopEarly() says so
local function waitPhase(stopEarly: (() -> boolean)?): boolean
	while workspace:GetServerTimeNow() < state:GetAttribute("EndsAt") do
		if stopEarly and stopEarly() then return true end
		task.wait(0.25)
	end
	return false
end

local function alive(player: Player): Humanoid?
	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if humanoid and humanoid.Health > 0 then return humanoid end
	return nil
end

local function eligible(): {Player}
	local list = {}
	for _, p in Players:GetPlayers() do
		if alive(p) and not p:GetAttribute("AFK") then table.insert(list, p) end
	end
	return list
end

local function payout(player: Player, amount: number)
	local stats = player:FindFirstChild("leaderstats")
	local coins = stats and stats:FindFirstChild("Coins")
	if coins then coins.Value += amount end -- swap for your currency module
end

local function runRound()
	-- pick and load a map
	local choices = maps:GetChildren()
	if #choices == 0 then warn("No maps in ServerStorage.Maps"); task.wait(5); return end
	local map = choices[rng:NextInteger(1, #choices)]:Clone()
	map.Name = "CurrentMap"
	map.Parent = workspace
	local spawns = map:WaitForChild("Spawns"):GetChildren()

	-- teleport contestants
	local inRound: {[Player]: boolean} = {}
	local connections = {}
	local contestants = eligible()
	for i, player in contestants do
		local humanoid = alive(player)
		local spawnPart = spawns[(i - 1) % #spawns + 1]
		if humanoid and spawnPart then
			player.Character:PivotTo(spawnPart.CFrame + Vector3.new(0, 4, 0))
			inRound[player] = true
			player:SetAttribute("InRound", true)
			table.insert(connections, humanoid.Died:Connect(function()
				inRound[player] = nil
				player:SetAttribute("InRound", false)
			end))
		end
	end
	table.insert(connections, Players.PlayerRemoving:Connect(function(p) inRound[p] = nil end))

	local function count()
		local n = 0
		for _ in inRound do n += 1 end
		return n
	end

	setPhase("Playing", ROUND_TIME, `{count()} players`)
	waitPhase(function() return count() <= 1 end)

	-- results
	local winners = {}
	for player in inRound do
		table.insert(winners, player.DisplayName)
		payout(player, WIN_REWARD)
	end
	local text = if #winners == 0 then "No winners" else "Winner: " .. table.concat(winners, ", ")
	setPhase("Ending", ENDING_TIME, text)
	waitPhase()

	-- cleanup: disconnect, send survivors back to the lobby, remove the map
	for _, c in connections do c:Disconnect() end
	for player in inRound do
		player:SetAttribute("InRound", false)
		if player.Parent then
			task.spawn(function() player:LoadCharacterAsync() end)
		end
	end
	map:Destroy()
end

while true do
	if #eligible() < MIN_PLAYERS then
		setPhase("Waiting", 0, `Need {MIN_PLAYERS} players`)
		task.wait(1)
		continue
	end
	setPhase("Intermission", INTERMISSION)
	waitPhase()
	if #eligible() >= MIN_PLAYERS then
		local ok, err = pcall(runRound)
		if not ok then
			warn("Round crashed:", err)
			local leftover = workspace:FindFirstChild("CurrentMap")
			if leftover then leftover:Destroy() end
		end
	end
end
```

## How to test
1. Make a map model `Arena` with a floor and a `Spawns` folder holding 4 small anchored parts; put it in `ServerStorage > Maps`.
2. Test tab > **Clients and Servers** with 2 players. Watch `ReplicatedStorage.RoundState` attributes: Waiting, Intermission (20 s), Playing.
3. Reset one player during Playing: the round ends early with the other as winner; both return to the lobby.
4. With 1 player: the state stays at `Waiting` with "Need 2 players".
5. Put a deliberate error in `runRound` (e.g. a map without `Spawns`): the pcall logs it and the next intermission still starts.

## Common mistakes
- **Firing a remote every second** for the timer. Publish `EndsAt` once per phase and let clients count.
- **`while wait(1) do`.** `wait()` is deprecated; use `task.wait`. And keep the loop protected with `pcall`, or one bug ends the game loop for the whole server.
- **Forgetting to disconnect `Died` connections** each round: they pile up and fire on old characters.
- **Dead players respawning into the map.** Keep `SpawnLocation`s only in the lobby; maps use plain parts as spawn points.
- **AFK players blocking rounds.** Exclude them (see [[Recipe - AFK Detection]]).
- Map choice by vote instead of random: [[Map Rotation and Voting - Loading Maps from ServerStorage]].

## Related
[[Scripting - Hub]] · [[Recipe - Countdown Timer UI Synced to Server Time]] · [[Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync]] · [[Runtime State and FSM Architecture]]
