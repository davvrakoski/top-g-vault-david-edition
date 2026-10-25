---
area: "01 Start Here"
cluster: "Start Here"
title: "First Round Loop - Intermission, Countdown and Winners"
tags: [roblox, community-knowledge, start-here, rounds, game-loop, ui]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/curriculums/gameplay-scripting/add-rounds
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/Instance
---
# First Round Loop - Intermission, Countdown and Winners

Round-based games (survive the disaster, tag, sword fights, minigames) all share one heartbeat: wait for players, count down, teleport everyone in, play until a timer ends or someone wins, announce, repeat. Writing this loop yourself is an excellent step after an obby, because it combines server state, timers, teleporting and UI. This note builds a minimal but correct loop in one server script plus one LocalScript.

## What the server owns

- The current **state** (`Intermission`, `Playing`, `Ended`) and **time left**.
- Who is in the round.
- Teleporting and rewards.

Publishing state through **attributes** on a shared object is the simplest way to show it to every client: the server sets them, they replicate automatically, and UI listens for changes.

## Setup

- Workspace: a `Lobby` SpawnLocation (Neutral) and a `Map` model with an `ArenaSpawn` part.
- ReplicatedStorage: a Folder named `RoundState`.

## Server Script (ServerScriptService)

```lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local state = ReplicatedStorage:WaitForChild("RoundState")
local arenaSpawn = workspace:WaitForChild("Map"):WaitForChild("ArenaSpawn")

local MIN_PLAYERS = 2
local INTERMISSION = 15
local ROUND_TIME = 60

local function countdown(label, seconds)
	state:SetAttribute("Status", label)
	for t = seconds, 1, -1 do
		state:SetAttribute("TimeLeft", t)
		task.wait(1)
	end
end

local function alivePlayers(list)
	local alive = {}
	for _, p in list do
		local h = p.Character and p.Character:FindFirstChildWhichIsA("Humanoid")
		if p.Parent and h and h.Health > 0 then table.insert(alive, p) end
	end
	return alive
end

while true do
	-- 1. wait for enough players
	while #Players:GetPlayers() < MIN_PLAYERS do
		state:SetAttribute("Status", "Waiting for players")
		task.wait(1)
	end

	-- 2. intermission
	countdown("Intermission", INTERMISSION)

	-- 3. start: teleport everyone who has a character
	local inRound = {}
	for _, p in Players:GetPlayers() do
		if p.Character then
			p.Character:PivotTo(arenaSpawn.CFrame + Vector3.new(math.random(-8, 8), 3, math.random(-8, 8)))
			table.insert(inRound, p)
		end
	end

	-- 4. play until time runs out or one player is left
	state:SetAttribute("Status", "Round")
	for t = ROUND_TIME, 1, -1 do
		state:SetAttribute("TimeLeft", t)
		if #alivePlayers(inRound) <= 1 then break end
		task.wait(1)
	end

	-- 5. results and reward
	local winners = alivePlayers(inRound)
	local names = {}
	for _, p in winners do
		table.insert(names, p.DisplayName)
		local stats = p:FindFirstChild("leaderstats")
		if stats and stats:FindFirstChild("Wins") then stats.Wins.Value += 1 end
	end
	state:SetAttribute("Status", #names > 0 and ("Winner: " .. table.concat(names, ", ")) or "No winners")
	task.wait(5)

	-- 6. back to lobby
	for _, p in winners do
		p:LoadCharacter()
	end
end
```

Players who died during the round respawn at the Lobby spawn automatically; survivors are reloaded at the end.

## Client UI (LocalScript inside a ScreenGui with a TextLabel `Status`)

```lua
local state = game:GetService("ReplicatedStorage"):WaitForChild("RoundState")
local label = script.Parent:WaitForChild("Status")

local function refresh()
	local status = state:GetAttribute("Status") or ""
	local t = state:GetAttribute("TimeLeft")
	label.Text = (status == "Intermission" or status == "Round") and t and `{status}: {t}` or status
end

state:GetAttributeChangedSignal("Status"):Connect(refresh)
state:GetAttributeChangedSignal("TimeLeft"):Connect(refresh)
refresh()
```

## Why it is built like this

- **One loop on the server** is the single source of truth; clients only display.
- `PivotTo` moves the whole character model cleanly.
- `alivePlayers` checks `p.Parent` so players who left mid-round are ignored.
- Attributes avoid needing a RemoteEvent for simple shared state.

## Next steps

- Load a random map from `ServerStorage` each round (see [[Map Rotation and Voting - Loading Maps from ServerStorage]]).
- Assign teams at round start ([[First Team Game - Teams and SpawnLocations]]).
- Save `Wins` ([[First DataStore Save - Load, Save, Leave and Shutdown]]).
- Award a badge for a first win ([[First Badge - Award on Achievement]]).

## Pitfalls

- Testing alone: `MIN_PLAYERS = 2` waits forever. Use **Server & Clients** with 2 clients, or temporarily set it to 1.
- Running the loop in a LocalScript: every client runs its own different round.
- Forgetting players who join mid-round: they wait in the lobby, which is fine; make the UI say so.

## Related
[[00 START HERE - Top G Vault]] · [[Lobby and Round System Blueprint]] · [[Round PvP Starter Architecture]] · [[Runtime State and FSM Architecture]] · [[30 Official Roblox Docs/Tutorials/Curriculums/Gameplay Scripting/Add rounds|Add rounds (official)]]
