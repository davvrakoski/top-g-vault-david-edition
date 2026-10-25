---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/scripted-airplane-flight-model"
title: "Scripted Airplane Flight Model - Lift, Drag and Thrust"
tags: [roblox, community, vehicles, planes, flight, physics, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/aerodynamic-physics-for-airplanes/3412855
  - https://create.roblox.com/docs/physics/constraints/vector-force
  - https://create.roblox.com/docs/physics/constraints/angular-velocity
---
# Scripted Airplane Flight Model - Lift, Drag and Thrust

If you do not want the beta built-in air model ([[Aerodynamic Fluid Forces Beta - Planes, Gliders and Wind]]), you compute the forces yourself. The 2025 DevForum thread "Aerodynamic Physics for Airplanes" is a good map of the approaches; this note distills it and gives an original, small model.

## What the thread taught
- **The starting bug:** the asker toggled legacy `BodyVelocity` / `BodyGyro` torque by speed and got a stall-recover-stall oscillation. Switching forces on and off is the problem; forces should change smoothly with speed and angle.
- **Force model (one reply):** sum lift, drag, thrust and side force; lift and drag are a coefficient x dynamic pressure x reference area; coefficients come from tables or stability derivatives. Apply with `ApplyImpulse` / `ApplyAngularImpulse`, or keep it simple and use Roblox's built-in aerodynamics.
- **Stability (another reply):** coarse time steps make aero models unstable; it suggested about 1/240 s steps and warned the model must conserve momentum.
- **Simple lift (accepted by the asker):** a lift curve from angle of attack, clamped, measured only in the pitch plane, with a tuning multiplier.
- **Simple drag (another reply):** a `VectorForce` opposite velocity scaled by speed squared gives a natural top speed.
- **The drag blow-up:** the asker's drag exploded because it was applied the wrong way (a feedback loop) and the angle of attack mixed pitch and yaw. Always apply drag along **minus velocity**.

## The model below
| Force | Formula | Direction |
|---|---|---|
| Thrust | throttle x max thrust | Nose (`LookVector`) |
| Lift | CL(aoa) x q | Perpendicular to velocity, in the plane's symmetry plane |
| Drag | (CD0 + k x CL²) x q | Opposite velocity |
| q (dynamic pressure) | 0.5 x K x speed² | K folds air density and wing area into one tuning number |

K is solved so that **lift equals weight at your chosen cruise speed and trim angle**. That makes the plane fly correctly at default Roblox gravity without guessing.

## Original Luau
LocalScript for the pilot, after the server gives the pilot network ownership. The plane's `PrimaryPart` has an Attachment `Center` at the center of mass.

```lua
--!strict
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local plane = workspace:WaitForChild("Plane") :: Model
local body = plane.PrimaryPart :: BasePart
local center = body:WaitForChild("Center") :: Attachment

local mass = body.AssemblyMass
local weight = mass * workspace.Gravity

-- Tuning
local CRUISE = 150                 -- studs/s (about 150 km/h)
local TRIM_AOA = math.rad(4)       -- nose-up angle that holds level flight at CRUISE
local CL_SLOPE = 5.5               -- lift per radian of angle of attack
local STALL_AOA = math.rad(16)
local CD0 = 0.03                   -- drag with zero lift
local INDUCED = 0.06               -- extra drag from making lift
local MAX_THRUST = weight * 0.45
local K = weight / (0.5 * CRUISE * CRUISE * CL_SLOPE * TRIM_AOA)
local PITCH_RATE, YAW_RATE, ROLL_RATE = 1.2, 0.6, 2.0   -- rad/s at full stick

local aero = Instance.new("VectorForce")
aero.Attachment0 = center
aero.RelativeTo = Enum.ActuatorRelativeTo.World
aero.ApplyAtCenterOfMass = true
aero.Parent = body

-- Rate control: the plane turns at the commanded rate and holds attitude otherwise.
local rates = Instance.new("AngularVelocity")
rates.Attachment0 = center
rates.RelativeTo = Enum.ActuatorRelativeTo.Attachment0
rates.MaxTorque = mass * 400
rates.AngularVelocity = Vector3.zero
rates.Parent = body

local function axis(positive: Enum.KeyCode, negative: Enum.KeyCode): number
	local p = if UserInputService:IsKeyDown(positive) then 1 else 0
	local n = if UserInputService:IsKeyDown(negative) then 1 else 0
	return p - n
end

local function liftCoefficient(aoa: number): number
	if math.abs(aoa) <= STALL_AOA then
		return CL_SLOPE * aoa
	end
	-- Past the stall the lift fades out instead of growing forever.
	local peak = CL_SLOPE * STALL_AOA * math.sign(aoa)
	return peak * math.max(0, 1 - (math.abs(aoa) - STALL_AOA) / STALL_AOA)
end

local throttle = 0

RunService.PreSimulation:Connect(function(dt)
	throttle = math.clamp(throttle + axis(Enum.KeyCode.LeftShift, Enum.KeyCode.LeftControl) * 0.5 * dt, 0, 1)
	local pitch = axis(Enum.KeyCode.S, Enum.KeyCode.W)   -- S = nose up (pull back)
	local yaw = axis(Enum.KeyCode.Q, Enum.KeyCode.E)     -- Q = nose left
	local roll = axis(Enum.KeyCode.A, Enum.KeyCode.D)    -- A = roll left

	local cf = body.CFrame
	local velocity = body.AssemblyLinearVelocity
	local speed = velocity.Magnitude
	local force = cf.LookVector * MAX_THRUST * throttle

	if speed > 1 then
		local localVel = cf:VectorToObjectSpace(velocity)
		local aoa = math.atan2(-localVel.Y, -localVel.Z)   -- pitch plane only
		local q = 0.5 * K * speed * speed
		local cl = liftCoefficient(aoa)
		local dir = velocity / speed
		local liftDir = cf.RightVector:Cross(dir)
		if liftDir.Magnitude > 1e-3 then
			force += liftDir.Unit * cl * q
		end
		force -= dir * (CD0 + INDUCED * cl * cl) * q
	end
	aero.Force = force

	-- Turn rates grow with airspeed, so a plane on the runway cannot spin in place.
	local authority = math.clamp(speed / CRUISE, 0, 1)
	rates.AngularVelocity = Vector3.new(pitch * PITCH_RATE, yaw * YAW_RATE, roll * ROLL_RATE) * authority
end)
```

How the axes work: `AngularVelocity` relative to its attachment uses the part's own axes. Positive X turns the nose up, positive Y turns it left, positive Z rolls the left wing down.

## Make it fun, not just correct
- **Banked turns:** add a small yaw rate proportional to bank angle so rolling into a turn actually turns the plane.
- **Stall warning:** when `aoa` nears `STALL_AOA`, shake the camera and play a horn. Never stall a mobile player silently.
- **Auto-level** when no input on mobile: drive roll back toward zero.
- **Ground handling:** wheels on hinges, or skip physics on the runway and blend into flight above a speed.
- **Security:** a pilot-owned plane can fly anywhere; add server checks like [[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]] with a higher speed limit.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Hover, Boat and Flying Vehicles with Mover Constraints]] · [[Helicopter Controls - Lift, Tilt and Yaw With Movers]] · [[Mover constraints]] · [[Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals]]

<!-- TDOD_GRAPH_END -->
