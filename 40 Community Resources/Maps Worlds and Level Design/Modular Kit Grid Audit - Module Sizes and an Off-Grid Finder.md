---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/modular-kit-grid-audit"
title: "Modular Kit Grid Audit - Module Sizes and an Off-Grid Finder"
tags: [roblox, community, level-design, modular-kits, snapping, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/modeling/assemble-modular-environments
  - https://create.roblox.com/docs/education/build-it-play-it-create-and-destroy/snap-to-grid
  - https://create.roblox.com/docs/studio/pivot-tools
  - https://create.roblox.com/docs/reference/engine/classes/ChangeHistoryService
---
# Modular Kit Grid Audit - Module Sizes and an Off-Grid Finder

Modular kits only save time if every piece lands exactly on the grid. One wall that is 0.2 studs off leaves a gap, a z-fighting seam or a ledge that snags the player, and the error spreads as more pieces snap to it. This note covers picking a module size and two command-bar tools: one finds pieces that are off the grid, one snaps them back.

## What Roblox's docs establish
- **Pivots decide snapping.** Roblox's *Assemble modular environments* tutorial explains that parts move from their pivot, which starts in the centre; a rotated 10 x 10 x 1 part moved in 5-stud steps ends up half a stud off. Kits need a **consistent pivot location** (the Modern City kit puts it at the front, lower corner).
- **Module length.** In the Modern City kit, every mesh is at least **7.5 studs** long and every length is divisible by 7.5, with **Move snap 7.5** and **Rotate snap 45** set in the toolbar.
- **Snap settings** live on the Home/Model tab; the Create and Destroy series sets Move to 4 studs for 4 x 4 and 8 x 8 tiles.
- **Move one piece at a time.** With several meshes selected, Studio averages their pivots and the alignment breaks.

## Choosing your module size
| Module | Works well with | Notes |
|---|---|---|
| **4 studs** | Terrain (4-stud voxels), heightmaps (4 studs per pixel) | Easiest to mix with terrain; small for walls |
| **8 studs** | Most building kits, corridors 8 or 16 wide | Popular middle ground; doors fit in one module |
| **7.5 studs** | Roblox's Modern City kit | Use if you build on that kit |
| **16 studs** | City blocks, roads, large tiles | Plot and road grids |

Pick one and write it in the kit's README: module size, pivot rule (e.g. "bottom-front-left corner"), rotate step (90 or 45) and wall thickness. Set Blender's origin to the same corner before export so imported meshes already carry the right pivot (see [[FBX Import Settings, Scale and Collision Fidelity]]).

## Tool 1: find pieces that are off the grid
Select the folder or model that holds your built pieces (or nothing, to scan Workspace). Each direct child Model or Part is treated as one piece.

```lua
-- Command bar (edit mode)
local Selection = game:GetService("Selection")

local GRID = 8      -- your module size in studs
local ROT_STEP = 90 -- degrees; use 45 if your kit allows diagonals
local EPS = 0.001

local root = Selection:Get()[1] or workspace

local function offStep(value: number, step: number): boolean
	local r = value / step
	return math.abs(r - math.round(r)) * step > EPS
end

local function check(piece: PVInstance): string?
	local cf = piece:GetPivot()
	local p = cf.Position
	if offStep(p.X, GRID) or offStep(p.Z, GRID) then
		return string.format("position (%.3f, %.3f, %.3f)", p.X, p.Y, p.Z)
	end
	local rx, ry, rz = cf:ToOrientation()
	for _, a in { rx, ry, rz } do
		if offStep(math.deg(a), ROT_STEP) then
			return string.format("rotation (%.2f, %.2f, %.2f)", math.deg(rx), math.deg(ry), math.deg(rz))
		end
	end
	return nil
end

local bad = {}
for _, piece in root:GetChildren() do
	if piece:IsA("Model") or piece:IsA("BasePart") then
		local problem = check(piece)
		if problem then
			table.insert(bad, piece)
			print(piece:GetFullName(), "->", problem)
		end
	end
end
Selection:Set(bad)
print(#bad, "pieces off the grid (now selected)")
```

Y is not checked on purpose; many kits stack floors at their own height step. Add a Y check with your floor height if yours is fixed.

## Tool 2: snap the selected pieces back (undoable)
```lua
-- Command bar (edit mode). Select pieces first (Tool 1 selects them for you).
local Selection = game:GetService("Selection")
local ChangeHistoryService = game:GetService("ChangeHistoryService")

local GRID, ROT_STEP = 8, 90

local function snap(v: number, step: number): number
	return math.round(v / step) * step
end

local rec = ChangeHistoryService:TryBeginRecording("SnapPiecesToGrid")
for _, piece in Selection:Get() do
	if piece:IsA("PVInstance") then
		local cf = piece:GetPivot()
		local p = cf.Position
		local _, ry, _ = cf:ToOrientation()
		local yaw = math.rad(snap(math.deg(ry), ROT_STEP))
		piece:PivotTo(CFrame.new(snap(p.X, GRID), p.Y, snap(p.Z, GRID)) * CFrame.Angles(0, yaw, 0))
	end
end
if rec then ChangeHistoryService:FinishRecording(rec, Enum.FinishRecordingOperation.Commit) end
```

This keeps only yaw (rotation around Y), which is right for walls, floors and props that stand upright. Don't run it on pieces that are meant to be tilted.

## Habits that prevent drift
- Build from one anchor piece and copy its position values, as the official tutorial suggests.
- Keep snap on while building; turn it off only for set dressing (props, clutter), which lives in a separate folder from the kit.
- Run Tool 1 before every layout lock and before converting a building into a package.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Assemble modular environments]] · [[Modular Kits from the Kenney FBX Library]] · [[Pivot tools]] · [[Scale in Studs - Real-World Sizes Converted]]

<!-- TDOD_GRAPH_END -->
