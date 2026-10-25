---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Frame-Rate Independent Smoothing - Exponential Decay and Springs"
tags: [roblox, community-knowledge, math, lerp, smoothing, springs, camera, game-feel]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.rorydriscoll.com/2016/03/07/frame-rate-independent-damping-using-lerp/
  - https://theorangeduck.com/page/spring-roll-call
  - https://create.roblox.com/docs/reference/engine/classes/RunService
---
# Frame-Rate Independent Smoothing - Exponential Decay and Springs

The most common smoothing line in Roblox code is `x = x:Lerp(target, 0.1)` inside `RenderStepped`. It looks fine on the developer's PC and feels different everywhere else, because it closes 10% of the gap **per frame**. Players now run at 30, 60, 120 or 240 fps (Roblox has an FPS cap setting), so camera follow, UI counters, aim smoothing and pet following all change speed with frame rate. The fix is one formula; for bouncier motion, a critically damped spring.

## Why the naive lerp breaks

With `alpha = 0.1` per frame, after one second the remaining gap is `0.9^fps`:
- 60 fps: about 0.2% left
- 30 fps: about 4.2% left

Same code, roughly twenty times difference in "settledness" after one second (numbers from Rory Driscoll's article).

## Fix 1: exponential decay with dt

Use the frame's delta time in the exponent:

```lua
-- `halfLife` = seconds to close half the remaining gap (easy to tune)
local function damp(current, target, halfLife: number, dt: number)
	local alpha = 1 - 2 ^ (-dt / halfLife)
	return current + (target - current) * alpha   -- numbers or Vector3s
end

RunService.RenderStepped:Connect(function(dt)
	camPos = damp(camPos, goalPos, 0.08, dt)
end)
```

Equivalent forms you will see: `alpha = 1 - smoothing ^ dt` (where `smoothing` is the fraction left after one second) and `alpha = 1 - math.exp(-lambda * dt)`. A **half-life** parameter is the most designer-friendly: "the camera closes half the distance in 0.08 s".

For CFrames use `cf:Lerp(goal, alpha)` with the same alpha.

## Fix 2: critically damped spring

Exponential decay starts moving instantly at full speed toward the target. A spring has **velocity**, so it eases in and carries momentum, which feels better for cameras, recoil recovery, weapon sway and UI pop. "Critically damped" means it reaches the target as fast as possible **without overshoot**.

Daniel Holden's "Spring-It-On" article derives an exact, stable update parameterized by half-life (own Luau port of the idea):

```lua
local LN2 = math.log(2)

local function fastNegExp(x: number): number
	return 1 / (1 + x + 0.48 * x * x + 0.235 * x * x * x)
end

-- returns new position and velocity; works for numbers or Vector3
local function springCritical(x, v, goal, halfLife: number, dt: number)
	local y = 2 * LN2 / halfLife   -- damping/2
	local j0 = x - goal
	local j1 = v + j0 * y
	local e = fastNegExp(y * dt)
	return e * (j0 + j1 * dt) + goal, e * (v - j1 * y * dt)
end
```

Properties that matter in games:
- **Frame-rate independent**: one big step equals many small steps.
- **Stable** for large `dt` (a lag spike doesn't explode it), unlike naive `v += k*(goal-x)*dt` springs.
- You can **kick** it: add to `v` for recoil or impact shake, and it settles back.

For bouncy (under-damped) motion, use a full spring with separate stiffness and damping, or a library such as RbxUtil's `Spring` / Fusion's `Spring` state.

## Which to use

| Feature | Use |
| --- | --- |
| Camera follow, smooth zoom | exponential decay or critical spring |
| Number counters in UI | exponential decay, snap when within 0.5 |
| Recoil / screen kick | critical spring with velocity kicks |
| Jelly, wobble, bounce | under-damped spring |
| Fixed-duration, designer-timed motion | TweenService (not frame-based smoothing) |

## Pitfalls
1. **Smoothing on the server** for things clients see makes motion steppy; smooth on the client, keep the server authoritative on the target value.
2. **Angles wrap.** Smoothing yaw from 350 to 10 degrees goes the long way; use the shortest signed difference (`(b - a + pi) % (2*pi) - pi`) or smooth CFrames instead of raw angles.
3. **Never snap-then-smooth every frame** (resetting `x` to some other value each frame); keep the smoothed value as persistent state.

## Related
[[Math Geometry - Hub]] · [[CFrame Recipes - Facing, Offsets and Relative Space]] · [[Math for Game Development]] · [[RbxCameraShaker for VFX Impacts (MIT)]]
