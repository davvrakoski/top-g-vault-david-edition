---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "26_Practical_Luau_Library/04_Spatial_Hash"
title: "Spatial Hash"
tags: ["roblox", "legendary", "production", "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Spatial Hash

A spatial hash avoids checking every NPC against every other object.

```lua
local SpatialHash = {}
SpatialHash.__index = SpatialHash

function SpatialHash.new(cellSize)
    return setmetatable({cellSize=cellSize, cells={}}, SpatialHash)
end

function SpatialHash:_key(p)
    local s=self.cellSize
    return (`{math.floor(p.X/s)}:{math.floor(p.Z/s)}`)
end

function SpatialHash:insert(id, position)
    local key=self:_key(position)
    local cell=self.cells[key] or {}
    self.cells[key]=cell
    cell[id]=position
end

function SpatialHash:clear()
    table.clear(self.cells)
end
```

Production versions usually need move/remove and neighbor-cell queries. Rebuilding a small hash periodically can be simpler than maintaining thousands of individual updates.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Performance - Hub|Performance]]

**Related:** [[Practical Luau Pattern Library]]
