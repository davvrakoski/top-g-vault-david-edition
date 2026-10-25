---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/raycast-suspension"
title: "Raycast Suspension Car - Spring-Damper Pattern and Pitfalls"
tags: [roblox, community, vehicles, raycast, suspension, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/car-suspension-scripted/92283
  - https://devforum.roblox.com/t/help-with-raycast-suspension/2271189
  - https://devforum.roblox.com/t/solvedproblem-with-raycasting-car-in-low-fps/3042743
  - https://devforum.roblox.com/t/raycast-suspension-flings/1691989
  - https://create.roblox.com/docs/physics/adaptive-timestepping
---
# Raycast Suspension Car - Spring-Damper Pattern and Pitfalls

A raycast car is **one rigid body** with no physical wheels. Each corner casts a ray down; if it hits, a spring-damper force pushes the body up. The visible wheels are just moved to where the ray hit. Many DevForum threads describe this; this note collects the pattern and the traps.

## The pattern (as the community describes it)
1. Put an Attachment at each wheel's top mount on the body.
2. Each step, raycast down from it (ignore the car itself).
3. Spring force = stiffness x compression. Damper force = damping x compression speed.
4. Apply the force up at that corner (not at the center of mass) so the body pitches and rolls.
5. Move the visual wheel to the hit point (wheels have `CanCollide` off).
6. Script **grip** yourself: push sideways against slide velocity at each grounded wheel. The "Car Suspension (Scripted)" thread is explicit that friction must be coded by you.

## Original Luau: suspension only
LocalScript for the **driver** (the driver's client must own the car, see [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]). Attachments named `Wheel...` sit on the body's `PrimaryPart`.

```lua
--!strict
local RunService = game:GetService("RunService")

local car = workspace:WaitForChild("RaycastCar") :: Model
local body = car.PrimaryPart :: BasePart

local REST_LENGTH = 2.5     -- studs from mount to ground when fully extended
local SAG = 0.5             -- fraction of REST_LENGTH compressed at rest
local DAMPING_RATIO = 0.4   -- 0.3 to 0.7 feels good; 1 = no bounce at all

local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude
params.FilterDescendantsInstances = { car }

type Wheel = { mount: Attachment, force: VectorForce, lastLength: number }
local wheels: { Wheel } = {}

for _, child in body:GetChildren() do
	if child:IsA("Attachment") and string.sub(child.Name, 1, 5) == "Wheel" then
		local vf = Instance.new("VectorForce")
		vf.Attachment0 = child
		vf.RelativeTo = Enum.ActuatorRelativeTo.World
		vf.ApplyAtCenterOfMass = false   -- push at the corner, so the body can roll
		vf.Force = Vector3.zero
		vf.Parent = child
		table.insert(wheels, { mount = child, force = vf, lastLength = REST_LENGTH })
	end
end

-- Size the spring from the car's own weight, so it works at any gravity or mass.
local massPerWheel = body.AssemblyMass / #wheels
local stiffness = massPerWheel * workspace.Gravity / (REST_LENGTH * SAG)
local damping = 2 * DAMPING_RATIO * math.sqrt(stiffness * massPerWheel)

RunService.PreSimulation:Connect(function(dt)
	local up = body.CFrame.UpVector
	for _, w in wheels do
		local hit = workspace:Raycast(w.mount.WorldPosition, -up * REST_LENGTH, params)
		if hit then
			local length = hit.Distance
			local compression = REST_LENGTH - length
			local compressSpeed = (w.lastLength - length) / dt   -- + when squashing
			local push = stiffness * compression + damping * compressSpeed
			w.force.Force = up * math.max(push, 0)   -- a spring never pulls down
			w.lastLength = length
		else
			w.force.Force = Vector3.zero
			w.lastLength = REST_LENGTH
		end
	end
end)
```

Why these choices:
- Stiffness from weight means the car rests at `SAG` compression whatever its mass, so rescaling does not break it (the classic constraint-car scaling problem).
- `math.max(push, 0)` stops the damper yanking the car to the ground when a wheel extends fast, a common cause of sticky or flinging cars.
- `PreSimulation` runs before physics each frame; it is the event replies recommend over `while true` loops.

## Pitfall 1: low FPS bounce
In "Problem With Raycasting Car In Low FPS" (2024) a reply explains the cause: physics steps at 240 Hz but your script runs once per rendered frame, so at 20 FPS the force stays frozen for many physics steps and the car bounces. The same reply says big games share the issue. Options from the thread:
- Use real **SpringConstraints** for suspension (the solver updates them every step) and keep raycasts only for wheel visuals.
- Write your own sub-stepping (hard, especially for rotation).
- Practical extras: raise `DAMPING_RATIO` on low-end devices, and clamp `push` to a few times the car's weight.

## Pitfall 2: flinging
A 2022 thread shows a flinging raycast car whose script uses a large fixed damper constant (5000) and no force clamp; the thread never confirmed a cause. Size damping from mass like above, clamp the force, and make sure the ray filter excludes **every** part of the car, including the driver's character.

## Pitfall 3: the car sleeps or ignores ownership
A single body with forces is still subject to the [[Sleep system]] and [[Network ownership]]. If the server owns it, client forces do nothing visible.

## When not to use raycast
If you need real wheel contact (rock crawling, physical wheels hitting curbs) use a constraint car: [[Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Arcade Handling and Drifting Without Fighting Physics]] · [[Choosing a Roblox Car Chassis - VehicleSeat, Constraint, Raycast or Server Authority]] · [[Springs and Damping for Game Feel]] · [[Vehicle Suspension, Chassis and Grip]]

<!-- TDOD_GRAPH_END -->
