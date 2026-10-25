---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Amphibious Vehicles - Land to Water Mode Handoff"
tags: [roblox, community-knowledge, vehicles, amphibious, boats, state-machine]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BuoyancySensor
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
  - https://create.roblox.com/docs/reference/engine/classes/LinearVelocity
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastResult
---
# Ride - Amphibious Vehicles - Land to Water Mode Handoff

Island maps, flood survival games and military sandboxes love vehicles that drive straight into the sea and keep going: amphibious trucks, duck tours, hovercraft, landing craft. The trick is not the boat part or the car part (both have notes already) but the **handoff**: deciding which mode is active and blending between them so the vehicle does not stall at the shoreline or launch into the air.

## Two drive systems on one chassis
- **Land**: wheel `HingeConstraint`s in Motor mode driven by the `VehicleSeat` (or your own script).
- **Water**: a `LinearVelocity` (Line mode along the hull forward axis) for propeller thrust and an `AngularVelocity` for rudder yaw, both starting with `MaxForce`/`MaxTorque` 0.
- One `BuoyancySensor` in the hull bottom part, plus a downward raycast from each axle to know if wheels touch ground.

## Mode decision
```lua
local function decideMode(hullSensor, wheelsGrounded)
	if wheelsGrounded >= 2 then return "Land" end
	if hullSensor.TouchingSurface or hullSensor.FullySubmerged then return "Water" end
	return "Air" -- jump or fall: no drive at all
end
```
Count `wheelsGrounded` from raycasts of about wheel radius + 0.5 studs. Add a short hysteresis (mode must hold for 0.25 s before switching) so waves near the beach do not flip modes every frame.

## Blending, not switching
Ramp the two systems over about 0.5 s with a `blend` value from 0 (land) to 1 (water):
- Wheel `MotorMaxTorque = landTorque * (1 - blend)`.
- Propeller `MaxForce = waterForce * blend`.
- Steering moves from wheel steer hinge to rudder yaw the same way.

On a ramp into water both are partly active, which pushes the vehicle through the shoreline instead of stalling where wheels lose grip but the prop has not taken over.

## Floating correctly
- Terrain water floats parts by density. A heavy truck sinks; either give the hull a large, low-density, invisible float part welded inside it (whether a `CanCollide = false` part still gets water buoyancy is unverified, so test it), or add a scripted upward `VectorForce` while in water mode, which is fully under your control.
- Keep the center of mass low so it does not roll when turning in water.
- Wheels in water add drag; let them spin freely (motor torque near 0) in water mode.

## Feel and feedback
- Water entry: big splash particle burst, camera dip, and a short speed loss proportional to entry speed.
- HUD icon showing the current mode (wheel or propeller).
- Engine sound switches from road to a deeper, muffled prop loop; crossfade with the blend value.
- Exiting water: wheels need a little extra torque on wet sand; a 1-2 s "climb boost" makes beach exits reliable.

## Hovercraft variant
Hovercraft skip the handoff: a hover force from raycasts works over land and water alike (the raycast hits terrain water surface if you include water in `RaycastParams.IgnoreWater = false`). Only the friction changes: lower lateral grip on water.

## Pitfalls
- Mode flicker at the waterline: always use hysteresis.
- `BuoyancySensor` reads terrain water only; part oceans need your own surface height check.
- Network ownership must stay with the driver through the handoff; do not rebuild constraints, just change their forces.

## Related
[[Vehicles - Hub]] - [[Hover, Boat and Flying Vehicles with Mover Constraints]] - [[Ride - Boat Planing, Hull Trim and Speed-Driven Wakes]] - [[Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat]]
