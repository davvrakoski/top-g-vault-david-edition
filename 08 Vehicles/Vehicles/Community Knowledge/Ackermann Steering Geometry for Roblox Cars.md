---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ackermann Steering Geometry for Roblox Cars"
tags: [roblox, community-knowledge, vehicles, steering, math]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://en.wikipedia.org/wiki/Ackermann_steering_geometry
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
---
# Ackermann Steering Geometry for Roblox Cars

When a car turns, the inner front wheel follows a tighter circle than the outer one, so it must be turned **more**. If both front wheels get the same `TargetAngle`, one of them is always being dragged sideways. On Roblox that shows up as tyre scrub, speed loss in corners, front-end shudder at low speed and cars that "hop" during tight turns. Ackermann geometry fixes it with a few lines of trigonometry.

## The idea
All four wheels should roll around one common turn centre that sits on the line of the rear axle. For a car with:
- `L` = wheelbase (front axle to rear axle, studs)
- `T` = track width (distance between left and right front wheel pivots, studs)
- `R` = turn radius measured to the middle of the rear axle

the two front angles are:

```
inner = atan( L / (R - T/2) )
outer = atan( L / (R + T/2) )
```

You usually start from the driver's steer input as a "centre" angle and work back to R:

```lua
local L, T = 9, 6 -- studs, measure your own chassis
local MAX_CENTRE = math.rad(30)

local function ackermann(steer: number): (number, number)
	-- steer in -1..1, positive = right
	if math.abs(steer) < 1e-3 then
		return 0, 0
	end
	local centre = steer * MAX_CENTRE
	local R = L / math.tan(math.abs(centre))
	local inner = math.atan(L / (R - T / 2))
	local outer = math.atan(L / (R + T / 2))
	local sign = if steer > 0 then 1 else -1
	-- turning right: right wheel is inner
	local right = math.deg(if steer > 0 then inner else outer) * sign
	local left = math.deg(if steer > 0 then outer else inner) * sign
	return left, right
end

RunService.Heartbeat:Connect(function()
	local left, right = ackermann(seat.SteerFloat)
	frontLeftHinge.TargetAngle = left
	frontRightHinge.TargetAngle = right
end)
```

Check the sign convention of your hinges first: depending on how the attachments face, a positive `TargetAngle` may turn the wheel left. Flip the sign per wheel rather than rewriting the math.

## Numbers to sanity-check
With L = 9 and T = 6 at a 30 degree centre angle, R is about 15.6 studs, the inner wheel turns about 36 degrees and the outer about 26. If your inner and outer angles differ by more than ~15 degrees at full lock, the car is too wide for its wheelbase or the max angle is too high.

## Arcade tweaks
- **Partial Ackermann.** Real race cars often use less than 100 percent. Blend: `angle = lerp(centre, ackermannAngle, 0.6)`. It feels slightly more stable at speed.
- **Speed-sensitive lock.** Reduce `MAX_CENTRE` as speed rises; Ackermann matters most at parking speed, where full lock is used.
- **Rear steer.** For long trucks or buses, add small opposite rear angles at low speed to tighten the circle.

## When you can skip it
Raycast or force-based cars that never use physical front wheels (see [[Arcade Handling and Drifting Without Fighting Physics]]) do not need Ackermann for physics, but you can still use the angles for the **visual** wheels so the car looks right in a turn.

## Related
[[Vehicles - Hub]] · [[HingeConstraint Motors and Servos for Wheels and Steering]] · [[Vehicle Suspension, Chassis and Grip]] · [[Drift and Handling Tuning - Community Tips for Constraint Cars]]
