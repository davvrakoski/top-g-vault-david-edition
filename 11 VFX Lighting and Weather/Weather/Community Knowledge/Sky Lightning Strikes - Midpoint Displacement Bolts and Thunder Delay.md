---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
title: "Sky Lightning Strikes - Midpoint Displacement Bolts and Thunder Delay"
tags: [roblox, community-knowledge, weather, lightning, procedural, storms]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://code.tutsplus.com/how-to-generate-shockingly-good-2d-lightning-effects-in-unity-javascript--cms-22174t
  - https://krazydad.com/bestiary/bestiary_lightning.html
  - https://gamedev.net/blogs/entry/1901925-lightning-bolts
  - https://create.roblox.com/docs/reference/engine/classes/Beam
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
---
# Sky Lightning Strikes - Midpoint Displacement Bolts and Thunder Delay

A storm needs lightning that looks different every time, lights up the world for a split second, and is followed by thunder that arrives later the farther away it struck. Pre-made bolt meshes repeat quickly. A procedural bolt from **midpoint displacement** (the same recursive idea used for fractal terrain, as Krazydad and several game-dev write-ups describe) gives endless variation with a few lines of code, and you can render it with Neon parts or Beams. This note covers sky-to-ground strikes; the Beams deep dive already covers short chain-lightning links between targets.

## The algorithm

1. Start with one segment from the cloud point A to the ground point B.
2. For each segment, take its midpoint and push it sideways by a random offset, perpendicular to the segment.
3. Halve the maximum offset and repeat for the new, shorter segments.
4. Stop after 5-7 generations (32-128 segments).
5. **Branches:** at some new midpoints, start a shorter forked segment heading roughly the same way, with its own smaller offsets.

Halving the offset each generation is what gives the fractal "big zigzags with small jitter" look.

```lua
local function bolt(a: Vector3, b: Vector3, generations: number, offset: number, rng: Random)
	local points = { a, b }
	local branches = {}
	for _ = 1, generations do
		local new = { points[1] }
		for i = 1, #points - 1 do
			local p, q = points[i], points[i + 1]
			local dir = (q - p)
			local side = dir:Cross(Vector3.yAxis)
			if side.Magnitude < 1e-3 then side = dir:Cross(Vector3.xAxis) end
			side = side.Unit
			local side2 = dir:Cross(side).Unit -- a second perpendicular axis for 3D jitter
			local mid = (p + q) / 2
				+ side * rng:NextNumber(-offset, offset)
				+ side2 * rng:NextNumber(-offset, offset)
			table.insert(new, mid)
			table.insert(new, q)
			if rng:NextNumber() < 0.08 then -- occasional fork
				local forkEnd = mid + (q - p) * 0.7 + side * rng:NextNumber(-offset, offset) * 2
				table.insert(branches, { mid, forkEnd })
			end
		end
		points = new
		offset /= 2
	end
	return points, branches
end
```

Start `offset` at roughly 10-15% of the bolt length. Use `Random.new(seed)`: the server can send only `(a, b, seed)` and every client draws the same bolt.

## Rendering the bolt

**Neon parts (simple, bright):** one thin part per segment, `Material = Neon`, width 0.3-0.6 for the main channel and 0.15-0.3 for branches, `CFrame = CFrame.lookAt((p + q) / 2, q)`, `Size = Vector3.new(w, w, (q - p).Magnitude)`. With Bloom in Lighting, Neon gives the glow. Pool the parts.

**Beams (softer, fewer instances):** one Beam per segment between pooled attachments, `LightEmission = 1`, `FaceCamera = true`, glow texture. Fewer parts in the world, more control over glow falloff.

## Timing of a strike (about 0.5 s total)

| Time | Event |
|---|---|
| 0.00 | Show bolt, sky flash on |
| 0.05 | Hide bolt |
| 0.10 | Show bolt again (re-strike flicker, optionally re-randomise small offsets) |
| 0.15-0.25 | Fade bolt out (transparency 0 -> 1) |
| 0.00-0.20 | Sky flash: brief `Lighting.ExposureCompensation` or a camera `ColorCorrectionEffect.Brightness` bump, then decay |
| distance / speed of sound | Thunder |

## Thunder delay

Real thunder travels at about 343 m/s. Roblox's guidance treats 1 stud as about 0.28 m (avatar scale), so sound covers roughly 1,200 studs per second. For gameplay readability, compress it:

```lua
local function thunderDelay(distanceStuds: number): number
	local realistic = distanceStuds * 0.28 / 343
	return math.clamp(realistic * 4, 0, 6) -- exaggerate so mid-range strikes have a noticeable gap
end
```

- Close strike (< 150 studs): no delay, sharp crack sample.
- Mid (150-800): short delay, rolling rumble.
- Far: long delay, low-pass filtered, quieter rumble.

Players instinctively count the gap, so a believable delay makes storms feel huge.

## Accessibility and safety

- Flashes are the main photosensitivity risk in weather. Limit to about 3 flashes per second at most, keep the brightness bump moderate, never full-screen white, and add a "reduce flashing" setting (also honour Reduce Motion as a proxy). See the thunder and accessibility note.
- Thunder can be startling and loud. Keep it on the ambience/weather bus so players can turn it down.

## Gameplay strikes

If lightning can hit players, the server picks the strike point and applies damage after a short **telegraph** (a warning glow or decal on the ground 0.8-1.5 s before), and broadcasts the seed so clients draw the bolt. Never let a purely cosmetic client bolt deal damage.

## Related
[[Weather - Hub]] · [[Thunder, Lightning and Accessibility]] · [[Beams, Trails and Attachments - Production Setups]] · [[Lightning Beams Module (MIT)]] · [[Day-Night Cycle and Weather Transitions in Practice]]
