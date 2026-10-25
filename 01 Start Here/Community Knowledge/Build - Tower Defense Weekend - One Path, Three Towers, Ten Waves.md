---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Tower Defense Weekend - One Path, Three Towers, Ten Waves"
tags: [roblox, community-knowledge, start-here, weekend-build, tower-defense]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://create.roblox.com/docs/reference/engine/classes/Model
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/scripting/events/remote
  - https://devforum.roblox.com/t/tower-defense-how-to-start/3195580
  - https://devforum.roblox.com/t/2558120
---
# Build - Tower Defense Weekend - One Path, Three Towers, Ten Waves

Tower defense looks big (units, maps, lobbies, trading), but the playable heart is small: enemies walk a path, towers shoot the one furthest along, money buys more towers, and the base dies if too many get through. If you build only that heart over one weekend, you learn server loops, attributes, remotes and placement validation, and you end with something friends can actually play. This note is the order to build it in. For the full-size design, read [[Tower Defense Starter Architecture]] and [[Tower Defense Genre Breakdown - Waves, Placement Economy and Unit Rosters]] after you finish, not before.

## The weekend scope

| In | Cut (later) |
|---|---|
| 1 map, 1 path, 1 base with 100 HP | Lobby, elevators, map vote |
| 3 enemy types (normal, fast, tanky) | Bosses, flying, stealth |
| 3 towers (cheap, sniper, splash) | Upgrades past level 1, unit rarity |
| 10 waves, then "You win" | Endless mode, difficulty select |
| Cash per kill, shared by everyone | Saving, unit inventory, crates |

## Day 1 - path, enemies and waves (about 5 hours)

1. **Block out the map (45 min).** A ground plane, a path of anchored parts, and a `Path` folder with small invisible parts named `1`, `2`, `3`... at each corner. Make the path long with 3-4 bends so towers have pockets. Read [[Map - Tower Defense Path Layout - Path Length, Bends and Placement Pockets]].
2. **Enemy templates (30 min).** Three simple Models in `ServerStorage/Enemies`, each with a `PrimaryPart`, all parts anchored and `CanCollide = false`. Anchored models without a Humanoid are cheaper to move than walking NPCs. See [[Starter - Models That Hold Together - Anchored, Welds, PrimaryPart and PivotTo]].
3. **One mover script (1.5 h).** The core script below moves every enemy along the points and records how far each one has travelled.
4. **Wave table (1 h).** A ModuleScript listing waves as data, for example `{ {type = "Normal", count = 8, gap = 1}, ... }`. A server loop spawns each wave, waits until `Enemies` is empty, pays a wave bonus, then starts the next. See [[Starter - First ModuleScript and Code Organization]] and [[Starter - First Spawner - Templates in ServerStorage, Clone and Cleanup]].
5. **Base health (30 min).** When an enemy reaches the last point, subtract its damage from a `BaseHealth` attribute on `workspace`. At 0, print "Game over" and stop the loop.

## Day 2 - towers, money and a finish line (about 5 hours)

1. **Cash (30 min).** A `Cash` leaderstat per player; split kill rewards evenly so co-op players do not fight over last hits. [[First Leaderboard with leaderstats]].
2. **Placement (2 h).** The client shows a ghost model under the mouse and fires a `PlaceTower` RemoteEvent with the tower name and a position. The server checks: the name exists, the player has enough cash, the spot is on a `Placeable` part, not on the path, and not within 3 studs of another tower. Only then it subtracts cash and clones the tower. [[First RemoteEvent - Button on the Client, Reward on the Server]], [[Grid Placement System - Community Blueprint]].
3. **Tower loop (1.5 h).** Every 0.1 s, each tower whose cooldown is ready picks the enemy with the highest `Dist` attribute inside its range, lowers its `Health` attribute, and plays a beam or sound. More modes later: [[Tower Defense Targeting Modes - First, Last, Strongest and Closest]].
4. **Win screen (30 min).** After wave 10 is cleared, show a "Victory" GUI to all players. [[First GUI Button - ScreenGui, TextButton and Activated]].
5. **Balance pass (30 min).** Play solo. If you never lose cash, raise tower cost by 20 percent; if wave 3 kills you, lower enemy health.

> **Code status:** original example, not run in Studio. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## The core script: one mover for all enemies

```lua
-- ServerScriptService/EnemyMover
local RunService = game:GetService("RunService")
local pathFolder = workspace:WaitForChild("Path")
local points = {}
for i = 1, #pathFolder:GetChildren() do
	points[i] = pathFolder:FindFirstChild(tostring(i)).Position
end

local active = {} -- [model] = {node, speed, dist}

local function spawnEnemy(template, speed, health)
	local e = template:Clone()
	e:SetAttribute("Health", health)
	e:PivotTo(CFrame.new(points[1]))
	e.Parent = workspace.Enemies
	active[e] = {node = 2, speed = speed, dist = 0}
end

RunService.Heartbeat:Connect(function(dt)
	for e, s in active do
		if not e.Parent or e:GetAttribute("Health") <= 0 then
			active[e] = nil
			if e.Parent then e:Destroy() end -- pay kill reward here
			continue
		end
		local pos = e:GetPivot().Position
		local toGoal = points[s.node] - pos
		local step = math.min(s.speed * dt, toGoal.Magnitude)
		if toGoal.Magnitude > 0.01 then
			e:PivotTo(CFrame.lookAt(pos + toGoal.Unit * step, points[s.node]))
		end
		s.dist += step
		e:SetAttribute("Dist", s.dist)
		if toGoal.Magnitude - step < 0.05 then
			s.node += 1
			if s.node > #points then -- reached the base
				active[e] = nil
				e:Destroy() -- subtract base health here
			end
		end
	end
end)

-- the wave loop (same script) calls spawnEnemy(template, 8, 100)
```

Why not `Humanoid:MoveTo`? It works and the DevForum threads above use it, but a Humanoid per enemy costs more, and `MoveTo` gives up after 8 seconds if the goal is not reached (see [[NPC Movement - MoveTo Timeout and Pathfinding Stutter]]). A common beginner error from the second DevForum thread is starting the waypoint loop at index 0; Luau arrays start at 1.

## What to cut when you run late

- Tower models: use coloured cylinders with a part on top.
- Splash tower: drop it, keep two towers.
- Ghost preview: let players click a pad to place instead.
- Any per-player saving: TD rounds can be fully temporary for a first build.

## How to test

- [ ] **Test** mode solo: enemies follow every bend and never cut corners.
- [ ] **Server and Clients** with 2 players: both see the same enemy positions and both get cash ([[Studio Testing Modes for Beginners - Test, Run and Server and Clients]]).
- [ ] Try to place a tower on the path, on another tower, and with 0 cash: all three are refused by the server.
- [ ] Destroy an enemy by hand in the Explorer mid-wave: the mover skips it without an error.
- [ ] Wave 10 ends in Victory; base at 0 ends in Game over; no errors in Output.

## Related
[[00 START HERE - Top G Vault]] - [[Tower Defense Starter Architecture]] - [[Case Study - Tower Defense Simulator]] - [[Starter - Scoping Your First Real Game - One Loop and a Cut List]]
