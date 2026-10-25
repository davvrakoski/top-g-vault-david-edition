---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Bicycles - Pedal Cadence, Stamina and IK Feet on Pedals"
tags: [roblox, community-knowledge, vehicles, bicycle, ik, animation]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/animation/inverse-kinematics
  - https://create.roblox.com/docs/reference/engine/classes/IKControl
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
---
# Ride - Bicycles - Pedal Cadence, Stamina and IK Feet on Pedals

A bicycle is a motorcycle without an engine, so the existing lean/balance note covers how it turns. What makes a bike a *bike* is that the rider is the engine: legs spin the pedals, speed costs stamina, and the feet must visibly stay on the pedals. This note covers those three parts.

## Rider-powered speed
Model a cadence (pedal revolutions per minute) instead of an engine RPM:

```lua
-- per frame, on the rider's client
local input = seat.ThrottleFloat -- W/S or trigger
cadence += (input * 90 - cadence) * math.min(1, dt * 2) -- target 90 rpm
local wheelSpeed = cadence / 60 * GEAR_RATIOS[gear] * WHEEL_CIRCUMFERENCE
```
- Gears: 3 to 7 ratios. Low gear = fast acceleration, low top speed. Up a gear with E, down with Q, or automatic by speed.
- Drive the rear wheel `HingeConstraint` (Motor) with `AngularVelocity = wheelSpeed / radius` and a modest `MotorMaxTorque` so hills slow you down.
- Coasting (no input): cadence drops to zero quickly, wheel freewheels (set motor torque to almost zero, not to braking).

## Stamina
- Stamina drains with `cadence x gear factor`. Uphill drains more (use the slope from a downward raycast normal).
- Below 20% stamina, cap target cadence to 50 rpm. At zero the rider must coast or walk the bike.
- Sprint button: target cadence 120 for heavy drain. Gives racers a decision.

## Feet on pedals with IKControl
Animating pedals with a keyframed loop desyncs as speed changes. Instead, rotate a crank and let IK put the feet on it.

1. The bike has a `Crank` part on a `HingeConstraint` (or just rotated by script) with two pedal Attachments, `PedalL` and `PedalR`, offset 180 degrees.
2. Add two `IKControl`s under the rider's Humanoid: `Type = Position` (or `Transform` to also match foot rotation), `ChainRoot = LeftUpperLeg`, `EndEffector = LeftFoot`, `Target = PedalL` (same for the right leg).
3. Add a `Pole` Attachment in front of each knee so knees bend forward, not sideways.
4. Spin the crank angle from cadence each frame: `angle += cadence / 60 * 360 * dt`.
5. Play a seated idle animation for the upper body; IK overrides the legs.

The docs require an `IKControl` to be a child of a Humanoid or AnimationController with an Animator, and all required properties set, or it does nothing. Set `Weight` to 0 when the rider gets off, and `SmoothTime` near 0 for pedals (any smoothing makes feet lag behind).

Also add hand IK to the handlebar grips so steering visibly turns the hands.

## Balance, crashes and dismount
- Use the motorcycle note's lean and auto-balance; reduce the self-righting force below walking speed so a stopped bike tips unless a foot is down (play a "foot down" pose).
- Crash on hard frontal impact or more than 60 degrees lean: ragdoll the rider, leave the bike.
- Kickstand on exit: anchor-free stand by setting the bike's lean target to 10 degrees and freezing the wheels.

## Pitfalls
- R6 avatars have no knees; IK legs need R15 (or a bike pose with a fixed leg animation for R6).
- IK on many remote riders costs CPU; disable IK for bikes beyond 150 studs from the camera.

## Related
[[Vehicles - Hub]] - [[Motorcycles and Bikes - Lean Angle and Balance]] - [[Inverse Kinematics]] - [[HingeConstraint Motors and Servos for Wheels and Steering]]
