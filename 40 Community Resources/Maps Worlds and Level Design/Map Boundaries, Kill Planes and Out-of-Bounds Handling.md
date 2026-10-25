---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/map-boundaries-kill-planes"
title: "Map Boundaries, Kill Planes and Out-of-Bounds Handling"
tags: [roblox, community, level-design, boundaries, collision-groups, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace#FallenPartsDestroyHeight
  - https://create.roblox.com/docs/workspace/collisions
  - https://create.roblox.com/docs/reference/engine/classes/PhysicsService
  - https://www.above-the-garage.com/wienies/
  - https://devforum.roblox.com/t/ruskis-tutorial-5-how-to-design-an-open-world-map/3554962
  - https://devforum.roblox.com/t/ruskis-tutorial-1-how-to-design-a-map-layout/277853
---
# Map Boundaries, Kill Planes and Out-of-Bounds Handling

Every map ends somewhere, and players will find that place within minutes. Good boundaries are layered: the map's look discourages leaving, physical blockers stop it, and the server catches anyone who still gets out.

## Layer 1: boundaries players believe
- **Hide the edge.** Clarke-Willson's Disneyland article lists tall barriers and distant scenery as ways to stop players thinking about leaving. Mountains, cliffs, water, dense forest and fog do the same in Roblox.
- **If it can't be entered, don't make it look enterable.** Ruski's open-world tutorial says boundaries should match the visuals; an open door you can't walk through is a broken promise.
- **Mark out-of-bounds early.** Ruski's map-layout tutorial marks out-of-bounds areas with bright placeholder parts during blockout, so everyone knows where the playable space ends before art starts.
- **Roofs and tops of walls** are where players escape most often (jump-stacking, ladders, tools). Plan which rooftops are playable.

## Layer 2: blockers that only block what they should
An invisible wall that also stops bullets, cameras and thrown items feels bad. Use a **collision group** so the wall only blocks characters.

```lua
-- ServerScriptService/PlayerOnlyWalls.server.lua
local PhysicsService = game:GetService("PhysicsService")
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

PhysicsService:RegisterCollisionGroup("Characters")
PhysicsService:RegisterCollisionGroup("PlayerWalls")
PhysicsService:CollisionGroupSetCollidable("PlayerWalls", "Default", false) -- props, projectiles pass
PhysicsService:CollisionGroupSetCollidable("PlayerWalls", "Characters", true) -- characters are blocked

-- Tag invisible boundary parts "PlayerWall" in Studio.
local function setupWall(part: Instance)
	if part:IsA("BasePart") then
		part.CollisionGroup = "PlayerWalls"
		part.Transparency = 1
		part.CanTouch = false
		part.Anchored = true
	end
end
for _, p in CollectionService:GetTagged("PlayerWall") do setupWall(p) end
CollectionService:GetInstanceAddedSignal("PlayerWall"):Connect(setupWall)

-- Put every character part in the Characters group.
local function setGroup(inst: Instance)
	if inst:IsA("BasePart") then inst.CollisionGroup = "Characters" end
end
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		for _, d in character:GetDescendants() do setGroup(d) end
		character.DescendantAdded:Connect(setGroup) -- accessories and tools added later
	end)
end)
```

Why raycasts pass through too: `CanQuery = false` only takes effect on parts with `CanCollide` off, so it can't be used on a solid wall. But a raycast uses the **Default** collision group unless its `RaycastParams.CollisionGroup` says otherwise, and parts in groups that don't collide with that group are ignored. Since `PlayerWalls` doesn't collide with `Default`, default raycasts (most weapons) skip these walls.

The same pattern makes team-only doors (a group per team) and spawn rooms enemies can't enter.

## Layer 3: the server catches escapes
Parts and characters that fall below `Workspace.FallenPartsDestroyHeight` are removed from Workspace (the property can only be set in Studio, the command bar or plugins, and is clamped to +/-50,000). Falling forever is slow and confusing, so add your own checks above that height:

```lua
-- ServerScriptService/OutOfBounds.server.lua
local Players = game:GetService("Players")

local PLAY_MIN = Vector3.new(-1200, -40, -1200) -- playable box: set to your map
local PLAY_MAX = Vector3.new(1200, 600, 1200)
local CHECK_EVERY = 0.5

local lastSafe: { [Player]: CFrame } = {}

local function insideBox(p: Vector3): boolean
	return p.X >= PLAY_MIN.X and p.X <= PLAY_MAX.X
		and p.Y >= PLAY_MIN.Y and p.Y <= PLAY_MAX.Y
		and p.Z >= PLAY_MIN.Z and p.Z <= PLAY_MAX.Z
end

while true do
	task.wait(CHECK_EVERY)
	for _, player in Players:GetPlayers() do
		local character = player.Character
		local root = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if root and humanoid and humanoid.Health > 0 then
			if insideBox(root.Position) then
				if humanoid.FloorMaterial ~= Enum.Material.Air then
					lastSafe[player] = root.CFrame -- standing on something inside the map
				end
			else
				local back = lastSafe[player]
				if back then
					character:PivotTo(back + Vector3.new(0, 3, 0))
				else
					humanoid.Health = 0
				end
			end
		end
	end
	for player in lastSafe do
		if not player.Parent then lastSafe[player] = nil end
	end
end
```

- Returning players to their last safe spot is friendlier than killing them; obbies may prefer a respawn at the checkpoint.
- Server-side checks matter because exploiters can move their own character freely; never rely on a client script to enforce boundaries.

## Kill bricks done right
- Make them readable (one colour language for the whole game; see [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]]).
- Handle `Touched` on the **server**, check the toucher is a living character, and debounce per player.
- Lava or water "floors" under a whole map are better as a server Y check (like the script above) than a giant touch part.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Collisions]] · [[Physics, Collisions and Ragdolls]] · [[Works in Studio, Breaks Live - Checklist]] · [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]]

<!-- TDOD_GRAPH_END -->
