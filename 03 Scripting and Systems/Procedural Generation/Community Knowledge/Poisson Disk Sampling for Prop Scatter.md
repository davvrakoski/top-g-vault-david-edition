---
area: "03 Scripting and Systems"
cluster: "Procedural Generation"
title: "Poisson Disk Sampling for Prop Scatter"
tags: [roblox, community-knowledge, procedural, poisson-disk, scatter, blue-noise, level-design]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.cs.ubc.ca/~rbridson/docs/bridson-siggraph07-poissondisk.pdf
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
---
# Poisson Disk Sampling for Prop Scatter

Scattering trees, rocks, loot crates, zombie spawns or ore nodes with `math.random` positions gives clumps and bare patches, because uniform random points cluster. **Poisson disk sampling** produces points that are random but never closer than a minimum distance `r`, which looks natural ("blue noise") and keeps gameplay spacing guarantees: no two crates on top of each other, no tree blocking a door. Robert Bridson's 2007 algorithm does it in linear time and is short enough to write from memory.

## Bridson's algorithm (2D, as used for ground scatter)

Inputs: area size, minimum distance `r`, attempts per point `k` (the paper uses **k = 30** as the typical value).

1. **Background grid** with cell size `r / sqrt(2)` (in n dimensions, `r / sqrt(n)`). Each cell can hold at most one point, so the grid is a simple 2D array of point indices.
2. **First point** chosen uniformly at random; add it to the grid and to an **active list**.
3. **Loop while the active list is not empty**: pick a random active point; generate up to `k` candidates in the ring between radius `r` and `2r` around it. For each candidate, check only nearby grid cells for points closer than `r`. Accept the first valid candidate (add to grid and active list). If all `k` fail, remove the active point.
4. The loop runs exactly `2N - 1` times for N points, so total time is O(N).

## Luau implementation sketch (own code)

```lua
local function poissonDisk(width: number, height: number, r: number, rng: Random, k: number?)
	k = k or 30
	local cell = r / math.sqrt(2)
	local cols, rows = math.ceil(width / cell), math.ceil(height / cell)
	local grid, points, active = {}, {}, {}

	local function gi(p: Vector2) return math.floor(p.X / cell) + math.floor(p.Y / cell) * cols end
	local function ok(p: Vector2): boolean
		if p.X < 0 or p.Y < 0 or p.X >= width or p.Y >= height then return false end
		local cx, cy = math.floor(p.X / cell), math.floor(p.Y / cell)
		for y = math.max(cy - 2, 0), math.min(cy + 2, rows - 1) do
			for x = math.max(cx - 2, 0), math.min(cx + 2, cols - 1) do
				local idx = grid[x + y * cols]
				if idx and (points[idx] - p).Magnitude < r then return false end
			end
		end
		return true
	end
	local function add(p: Vector2)
		table.insert(points, p); grid[gi(p)] = #points; table.insert(active, #points)
	end

	add(Vector2.new(rng:NextNumber(0, width), rng:NextNumber(0, height)))
	while #active > 0 do
		local ai = rng:NextInteger(1, #active)
		local base = points[active[ai]]
		local found = false
		for _ = 1, k do
			local ang, dist = rng:NextNumber(0, 2 * math.pi), rng:NextNumber(r, 2 * r)
			local c = base + Vector2.new(math.cos(ang), math.sin(ang)) * dist
			if ok(c) then add(c); found = true; break end
		end
		if not found then active[ai] = active[#active]; active[#active] = nil end
	end
	return points
end
```

Note: sampling `dist` uniformly in [r, 2r] is a simplification; it slightly favours points near the inner ring, which is fine for props.

## Using it in a Roblox map

1. Generate points in a local 2D area; convert to world with `Vector3.new(p.X + originX, 0, p.Y + originZ)`.
2. **Raycast down** from above each point to find ground height and normal; reject points on steep slopes (`result.Normal.Y < 0.8`), water (`result.Material`), roads or no-build zones.
3. Pick the prop with weighted random selection ([[Weighted Random Selection]]) and random yaw/scale from the same `Random` object.
4. Different layers, different `r`: big trees `r = 18`, bushes `r = 6`, grass clumps `r = 2`. Run large layers first and reject small props too close to big ones.

## Variable density
Scale `r` by a noise or mask value at the candidate position (dense forest core, sparse edges). The ring check must then use the larger of the two radii, and the grid cell size must use the **smallest** `r`.

## Pitfalls
- Using `math.random` breaks reproducibility; pass a seeded `Random` so the same seed gives the same forest ([[Seeded Random - Deterministic Worlds with Random.new]]).
- Thousands of props: spread spawning over frames and use StreamingEnabled; consider instancing-friendly meshes ([[Draw Calls and Mesh Instancing - Official Rules vs Forum Lore]]).

## Related
[[Procedural Generation - Hub]] · [[Fractal Noise Terrain with math.noise - Octaves, Redistribution and Islands]] · [[Procedural Content Framework]] · [[Weighted Random Selection]]
