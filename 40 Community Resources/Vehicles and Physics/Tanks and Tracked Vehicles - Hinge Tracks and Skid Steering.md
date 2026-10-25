---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/tanks-tracked-vehicles"
title: "Tanks and Tracked Vehicles - Hinge Tracks and Skid Steering"
tags: [roblox, community, vehicles, tanks, tracks, hinge, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/tank-chassis-constraint-chassis/59923
  - https://devforum.roblox.com/t/making-caterpillar-tracks/1564657
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
  - https://create.roblox.com/docs/physics/adaptive-timestepping
---
# Tanks and Tracked Vehicles - Hinge Tracks and Skid Steering

## Two ways to fake tracks
| Approach | How | Cost | Looks |
|---|---|---|---|
| **Wheels + visual tracks** | Hidden road wheels on HingeConstraint motors do the driving; the track is a textured mesh or Beam whose texture scrolls with speed | Cheap | Good from gameplay distance |
| **Physical link tracks** | Each link joined to the next with HingeConstraints, wrapped around driven wheels | Expensive (dozens of constraints per side) | Best up close, can tangle |

DevForum builders who tried rods or ropes for links reported jitter and tangling; hinges between links are the common choice. One builder's tested numbers: wheel friction about **2**, track link friction about **1.3** (so the tank can still turn), and links that do not collide with each other via collision groups, because the hinges sit inside the link meshes. Another suggestion for a cheap look: a few parts and Beams whose texture speed follows the tank's speed.

## Skid steering (from the 2017 "Tank Chassis =/= Constraint Chassis" thread)
A reply laid out the method: drive every wheel's HingeConstraint motor from the seat input. Forward and back spin all wheels the same way; turning spins the left and right sides in opposite directions. `MotorMaxTorque` and `MotorMaxAcceleration` need tuning, and the script runs on the driver's client for responsiveness. Later versions read the VehicleSeat's speed settings and supported any number of wheels. The thread's author found split-side turning awkward on a heavy vehicle, so expect tuning time.

## Original Luau: skid steer from a VehicleSeat
Put the drive wheels' hinges in two folders, `LeftHinges` and `RightHinges`, all set to `ActuatorType = Motor`. Run on the driver's client after they own the vehicle.

```lua
--!strict
local RunService = game:GetService("RunService")

local tank = workspace:WaitForChild("Tank") :: Model
local seat = tank:WaitForChild("DriverSeat") :: VehicleSeat
local left = (tank:WaitForChild("LeftHinges") :: Folder):GetChildren()
local right = (tank:WaitForChild("RightHinges") :: Folder):GetChildren()

local WHEEL_RADIUS = 1.5        -- studs
local TURN_SHARE = 0.6          -- how much of top speed goes into turning
local TORQUE = 60000            -- tune to the tank's mass

local function wheelRate(studsPerSecond: number): number
	return studsPerSecond / WHEEL_RADIUS   -- HingeConstraint.AngularVelocity is radians per second
end

local function drive(hinges: { Instance }, rate: number)
	for _, h in hinges do
		local hinge = h :: HingeConstraint
		hinge.MotorMaxTorque = TORQUE
		hinge.AngularVelocity = rate
	end
end

RunService.PreSimulation:Connect(function()
	local throttle = seat.ThrottleFloat     -- -1..1
	local steer = seat.SteerFloat           -- -1..1, + is right
	local topSpeed = seat.MaxSpeed

	local leftSpeed = math.clamp(throttle + steer * TURN_SHARE, -1, 1) * topSpeed
	local rightSpeed = math.clamp(throttle - steer * TURN_SHARE, -1, 1) * topSpeed

	-- If a side spins backwards, its hinge attachments face the other way: flip the sign there.
	drive(left, wheelRate(leftSpeed))
	drive(right, -wheelRate(rightSpeed))
end)
```

Common mistakes:
- **Degrees vs radians.** HingeConstraint `AngularVelocity` is radians per second. A turret thread on the DevForum spun wildly from passing degrees.
- **Mirrored attachments.** Left and right hinges usually point opposite ways, hence the minus sign on one side. Test each side alone.
- **Wheels not connected to the seat.** The VehicleSeat only auto-drives hinges it is directly or rigidly connected to; with your own script that rule no longer matters.

## Physics settings
- The adaptive timestepping docs name tank-like complex mechanisms as a case for **Fixed** 240 Hz stepping. Physical link tracks especially need it.
- Count your constraints: two tracks of 40 links is 80+ hinges per tank. See [[Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Hinge]] · [[Choosing a Roblox Car Chassis - VehicleSeat, Constraint, Raycast or Server Authority]] · [[Vehicle Damage, Repair and Failure States]] · [[Adaptive timestepping]]

<!-- TDOD_GRAPH_END -->
