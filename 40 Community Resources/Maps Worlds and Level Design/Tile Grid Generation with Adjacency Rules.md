---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/tile-grid-adjacency-generation"
title: "Tile Grid Generation with Adjacency Rules"
tags: [roblox, community, procedural, wfc, tiles, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://github.com/mxgmn/WaveFunctionCollapse
  - https://devforum.roblox.com/t/problem-with-room-generation/3971134
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://create.roblox.com/docs/reference/engine/classes/PVInstance#PivotTo
---
# Tile Grid Generation with Adjacency Rules

Room chains ([[Room-Chain Generation with Connector Attachments]]) grow outward from a door. Tile grids work the other way: you have a fixed grid (a town, a maze, a dungeon floor), a set of tiles whose edges must match, and the generator fills the grid so every neighbour fits. This is the "simple tiled model" from Maxim Gumin's well-known **WaveFunctionCollapse** project (GitHub; its license is not a standard one, so this note uses only the idea, with original Luau).

On the DevForum, Denneisk's reply in *Problem with room generation* (2025) describes the grid route too: place points of interest on a grid, carve paths, then fill tiles to match the directions.

## The idea in four steps
1. Every cell starts with **all tiles possible**.
2. Pick the cell with the **fewest options** and **collapse** it to one tile (random, weighted).
3. **Propagate**: remove options from neighbours whose edges no longer match, and keep spreading.
4. Repeat until every cell has one tile. If a cell runs out of options (a contradiction), restart with the next seed.

## Tiles with edge sockets
Each tile lists what is on its North, East, South and West edge. Two neighbours fit when the touching edges have the same socket. Rotations are generated automatically.

```lua
-- ServerScriptService/TileGrid (ModuleScript)
local TileGrid = {}

type Sockets = { N: string, E: string, S: string, W: string }
type Tile = { name: string, sockets: Sockets, rot: number, weight: number }

-- Rotate 90 degrees clockwise (seen from above): what was on the West edge is now North.
local function rotate(s: Sockets): Sockets
	return { N = s.W, E = s.N, S = s.E, W = s.S }
end

-- defs: { { name = "Road_Straight", sockets = {N="road",E="grass",S="road",W="grass"}, weight = 2, rotations = 2 }, ... }
function TileGrid.expand(defs): { Tile }
	local tiles = {}
	for _, def in defs do
		local s = def.sockets
		for r = 0, (def.rotations or 1) - 1 do
			table.insert(tiles, { name = def.name, sockets = s, rot = r, weight = def.weight or 1 })
			s = rotate(s)
		end
	end
	return tiles
end

local DIRS = {
	{ dx = 0, dy = -1, side = "N", other = "S" },
	{ dx = 1, dy = 0, side = "E", other = "W" },
	{ dx = 0, dy = 1, side = "S", other = "N" },
	{ dx = -1, dy = 0, side = "W", other = "E" },
}

local function solveOnce(tiles: { Tile }, w: number, h: number, rng: Random): { number }?
	local cells: { { [number]: boolean } } = {}
	for i = 1, w * h do
		local all = {}
		for t = 1, #tiles do all[t] = true end
		cells[i] = all
	end
	local function index(x: number, y: number) return (y - 1) * w + x end
	local function count(set) local n = 0 for _ in set do n += 1 end return n end

	local function propagate(sx: number, sy: number): boolean
		local stack = { { sx, sy } }
		while #stack > 0 do
			local cx, cy = table.unpack(table.remove(stack))
			local here = cells[index(cx, cy)]
			for _, d in DIRS do
				local nx, ny = cx + d.dx, cy + d.dy
				if nx >= 1 and nx <= w and ny >= 1 and ny <= h then
					local there = cells[index(nx, ny)]
					local changed = false
					for t in there do
						local fits = false
						for s in here do
							if tiles[s].sockets[d.side] == tiles[t].sockets[d.other] then
								fits = true
								break
							end
						end
						if not fits then
							there[t] = nil -- clearing a field during traversal is allowed
							changed = true
						end
					end
					if changed then
						if next(there) == nil then return false end -- contradiction
						table.insert(stack, { nx, ny })
					end
				end
			end
		end
		return true
	end

	while true do
		-- Find the undecided cell with the fewest options (tiny random tie-break).
		local bestI, bestScore = nil, math.huge
		for i, set in cells do
			local n = count(set)
			if n > 1 then
				local score = n + rng:NextNumber() * 0.1
				if score < bestScore then bestI, bestScore = i, score end
			end
		end
		if not bestI then break end -- all decided

		-- Weighted pick among the remaining options.
		local set, total = cells[bestI], 0
		for t in set do total += tiles[t].weight end
		local roll, chosen = rng:NextNumber(0, total), nil
		for t in set do
			roll -= tiles[t].weight
			chosen = t
			if roll <= 0 then break end
		end
		cells[bestI] = { [chosen] = true }
		local x, y = (bestI - 1) % w + 1, (bestI - 1) // w + 1
		if not propagate(x, y) then return nil end
	end

	local result = {}
	for i, set in cells do result[i] = next(set) end
	return result
end

-- Returns an array of tile indices (row by row) or nil after maxTries contradictions.
function TileGrid.solve(tiles: { Tile }, w: number, h: number, seed: number, maxTries: number?): { number }?
	for attempt = 0, (maxTries or 20) - 1 do
		local result = solveOnce(tiles, w, h, Random.new(seed + attempt))
		if result then return result end
	end
	return nil
end

-- Clone ServerStorage.Tiles[<name>] for each cell. N is -Z, E is +X; clockwise = negative yaw.
function TileGrid.build(tiles: { Tile }, result: { number }, w: number, tileSize: number, origin: CFrame, folder: Instance)
	local templates = game:GetService("ServerStorage"):WaitForChild("Tiles")
	for i, t in result do
		local tile = tiles[t]
		local x, y = (i - 1) % w, (i - 1) // w
		local model = templates[tile.name]:Clone()
		model:PivotTo(origin * CFrame.new(x * tileSize, 0, y * tileSize) * CFrame.Angles(0, -tile.rot * math.pi / 2, 0))
		model.Parent = folder
	end
end

return TileGrid
```

## Using it
```lua
local TileGrid = require(script.Parent.TileGrid)
local tiles = TileGrid.expand({
	{ name = "Grass",         sockets = { N = "g", E = "g", S = "g", W = "g" }, weight = 6 },
	{ name = "Road_Straight", sockets = { N = "r", E = "g", S = "r", W = "g" }, weight = 2, rotations = 2 },
	{ name = "Road_Corner",   sockets = { N = "r", E = "r", S = "g", W = "g" }, weight = 1, rotations = 4 },
	{ name = "Road_T",        sockets = { N = "r", E = "r", S = "g", W = "r" }, weight = 0.5, rotations = 4 },
})
local result = TileGrid.solve(tiles, 12, 12, 2026)
if result then
	local folder = Instance.new("Folder")
	folder.Name = "Town"
	folder.Parent = workspace
	TileGrid.build(tiles, result, 12, 32, CFrame.new(0, 0, 0), folder)
end
```

## Tips
- **Build tile models so a rotation of 0 matches the sockets you wrote**, with the pivot at the tile centre. Rotations are applied around that pivot.
- **Borders:** to stop roads running off the edge, pre-restrict edge cells to tiles whose outward socket is "g" before solving (or add a border socket).
- **Weights shape the look.** More Grass weight = sparser roads. Very low weights on special tiles make them rare landmarks.
- **Guarantee connectivity** separately: this algorithm only ensures neighbours match, not that every road connects. Flood-fill the result and re-roll if your critical path is broken.
- Grids larger than ~40 x 40 get slow with this simple version because it rescans all cells each step; generate in chunks or keep a priority list if you need big maps.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Procedural Systems and Geometry]] · [[Procedural Content Framework]] · [[Room-Chain Generation with Connector Attachments]] · [[Modular Kit Grid Audit - Module Sizes and an Off-Grid Finder]]

<!-- TDOD_GRAPH_END -->
