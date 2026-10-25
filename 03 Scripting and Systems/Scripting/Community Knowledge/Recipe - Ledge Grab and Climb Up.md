---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Ledge Grab and Climb Up"
tags: [roblox, community-knowledge, scripting, recipe, luau, movement, ledge-grab, parkour, raycast, alignposition]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/constraints/align-position
  - https://create.roblox.com/docs/reference/engine/classes/AlignOrientation
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://devforum.roblox.com/t/how-would-i-make-a-ledge-grab/2779366
  - https://devforum.roblox.com/t/ledge-grab-system/2156422
---
# Recipe - Ledge Grab and Climb Up

When a falling player reaches the top edge of a wall, they catch it and hang. Jump climbs onto the ledge; C drops. It saves near-miss jumps in obbies and is the backbone of parkour games. The detection idea is one that DevForum answers keep returning to: a ray at chest height **hits** the wall, a ray above the head **misses** (so there is an edge), and a downward ray finds the flat top to stand on.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Script | Type | Location |
|---|---|---|
| `LedgeGrab` | LocalScript | `StarterPlayer > StarterPlayerScripts` |

All client-side: the client owns its character. Holding is done with `AlignPosition` + `AlignOrientation` in one-attachment mode (not by anchoring the root, which stops the client's physics updates for that part and can look frozen or jittery to others).

## The three rays
```
        head ray  ->   (miss = open air above the wall)
  O     chest ray ->|  (hit = there is a wall)
 /|\               v   down ray from above the wall top (hit = a floor to climb onto)
 / \               |
```

## The code
```lua
-- StarterPlayerScripts/LedgeGrab (LocalScript)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local REACH = 2.4
local HANG_DROP = 1.6      -- root hangs this far below the ledge top
local REGRAB_DELAY = 0.5

local player = Players.LocalPlayer
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude

local hanging = false
local lastRelease = 0
local holdAttachment, holdPos, holdRot
local ledgeTop: Vector3? = nil
local wallNormal: Vector3? = nil

local function getParts()
	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	return character, humanoid, humanoid and humanoid.RootPart
end

local function release(humanoid: Humanoid)
	hanging = false
	lastRelease = os.clock()
	if holdPos then holdPos:Destroy() end
	if holdRot then holdRot:Destroy() end
	if holdAttachment then holdAttachment:Destroy() end
	holdPos, holdRot, holdAttachment = nil, nil, nil
	humanoid.AutoRotate = true
	humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
end

local function grab(humanoid: Humanoid, root: BasePart, wallHit: RaycastResult, topHit: RaycastResult)
	hanging = true
	local flatNormal = Vector3.new(wallHit.Normal.X, 0, wallHit.Normal.Z).Unit
	wallNormal = flatNormal
	ledgeTop = topHit.Position
	local hangPos = Vector3.new(wallHit.Position.X, topHit.Position.Y - HANG_DROP, wallHit.Position.Z)
		+ flatNormal * 1.1

	humanoid.AutoRotate = false
	humanoid:ChangeState(Enum.HumanoidStateType.Physics) -- Humanoid stops fighting the movers

	holdAttachment = Instance.new("Attachment")
	holdAttachment.Parent = root

	holdPos = Instance.new("AlignPosition")
	holdPos.Mode = Enum.PositionAlignmentMode.OneAttachment
	holdPos.Attachment0 = holdAttachment
	holdPos.Position = hangPos
	holdPos.MaxForce = root.AssemblyMass * 2000
	holdPos.Responsiveness = 60
	holdPos.Parent = root

	holdRot = Instance.new("AlignOrientation")
	holdRot.Mode = Enum.OrientationAlignmentMode.OneAttachment
	holdRot.Attachment0 = holdAttachment
	holdRot.CFrame = CFrame.lookAt(hangPos, hangPos - flatNormal) -- face the wall
	holdRot.MaxTorque = root.AssemblyMass * 2000
	holdRot.Responsiveness = 60
	holdRot.Parent = root
end

RunService.Heartbeat:Connect(function()
	if hanging or os.clock() - lastRelease < REGRAB_DELAY then return end
	local character, humanoid, root = getParts()
	if not root or humanoid.Health <= 0 then return end
	if humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then return end
	if root.AssemblyLinearVelocity.Y > 4 then return end -- only near the top of a jump or falling

	params.FilterDescendantsInstances = { character }
	local look = root.CFrame.LookVector
	local flat = Vector3.new(look.X, 0, look.Z)
	if flat.Magnitude < 0.01 then return end
	flat = flat.Unit

	local wallHit = workspace:Raycast(root.Position + Vector3.new(0, 0.8, 0), flat * REACH, params)
	if not wallHit or math.abs(wallHit.Normal.Y) > 0.3 then return end
	if workspace:Raycast(root.Position + Vector3.new(0, 2.8, 0), flat * REACH, params) then return end

	local downFrom = wallHit.Position - wallHit.Normal * 0.7 + Vector3.new(0, 3, 0)
	local topHit = workspace:Raycast(downFrom, Vector3.new(0, -3.5, 0), params)
	if not topHit or topHit.Normal.Y < 0.7 then return end

	local rise = topHit.Position.Y - root.Position.Y
	if rise < 0.5 or rise > 3 then return end
	grab(humanoid, root, wallHit, topHit)
end)

UserInputService.JumpRequest:Connect(function()
	if not hanging or not holdPos or not ledgeTop or not wallNormal then return end
	local _, humanoid, root = getParts()
	if not root then return end
	-- climb: target a point on top of the ledge, a little past the edge
	local standY = ledgeTop.Y + humanoid.HipHeight + root.Size.Y / 2 + 0.2
	holdPos.Position = Vector3.new(ledgeTop.X, standY, ledgeTop.Z) - wallNormal * 1.2
	task.delay(0.3, function()
		if hanging then release(humanoid) end
	end)
	ledgeTop = nil -- block repeat presses
end)

UserInputService.InputBegan:Connect(function(input, processed)
	if processed or not hanging then return end
	if input.KeyCode == Enum.KeyCode.C or input.KeyCode == Enum.KeyCode.ButtonB then
		local _, humanoid = getParts()
		if humanoid then release(humanoid) end
	end
end)

player.CharacterAdded:Connect(function()
	hanging = false
	holdPos, holdRot, holdAttachment = nil, nil, nil
end)
```

## How to test
1. Build a 9-stud-high anchored block. Jump at it from a step so your chest meets the top edge: you should stop and hang facing the wall.
2. Press jump: you rise onto the top and land standing. Press C while hanging: you drop and cannot regrab for 0.5 s.
3. Jump at a tall wall with no top in reach: nothing happens (head ray hits).
4. Jump at a wedge or a railing thinner than 0.7 studs: the down ray should not find a valid floor, so no grab.
5. Watch from a second client: the hang should look steady. If it jitters, raise `Responsiveness`.

## Common mistakes
- **Anchoring the HumanoidRootPart** to hang. It works in solo tests but behaves badly once other players watch; movers keep physics alive.
- **Leaving the Humanoid in `Physics` state.** Always `ChangeState(Freefall)` on release, or the character stays limp.
- **No re-grab delay.** Dropping immediately re-catches the same ledge.
- **Using `BodyPosition`/`BodyGyro`** from old threads: deprecated; use AlignPosition/AlignOrientation.
- Add a hang animation by loading it on the `Animator` in `grab` and stopping it in `release`.

## Related
[[Scripting - Hub]] · [[Recipe - Wall Jump]] · [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]] · [[Raycasts and Shapecasts - RaycastParams in 2026]]
