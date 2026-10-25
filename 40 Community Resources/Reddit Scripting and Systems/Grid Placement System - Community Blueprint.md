---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/grid-placement-system"
title: "Grid Placement System - Community Blueprint"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/creating-a-furniture-placement-system/205509
  - https://devforum.roblox.com/t/how-do-i-fix-my-grid-block-placing-system/4680509
cssclasses: [tg-a40]
---

# Grid Placement System - Community Blueprint

Tycoons, base builders and house games all need "place furniture on a grid, rotate it, save it." The reference everyone still links is @EgoMoose's **Creating A Furniture Placement System** (2018, ~2,000 likes, 144k views), originally from Scripting Helpers.

## The architecture it teaches

1. **Client previews, server places.** The client moves a ghost model under the mouse; on click it sends *what* and *where* (item id, CFrame). The server re-validates and spawns the real model.
2. **Work in the canvas's local space.** Convert the mouse hit to the plot's object space, snap there, convert back. This makes rotated plots work for free.
3. **Clamp to the canvas** using the model's footprint so items can't hang off the edge.
4. **Save as relative data**: item id + CFrame relative to the plot, so a player's base loads onto whichever plot they get next time.

## Gotchas raised in the thread

- **Grid offset**: items don't center under the mouse because they lock to the grid; @EgoMoose's answer was to set the grid unit to 0 to follow the mouse exactly.
- **Non-90-degree rotation**: the simple math assumes axis-aligned rotation; for arbitrary angles you must compute the model's **world-space bounding box** before clamping.
- **Offset grids (2026 block-building thread)**: @Tem9v's fix for a Y grid that felt inconsistent: subtract the offset *before* snapping and add it back *after*. And instead of magic offsets like 0.375, compute height as "bottom of the new block on top of the part that was hit."
- **Placing on the side of a block**: use the raycast's surface normal (`RaycastResult.Normal`) and step one grid cell along it from the hit block, instead of always stacking on top.

## Own snapping core

```lua
--!strict
local GRID = 2

-- canvas: the plot part (top surface is the build plane)
-- hitPos: world position under the mouse
-- size: model footprint (X, Z) after rotation
-- rotation: 0, 90, 180 or 270 degrees
local function snapToCanvas(canvas: BasePart, hitPos: Vector3, size: Vector2, rotation: number): CFrame
	local rotated = (rotation % 180 ~= 0)
	local footprint = if rotated then Vector2.new(size.Y, size.X) else size

	local localPos = canvas.CFrame:PointToObjectSpace(hitPos)
	local half = Vector2.new(canvas.Size.X, canvas.Size.Z) / 2
	local maxX = half.X - footprint.X / 2
	local maxZ = half.Y - footprint.Y / 2

	local x = math.clamp(math.round(localPos.X / GRID) * GRID, -maxX, maxX)
	local z = math.clamp(math.round(localPos.Z / GRID) * GRID, -maxZ, maxZ)
	local y = canvas.Size.Y / 2

	return canvas.CFrame * CFrame.new(x, y, z) * CFrame.Angles(0, math.rad(rotation), 0)
end
```

Place the model so its bottom sits at the returned CFrame (offset by half its height), and on the server recompute `snapToCanvas` from the sent position instead of trusting the client's CFrame. Also check the player owns the plot and the item, and test overlap with `GetPartBoundsInBox` before spawning.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Remote Payload Validation]] · [[Save Schema Migration Blueprint]] · [[DataStore Production Patterns]] · [[Anti-Dupe Transaction Blueprint]]

<!-- TDOD_GRAPH_END -->
