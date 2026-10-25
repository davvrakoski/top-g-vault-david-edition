---
area: "01 Start Here"
cluster: "Start Here"
title: "First Chasing Enemy - Nearest Player, Touch Damage and a Leash"
tags: [roblox, community-knowledge, start-here, npc, enemy, ai, humanoid]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/characters/pathfinding
---
# First Chasing Enemy - Nearest Player, Touch Damage and a Leash

The first enemy most beginners want is a zombie or slime that runs at the nearest player and hurts them on contact. It is a great learning project because it combines a loop, distance math, Humanoids, debounce and respawning. This version is deliberately simple: no pathfinding, one server Script, and three rules (**find**, **chase**, **give up**). It builds on [[Starter - First Patrol NPC - Waypoints with MoveTo and MoveToFinished]].

## Setup

1. Make a rig (**Avatar > Rig Builder**), name it `Zombie`, unanchor every part, set `Humanoid.WalkSpeed` to 12 (slower than the player's 16, so players can escape).
2. Move the finished model into **ServerStorage** and name it `ZombieTemplate`. A spawner clones it; the original stays safe.
3. Put a part named `ZombieSpawn` in Workspace (anchored, invisible, no collision) where the enemy should appear.

## The brain: one server Script in ServerScriptService

```lua
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local TEMPLATE = ServerStorage:WaitForChild("ZombieTemplate")
local SPAWN = workspace:WaitForChild("ZombieSpawn")
local SIGHT_RANGE = 60     -- studs: starts chasing inside this
local LEASH_RANGE = 90     -- studs from spawn: gives up beyond this
local DAMAGE = 15
local HIT_COOLDOWN = 1     -- seconds between hits on the same player

local function nearestPlayer(fromPos: Vector3)
	local best, bestDist = nil, SIGHT_RANGE
	for _, player in Players:GetPlayers() do
		local char = player.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if hum and root and hum.Health > 0 then
			local d = (root.Position - fromPos).Magnitude
			if d < bestDist then best, bestDist = root, d end
		end
	end
	return best
end

local function spawnZombie()
	local zombie = TEMPLATE:Clone()
	zombie:PivotTo(SPAWN.CFrame + Vector3.new(0, 3, 0))
	zombie.Parent = workspace
	local hum = zombie:WaitForChild("Humanoid")
	local root = zombie:WaitForChild("HumanoidRootPart")
	root:SetNetworkOwner(nil)

	-- touch damage with a per-player cooldown
	local lastHit = {}
	for _, part in zombie:GetDescendants() do
		if part:IsA("BasePart") then
			part.Touched:Connect(function(other)
				local victim = other.Parent and other.Parent:FindFirstChildOfClass("Humanoid")
				local player = victim and Players:GetPlayerFromCharacter(other.Parent)
				if not player or hum.Health <= 0 then return end
				local now = os.clock()
				if (lastHit[player] or 0) + HIT_COOLDOWN > now then return end
				lastHit[player] = now
				victim:TakeDamage(DAMAGE)
			end)
		end
	end

	-- respawn after death
	hum.Died:Once(function()
		task.wait(5)
		zombie:Destroy()
		spawnZombie()
	end)

	-- chase loop
	task.spawn(function()
		while hum.Health > 0 do
			local target = nearestPlayer(root.Position)
			local farFromHome = (root.Position - SPAWN.Position).Magnitude > LEASH_RANGE
			if target and not farFromHome then
				hum:MoveTo(target.Position)
			else
				hum:MoveTo(SPAWN.Position) -- walk home
			end
			task.wait(0.25)
		end
	end)
end

spawnZombie()
```

## What each part teaches

- **Find:** loop over `Players:GetPlayers()`, skip players with no character or zero health, keep the closest one inside `SIGHT_RANGE`. `.Magnitude` of the difference between two positions is the distance in studs.
- **Chase:** calling `MoveTo` every 0.25 s re-aims at the moving player and also keeps resetting the 8-second MoveTo timeout.
- **Give up (the leash):** without it, one player can drag every enemy across the map. Walking home when too far from spawn keeps encounters where you designed them.
- **`TakeDamage`** respects a `ForceField` (fresh spawns are protected); setting `Health` directly does not.
- **Per-player cooldown:** `Touched` fires many times per second while parts overlap. Without the `lastHit` table a single brush kills instantly.

## Pitfalls

- **Enemy hits other enemies:** `GetPlayerFromCharacter` returns nil for NPCs, so the check above already ignores them.
- **Stuck on walls:** straight-line `MoveTo` cannot go around obstacles. When this matters, upgrade to `PathfindingService`; see [[Enemy AI Pathing Loop with PathfindingService]].
- **Many enemies, many loops:** 5-10 of these are fine. For hordes, one loop that updates all enemies beats one loop per enemy; see [[NPCs tank server performance]].
- **Damage in a LocalScript:** never. Exploiters could edit it, and other players would not see it. All of this runs on the server.
- **Tuning feel:** give players a fair chance: enemy WalkSpeed a bit below player speed, a short wind-up, and a sound when it notices you.

## Related
[[00 START HERE - Top G Vault]] · [[Starter - First Patrol NPC - Waypoints with MoveTo and MoveToFinished]] · [[Enemy AI Pathing Loop with PathfindingService]] · [[Events and Connections for Beginners - Connect, Once, Wait and Debounce]] · [[NPC AI Framework]]
