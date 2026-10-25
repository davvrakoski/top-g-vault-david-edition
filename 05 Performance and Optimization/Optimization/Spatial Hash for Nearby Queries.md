---
area: "05 Performance and Optimization"
cluster: "Optimization"
source_note: "05_Performance_Engineering/05_Spatial_Hash_Pattern"
title: "Spatial Hash for Nearby Queries"
tags: [roblox, premium, "cluster/optimization"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Spatial Hash for Nearby Queries

A spatial hash reduces "compare everything to everything" work.

```luau
--!strict
local SpatialHash = {}
SpatialHash.__index = SpatialHash

local function key(x: number, z: number): string
    return x .. ":" .. z
end

function SpatialHash.new(cellSize: number)
    return setmetatable({cellSize = cellSize, cells = {}}, SpatialHash)
end

function SpatialHash:_coords(position: Vector3): (number, number)
    return math.floor(position.X / self.cellSize), math.floor(position.Z / self.cellSize)
end

function SpatialHash:Insert(id: any, position: Vector3)
    local x, z = self:_coords(position)
    local k = key(x, z)
    self.cells[k] = self.cells[k] or {}
    self.cells[k][id] = position
end

function SpatialHash:Query(position: Vector3, radius: number): {any}
    local minX, minZ = self:_coords(position - Vector3.new(radius, 0, radius))
    local maxX, maxZ = self:_coords(position + Vector3.new(radius, 0, radius))
    local results = {}
    for x = minX, maxX do
        for z = minZ, maxZ do
            local cell = self.cells[key(x, z)]
            if cell then
                for id, p in cell do
                    if (p - position).Magnitude <= radius then
                        table.insert(results, id)
                    end
                end
            end
        end
    end
    return results
end

return SpatialHash
```

For moving entities, update/remove cell membership. For very large scale, consider more specialized structures or maintained libraries.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Optimization - Hub]]

**Related notes:** [[Instance Streaming Deep Dive]] · [[Production Labs]] · [[Object Pooling Without Making a Mess]] · [[Memory Leaks and Lifecycle Management]]

<!-- TDOD_GRAPH_END -->
