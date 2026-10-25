---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Easing Functions by Hand and TweenService GetValue"
tags: [roblox, community-knowledge, math, easing, tween, animation, ui]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/enums/EasingStyle
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://easings.net/
---
# Math - Easing Functions by Hand and TweenService GetValue

An easing function takes a linear progress `t` from 0 to 1 and bends it so motion starts or ends gently. TweenService does this for properties, but you often need the curve in code: a custom camera shake decay, damage numbers that pop, a coin magnet, a value you feed into a shader-like effect, or hundreds of objects animated from one loop. Knowing the formulas also helps you pick styles on purpose instead of by trial.

## The shortcut: GetValue

`TweenService:GetValue(alpha, Enum.EasingStyle.X, Enum.EasingDirection.Y)` returns the eased alpha for any engine style (Linear, Sine, Quad, Cubic, Quart, Quint, Exponential, Circular, Back, Elastic, Bounce). Alpha is clamped to 0..1, and the reference says it errors for the newer `Bezier` and `Spring` styles. Use it when you want Roblox-identical curves and do not care about a function call per sample.

## Writing them yourself (own code)

"In" accelerates from rest, "Out" decelerates into the end, "InOut" does both.

```lua
local Ease = {}
function Ease.quadIn(t) return t * t end
function Ease.quadOut(t) return 1 - (1 - t) * (1 - t) end
function Ease.cubicInOut(t)
	if t < 0.5 then return 4 * t * t * t end
	local f = -2 * t + 2
	return 1 - f * f * f / 2
end
function Ease.backOut(t) -- overshoots then settles
	local c1 = 1.70158
	local c3 = c1 + 1
	local u = t - 1
	return 1 + c3 * u * u * u + c1 * u * u
end
function Ease.expoOut(t)
	return if t >= 1 then 1 else 1 - 2 ^ (-10 * t)
end
return Ease
```

Rule to build any "Out" from an "In": `out(t) = 1 - in(1 - t)`. Any "InOut": use `in(2t)/2` for the first half and `1 - in(2 - 2t)/2` for the second.

## Which style for which job

| Feel | Style | Typical use |
| --- | --- | --- |
| Snappy, responsive | Quad/Cubic Out, 0.15-0.3 s | menus, buttons, hit flashes |
| Heavy, mechanical | Sine InOut, 0.6-1.5 s | doors, elevators, platforms |
| Playful pop | Back Out | reward popups, icon scale-in |
| Physical drop | Bounce Out | falling loot labels |
| Springy wobble | Elastic Out (sparingly) | jelly UI, cartoon feedback |
| Fade-outs, decays | Exponential Out | camera shake, glow decay |

## Using a curve outside 0..1

Back and Elastic return values above 1 or below 0 mid-curve. That is intended: an overshoot. If you lerp a `UDim2` size with them the element briefly grows past its final size, which is the point. If the target value must never exceed its range (transparency, health), clamp the output with `math.clamp`.

## Reverse and ping-pong

- Reverse: `ease(1 - t)`.
- Ping-pong for looped hovering: `local p = 1 - math.abs((t % 2) - 1)` then ease `p`.

## Pitfalls

- Easing does not fix frame-rate dependence: compute `t` from elapsed time (`os.clock()` difference or summed `dt`), never by adding a constant each frame.
- Overusing Elastic/Bounce makes a UI feel cheap; keep them for rewards.
- Long Out curves feel laggy on input feedback; button response should finish under about 0.2 s.

## Related
[[Math Geometry - Hub]] · [[Math - Lerp vs TweenService vs SmoothDamp - Choosing an Animator]] · [[TweenService UI Animation Recipes]] · [[First Moving Part with TweenService]]
