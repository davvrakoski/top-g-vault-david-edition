---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/procedural-terrain-noise-writevoxels"
title: "Procedural Terrain with math.noise and WriteVoxels"
tags: [roblox, community, terrain, procedural, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Terrain#WriteVoxels
  - https://create.roblox.com/docs/reference/engine/libraries/math#noise
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://create.roblox.com/docs/parts/terrain
---
# Procedural Terrain with math.noise and WriteVoxels

The Terrain Editor's Generate button gives you random landmasses, but you can't control them, re-create them from a seed, or tie them to gameplay. This note gives an original, seeded terrain generator that writes smooth terrain in chunks with `Terrain:WriteVoxels`, picks materials by height and slope, and fills water. Use it in edit mode to sketch a map, or on the server for per-match worlds.

## Facts the code depends on (Engine API)
- `Terrain:WriteVoxels(region, resolution, materials, occupancy)`: `resolution` **must be 4**, the `Region3` must be **aligned to the voxel grid**, both arrays must match the region's size in voxels exactly, indexed `[x][y][z]`, and one call is limited to **4,194,304 voxels**.
- Occupancy is a number from 0 to 1 per voxel. Partial values give smooth slopes.
- `math.noise(x, y, z)` is Perlin noise. It returns **0 at integer coordinates**, mostly stays between -0.5 and 0.5 for fractional inputs, and **repeats every 256 units** per axis. So: offset your inputs by a fraction and keep the frequency low.
- `Random.new(seed)` gives the same sequence for the same seed, so a seed rebuilds the same world.

## The generator
Save a copy of your place first, then run in the command bar (edit mode) or a server Script.

```lua
local Terrain = workspace.Terrain

local SEED = 4821
local MAP_SIZE = 512   -- studs per side, multiple of CHUNK
local CHUNK = 64       -- studs per chunk side, multiple of 4
local BASE_Y = 0       -- lowest ground
local RELIEF = 96      -- extra height for the highest hills
local FREQ = 1 / 220   -- lower = wider hills
local WATER_Y = 18     -- water surface; set below BASE_Y to disable
local RES = 4

local rng = Random.new(SEED)
-- Fractional offsets keep us off noise's integer lattice (where it is always 0).
local OX, OZ = rng:NextNumber(0, 255) + 0.37, rng:NextNumber(0, 255) + 0.61

local function height(x: number, z: number): number
	local nx, nz = x * FREQ + OX, z * FREQ + OZ
	local n = math.noise(nx, nz) * 0.6
		+ math.noise(nx * 2.03, nz * 2.03) * 0.3
		+ math.noise(nx * 4.11, nz * 4.11) * 0.1
	local t = math.clamp(n + 0.5, 0, 1)
	t = t * t * (3 - 2 * t) -- smoothstep: flatter valleys and plateaus, easier to build on
	return BASE_Y + t * RELIEF
end

local function surfaceMaterial(h: number, slope: number): Enum.Material
	if slope > 1 then return Enum.Material.Rock end            -- steeper than ~45 degrees
	if h > BASE_Y + RELIEF * 0.8 then return Enum.Material.Snow end
	if h < WATER_Y + 3 then return Enum.Material.Sand end      -- beaches
	return Enum.Material.Grass
end

local function writeChunk(x0: number, z0: number)
	local region = Region3.new(
		Vector3.new(x0, BASE_Y - 8, z0),
		Vector3.new(x0 + CHUNK, BASE_Y + RELIEF + 8, z0 + CHUNK)
	):ExpandToGrid(RES)
	local count = region.Size / RES
	local sx, sy, sz = count.X, count.Y, count.Z
	local corner = region.CFrame.Position - region.Size / 2

	-- Column heights and slopes (rise over run) first.
	local heights, slopes = {}, {}
	for ix = 1, sx do
		heights[ix], slopes[ix] = {}, {}
		local wx = corner.X + (ix - 0.5) * RES
		for iz = 1, sz do
			local wz = corner.Z + (iz - 0.5) * RES
			heights[ix][iz] = height(wx, wz)
			local dx = math.abs(height(wx + RES, wz) - height(wx - RES, wz))
			local dz = math.abs(height(wx, wz + RES) - height(wx, wz - RES))
			slopes[ix][iz] = math.max(dx, dz) / (2 * RES)
		end
	end

	local materials, occupancy = table.create(sx), table.create(sx)
	for ix = 1, sx do
		local matsX, occX = table.create(sy), table.create(sy)
		materials[ix], occupancy[ix] = matsX, occX
		for iy = 1, sy do
			local bottom = corner.Y + (iy - 1) * RES
			local centre = bottom + RES / 2
			local matsY, occY = table.create(sz), table.create(sz)
			matsX[iy], occX[iy] = matsY, occY
			for iz = 1, sz do
				local h = heights[ix][iz]
				local fill = math.clamp((h - bottom) / RES, 0, 1)
				if fill > 0 then
					local depth = h - centre
					matsY[iz] = if depth > 8 then Enum.Material.Rock
						elseif depth > 3 then Enum.Material.Ground
						else surfaceMaterial(h, slopes[ix][iz])
					occY[iz] = fill
				elseif centre < WATER_Y then
					matsY[iz] = Enum.Material.Water
					occY[iz] = 1
				else
					matsY[iz] = Enum.Material.Air
					occY[iz] = 0
				end
			end
		end
	end

	Terrain:WriteVoxels(region, RES, materials, occupancy)
end

local half = MAP_SIZE / 2
for x0 = -half, half - CHUNK, CHUNK do
	for z0 = -half, half - CHUNK, CHUNK do
		writeChunk(x0, z0)
	end
end
print("Terrain generated with seed", SEED)
```

## How to use it well
- **Sketch, then sculpt.** Generate a few seeds, keep the best, then hand-edit with Flatten, Smooth and Paint. Generated terrain is a starting point, not a finished map.
- **Gameplay areas first.** After generating, flatten spawn, towns and arenas. Or bake them in: inside `height()`, blend toward a flat value near known points (e.g. `math.lerp`-style mixing by distance to the spawn).
- **Runtime worlds:** run the same code on the server at startup with `task.wait()` after each `writeChunk` so the server doesn't freeze, and finish before players need the area. Terrain edits replicate to clients.
- **Chunk size:** 64 x (RELIEF + 16) x 64 studs is a few thousand voxels per call, far below the 4,194,304 limit, and keeps each call short.
- **Bigger worlds:** lower `FREQ` for wider features; the 256-unit noise period at `FREQ = 1/220` repeats only every ~56,000 studs, far beyond any playable map.
- **Same seed, same world**, as long as the code and constants don't change. Store the seed with your map data.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Terrain Tools, Expanded Terrain and Material Variants]] · [[Procedural Content Framework]] · [[Procedural Vegetation Scatter and Biome Rules]] · [[Real-World Heightmaps - Free DEM Sources and Licenses]]

<!-- TDOD_GRAPH_END -->
