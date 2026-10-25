---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Hex Grids - Axial Coordinates, Distance and Rounding"
tags: [roblox, community-knowledge, math, hex-grid, strategy, procedural]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.redblobgames.com/grids/hexagons/
  - https://create.roblox.com/docs/reference/engine/libraries/math
---
# Math - Hex Grids - Axial Coordinates, Distance and Rounding

Hex grids give every tile six equal neighbours, which makes movement ranges look round and fair. They suit strategy games, board-game style maps, territory control and hex-tile terrain. The standard reference is Red Blob Games' hexagon guide; this note is the minimum subset translated to Roblox's X/Z ground plane in our own Luau.

## Pick a coordinate system: axial

Store each hex as two integers `(q, r)`. The implied third cube coordinate is `s = -q - r`. Axial is compact for tables and makes distance and neighbours trivial; offset coordinates ("odd rows shifted") look natural in a 2D array but complicate every formula.

## Pointy-top hex to world position (own code)

`SIZE` is the distance from centre to a corner, in studs.

```lua
local SIZE = 6
local SQRT3 = math.sqrt(3)
local function hexToWorld(q: number, r: number, y: number): Vector3
	local x = SIZE * (SQRT3 * q + SQRT3 / 2 * r)
	local z = SIZE * (1.5 * r)
	return Vector3.new(x, y, z)
end
```

For flat-top hexes swap the roles: `x = SIZE * 1.5 * q`, `z = SIZE * (SQRT3/2 * q + SQRT3 * r)`.

## World position to hex (with cube rounding)

```lua
local function cubeRound(fq: number, fr: number): (number, number)
	local fs = -fq - fr
	local q, r, s = math.round(fq), math.round(fr), math.round(fs)
	local dq, dr, ds = math.abs(q - fq), math.abs(r - fr), math.abs(s - fs)
	if dq > dr and dq > ds then
		q = -r - s
	elseif dr > ds then
		r = -q - s
	end
	return q, r
end
local function worldToHex(p: Vector3): (number, number)
	local fq = (SQRT3 / 3 * p.X - 1 / 3 * p.Z) / SIZE
	local fr = (2 / 3 * p.Z) / SIZE
	return cubeRound(fq, fr)
end
```

Rounding each coordinate separately breaks the `q + r + s = 0` rule near edges; fixing the one with the biggest rounding error is what makes clicks pick the correct tile.

## Neighbours and distance

```lua
local DIRS = {{1,0},{1,-1},{0,-1},{-1,0},{-1,1},{0,1}}
local function hexDistance(q1, r1, q2, r2)
	local dq, dr = q1 - q2, r1 - r2
	return (math.abs(dq) + math.abs(dq + dr) + math.abs(dr)) / 2
end
```

All tiles within range `N`: loop `q` from `-N` to `N`, and `r` from `math.max(-N, -q - N)` to `math.min(N, -q + N)`. That gives the hexagon-shaped area (`3N(N+1) + 1` tiles).

## Building the tiles in Roblox

- A hex prism mesh (MeshPart) sized to the same `SIZE` keeps visuals and math in sync. Pointy-top width is `SQRT3 * SIZE`, height `2 * SIZE`.
- Store tile data in a table keyed by `q .. "," .. r`; keep Instances separate from data so saving does not serialize parts.
- Hover highlighting: raycast the mouse to the ground plane, run `worldToHex`, and highlight that key.

## Pitfalls

- Decide pointy-top vs flat-top once; mixing them flips every formula.
- If the grid sits on a rotated board, convert with `board.CFrame:PointToObjectSpace` before `worldToHex`.
- Pathfinding on hexes: use `hexDistance` as the A* heuristic; it is exact for uniform-cost tiles.

## Related
[[Math Geometry - Hub]] · [[Math - Square Grids - World to Cell, Neighbours and Chunk Keys]] · [[Tile Grid Generation with Adjacency Rules]] · [[Kenney - Hexagon Kit]]
