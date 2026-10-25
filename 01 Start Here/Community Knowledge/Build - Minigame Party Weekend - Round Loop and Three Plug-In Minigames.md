---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Minigame Party Weekend - Round Loop and Three Plug-In Minigames"
tags: [roblox, community-knowledge, start-here, weekend-build, minigames, rounds]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/curriculums/gameplay-scripting/add-rounds
  - https://create.roblox.com/docs/scripting/module
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
---
# Build - Minigame Party Weekend - Round Loop and Three Plug-In Minigames

A minigame party game (lobby, random short game, winners, back to lobby) is a great weekend build because each minigame is tiny and the hard part, the round loop, is written once. The key design decision is to make every minigame a **ModuleScript with the same five fields**, so the loop never needs to know which game it is running. Then minigame number four is a new file, not a rewrite. Round basics: [[First Round Loop - Intermission, Countdown and Winners]] and [[Recipe - Round System with Intermission]]; the bigger version is [[Lobby and Round System Blueprint]].

## The weekend scope

| In | Cut (later) |
|---|---|
| Lobby with a status text | Map/minigame voting |
| 3 minigames, 30-60 s each | 20 minigames, team games |
| Wins leaderstat, saved | Coins shop, cosmetics |
| Spectate from lobby when out | Spectate camera per player |
| Random pick, no repeat twice in a row | Weighted picks by player count |

Good first minigames, all with "last alive wins" or "first to touch wins" rules: **Lava Rise** (floor of lava rises), **Falling Tiles** (tiles drop after you step on them), **Race to the Top** (short obby, first to the button wins).

## Day 1 - the loop and minigame 1 (about 5 hours)

1. **Lobby (1 h).** A small room with a SpawnLocation and a big status board. The HUD reads `workspace:GetAttribute("Status")`.
2. **Arenas (1 h).** Build each arena as a Model in `ServerStorage/Arenas`, far away from the lobby, with a `Spawns` folder of parts. Cloning from ServerStorage keeps arenas out of memory until used: [[Starter - First Spawner - Templates in ServerStorage, Clone and Cleanup]]. Hub layouts: [[Map - Minigame Hubs and Duel Pads - Parallel Arenas in One Server]].
3. **Round loop (2 h).** The core script below.
4. **Lava Rise (1 h).** The example module below. Test until a round ends cleanly every time.

## Day 2 - two more games and polish (about 5 hours)

1. **Falling Tiles (1.5 h).** Same module shape; tiles tagged and handled like the `Fade` obstacle in [[Build - Obby Weekend - 30 Stages, Obstacle Tags and a Skip Button]].
2. **Race to the Top (1.5 h).** `isOver` returns true once someone presses the top button; `winners` returns that player.
3. **Saving wins (1 h).** [[First DataStore Save - Load, Save, Leave and Shutdown]].
4. **Load spikes (30 min).** Cloning an arena and teleporting everyone in one frame can hitch; read [[Speed - Round Start Spikes - Map Loads, Mass Spawns and Teleport Bursts]].
5. **Badge (30 min).** "Win 10 games": [[First Badge - Award on Achievement]].

> **Code status:** original example, not run in Studio. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## The core script: one loop, any minigame

```lua
-- ServerScriptService/Party (Script); minigames are ModuleScripts in its Minigames folder
local Players = game:GetService("Players")
local list = script:WaitForChild("Minigames"):GetChildren()
local INTERMISSION, MIN_PLAYERS = 15, 2

local function setStatus(text) workspace:SetAttribute("Status", text) end

local function alive(players)
	local out = {}
	for _, p in players do
		local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
		if p.Parent and h and h.Health > 0 then table.insert(out, p) end
	end
	return out
end

local last
while true do
	while #Players:GetPlayers() < MIN_PLAYERS do
		setStatus("Waiting for players")
		task.wait(1)
	end
	for t = INTERMISSION, 1, -1 do
		setStatus("Next game in " .. t)
		task.wait(1)
	end
	local pick
	repeat pick = list[math.random(#list)] until pick ~= last or #list == 1
	last = pick
	local mg = require(pick)
	local players = Players:GetPlayers()
	setStatus(mg.Name)
	local arena = mg.setup(players)
	local stopAt = os.clock() + mg.duration
	while os.clock() < stopAt and not mg.isOver(alive(players)) do
		task.wait(0.25)
	end
	for _, p in mg.winners(alive(players)) do
		p.leaderstats.Wins.Value += 1
	end
	mg.cleanup(arena)
	for _, p in players do
		if p.Parent then p:LoadCharacterAsync() end -- back to the lobby
	end
end
```

```lua
-- Minigames/LavaRise (ModuleScript): the contract every minigame follows
local TweenService = game:GetService("TweenService")
local M = {Name = "Lava Rise", duration = 60}

function M.setup(players)
	local arena = game:GetService("ServerStorage").Arenas.LavaRise:Clone()
	arena.Parent = workspace
	local spawns = arena.Spawns:GetChildren()
	for i, p in players do
		if p.Character then p.Character:PivotTo(spawns[(i - 1) % #spawns + 1].CFrame + Vector3.yAxis * 3) end
	end
	local lava = arena.Lava -- a kill part tagged "Kill"
	TweenService:Create(lava, TweenInfo.new(M.duration), {Position = lava.Position + Vector3.yAxis * 40}):Play()
	return arena
end
function M.isOver(alivePlayers) return #alivePlayers <= 1 end
function M.winners(alivePlayers) return alivePlayers end
function M.cleanup(arena) arena:Destroy() end
return M
```

Players who join mid-round are not in `players`, so they wait in the lobby, which is what you want. `leaderstats.Wins` must be created on join (see [[First Leaderboard with leaderstats]]).

## What to cut when you run late

- Race to the Top: two minigames are enough to prove the loop.
- Saving: wins can be per-server for a first test.
- "No repeat" pick: fine to remove if it confuses you.

## How to test

- [ ] Solo in Studio, set `MIN_PLAYERS = 1` and run 10 rounds in a row without an error.
- [ ] 3 players in **Server and Clients**: one dies early and is back in the lobby only after the round.
- [ ] A player leaves mid-round: the round still ends and nobody gets an error in Output.
- [ ] Round time runs out with 2 alive: both get a win (or decide "nobody wins" and change `winners`).
- [ ] Arenas are gone from Workspace after each round (check the Explorer).

## Related
[[00 START HERE - Top G Vault]] - [[Map Rotation and Voting - Loading Maps from ServerStorage]] - [[Round PvP Starter Architecture]] - [[Case Study - Patterns Across Hit Roblox Games]]
