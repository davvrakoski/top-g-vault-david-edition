---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Movement Feel Tuning - Acceleration, Turn Speed and Air Control with ControllerManager"
tags: [roblox, community-knowledge, character-controller, movement-feel, controllermanager, air-control]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ControllerManager
  - https://create.roblox.com/docs/reference/engine/classes/GroundController
  - https://create.roblox.com/docs/reference/engine/classes/AirController
  - https://create.roblox.com/docs/reference/engine/classes/ControllerBase
  - https://create.roblox.com/docs/characters/character-controller-library
---
# Anim - Movement Feel Tuning - Acceleration, Turn Speed and Air Control with ControllerManager

Classic Humanoid movement is instant: full speed on the first frame of input, dead stop on release, near-total steering in the air. That suits obbies, but a horror game, a heavy knight or a skating game needs weight. Roblox's physics controllers (`ControllerManager` with `GroundController`, `AirController` and friends, also what the Character Controller Library runs on) expose the exact knobs: acceleration time, deceleration time, turn speed and air force. This note is a tuning guide for those knobs and how animation has to follow them.

## The knobs that matter

| Feel | Property | Notes from the API reference |
|---|---|---|
| Top speed | `ControllerManager.BaseMoveSpeed` x `ControllerBase.MoveSpeedFactor` | Each controller (ground, air, swim, climb) scales the base speed |
| Ramp up | `GroundController.AccelerationTime` | Seconds to reach target speed; linear, affected by friction |
| Ramp down | `GroundController.DecelerationTime` | Seconds from full speed to stop after input ends |
| Turn rate | `ControllerManager.BaseTurnSpeed` x `TurnSpeedFactor` | Angular speed toward `FacingDirection` |
| Ice / mud | `GroundController.Friction`, `FrictionWeight` | Less friction = less force for moving and holding on slopes |
| Air steering | `AirController.MoveMaxForce` | Max force pushing toward `MovingDirection` while airborne |
| Air drift | `AirController.MaintainLinearMomentum` | If false, the controller brakes you toward 0 when there is no input |
| Air spin | `AirController.TurnMaxTorque`, `MaintainAngularMomentum` | How quickly you can rotate mid-air |

The official CCL quick start shows the pattern: on character spawn, find the `GroundController` and set `AccelerationTime = 0.2`, `DecelerationTime = 0.4` for a "slight" weight.

## Starting presets (our suggestions, tune by playtest)

| Game type | AccelerationTime | DecelerationTime | Turn | Air control |
|---|---|---|---|---|
| Obby / platformer | 0-0.05 | 0-0.05 | high | high `MoveMaxForce`, momentum off |
| Action / shooter | 0.08-0.15 | 0.1-0.2 | high | medium |
| Heavy / horror | 0.25-0.4 | 0.3-0.5 | low (`TurnSpeedFactor` 0.5) | low, momentum on |
| Ice / skating | 0.4+ | 1.0+ with low `Friction` | medium | momentum on |

Rule: deceleration slightly longer than acceleration feels natural; the reverse feels like sticky brakes.

## Script shape

```lua
-- Server Script: apply a feel profile to every character
local Profiles = {
	Heavy = { accel = 0.3, decel = 0.45, turn = 0.5, airForce = 0.4, keepMomentum = true },
}

local function apply(character, p)
	local cm = character:WaitForChild("ControllerManager", 10)
	if not cm then return end
	local ground = cm:FindFirstChildWhichIsA("GroundController")
	local air = cm:FindFirstChildWhichIsA("AirController")
	if ground then
		ground.AccelerationTime = p.accel
		ground.DecelerationTime = p.decel
		ground.TurnSpeedFactor = p.turn
	end
	if air then
		air.MoveMaxForce *= p.airForce
		air.MaintainLinearMomentum = p.keepMomentum
	end
end
```

Multiply relative to the defaults your controller ships with (read them once in Studio) instead of hard-coding absolute forces, because force needs scale with character mass.

## Animation has to follow physics

Once speed ramps, animations driven by input instead of velocity look wrong: the run clip starts at full stride while the body is still at 20 % speed.

- Blend locomotion by **actual horizontal speed** of the root (`AssemblyLinearVelocity` with Y removed), not by input.
- Scale stride playback: `walkTrack:AdjustSpeed(speed / authoredSpeed)`.
- Add a **start** and **stop** clip for heavy profiles (lean forward on start, a settling step on stop) triggered when speed crosses thresholds.
- Lean into turns from the angle between facing and velocity (see procedural lean note).

## Feel extras that are not properties

- **Coyote time:** allow a jump for about 0.1 s after walking off a ledge.
- **Jump buffer:** remember a jump press for about 0.1 s before landing.
- **Variable jump height:** cut upward velocity when jump is released early.
These are code on top of either stack; they matter more for feel than most property tweaks.

## Humanoid-only fallback

Humanoid has no acceleration property. A common fake is easing `WalkSpeed` toward its target each frame on the client; it changes top speed, not steering, so it feels less natural than real acceleration. If weight matters to your game, the controller route is the better base.

## Related
[[Animation - Hub]] · [[Humanoid vs Character Controller Library - Choosing a Movement Stack]] · [[Directional Locomotion Blending - Strafe, Speed-Matched Gaits]] · [[Procedural Lean and Torso Twist with Motor6D.Transform]]
