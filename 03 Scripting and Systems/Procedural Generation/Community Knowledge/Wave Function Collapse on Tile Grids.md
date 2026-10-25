---
area: "03 Scripting and Systems"
cluster: "Procedural Generation"
title: "Wave Function Collapse on Tile Grids"
tags: [roblox, community-knowledge, procedural, wfc, wave-function-collapse, tiles, constraints]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/mxgmn/WaveFunctionCollapse
---
# Wave Function Collapse on Tile Grids

Wave Function Collapse (WFC), popularized by Maxim Gumin's open-source repository, generates layouts that obey **local adjacency rules**: a road piece must connect to a road, a wall corner must meet two walls, water borders only shore. For Roblox this fits modular kits (city blocks, dungeon rooms, backrooms-style mazes, sky islands) where you have a set of tile models and want endless valid combinations without hand-placing them. It is not a full level designer: it guarantees local consistency, not good pacing, so pair it with a room-graph approach for gameplay structure ([[Procedural Dungeon and Room Generation]]).

**License note:** the reference repository includes a LICENSE file; it is widely reported as MIT, but we did not confirm the text (unverified). Treat it as **link only** and write your own Luau implementation from the algorithm description.

## The algorithm (simple tiled model)

1. **Tiles and rules.** Each tile has an id, an optional weight, and for each side a list of tiles allowed next to it (or a "socket" label that must match).
2. **Wave.** Every grid cell starts with all tiles possible.
3. **Observe.** Pick the cell with the **lowest non-zero entropy** (fewest remaining options, weighted). Break ties randomly.
4. **Collapse.** Choose one tile for that cell, randomly by weight.
5. **Propagate.** Remove now-impossible options from neighbours; any neighbour that changed pushes its own neighbours onto a stack, until nothing changes.
6. **Repeat** until all cells are collapsed (success) or some cell has zero options (**contradiction**).

The original implementation has **no backtracking**: a contradiction ends the run. The README notes contradictions are surprisingly rare in practice, but they happen, so plan for them.

The "overlapping model" (learning NxN patterns, typically 3x3, from a sample image) is powerful for textures but overkill for most Roblox tile kits; start with the simple tiled model.

## Sockets: the practical way to write rules

Instead of listing every allowed pair, label each tile edge:

| Tile | North | East | South | West |
| --- | --- | --- | --- | --- |
| Road straight | road | grass | road | grass |
| Road corner | road | road | grass | grass |
| Grass | grass | grass | grass | grass |

Two tiles may touch if the facing sockets match. Generate rotated variants automatically (rotate the socket list and the model by 90 degrees), which quadruples your kit for free.

## Luau data shape (own sketch)

```lua
type Tile = { id: string, weight: number, sockets: { string } } -- N, E, S, W
-- wave[cellIndex] = { [tileId] = true, ... }

local OPPOSITE = { 3, 4, 1, 2 }
local function compatible(a: Tile, b: Tile, dir: number): boolean
	return a.sockets[dir] == b.sockets[OPPOSITE[dir]]
end
```

Precompute, for every tile and direction, the set of compatible neighbours once. Propagation then becomes set intersection, which is where all the speed comes from.

## Handling contradictions

- **Restart** with a new seed (cheap for small grids, the usual first approach).
- **Chunk and retry**: generate in 8x8 chunks, retry only the failing chunk with fixed borders.
- **Backtracking** (save state at each collapse, undo on failure) is more robust but more code and memory.
- **Pre-seed** important cells (spawn room, exits) before running, so the solver builds around them.

## Roblox-specific tips

- Build tiles as Models with a consistent pivot at the cell centre and size multiple of 4 studs if you mix with terrain.
- Solve on the server with a seeded `Random`, then spawn models over several frames (`task.wait()` every N tiles) to avoid a long hitch.
- Store only `seed + tile kit version` to rebuild the same layout later ([[Seeded Random - Deterministic Worlds with Random.new]]).
- Validate the result: run a flood fill to check every walkable cell is reachable from spawn, and regenerate if not.

## Related
[[Procedural Generation - Hub]] · [[Procedural Dungeon and Room Generation]] · [[Maze Generation Algorithms Compared]] · [[Procedural Content Framework]]
