---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Lerp vs TweenService vs SmoothDamp - Choosing an Animator"
tags: [roblox, community-knowledge, math, lerp, tween, spring, animation]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://create.roblox.com/docs/reference/engine/libraries/math
  - https://create.roblox.com/docs/reference/engine/datatypes/CFrame
  - https://create.roblox.com/docs/ui/animation
---
# Math - Lerp vs TweenService vs SmoothDamp - Choosing an Animator

Roblox gives you three ways to move a value from A to B: do the interpolation yourself with **lerp**, hand it to **TweenService**, or chase a moving target with a **damped spring** (`TweenService:SmoothDamp`, or your own spring). Picking the wrong one is the root of "jittery camera", "door snaps when interrupted" and "UI feels floaty". This note is the decision guide.

## The building blocks (all in the API reference)

| Tool | Signature | What it is |
| --- | --- | --- |
| `math.lerp` | `math.lerp(a, b, t)` | `a + (b - a) * t` for numbers |
| `Vector3:Lerp` / `CFrame:Lerp` | `v:Lerp(goal, alpha)` | same for vectors; CFrame also slerps rotation |
| `TweenService:Create` | `(instance, TweenInfo, goals)` | engine-driven property animation with easing |
| `TweenService:GetValue` | `(alpha, EasingStyle, EasingDirection)` | the easing curve alone, alpha clamped to 0..1 |
| `TweenService:SmoothDamp` | `(current, target, velocity, smoothTime, maxSpeed?, dt?)` | critically damped spring step, returns `(newValue, newVelocity)`; number, Vector2, Vector3, CFrame |

## Decision table

| Situation | Use | Why |
| --- | --- | --- |
| Fixed start, fixed end, fixed duration (door, UI panel, fade) | `TweenService:Create` | no per-frame script cost, easing built in |
| Same, but you need the value in code (custom shader-like effect, many objects in one loop) | lerp with `GetValue` easing | one loop drives hundreds of objects |
| Target keeps moving (camera follow, aim smoothing, health bar chasing damage) | `SmoothDamp` or a spring | carries velocity, so retargeting stays smooth |
| Physics object | a constraint, not any of these | tweening CFrame on a simulated part fights the solver |

## Recipe: eased lerp you control (own code)

```lua
local TweenService = game:GetService("TweenService")
local function easedLerp(a: Vector3, b: Vector3, t: number): Vector3
	local e = TweenService:GetValue(t, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	return a:Lerp(b, e)
end
```

Drive `t = elapsed / duration` from `RunService.Heartbeat` (or `RenderStepped` for camera work) and stop when `t >= 1`.

## Recipe: smooth follow with SmoothDamp (own code)

```lua
local vel = Vector3.zero
RunService.RenderStepped:Connect(function(dt)
	local goal = target.Position + Vector3.new(0, 6, 12)
	local pos
	pos, vel = TweenService:SmoothDamp(camPart.Position, goal, vel, 0.25, nil, dt)
	camPart.Position = pos
end)
```

Keep `vel` between frames and never edit it yourself; `smoothTime` (0.25 s here) is roughly how long it takes to catch up.

## Why "lerp by 0.1 every frame" is wrong

`x = x:Lerp(goal, 0.1)` each frame converges faster at 144 FPS than at 30 FPS. If you want that look, use a frame-rate independent factor `1 - math.exp(-k * dt)` (see the smoothing note below) or SmoothDamp.

## Interrupting tweens

Creating a new tween on the same property cancels the old one, but the new tween starts with zero velocity, so direction changes look like a hard stop. If the goal can change mid-way (hover in/out spam), a spring looks better.

## Pitfalls

- Server-side tweens replicate property changes to every client; prefer client-side tweens for cosmetic motion.
- `CFrame:Lerp` between two orientations more than 180 degrees apart takes the short path; split the rotation if you need a full spin.
- `GetValue` raises an error for `Enum.EasingStyle.Bezier` and `Enum.EasingStyle.Spring` (per the API reference); use the classic styles with it.

## Related
[[Math Geometry - Hub]] · [[Frame-Rate Independent Smoothing - Exponential Decay and Springs]] · [[Server-Side Tweens and Property Churn - Hidden Replication Cost]] · [[TweenService UI Animation Recipes]]
