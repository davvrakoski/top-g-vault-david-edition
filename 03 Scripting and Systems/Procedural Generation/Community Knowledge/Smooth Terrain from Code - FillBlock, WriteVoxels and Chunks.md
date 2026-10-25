---
area: "03 Scripting and Systems"
cluster: "Procedural Generation"
title: "Smooth Terrain from Code - FillBlock, WriteVoxels and Chunks"
tags: [roblox, community-knowledge, procedural, terrain, voxels, writevoxels, chunks]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://create.roblox.com/docs/reference/engine/datatypes/Region3
---
# Smooth Terrain from Code - FillBlock, WriteVoxels and Chunks

Generating Roblox smooth terrain from a script is how procedural islands, destructible ground, mining games and randomized biomes get built. There are two families of API: **shape fills** (`FillBlock`, `FillBall`, `FillCylinder`, `FillWedge`, `FillRegion`) that are easy but slow for big areas, and **voxel arrays** (`WriteVoxels`, `WriteVoxelChannels`) that write a whole region in one call. Knowing the grid rules and the size limit saves hours of "Region not aligned" errors.

## Grid facts (from the Terrain reference)

- Terrain is a grid of **4 x 4 x 4 stud cells**. Cell `(x, y, z)` has its corner at `(x*4, y*4, z*4)` studs; `CellCenterToWorld` adds `(2, 2, 2)`.
- Editable extent: cells -32,000 to 32,000 on each axis (about +/-128,000 studs).
- Every voxel API takes `resolution` and it **must be 4**.
- Regions must be **aligned to the voxel grid**: use `Region3:ExpandToGrid(4)`.
- One `WriteVoxels` / `ReadVoxels` / `*VoxelChannels` call is limited to **4,194,304 voxels** (for example 256 x 64 x 256).

## Shape fills: quick and readable

| Call | Use |
| --- | --- |
| `FillBlock(cframe, size, material)` | rotated boxes: platforms, ramps, cliff blocks |
| `FillBall(center, radius, material)` | blobs, craters (fill with `Air` to dig) |
| `FillCylinder(cframe, height, radius, material)` | pillars, tunnels |
| `FillWedge(cframe, size, material)` | slopes |
| `FillRegion(region, 4, material)` | axis-aligned full-occupancy fill |

Digging is just filling with `Enum.Material.Air`. `ReplaceMaterial(region, 4, from, to)` repaints (for example grass to snow above an altitude).

Shape fills are fine for dozens of calls. For a heightmap of 256 x 256 columns, calling `FillBlock` per column is 65,536 calls; use voxel arrays instead.

## Voxel arrays: WriteVoxels

`WriteVoxels(region, 4, materials, occupancy)` takes two **3D arrays** indexed `[x][y][z]` whose sizes exactly match the region in voxels. Occupancy is 0..1 per voxel; fractional occupancy is what makes the surface smooth instead of blocky.

```lua
-- own example: one chunk of heightmap terrain
local function writeChunk(cx: number, cz: number, size: number, heightAt: (number, number) -> number)
	local maxY = 32 -- voxels tall (128 studs)
	local origin = Vector3.new(cx * size * 4, 0, cz * size * 4)
	local region = Region3.new(origin, origin + Vector3.new(size * 4, maxY * 4, size * 4)):ExpandToGrid(4)
	local mats, occ = {}, {}
	for x = 1, size do
		mats[x], occ[x] = {}, {}
		for y = 1, maxY do
			mats[x][y], occ[x][y] = {}, {}
			for z = 1, size do
				local h = heightAt(origin.X / 4 + x, origin.Z / 4 + z) -- height in voxels
				local fill = math.clamp(h - (y - 1), 0, 1) -- partial top voxel = smooth surface
				occ[x][y][z] = fill
				mats[x][y][z] = if fill > 0 then (if y > 20 then Enum.Material.Rock else Enum.Material.Grass) else Enum.Material.Air
			end
		end
	end
	workspace.Terrain:WriteVoxels(region, 4, mats, occ)
end
```

`WriteVoxelChannels(region, 4, { SolidMaterial = ..., SolidOccupancy = ..., LiquidOccupancy = ... })` writes only the channels you pass, which is how you add water without touching solid terrain; `ReadVoxelChannels` is its inverse.

## Chunking strategy

1. Choose a chunk size well under the voxel cap: 32 x 32 columns x 32-64 tall is a comfortable unit.
2. Generate chunks in rings around spawn (closest first), yielding with `task.wait()` between chunks so the server keeps ticking.
3. Compute arrays in Parallel Luau if you need speed; the `WriteVoxels` call itself is marked thread-unsafe, so synchronize before writing ([[Parallel Luau Actors - A Worked Example]]).
4. Pair with StreamingEnabled for large maps so clients receive terrain near them.

## Destruction and mining
- Explosions: `FillBall(pos, r, Air)` on the server; or set `Explosion.ExplosionType` to allow craters ([[Explosions - BlastPressure, Joint Radius and Custom Damage]]).
- Mining games: read the voxel under the tool with `ReadVoxels` on a single-cell region to know what material was mined before clearing it.
- Rate-limit client-triggered terrain edits; each edit replicates to every player.

## Related
[[Procedural Generation - Hub]] · [[Fractal Noise Terrain with math.noise - Octaves, Redistribution and Islands]] · [[Real-World Heightmaps - Free DEM Sources and Licenses]] · [[Procedural Content Framework]]
