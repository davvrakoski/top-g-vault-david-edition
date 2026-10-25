---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Moving Platform with PrismaticConstraint"
tags: [roblox, community-knowledge, scripting, recipe, luau, moving-platform, prismaticconstraint, physics, elevator, network-ownership]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/constraints/prismatic
  - https://create.roblox.com/docs/reference/engine/classes/PrismaticConstraint
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/physics/mechanical-constraints
---
# Recipe - Moving Platform with PrismaticConstraint

A platform or elevator that slides back and forth along one line and **carries players standing on it**. Platforms moved with TweenService on an anchored part teleport each frame and have no velocity, so riders slide off (the reasons are collected in [[Moving Platforms - Why Players Slide Off]]). A physics platform driven by a `PrismaticConstraint` servo has real velocity, so Humanoids ride it naturally. The official docs describe the prismatic constraint exactly for "sliding doors and elevator platforms".

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `PrismaticPlatforms` | Script | `ServerScriptService` |
| platform rigs | Model tagged `SlidingPlatform` | `Workspace` |

Each tagged model contains:
- `Anchor`: small part, **Anchored**, `Transparency = 1`, `CanCollide` off. Put it anywhere; it is the fixed reference.
- `Platform`: the part players stand on, **not anchored**.

Model attributes (all optional): `Direction` (Vector3, world direction of travel, default `0, 1, 0` = elevator), `Travel` (studs, default 20), `Speed` (studs/s, default 8), `Pause` (seconds at each end, default 2).

## The code
```lua
-- ServerScriptService/PrismaticPlatforms (Script)
local CollectionService = game:GetService("CollectionService")

local RIDER_MASS_BUDGET = 100 -- extra mass the servo must lift; tune for your character sizes

-- an attachment CFrame whose X axis (the prismatic slide axis) points along worldDir
local function axisCFrame(part: BasePart, worldPos: Vector3, worldDir: Vector3): CFrame
	local localPos = part.CFrame:PointToObjectSpace(worldPos)
	local localDir = part.CFrame:VectorToObjectSpace(worldDir).Unit
	local helper = if math.abs(localDir.Y) < 0.9 then Vector3.yAxis else Vector3.xAxis
	local localUp = localDir:Cross(helper):Cross(localDir).Unit
	return CFrame.fromMatrix(localPos, localDir, localUp)
end

local function setup(model: Instance)
	local anchor = model:FindFirstChild("Anchor")
	local platform = model:FindFirstChild("Platform")
	if not (anchor and anchor:IsA("BasePart") and platform and platform:IsA("BasePart")) then
		warn("SlidingPlatform needs Anchor and Platform parts:", model:GetFullName())
		return
	end
	local dir = (model:GetAttribute("Direction") or Vector3.new(0, 1, 0)).Unit
	local travel = model:GetAttribute("Travel") or 20
	local speed = model:GetAttribute("Speed") or 8
	local pause = model:GetAttribute("Pause") or 2

	anchor.Anchored = true
	platform.Anchored = false

	-- both attachments start at the platform's position, axes aligned, so separation starts at 0
	local a0 = Instance.new("Attachment")
	a0.Name = "SlideStart"
	a0.CFrame = axisCFrame(anchor, platform.Position, dir)
	a0.Parent = anchor

	local a1 = Instance.new("Attachment")
	a1.Name = "SlideRider"
	a1.CFrame = axisCFrame(platform, platform.Position, dir)
	a1.Parent = platform

	local slider = Instance.new("PrismaticConstraint")
	slider.Attachment0 = a0
	slider.Attachment1 = a1
	slider.ActuatorType = Enum.ActuatorType.Servo
	slider.LimitsEnabled = true
	slider.LowerLimit = 0
	slider.UpperLimit = travel
	slider.Speed = speed
	slider.ServoMaxForce = (platform.AssemblyMass + RIDER_MASS_BUDGET) * workspace.Gravity * 2
	slider.TargetPosition = 0
	slider.Parent = platform

	-- keep physics on the server: no ownership hand-off to the nearest player
	platform:SetNetworkOwner(nil)

	task.spawn(function()
		local goingOut = true
		while model.Parent do
			slider.TargetPosition = if goingOut then travel else 0
			local target = slider.TargetPosition
			local started = os.clock()
			-- wait until it arrives (or a timeout, in case something blocks it)
			while math.abs(slider.CurrentPosition - target) > 0.1
				and os.clock() - started < travel / speed + 3 do
				task.wait(0.1)
			end
			task.wait(pause)
			goingOut = not goingOut
		end
	end)
end

for _, m in CollectionService:GetTagged("SlidingPlatform") do setup(m) end
CollectionService:GetInstanceAddedSignal("SlidingPlatform"):Connect(setup)
```

## How to test
1. Build a model `Lift` with `Anchor` (1x1x1, anchored) and `Platform` (8x1x8, unanchored) resting where the lift starts. Tag the model `SlidingPlatform`. Play: it rises 20 studs, waits, comes back.
2. Stand on it: you ride up without sliding. Jump while it moves: you land back on it.
3. Set `Direction = 1, 0, 0` and `Travel = 30` for a sideways ferry. If it moves the opposite way, flip the sign of `Direction`.
4. Turn on Studio's network-owner display (Studio Settings > Physics, "Are Owners Shown"; setting name unverified for the 2026 Studio build): the platform should stay server-owned while you stand on it.
5. Pile five players (or heavy parts) on it: if it sags or stalls, raise `RIDER_MASS_BUDGET`.

## Common mistakes
- **Anchoring the Platform.** Constraints cannot move anchored parts; only the `Anchor` is anchored.
- **Attachment axes not aligned.** The slide happens along the attachments' primary (yellow arrow) axis; misaligned attachments slide diagonally. The `axisCFrame` helper builds both from the same world direction.
- **Leaving network ownership automatic.** The engine may give the platform to a nearby player; it then moves smoothly for them and jerkily for others, and an exploiter could move it.
- **Weak servo.** `ServoMaxForce` must beat gravity on the platform plus riders, or the lift stops halfway.
- **Spinning or tilting.** A prismatic already blocks rotation relative to the anchor; if a platform still wobbles, check that nothing else (welds to loose parts, other constraints) is attached.

## Related
[[Scripting - Hub]] · [[Moving Platforms - Why Players Slide Off]] · [[Riding Moving Vehicles - Keeping Standing Players Onboard]] · [[Trains on Roblox - Spline CFrame Trains vs PrismaticConstraint Carts]]
