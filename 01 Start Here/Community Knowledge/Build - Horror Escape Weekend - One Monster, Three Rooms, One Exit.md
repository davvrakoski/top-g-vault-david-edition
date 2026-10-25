---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Horror Escape Weekend - One Monster, Three Rooms, One Exit"
tags: [roblox, community-knowledge, start-here, weekend-build, horror]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#Raycast
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/characters/pathfinding
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/production/promotion/content-maturity
---
# Build - Horror Escape Weekend - One Monster, Three Rooms, One Exit

A tiny horror escape is one of the best weekend projects because fear comes from lighting, sound and timing, not from content volume. Three dark rooms, one item per room, one monster that patrols and chases, and a door that opens when you have everything: that is a full game loop with a start, tension and an ending. This plan keeps the monster brain to about 40 lines and spends the rest of the time on atmosphere. Bigger design: [[Horror Starter Architecture]] and [[Case Study - DOORS]].

## The weekend scope

| In | Cut (later) |
|---|---|
| 3 rooms + a hallway loop | Procedural rooms, many floors |
| Key (room 1), fuse (room 2), exit (room 3) | Inventory UI with slots |
| 1 monster: patrol, see, chase, catch | Several monsters, sound hearing |
| 2-3 hiding closets | Hiding mini-game |
| Spectate after you die, round restarts | Lobby, revives, shop |

## Day 1 - rooms, items, monster (about 5 hours)

1. **Greybox (1.5 h).** Three rooms joined by a hallway that **loops**, so players can run circles instead of hitting dead ends. Read [[Horror Map Design - Pacing, Loops and Readable Darkness]].
2. **Items and doors (1.5 h).** Each item is a part with a ProximityPrompt. Picking it up sets an attribute on the server (`workspace:SetAttribute("HasKey", true)`; shared for co-op). Room 2's door checks `HasKey`; the exit checks the fuse. Pattern: [[Recipe - Keycard Door with ProximityPrompt]] and [[First Interaction with ProximityPrompt]].
3. **Monster (2 h).** Any R15 rig with a Humanoid. Place 6-8 invisible `PatrolPoints` through all rooms. Paste the core script. The monster is released only when the key is picked up, so players get a calm first minute.

## Day 2 - fear, fairness and the ending (about 5 hours)

1. **Lighting (1.5 h).** Dark ambient, fog, and one flashlight. Calibrate so silhouettes stay readable: [[FX - Horror Fog and Brightness Calibration - Silhouettes, Fog Walls and a Gamma Screen]] and [[Story - Horror Flashlights - Aim, Battery, Replication and Shadow Budget]].
2. **Sound (1 h).** Footsteps on the monster, a low loop that rises when it chases, near silence otherwise. [[Story - Horror Audio - Silence, Room Reverb and Monster Cues]].
3. **Hiding closets (1 h).** A ProximityPrompt that moves the player inside and sets the character attribute `Hidden`. The monster script below ignores hidden players. Make the monster sometimes walk past the closet. [[Story - Hiding Spots - Closets, Lockers and Monster Checks]].
4. **Ending and restart (1 h).** Touching the exit with the fuse shows "You escaped" for 5 seconds, then everyone respawns and items reset. Dead players spectate: [[Recipe - Spectate Mode]].
5. **Maturity (30 min).** Fill in the content maturity questionnaire honestly; a scary chase is fine but label it. [[Story - Jump Scares, Flashing and Maturity Labels - Ethical Horror on Roblox]].

> **Code status:** original example, not run in Studio. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## The core script: patrol, see, chase, catch

```lua
-- ServerScriptService/Monster
local Players = game:GetService("Players")
local monster = workspace:WaitForChild("Monster")
local hum = monster:WaitForChild("Humanoid")
local root = monster:WaitForChild("HumanoidRootPart")
local points = workspace:WaitForChild("PatrolPoints"):GetChildren()
root:SetNetworkOwner(nil) -- the server moves it, no client stutter

local SIGHT, CATCH = 60, 4
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude
params.FilterDescendantsInstances = {monster}

local function canSee(character)
	local target = character:FindFirstChild("HumanoidRootPart")
	if not target or character:GetAttribute("Hidden") then return false end
	local offset = target.Position - root.Position
	if offset.Magnitude > SIGHT then return false end
	local hit = workspace:Raycast(root.Position, offset, params)
	return hit ~= nil and hit.Instance:IsDescendantOf(character)
end

local function closestVisible()
	local best, bestDist = nil, math.huge
	for _, player in Players:GetPlayers() do
		local c = player.Character
		local h = c and c:FindFirstChildOfClass("Humanoid")
		if h and h.Health > 0 and canSee(c) then
			local d = (c.HumanoidRootPart.Position - root.Position).Magnitude
			if d < bestDist then best, bestDist = c, d end
		end
	end
	return best, bestDist
end

repeat task.wait(0.5) until workspace:GetAttribute("HasKey")
local index = 1
while true do
	local target, dist = closestVisible()
	if target then
		hum.WalkSpeed = 18
		hum:MoveTo(target.HumanoidRootPart.Position)
		if dist < CATCH then target.Humanoid.Health = 0 end
	else
		hum.WalkSpeed = 10
		local goal = points[index].Position
		hum:MoveTo(goal)
		local flat = Vector3.new(goal.X - root.Position.X, 0, goal.Z - root.Position.Z)
		if flat.Magnitude < 4 then index = index % #points + 1 end
	end
	task.wait(0.2)
end
```

The default player WalkSpeed is 16, so a chase speed of 18 is catchable but not instant; tune it after playtests. Calling `MoveTo` every 0.2 s also avoids the 8-second `MoveTo` timeout. The monster walks in straight lines, so keep doorways wide. If it gets stuck on corners, upgrade the chase branch to `PathfindingService` next weekend: [[Enemy AI Pathing Loop with PathfindingService]].

## What to cut when you run late

- Hiding closets: replace them with a second loop route.
- Spectate: just respawn dead players in the hallway after 10 seconds.
- Custom monster model: a tall dark rig with glowing eyes is scarier than a rushed mesh.

## How to test

- [ ] Stand behind a wall in plain range: the monster does not chase (raycast blocked).
- [ ] Hide in a closet mid-chase: the monster goes back to patrol.
- [ ] Two players: it chases the closer one and switches when that one hides.
- [ ] Run the hallway loop for 60 seconds at full speed: you can escape, so deaths feel fair. [[Story - Stalker Monster AI Feel - Director Leash, Senses and Fair Kills]].
- [ ] Full round start to "You escaped", then a second round starts clean.

## Related
[[00 START HERE - Top G Vault]] - [[Horror Starter Architecture]] - [[Story - Horror Tension Director - Intensity, Build Up, Peak and Relax]] - [[Case Study - Piggy]]
