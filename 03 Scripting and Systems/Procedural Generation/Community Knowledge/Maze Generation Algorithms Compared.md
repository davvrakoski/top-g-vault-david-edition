---
area: "03 Scripting and Systems"
cluster: "Procedural Generation"
title: "Maze Generation Algorithms Compared"
tags: [roblox, community-knowledge, procedural, maze, algorithms, horror, level-design]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://weblog.jamisbuck.org/2011/2/7/maze-generation-algorithm-recap
---
# Maze Generation Algorithms Compared

Mazes power a whole Roblox genre: horror escape maps, backrooms, corn mazes, labyrinth obbies, dungeon corridors. The algorithm you pick decides how the maze *feels*: long winding corridors are tense and disorienting, many short dead ends are frustrating but good for hiding loot. Jamis Buck's well-known recap of eleven algorithms is the best quick comparison; this note distills it into a decision table and a Roblox build recipe.

## What each algorithm feels like

| Algorithm | Character | Implementation |
| --- | --- | --- |
| **Recursive backtracker** (depth-first) | long, winding passages, few dead ends | easy, fast; the author's long-time default |
| **Hunt-and-kill** | similar long passages; rescans grid at dead ends | easy, slower on big grids |
| **Randomized Prim's** | many short cul-de-sacs, "bushy" | straightforward |
| **Randomized Kruskal's** | many short dead ends, uniform-looking | needs a union-find structure |
| **Growing tree** | tunable: newest-cell choice = backtracker, random choice = Prim's, mixes in between | the author's later favourite |
| **Eller's** | row by row, can make infinitely long mazes | hardest to implement |
| **Wilson's / Aldous-Broder** | unbiased (every maze equally likely) | Aldous-Broder very slow; Wilson's faster |
| **Binary tree** | strong diagonal bias, two open edges | trivial; can stream infinitely |
| **Sidewinder** | less bias, one long open row | simple, row-based |
| **Recursive division** | adds walls instead of carving; fractal, boxy rooms | simple, good for building-like layouts |

## Picking for gameplay

- **Horror chase map:** growing tree with ~75% "newest" and ~25% "random" choice: long corridors with some branching so the monster can be evaded.
- **Treasure / exploration maze:** Prim's or Kruskal's; lots of dead ends to place loot and secrets.
- **Endless runner corridor:** Eller's or sidewinder, generated row by row ahead of the player and destroyed behind.
- **Office / backrooms:** recursive division, then knock out extra walls.

## Making mazes fun (beyond "perfect" mazes)

All algorithms above make **perfect mazes**: exactly one path between any two cells, no loops. Pure perfect mazes are dull to play. After generating:
1. **Braid**: remove a percentage (10-30%) of dead ends by opening one wall, creating loops so players can circle a pursuer.
2. **Rooms**: clear a few 3x3 areas for set pieces.
3. **Landmarks**: unique props at junctions so players can navigate ([[Wayfinding with Landmarks and Weenies]]).
4. Place the exit at the cell **farthest from spawn** (one breadth-first search over the cells gives distances).

## Recursive backtracker in Luau (own code)

```lua
local function carve(w: number, h: number, rng: Random)
	local visited, walls = {}, {} -- walls[cellIndex] = {N=true,E=true,S=true,W=true}
	local DIRS = { { 0, -1, "N", "S" }, { 1, 0, "E", "W" }, { 0, 1, "S", "N" }, { -1, 0, "W", "E" } }
	local function idx(x, y) return y * w + x end
	for i = 0, w * h - 1 do walls[i] = { N = true, E = true, S = true, W = true } end

	local stack = { { 0, 0 } }
	visited[idx(0, 0)] = true
	while #stack > 0 do
		local cx, cy = stack[#stack][1], stack[#stack][2]
		local options = {}
		for _, d in DIRS do
			local nx, ny = cx + d[1], cy + d[2]
			if nx >= 0 and ny >= 0 and nx < w and ny < h and not visited[idx(nx, ny)] then
				table.insert(options, d)
			end
		end
		if #options == 0 then
			table.remove(stack) -- backtrack
		else
			local d = options[rng:NextInteger(1, #options)]
			local nx, ny = cx + d[1], cy + d[2]
			walls[idx(cx, cy)][d[3]] = false
			walls[idx(nx, ny)][d[4]] = false
			visited[idx(nx, ny)] = true
			table.insert(stack, { nx, ny })
		end
	end
	return walls
end
```

An explicit stack avoids recursion depth limits on large grids.

## Building it in Roblox
- Cell size 12-16 studs for characters (corridors at least 3x a character's width for chases).
- Merge wall runs: one long part per straight wall segment instead of one per cell edge, cutting part count a lot.
- Anchor everything, set `CanTouch`/`CanQuery` off on decorative trim.
- Seed with a stored seed for replayable layouts ([[Seeded Random - Deterministic Worlds with Random.new]]).

## Related
[[Procedural Generation - Hub]] · [[Procedural Dungeon and Room Generation]] · [[Wave Function Collapse on Tile Grids]] · [[Horror Map Design - Pacing, Loops and Readable Darkness]]
