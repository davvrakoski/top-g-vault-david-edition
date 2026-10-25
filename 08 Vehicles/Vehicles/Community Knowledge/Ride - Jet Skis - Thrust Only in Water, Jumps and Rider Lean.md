---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Jet Skis - Thrust Only in Water, Jumps and Rider Lean"
tags: [roblox, community-knowledge, vehicles, jetski, water, movers]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BuoyancySensor
  - https://create.roblox.com/docs/reference/engine/classes/LinearVelocity
  - https://create.roblox.com/docs/reference/engine/classes/AlignOrientation
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
---
# Ride - Jet Skis - Thrust Only in Water, Jumps and Rider Lean

A jet ski is small, twitchy and fun because it reacts to waves and jumps off them. The big rule that separates a good one from a flying sofa: **a water jet only pushes while its intake is in water**. If thrust keeps working in the air, players fly off every wave and steer mid-air. Get that one rule right and the rest is tuning.

## Parts layout
- Hull part (root, holds the movers), a `VehicleSeat` for the rider, optional second `Seat` behind.
- An invisible small `Part` at the back underside called `Intake`, welded to the hull, with a `BuoyancySensor` inside.
- Hull also gets its own `BuoyancySensor` for "on the water" checks.

## Thrust gated by the intake
```lua
local seat, hull = model.VehicleSeat, model.Hull
local intake = model.Intake.BuoyancySensor
local lv = hull.LinearVelocity -- Line mode, RelativeTo Attachment0
RunService.Heartbeat:Connect(function()
	local wet = intake.TouchingSurface or intake.FullySubmerged
	local throttle = wet and seat.ThrottleFloat or 0
	lv.LineVelocity = throttle * MAX_SPEED
	lv.MaxForce = wet and THRUST_FORCE or 0
end)
```
Run this where the rider owns physics (the client of the driver), and set `MaxForce` to 0 in the air rather than disabling the constraint so it ramps back in cleanly.

Use `VelocityConstraintMode = Line` along the hull's forward axis. That leaves sideways sliding to buoyancy and water drag, which gives the drifty feel.

## Steering
- Real jet skis steer by pointing the jet. No thrust, almost no steering. Scale yaw rate by throttle: `yaw = seat.SteerFloat * TURN * (0.3 + 0.7 * throttle)`.
- Apply yaw with an `AngularVelocity` on the world Y axis with a modest `MaxTorque`, again zero while airborne.

## Rider lean and posture
- Bank the hull into turns with `AlignOrientation` (roll target = steer * 20 degrees, more at speed). Keep `Responsiveness` low (10-20) so waves can still move it.
- Lean back on landings: when the intake goes from dry to wet, briefly nose-up the target (5 degrees for 0.3 s) to sell the impact.
- Play a separate rider animation for "standing" at high speed if you have one.

## Jumps and tricks
- Detect air time: both sensors dry for more than 0.25 s. Count hang time and rotation for a stunt score.
- Clamp air rotation by keeping `AlignOrientation` on with a weak torque; it stops endless flips unless you want a trick mode.
- On landing, compare hull up vector with world up. More than 70 degrees off = wipeout: eject the rider with `Humanoid.Sit = false`, give a small push, respawn the ski upright after 3 s.

## Pitfalls
- Intake placed too high: the ski loses thrust in small waves. Put it at the lowest point, slightly behind center.
- Big `MaxTorque` on orientation makes it feel like a rail car. Let buoyancy win.
- Sea level differences on part-based oceans: `BuoyancySensor` only reads terrain water.

## Checklist
- [ ] No thrust or steering in the air
- [ ] Turns bank the hull, landings dip the nose
- [ ] Wipeout and respawn work at any angle
- [ ] Passenger seat does not change handling much (check `AssemblyMass`)

## Related
[[Vehicles - Hub]] - [[Hover, Boat and Flying Vehicles with Mover Constraints]] - [[Ride - Boat Planing, Hull Trim and Speed-Driven Wakes]] - [[Motorcycles and Bikes - Lean Angle and Balance]]
