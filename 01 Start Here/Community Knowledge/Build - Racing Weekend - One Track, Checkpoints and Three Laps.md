---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Racing Weekend - One Track, Checkpoints and Three Laps"
tags: [roblox, community-knowledge, start-here, weekend-build, racing, vehicles]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/resources/templates
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
  - https://create.roblox.com/docs/reference/engine/classes/Instance
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/physics/network-ownership
---
# Build - Racing Weekend - One Track, Checkpoints and Three Laps

Writing a good car from scratch takes longer than a weekend, so a beginner racing game should **borrow the car** and build the race: a track, checkpoints that must be hit in order, a lap counter, a countdown, and a results list. That is the part that turns "driving around" into a game. Roblox ships official templates with working cars (Racing and Classic Racing in File > New), which makes this genre unusually beginner friendly. The full system view is in [[Racing Starter Architecture]] and [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]]; this note is the order to build it in.

## The weekend scope

| In | Cut (later) |
|---|---|
| 1 track, 8-12 checkpoints | Track editor, many maps |
| Template car, one per player | Car shop, tuning, colours |
| 3 laps, countdown, results | Matchmaking, ranked |
| Lap and position HUD | Minimap, split times |
| Reset-to-checkpoint key | Ghosts, AI racers, drifting score |

## Day 1 - car, track, laps (about 5 hours)

1. **Pick the car (45 min).** Start a place from the Racing template, or copy its car into your own place. If you want to understand the options first, read [[Choosing a Roblox Car Chassis - VehicleSeat, Constraint, Raycast or Server Authority]] and [[Roblox Racing Template - Dune Buggy Chassis and Server Authority Version]]. Give the car Model an attribute `IsCar = true`.
2. **Track (2 h).** One loop about 60-90 seconds long with 2 straights, 1 hairpin and 1 fast S-bend. Wide enough for 3 cars side by side. Read [[World - Racing Tracks]], then playtest every corner at full speed before decorating.
3. **Checkpoints (30 min).** Tall invisible parts across the road, `Anchored`, `CanCollide = false`, `CanTouch = true`, in a folder `Checkpoints`, named `1` to `N`. `1` is the start/finish line. Place them so you cannot skip one by cutting a corner.
4. **Lap script (1.5 h).** The core script below.

## Day 2 - a real race (about 5 hours)

1. **Race flow (2 h).** Lobby wait until 2+ players, spawn one car per player on grid spots behind line 1, anchor them during a 3-2-1 countdown, unanchor on GO, set `progress[player]`. After the winner finishes, give others 30 seconds, then show results. Full pattern: [[Racing - Race Lifecycle, Grid Placement and DNF Timer]].
2. **HUD (1 h).** Read the `Lap` attribute for "Lap 2/3"; position comes from (lap, checkpoint, distance to next checkpoint). [[Racing - Track Progress, Wrong-Way Detection and Live Positions]] and [[Racing - Race HUD - Minimap, Position, Lap and Split Times]].
3. **Reset key (45 min).** Press R: the server moves the car to the last checkpoint reached, upright, speed zero. This removes most "I flipped and quit" moments.
4. **Camera and feel (1 h).** Small FOV push at high speed: [[Racing - Chase Camera and Speed Effects - FOV, Shake and Speed Lines]].

> **Code status:** original example, not run in Studio. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## The core script: ordered checkpoints and laps

```lua
-- ServerScriptService/Laps
local Players = game:GetService("Players")
local folder = workspace:WaitForChild("Checkpoints")
local COUNT = #folder:GetChildren()
local LAPS = 3
local progress = {} -- [player] = {nextCp, lap, start}

local function driverOf(hit)
	local node = hit
	while node and node ~= workspace do
		if node:IsA("Model") and node:GetAttribute("IsCar") then
			local seat = node:FindFirstChildWhichIsA("VehicleSeat", true)
			local hum = seat and seat.Occupant
			return hum and Players:GetPlayerFromCharacter(hum.Parent)
		end
		node = node.Parent
	end
	return nil
end

local function startRace(player) -- call on GO
	progress[player] = {nextCp = 2, lap = 1, start = os.clock()}
	player:SetAttribute("Lap", 1)
end

for _, cp in folder:GetChildren() do
	local n = tonumber(cp.Name)
	cp.Touched:Connect(function(hit)
		local player = driverOf(hit)
		local p = player and progress[player]
		if not p or n ~= p.nextCp then return end -- wrong order: ignore
		player:SetAttribute("LastCp", n)
		if n == 1 then
			p.lap += 1
			if p.lap > LAPS then
				progress[player] = nil
				print(player.Name, "finished in", os.clock() - p.start)
				return
			end
			player:SetAttribute("Lap", p.lap)
		end
		p.nextCp = n % COUNT + 1
	end)
end

Players.PlayerRemoving:Connect(function(p) progress[p] = nil end)
```

The cars start **behind** line 1, so crossing it at the start is ignored (the script waits for checkpoint 2). Because only `nextCp` counts, driving backwards or skipping a corner does nothing. The driver is found through the seat's `Occupant`, so a passenger or a loose wheel cannot score a lap for someone else.

## What to cut when you run late

- Position HUD: show only lap and finish order.
- Countdown anchoring: freeze cars by setting each `VehicleSeat.MaxSpeed = 0` until GO.
- Custom car model: keep the template body and change colours.

## How to test

- [ ] Drive the track backwards: lap stays at 1.
- [ ] Cut across the infield past a checkpoint: the next lap does not count.
- [ ] Two players in **Server and Clients**: both laps count independently; the finish order prints correctly.
- [ ] A player leaves mid-race: no error, race still ends.
- [ ] Flip the car and press R: you are back on the road at the last checkpoint.
- [ ] Test on a phone emulator: touch steering can finish the hairpin.

## Related
[[00 START HERE - Top G Vault]] - [[Racing Starter Architecture]] - [[Roblox Studio Templates - Official Uncopylocked Starter Games]] - [[Case Study - Jailbreak]]
