---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Wall Jump"
tags: [roblox, community-knowledge, scripting, recipe, luau, movement, wall-jump, raycast, parkour]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/classes/LinearVelocity
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://devforum.roblox.com/t/wall-running-help/1729397
  - https://devforum.roblox.com/t/wall-jump-walls/278614
---
# Recipe - Wall Jump

While falling next to a wall, press jump to kick off it: up and away from the wall, facing out. Players can then climb a shaft by bouncing between two walls. DevForum threads on wall jumps mostly agree on the approach used here: a short raycast from the HumanoidRootPart to find the wall, the hit **normal** to decide the push direction, and a brief velocity burst because the Humanoid's air control would otherwise cancel a single velocity change.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Script | Type | Location |
|---|---|---|
| `WallJump` | LocalScript | `StarterPlayer > StarterPlayerScripts` |

Optional: tag climbable walls `WallJump` with the Tag Editor (Properties > Tags) and set `REQUIRE_TAG = true`, so players cannot wall-jump up the side of your whole map.

## The code
```lua
-- StarterPlayerScripts/WallJump (LocalScript)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local CHECK_DIST = 2.4       -- studs from root centre to wall
local PUSH_SPEED = 35        -- away from the wall
local UP_SPEED = 50          -- upward part of the kick
local BURST_TIME = 0.14
local REQUIRE_TAG = false
local SAME_WALL_LOCK = true  -- must touch a different wall (or land) before reusing one

local player = Players.LocalPlayer
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude

local lastWall: Instance? = nil
local busy = false

local function findWall(root: BasePart, humanoid: Humanoid): RaycastResult?
	local look = root.CFrame.LookVector
	local candidates = { Vector3.new(look.X, 0, look.Z) }
	local move = humanoid.MoveDirection
	if move.Magnitude > 0.1 then
		table.insert(candidates, Vector3.new(move.X, 0, move.Z))
	end
	for _, dir in candidates do
		if dir.Magnitude > 0.01 then
			local hit = workspace:Raycast(root.Position, dir.Unit * CHECK_DIST, params)
			if hit and math.abs(hit.Normal.Y) < 0.3 then -- near-vertical surface only
				if (not REQUIRE_TAG or hit.Instance:HasTag("WallJump"))
					and (not SAME_WALL_LOCK or hit.Instance ~= lastWall) then
					return hit
				end
			end
		end
	end
	return nil
end

local function kick(root: BasePart, normal: Vector3)
	local flat = Vector3.new(normal.X, 0, normal.Z).Unit
	-- face away from the wall
	root.CFrame = CFrame.lookAt(root.Position, root.Position + flat)

	local attachment = Instance.new("Attachment")
	attachment.Parent = root
	local mover = Instance.new("LinearVelocity")
	mover.Attachment0 = attachment
	mover.RelativeTo = Enum.ActuatorRelativeTo.World
	mover.VectorVelocity = flat * PUSH_SPEED + Vector3.new(0, UP_SPEED, 0)
	mover.MaxForce = root.AssemblyMass * 4000
	mover.Parent = root
	task.delay(BURST_TIME, function()
		mover:Destroy()
		attachment:Destroy()
	end)
end

UserInputService.JumpRequest:Connect(function()
	if busy then return end
	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	local root = humanoid and humanoid.RootPart
	if not root or humanoid.Health <= 0 then return end
	if humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then return end

	params.FilterDescendantsInstances = { character }
	local hit = findWall(root, humanoid)
	if not hit then return end

	busy = true
	lastWall = hit.Instance
	character:SetAttribute("WallJumpAt", os.clock()) -- lets a double-jump script skip this press
	kick(root, hit.Normal)
	task.delay(0.25, function()
		busy = false
	end)
end)

local function onCharacter(character: Model)
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	humanoid.StateChanged:Connect(function(_, new)
		if new == Enum.HumanoidStateType.Landed or new == Enum.HumanoidStateType.Running then
			lastWall = nil
		end
	end)
end
if player.Character then onCharacter(player.Character) end
player.CharacterAdded:Connect(onCharacter)
```

## Living with [[Recipe - Double Jump]]
Both scripts listen to `JumpRequest`, and the order listeners run in is not something to rely on. In the double-jump handler add, at the top:
```lua
local wj = player.Character and player.Character:GetAttribute("WallJumpAt")
if wj and os.clock() - wj < 0.1 then return end
```
If the double jump wins the race, it spends an air jump while the wall jump also fires. For a polished game, merge both into one movement script that checks the wall first.

## How to test
1. Build two tall parts 8 studs apart (a shaft). Jump against one, press jump again while falling: you should kick across toward the other wall, facing away from the one you left. Press jump again as you fall beside the second wall to kick back.
2. With `SAME_WALL_LOCK = true`, pressing jump twice against the same wall must do nothing the second time.
3. Hold jump continuously: the `busy` gate stops a burst every frame.
4. Try a slope (wedge): it must not count as a wall (normal Y above 0.3).

## Common mistakes
- **Setting `AssemblyLinearVelocity` once.** The Humanoid's air control pulls you back toward `MoveDirection` within a few frames; the short `LinearVelocity` burst wins that fight.
- **Not filtering your own character** from the ray: you "wall jump" off your arm.
- **Raycasting only along `LookVector`.** With shift lock or a camera-relative control scheme players often back into walls; checking `MoveDirection` too helps. Add a backward ray if your game needs it.
- **Skipping the tag check** in a city map: every building becomes a ladder.

## Related
[[Scripting - Hub]] · [[Recipe - Double Jump]] · [[Recipe - Ledge Grab and Climb Up]] · [[Raycasts and Shapecasts - RaycastParams in 2026]]
