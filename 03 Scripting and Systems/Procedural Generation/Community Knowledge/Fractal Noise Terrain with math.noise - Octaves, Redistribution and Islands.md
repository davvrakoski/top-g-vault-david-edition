---
area: "03 Scripting and Systems"
cluster: "Procedural Generation"
title: "Fractal Noise Terrain with math.noise - Octaves, Redistribution and Islands"
tags: [roblox, community-knowledge, procedural, noise, perlin, terrain, heightmap]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/libraries/math
  - https://www.redblobgames.com/maps/terrain-from-noise/
---
# Fractal Noise Terrain with math.noise - Octaves, Redistribution and Islands

Procedural worlds, infinite runners, mining games and random biomes all start with a heightmap. Roblox ships Perlin noise as `math.noise`, but raw noise looks like gentle blobs. Amit Patel's Red Blob Games article on terrain from noise shows the small set of tricks that turn it into believable land: octaves, redistribution, terraces, two-map biomes and island shaping. This note maps each trick onto Luau and the quirks of Roblox's noise function.

## math.noise quirks (from the API reference)

- Signature: `math.noise(x, y?, z?)`, missing arguments are 0.
- Output is *usually* in -1..1 but can fall outside, so `math.clamp` if you index tables with it.
- **At integer coordinates the result is 0.** Sampling at `(x, z)` for integer grid cells gives a flat world. Always divide by a scale (`x / 64`) or add a fractional offset.
- It is deterministic: the same inputs always return the same value. There is **no seed argument**; seed by offsetting coordinates (`x + seed * 1000.37`).

## Step 1: octaves (fractal Brownian motion)

Each octave doubles the frequency and halves the amplitude; divide by the sum of amplitudes to keep the range stable.

```lua
local function fbm(x: number, z: number, seed: number, octaves: number): number
	local total, amp, freq, norm = 0, 1, 1, 0
	for _ = 1, octaves do
		total += amp * math.noise(x * freq + seed, z * freq - seed, 0.5)
		norm += amp
		amp *= 0.5
		freq *= 2
	end
	return total / norm -- roughly -1..1
end
```

Four to six octaves is typical; each one costs another `math.noise` call per sample.

## Step 2: redistribution

Map to 0..1 (`e = (n + 1) / 2`), then raise to a power: `e = e ^ 2.0`. Exponents above 1 push mid elevations down into valleys and leave sharp peaks; below 1 makes plateaus.

## Step 3: terraces

`e = math.round(e * levels) / levels` gives stepped mesas, which read well at Roblox scale and suit blocky or stylized games.

## Step 4: biomes from two maps

Generate a second noise map for **moisture** with a different seed/offset. Choose biome from (elevation, moisture) with a lookup: low = water, slightly above = sand, high + dry = rock, mid + wet = forest. Keep biome thresholds in a config table so designers can tune.

## Step 5: islands and arenas

For a map that is land in the middle and sea at the edges, compute a normalized distance from centre `d` (0 at centre, 1 at the edge) and blend:

`e = lerp(e, 1 - d, mix)`

`mix = 0` leaves raw noise; `mix = 1` gives a perfect dome. Around 0.3-0.5 keeps the island readable while staying natural. The article's "square bump" distance `1 - (1 - nx^2)(1 - nz^2)` fills square maps better than a circle.

## Turning it into Roblox terrain

Sample per 4-stud voxel column and write with `Terrain:WriteVoxels` or `FillBlock` per column; details, limits and chunking in [[Smooth Terrain from Code - FillBlock, WriteVoxels and Chunks]]. For part-based worlds, place tiles or meshes per cell instead.

## Scale guide for Roblox

| Feature | Noise scale (studs per unit of noise input) |
| --- | --- |
| Continents / big hills | 400 - 1000 |
| Rolling hills | 100 - 250 |
| Surface roughness | 15 - 40 |
| Ore veins / caves (3D noise) | 20 - 60 |

(These ranges are our own starting points, not from a source; tune by eye.)

## Pitfalls
1. **Grid artifacts.** Very low octave counts with integer-aligned sampling show square patterns; add fractional offsets.
2. **Server cost.** Thousands of samples per frame stall the server. Generate in chunks across frames (`task.wait()` between chunks) or in Parallel Luau ([[Parallel Luau Actors - A Worked Example]]).
3. **Replication.** Generated terrain replicates to clients like any terrain. For huge worlds use StreamingEnabled, or send the seed and generate client-side for purely visual details.
4. **Determinism.** Keep the seed in your save data so a world can be regenerated ([[Seeded Random - Deterministic Worlds with Random.new]]).

## Related
[[Procedural Generation - Hub]] · [[Procedural Systems and Geometry]] · [[Poisson Disk Sampling for Prop Scatter]] · [[Real-World Heightmaps - Free DEM Sources and Licenses]]
