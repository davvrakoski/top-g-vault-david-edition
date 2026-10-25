---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Weapon Spread and Bell Curves - Cone Sampling and Gaussian Random"
tags: [roblox, community-knowledge, math, random, weapons, combat]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://create.roblox.com/docs/reference/engine/datatypes/CFrame
  - https://en.wikipedia.org/wiki/Box%E2%80%93Muller_transform
---
# Math - Weapon Spread and Bell Curves - Cone Sampling and Gaussian Random

`Random:NextNumber(min, max)` is flat: every value in the range is equally likely. Many game systems want something else: bullets that cluster near the crosshair, stat rolls where average is common and extremes are rare, NPC reaction times that vary naturally. This note covers random directions inside a cone (spread) and bell-curve (Gaussian) numbers.

## Uniform direction inside a cone (own code)

```lua
local function spreadDir(rng: Random, aim: CFrame, maxAngle: number): Vector3
	local cosMax = math.cos(maxAngle)
	local cosT = 1 - rng:NextNumber() * (1 - cosMax) -- uniform over the cone's cap
	local theta = math.acos(cosT)
	local phi = rng:NextNumber(0, 2 * math.pi)
	return (aim * CFrame.Angles(0, 0, phi) * CFrame.Angles(theta, 0, 0)).LookVector
end
```

- Rolling by `phi` around the aim axis, then tilting by `theta`, rotates the LookVector off-centre in a random direction.
- Sampling `cos(theta)` uniformly (not `theta`) is what keeps hits even across the cone area; sampling `theta` directly clusters hits at the centre. That clustering can be desirable: see below.

## Choosing the spread shape on purpose

| Sampling | Feel |
| --- | --- |
| uniform over cap (above) | shotgun pellets, even pattern |
| `theta = maxAngle * rng:NextNumber()` | tighter centre, wider rare misses |
| Gaussian `theta`, clamped | realistic rifle grouping |
| fixed pattern + small jitter | competitive games: learnable recoil |

## Gaussian numbers (Box-Muller)

```lua
local function gaussian(rng: Random, mean: number, sd: number): number
	local u1 = math.max(rng:NextNumber(), 1e-12) -- avoid log(0)
	local u2 = rng:NextNumber()
	return mean + sd * math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
end
```

About 68% of results fall within one `sd` of the mean, 95% within two. Always clamp the result for gameplay values: the tails are unbounded.

## Cheap bell curve: average several rolls

`(rng:NextNumber() + rng:NextNumber() + rng:NextNumber()) / 3` is a smooth hump between 0 and 1 with no extreme tails, and never leaves the range. Good for item stat rolls ("most swords roll near average") and loot quantities.

## Bias curves

To skew a uniform `u` in 0..1: `u ^ k`. With `k = 2` low values are common (rarer high rolls); `k = 0.5` favours high values. Useful for "mostly small coins, occasional big one" without a table.

## Recoil and bloom

Spread usually grows while firing and recovers when idle. Keep `currentSpread` as a number, add per shot, and decay it with `currentSpread *= math.exp(-recovery * dt)`. Feed `math.rad(currentSpread)` to `spreadDir`.

## Pitfalls

- Roll spread on the server (or validate it there) for hit registration; send the seed or the final direction, not "trust me" hit results.
- `math.acos` of values slightly above 1 from float error returns NaN; the formula above stays in range, but clamp if you derive `cosT` another way.
- Reuse one `Random` per weapon or system rather than creating one per shot.

## Related
[[Math Geometry - Hub]] · [[Projectile Ballistics - Gravity Arcs, Launch Angles and Lead]] · [[Projectile Libraries - FastCast, FastCast2 and SwiftCast]] · [[Math - Points on Circles, Disks and Spheres - Uniform Placement]]
