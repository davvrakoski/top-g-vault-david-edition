---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Remap, Clamp, Inverse Lerp and Smoothstep"
tags: [roblox, community-knowledge, math, utilities, game-feel]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/libraries/math
  - https://en.wikipedia.org/wiki/Smoothstep
---
# Math - Remap, Clamp, Inverse Lerp and Smoothstep

Most game-feel code is "turn one range into another": speed 0-80 into camera FOV 70-90, distance 10-100 into damage 50-10, health 0-100 into a red vignette, altitude into wind volume. Five tiny functions cover nearly all of it. Luau's `math` library now ships two of them (`math.lerp`, `math.map`); the rest are one-liners.

## The five

| Function | What it does | Luau |
| --- | --- | --- |
| clamp | keep `x` in `[a, b]` | `math.clamp(x, a, b)` |
| lerp | `t` in 0..1 to a value between `a` and `b` | `math.lerp(a, b, t)` |
| inverse lerp | value between `a` and `b` to `t` | `(x - a) / (b - a)` |
| remap | range A to range B | `math.map(x, inMin, inMax, outMin, outMax)` |
| smoothstep | soft 0..1 ramp with flat ends | `t * t * (3 - 2 * t)` |

`math.map` maps linearly; it is not documented as clamping, so clamp first when the output must stay in range.

## Helpers (own code)

```lua
local M = {}
function M.invLerp(a: number, b: number, x: number): number
	return (x - a) / (b - a)
end
function M.remapClamped(x, a, b, c, d)
	local t = math.clamp((x - a) / (b - a), 0, 1)
	return c + (d - c) * t
end
function M.smoothstep(a: number, b: number, x: number): number
	local t = math.clamp((x - a) / (b - a), 0, 1)
	return t * t * (3 - 2 * t)
end
return M
```

## Recipes

**Speed-based FOV:**
```lua
camera.FieldOfView = M.remapClamped(root.AssemblyLinearVelocity.Magnitude, 16, 80, 70, 90)
```

**Damage falloff with distance** (full damage to 10 studs, 20% at 60+):
```lua
local dmg = 50 * M.remapClamped(dist, 10, 60, 1, 0.2)
```

**Low-health vignette that fades in softly** below 30% health:
```lua
vignette.ImageTransparency = 1 - M.smoothstep(30, 0, humanoid.Health) * 0.6
```
(Swapping `a` and `b` reverses the ramp: here it rises as health drops.)

**Footstep volume from speed, ignoring tiny movements:** `M.smoothstep(2, 16, speed)` gives silence below 2 studs/s and full volume at walk speed.

## Inverse lerp for progress bars

A level bar from `xpForLevel(n)` to `xpForLevel(n+1)` is `M.invLerp(lo, hi, xp)`; feed that 0..1 directly into a `UDim2.fromScale(t, 1)`.

## Pitfalls

- Inverse lerp with `a == b` divides by zero (inf or NaN). Guard ranges that come from config.
- Remap without clamp lets values escape (negative damage, FOV 140); clamp anything that ends up on screen or in combat.
- Smoothstep is not an easing over time by itself; to animate, feed it `elapsed / duration`.

## Related
[[Math Geometry - Hub]] · [[Math - Easing Functions by Hand and TweenService GetValue]] · [[Math - Lerp vs TweenService vs SmoothDamp - Choosing an Animator]] · [[XP Curve Formulas - Time-to-Level Targets and Level Caps]]
