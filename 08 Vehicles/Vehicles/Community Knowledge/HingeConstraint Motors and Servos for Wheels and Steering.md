---
area: "08 Vehicles"
cluster: "Vehicles"
title: "HingeConstraint Motors and Servos for Wheels and Steering"
tags: [roblox, community-knowledge, vehicles, constraints, hingeconstraint, steering]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
  - https://create.roblox.com/docs/reference/engine/classes/CylindricalConstraint
  - https://create.roblox.com/docs/reference/engine/enums/ActuatorType
  - https://create.roblox.com/docs/physics/mechanical-constraints
  - https://create.roblox.com/docs/physics/units
---
# HingeConstraint Motors and Servos for Wheels and Steering

Almost every physics car on Roblox is two kinds of actuator: **motors** that spin the drive wheels and **servos** that turn the steering knuckles to an angle. Both live on `HingeConstraint` (and on the angular half of `CylindricalConstraint`). Most "car is sluggish / car flips / steering wobbles" problems come from leaving their limits at defaults or from mixing up units.

## ActuatorType in one table

| `ActuatorType` | Goal property | Limited by | Use for |
|---|---|---|---|
| `None` | nothing | - | Free-spinning wheels (trailers, undriven axles) |
| `Motor` | `AngularVelocity` (rad/s) | `MotorMaxTorque`, `MotorMaxAcceleration` (rad/s²) | Drive wheels |
| `Servo` | `TargetAngle` (degrees) | `AngularSpeed` (rad/s), `ServoMaxTorque`, `AngularResponsiveness` | Steering, turrets, doors |

On `CylindricalConstraint` the angular versions are named `AngularActuatorType`, `AngularVelocity`, `MotorMaxAngularAcceleration`, `MotorMaxTorque`, `TargetAngle`, `AngularSpeed`, `AngularResponsiveness`, `ServoMaxTorque`. Note the mix of units: **servo targets are in degrees, speeds are in radians per second.**

## Drive wheels (Motor)
Wheel angular velocity for a target ground speed is `v / r`:

```lua
local function wheelOmega(speedStudsPerSec: number, wheelRadius: number): number
	return speedStudsPerSec / wheelRadius -- rad/s
end
-- 80 studs/s on a 1.5-stud radius wheel = about 53 rad/s
```

Tuning rules that hold up:
1. Set `MotorMaxTorque` from the car's mass. Torque units are mass x studs² / s². Start with `assemblyMass * gravity * wheelRadius` (enough to climb a steep slope) and adjust.
2. Use `MotorMaxAcceleration` as your **traction control**. A lower value stops wheelspin at launch; `math.huge` gives instant spin-up and burnouts.
3. For braking, set `AngularVelocity = 0` and keep torque high; for coasting, drop `MotorMaxTorque` to a small value so the wheel rolls freely instead of acting as a brake.
4. Remember the sign: a left wheel and a right wheel facing opposite ways need opposite `AngularVelocity` signs. Check by driving slowly with Constraint Details visible.

## Steering (Servo)
```lua
-- driver client
local MAX_STEER = 30 -- degrees
local function applySteer(steerInput: number, speed: number)
	local scale = math.clamp(1 - speed / 200, 0.35, 1) -- less steer at speed
	local angle = steerInput * MAX_STEER * scale
	frontLeft.TargetAngle = angle
	frontRight.TargetAngle = angle
end
```
- `AngularSpeed` around 4-8 rad/s feels responsive without snapping.
- `ServoMaxTorque` must beat the tyre's scrub force. Too low and the wheels never reach the target under load; too high on a light car and the knuckle buzzes.
- `AngularResponsiveness` trades sharpness for damping. Lower it if steering oscillates around the target.
- Enable `LimitsEnabled` with `LowerAngle` / `UpperAngle` a few degrees beyond `MAX_STEER` as a hard stop.
- Give each front wheel its own angle for real geometry: [[Ackermann Steering Geometry for Roblox Cars]].

## Pitfalls
- **Wheel attached to an anchored part** will not be locally simulated for the player (documented for CylindricalConstraint). Never anchor the chassis while testing driving.
- **Huge torque on light wheels** makes the solver unstable; give wheels sensible density instead of `Massless`.
- **Setting properties from the server** while the client owns the car makes the change arrive late. Drive actuators on the network owner.

## Related
[[Vehicles - Hub]] · [[Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat]] · [[Vehicle Suspension, Chassis and Grip]] · [[Tanks and Tracked Vehicles - Hinge Tracks and Skid Steering]] · [[HingeConstraint]]
