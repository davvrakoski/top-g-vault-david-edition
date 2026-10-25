---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/helicopter-controls"
title: "Helicopter Controls - Lift, Tilt and Yaw With Movers"
tags: [roblox, community, vehicles, helicopter, flight, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/2232045
  - https://create.roblox.com/docs/physics/constraints/linear-velocity
  - https://create.roblox.com/docs/physics/constraints/align-orientation
---
# Helicopter Controls - Lift, Tilt and Yaw With Movers

No well-known free, open-licensed helicopter kit turned up in our search (most "open source" listings are paid marketplace items with their own terms). The good news: an arcade helicopter is short to write.

## The community's build order
A 2023 DevForum answer (ValtryekRBLX, "I want to build a helicopter system...") gives a clear five-step plan:
1. **Enter / exit** with proximity prompts (optional animation).
2. **Vertical:** E / Q climb and descend, accelerating while held and easing off on release; spin the rotor from that acceleration.
3. **Tilt:** W / S pitch the nose down / up, clamped with `math.clamp`, with ease-in and ease-out.
4. **Forward / back** movement along the helicopter's facing.
5. **Turn:** A / D yaw left and right, unclamped.

The answer used `AssemblyLinearVelocity` directly. Below is the same plan with **mover constraints**, which play better with collisions and network ownership than setting velocity every frame.

## Original Luau
LocalScript for the pilot, after the server gives the pilot ownership of the helicopter ([[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]). The body has an Attachment `Center` at its center of mass.

```lua
--!strict
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local heli = workspace:WaitForChild("Helicopter") :: Model
local body = heli.PrimaryPart :: BasePart
local center = body:WaitForChild("Center") :: Attachment
local rotor = heli:FindFirstChild("RotorHinge") :: HingeConstraint?

local MAX_SPEED = 90           -- studs/s forward
local MAX_CLIMB = 35           -- studs/s up or down
local YAW_RATE = math.rad(70)  -- per second
local MAX_TILT = math.rad(18)  -- nose-down at full forward
local ACCEL = 2.5              -- how fast velocity follows the stick (per second)
local TILT_SPEED = 4

local mass = body.AssemblyMass

local move = Instance.new("LinearVelocity")
move.Attachment0 = center
move.RelativeTo = Enum.ActuatorRelativeTo.World
move.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
move.MaxForce = mass * workspace.Gravity * 3   -- enough to hover and push
move.VectorVelocity = Vector3.zero
move.Parent = body

local attitude = Instance.new("AlignOrientation")
attitude.Mode = Enum.OrientationAlignmentMode.OneAttachment
attitude.Attachment0 = center
attitude.MaxTorque = mass * 2000
attitude.Responsiveness = 20
attitude.Parent = body

local function axis(positive: Enum.KeyCode, negative: Enum.KeyCode): number
	local p = if UserInputService:IsKeyDown(positive) then 1 else 0
	local n = if UserInputService:IsKeyDown(negative) then 1 else 0
	return p - n
end

local _, startYaw, _ = body.CFrame:ToOrientation()
local yaw = startYaw
local tilt = 0
local velocity = Vector3.zero

RunService.PreSimulation:Connect(function(dt)
	local forward = axis(Enum.KeyCode.W, Enum.KeyCode.S)
	local climb = axis(Enum.KeyCode.E, Enum.KeyCode.Q)
	local turn = axis(Enum.KeyCode.A, Enum.KeyCode.D)

	yaw += turn * YAW_RATE * dt
	local heading = CFrame.Angles(0, yaw, 0)

	-- Nose dips when flying forward; eased so it never snaps.
	local targetTilt = -forward * MAX_TILT
	tilt += (targetTilt - tilt) * math.min(1, TILT_SPEED * dt)
	attitude.CFrame = heading * CFrame.Angles(tilt, 0, 0)

	local target = heading.LookVector * forward * MAX_SPEED + Vector3.yAxis * climb * MAX_CLIMB
	velocity = velocity:Lerp(target, math.min(1, ACCEL * dt))
	move.VectorVelocity = velocity

	if rotor then
		rotor.AngularVelocity = 30 + math.abs(climb) * 10   -- radians per second, visual only
	end
end)
```

Why it is built this way:
- `LinearVelocity` with no input holds a **hover** (target velocity zero), which is how most arcade helicopters feel.
- `AlignOrientation` in one-attachment mode takes a target `CFrame`; yaw and tilt are just angles we build.
- A negative X angle tips the nose **down** (positive would raise it).
- `MaxForce` caps how hard the helicopter can push, so it still bumps off buildings instead of plowing through.

## Upgrades
- **Bank into turns:** add a roll angle of `turn * math.rad(10)` to the attitude.
- **Wind and drift:** let a small amount of `Workspace.GlobalWind` into the target velocity, or try built-in air ([[Aerodynamic Fluid Forces Beta - Planes, Gliders and Wind]]).
- **Landing:** below a few studs from the ground, clamp descent speed and level the tilt.
- **Gamepad / mobile:** swap `axis()` for a `Direction3D` input action ([[Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Hover, Boat and Flying Vehicles with Mover Constraints]] · [[Scripted Airplane Flight Model - Lift, Drag and Thrust]] · [[Mover constraints]] · [[Vehicle Enter - Exit, Seats and Camera]]

<!-- TDOD_GRAPH_END -->
