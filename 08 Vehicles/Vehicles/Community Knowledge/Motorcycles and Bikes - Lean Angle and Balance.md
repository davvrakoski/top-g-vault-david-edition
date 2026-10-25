---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Motorcycles and Bikes - Lean Angle and Balance"
tags: [roblox, community-knowledge, vehicles, motorcycle, bike, alignorientation]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/balancing-a-two-wheeled-vehicle/3884033
  - https://devforum.roblox.com/t/motorcycle-keeps-falling-over/1714442
  - https://devforum.roblox.com/t/best-way-to-do-bike-physics/578284
  - https://devforum.roblox.com/t/how-to-make-leaning-and-fix-the-suspension-on-the-motorcycle/3882269
  - https://en.wikipedia.org/wiki/Bicycle_and_motorcycle_dynamics
  - https://create.roblox.com/docs/reference/engine/classes/AlignOrientation
---
# Motorcycles and Bikes - Lean Angle and Balance

Two-wheelers are the vehicle most Roblox devs give up on: the physics bike falls over at rest, wobbles at speed and flips on ramps. Real bikes balance through steering geometry and gyroscopic effects that are hard to reproduce in a game solver. The approach that DevForum threads converge on is to **fake balance with an orientation constraint** and compute the lean angle yourself, so the bike looks physical but cannot fall over unless you let it.

## The physics you are faking
For a steady turn, a bike leans so that gravity and the centripetal force balance. The standard result (see "Bicycle and motorcycle dynamics") is:

```
leanAngle = atan( v^2 / (g * r) )
```
with speed `v`, gravity `g` and turn radius `r`. On Roblox use `workspace.Gravity` (default 196.2 studs/s²) and studs for `v` and `r`. Equivalent, if you know the yaw rate `w` (rad/s) of the bike: `lean = atan(v * w / g)`. The yaw-rate version is easier because you can read it from `AssemblyAngularVelocity`.

## Setup
- Chassis part with **two wheel hinges** (rear driven Motor, front free or Servo for steering visuals).
- Optional small outrigger collision boxes near the footpegs with `CanCollide = false` (only enable for crash detection).
- One `AlignOrientation` in `OneAttachment` mode, `AlignType = AllAxes`, that you drive every frame with a goal `CFrame`.

```lua
-- driver client, bike owned by the driver
local MAX_LEAN = math.rad(45)
local align: AlignOrientation = bike.Chassis.Balance
align.Mode = Enum.OrientationAlignmentMode.OneAttachment
align.AlignType = Enum.AlignType.AllAxes
align.MaxTorque = bike.Chassis.AssemblyMass * 400
align.Responsiveness = 25

RunService.Heartbeat:Connect(function(dt)
	local root = bike.Chassis
	local look = root.CFrame.LookVector
	local flatLook = Vector3.new(look.X, 0, look.Z).Unit
	local v = root.AssemblyLinearVelocity:Dot(flatLook)
	local yawRate = root.AssemblyAngularVelocity.Y

	-- steering input turns the bike: add yaw to the goal
	local yawStep = -seat.SteerFloat * math.clamp(math.abs(v) / 40, 0.2, 1.5) * dt * 2
	local lean = math.clamp(math.atan(v * yawRate / workspace.Gravity), -MAX_LEAN, MAX_LEAN)

	local heading = CFrame.lookAt(Vector3.zero, flatLook) * CFrame.Angles(0, yawStep, 0)
	align.CFrame = heading * CFrame.Angles(0, 0, lean)
end)
```
Notes: the goal keeps pitch at zero, which is what stops ramp flips; release pitch (set it from the ground normal) only if you want wheelies. Check the lean sign on your model; flip it if the bike leans out of turns.

## Turning itself
Lean is cosmetic plus stability; the actual turning comes from either:
1. a `Torque` / `AngularVelocity` yaw driven by steer input (arcade, recommended), or
2. a steering servo on the front wheel with the align only controlling roll and pitch (more physical, harder).

## Balance at low speed and when stopped
- Below ~5 studs/s blend lean to 0 and keep the bike upright (a "kickstand" mode). At a full stop many games tilt the bike 5-8 degrees to one side for looks.
- Raise align torque when airborne (no wheel contact) so the bike lands on its wheels, as DevForum replies recommend for dirt bikes.

## Crashes
Let it fall on purpose: if the chassis hits something above a speed threshold, set `align.Enabled = false`, ragdoll the rider and let physics take over. Re-enable when respawning.

## Common mistakes
- Using the deprecated `BodyGyro` from old tutorials; `AlignOrientation` replaces it.
- Making the constraint rigid (`RigidityEnabled`), which turns every bump into a huge torque spike.
- Computing lean from steer input only; it looks wrong when sliding or turning from collisions.

## Related
[[Vehicles - Hub]] · [[Center of Mass, Anti-Flip and Self-Righting]] · [[Hover, Boat and Flying Vehicles with Mover Constraints]] · [[AlignOrientation]]
