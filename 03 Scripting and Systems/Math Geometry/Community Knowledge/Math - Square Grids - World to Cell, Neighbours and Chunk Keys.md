---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Square Grids - World to Cell, Neighbours and Chunk Keys"
tags: [roblox, community-knowledge, math, grids, building, spatial-hash]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/libraries/math
  - https://create.roblox.com/docs/reference/engine/datatypes/Vector3
  - https://www.redblobgames.com/grids/parts/
---
# Math - Square Grids - World to Cell, Neighbours and Chunk Keys

Tycoon plots, farming tiles, build modes, tower-defense placement, inventory slots and spatial lookups ("which zombies are near me") all sit on a square grid. The math is small, but off-by-half errors (blocks snapping to cell corners instead of centres) and negative-coordinate bugs are common. This note collects the conversions and the data layout that keep a grid fast.

## World position to cell and back (own code)

```lua
local CELL = 4 -- studs
local function toCell(p: Vector3): (number, number)
	return math.floor(p.X / CELL), math.floor(p.Z / CELL)
end
local function cellCenter(cx: number, cz: number, y: number): Vector3
	return Vector3.new((cx + 0.5) * CELL, y, (cz + 0.5) * CELL)
end
```

- Use `math.floor`, never truncation (`// ` is fine, it floors too). `-0.5 / 4` must land in cell -1, not 0.
- The `+ 0.5` puts objects in the centre. Without it parts snap to grid **lines**, which looks fine for 1x1 items and wrong for odd-sized ones.

## Placing items bigger than one cell

For an item `w x d` cells anchored at its minimum cell `(cx, cz)`, its centre is `((cx + w/2) * CELL, y, (cz + d/2) * CELL)`. When the player rotates by 90 degrees, swap `w` and `d` before computing the footprint.

## Grid relative to a plot

Plots are usually rotated or offset. Convert into plot space first:

```lua
local localPos = plotCFrame:PointToObjectSpace(worldPos)
local cx, cz = toCell(localPos)
-- ...and back:
local world = plotCFrame:PointToWorldSpace(cellCenter(cx, cz, 0))
```

Now the same save data (cell indices) works for every plot and every rotation.

## Keys for tables

| Key style | Example | Notes |
| --- | --- | --- |
| String | `cx .. "," .. cz` | readable, fine for saves and a few thousand cells |
| Packed number | `cx * 65536 + cz` with an offset | faster lookups, keep `cz` in 0..65535 by adding a bias |
| Nested | `grid[cx][cz]` | easy iteration by row, needs nil checks |
| `Vector3` key | `Vector3.new(cx, 0, cz)` | Vector3 values hash by value in Luau, convenient (verify in your build) |

## Neighbours and distances

```lua
local N4 = {{1,0},{-1,0},{0,1},{0,-1}}
local N8 = {{1,0},{-1,0},{0,1},{0,-1},{1,1},{1,-1},{-1,1},{-1,-1}}
```

- 4-neighbour movement distance is **Manhattan**: `|dx| + |dz|`.
- 8-neighbour with equal diagonal cost is **Chebyshev**: `math.max(|dx|, |dz|)`.
- Diagonals costing `sqrt(2)` match Euclidean movement better for pathfinding heuristics.

## Chunks and spatial hashing

Group cells into chunks of `C x C` (for example 16): `chunkX = cx // C`. Store entities by chunk key, then a "who is near" query only checks the 3x3 chunks around the player instead of every entity on the server. This is the same trick used for streaming custom terrain and for culling NPC updates.

## Pitfalls

- Floating-point: 0.1-stud grids drift. Keep cell sizes as integers or powers of two, and store indices, not world positions.
- Validate placement on the server: recompute the cell from the requested position and reject overlaps there.
- Do not mix "cell index" and "cell centre" in the same variable name; name them `cx` vs `centerPos`.

## Related
[[Math Geometry - Hub]] · [[Grid Placement System - Community Blueprint]] · [[Modular Kits and Grid Snapping in Studs]] · [[Math - Hex Grids - Axial Coordinates, Distance and Rounding]]
