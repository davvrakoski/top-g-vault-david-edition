---
area: "12 UI Audio and Camera"
cluster: "Camera Game Feel"
title: "Frame-Rate Independent Camera Smoothing"
tags: [roblox, community-knowledge, camera, smoothing, math, springs]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/programming/improved-lerp-smoothing-
  - https://devforum.roblox.com/t/frame-rate-independent-lerp/352375
  - https://create.roblox.com/docs/reference/engine/datatypes/CFrame
  - https://create.roblox.com/docs/reference/engine/classes/RunService
---
# Frame-Rate Independent Camera Smoothing

Roblox players run anywhere from 30 FPS on old phones to 240 FPS on gaming PCs (with the FPS cap raised). The common smoothing line `pos = pos:Lerp(target, 0.1)` runs once per frame, so on a 240 FPS machine the camera catches up eight times faster than at 30 FPS. Your carefully tuned follow cam feels floaty on phones and twitchy on PCs. The fix is one formula: use an exponential decay factor based on delta time.

## The formula

Replace a fixed alpha with:

```
alpha = 1 - exp(-rate * dt)
value = lerp(value, target, alpha)
```

- `rate` is "how fast", in 1/seconds. After `1/rate` seconds the remaining gap has shrunk to about 37%; after `3/rate` seconds to about 5%.
- It gives the same motion at any frame rate, which is why game-dev write-ups on "improved lerp smoothing" and the matching DevForum thread recommend it.
- To convert an old per-frame alpha tuned at 60 FPS: `rate = -ln(1 - oldAlpha) * 60`. An old `0.1` becomes about `6.3`.

```lua
local function damp(current, target, rate: number, dt: number)
	return current:Lerp(target, 1 - math.exp(-rate * dt))
end
-- works for Vector3, CFrame (Lerp), Color3 and UDim2; for numbers:
local function dampNumber(a: number, b: number, rate: number, dt: number): number
	return a + (b - a) * (1 - math.exp(-rate * dt))
end
```

## Typical rates for cameras

| What | Rate | Feel |
|---|---|---|
| Shoulder camera position follow | 12-20 | Tight, slight softness |
| Look-at target (lock-on) | 6-10 | Smooth turn toward targets |
| Vehicle chase camera | 3-6 | Lazy, cinematic lag |
| Camera height on stairs / crouch | 10-15 | Removes step jitter |
| Zoom distance after obstruction | 8 in, 3 out | Snap in fast, ease back out slowly |

Using two different rates for "moving toward a wall" and "returning" is a big quality win: snapping in avoids clipping, slow release avoids pumping.

## Rotation: lerp the CFrame, not the angles

`CFrame:Lerp` interpolates rotation along the shortest arc, so it doesn't spin the long way round at 180 degrees the way lerping yaw numbers does. If you must smooth angles as numbers, wrap the difference into -pi..pi first:

```lua
local function dampAngle(a: number, b: number, rate: number, dt: number): number
	local diff = (b - a + math.pi) % (2 * math.pi) - math.pi
	return a + diff * (1 - math.exp(-rate * dt))
end
```

## When you want overshoot: springs

Exponential damping never overshoots. For a bouncy camera (recoil kick, landing bob, weapon sway), use a damped spring instead. A semi-implicit Euler step is fine at game frame rates if you clamp `dt`:

```lua
-- x = position, v = velocity, k = stiffness, c = damping
local function springStep(x: number, v: number, target: number, k: number, c: number, dt: number)
	dt = math.min(dt, 1 / 30) -- avoid explosions after hitches
	local a = k * (target - x) - c * v
	v += a * dt
	x += v * dt
	return x, v
end
```

Critical damping (no overshoot, fastest settle) is `c = 2 * sqrt(k)`. Use less damping for bounce. Community spring modules exist (often named "Spring" in Roblox codebases) if you prefer not to write one; check their licence before bundling.

## Where to run it

- Camera smoothing belongs in `RunService:BindToRenderStep(..., Enum.RenderPriority.Camera.Value, fn)` or `RenderStepped`, using the `dt` that callback passes.
- Don't smooth the target with `Heartbeat` and the camera with `RenderStepped` separately; that mixes timelines and creates stutter. Read the target's current CFrame in the render step.
- Character-follow jitter often comes from following a physics part directly. Follow the HumanoidRootPart with smoothing, or the head with a small rate.

## Checklist

- [ ] No fixed-alpha lerps left (search the codebase for `:Lerp(` with a literal)
- [ ] Rates documented in one config module
- [ ] Separate in/out rates for obstruction zoom
- [ ] `dt` clamped in spring code
- [ ] Tested with FPS capped at 30 and uncapped

## Related
[[Camera Game Feel - Hub]] · [[Custom Camera Systems in Luau]] · [[Camera Obstruction, Shoulder Swap and Lock-On]] · [[FOV Punch, Sprint FOV and Zoom]]
