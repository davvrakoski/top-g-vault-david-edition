---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Terrain Voxel Channels - ReadVoxelChannels, WriteVoxelChannels and Chunked Edits"
tags: [roblox, community-knowledge, terrain, voxels, scripting, water]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://create.roblox.com/docs/reference/engine/datatypes/Region3
  - https://devforum.roblox.com/t/how-to-load-terrain-in-chunks/3293384
  - https://devforum.roblox.com/t/incrementally-loading-terrain/344566
---
# Terrain Voxel Channels - ReadVoxelChannels, WriteVoxelChannels and Chunked Edits

`ReadVoxels` and `WriteVoxels` work on two arrays, material and occupancy, and treat water as just another material. The newer channel methods split the data into **SolidMaterial**, **SolidOccupancy** and **LiquidOccupancy**, which is how the engine stores shorelines where rock and water share a voxel. If you edit terrain from code (biome painting, flooding a basin, draining a lake, procedural caves), the channel API lets you change one layer without flattening the others. This note covers the rules, a chunked edit helper, and when to use which API.

## Rules that every voxel call shares (Engine API)

- Regions must be aligned to the 4-stud grid. Build them with `Region3.new(min, max):ExpandToGrid(4)`.
- `resolution` must be `4`.
- A single call cannot exceed **4,194,304 voxels** (for example 256 x 64 x 256 cells, or about 1024 x 256 x 1024 studs).
- Arrays are 3D: `data[x][y][z]`, 1-indexed, with a `Size` field (`Vector3`) giving the dimensions.
- `ReadVoxels` and `ReadVoxelChannels` are marked thread **Safe**, so they can run in a desynchronized Actor. The write methods are **Unsafe** and must run in serial.

## The three channels

| Channel | Type | Meaning |
| --- | --- | --- |
| `SolidMaterial` | `Enum.Material` | Material of the solid part. The docs note `Water` is no longer a solid material value. |
| `SolidOccupancy` | number 0-1 | How full the voxel is with that solid |
| `LiquidOccupancy` | number 0-1 | How full the voxel is with water. Forced to 0 when the voxel is fully solid (occupancy 1, not Air). |

Practical consequence: to "add water to a pit" you write only `LiquidOccupancy`; rocks and the pit floor stay untouched. To read whether a cell is water, read `LiquidOccupancy`, not the material.

## Example: flood everything below a water line

```lua
-- Server or command bar. Fills empty space below waterY with water inside a box.
local Terrain = workspace.Terrain

local function flood(minPos: Vector3, maxPos: Vector3, waterY: number)
    local region = Region3.new(minPos, maxPos):ExpandToGrid(4)
    local data = Terrain:ReadVoxelChannels(region, 4, {"SolidOccupancy", "LiquidOccupancy"})
    local solid, liquid = data.SolidOccupancy, data.LiquidOccupancy
    local size = data.Size
    local baseY = region.CFrame.Position.Y - region.Size.Y / 2

    for x = 1, size.X do
        for y = 1, size.Y do
            local cellTop = baseY + y * 4
            if cellTop <= waterY then
                for z = 1, size.Z do
                    liquid[x][y][z] = 1 - solid[x][y][z] -- fill the space the solid leaves
                end
            end
        end
    end
    Terrain:WriteVoxelChannels(region, 4, {LiquidOccupancy = liquid})
end
```

Writing only `LiquidOccupancy` leaves solids untouched. Draining is the same loop with `0`.

## Chunked edits for big areas

Large maps go past the voxel limit, and even legal-size writes cause a visible hitch. Split the box into chunks and yield between them, as DevForum threads on loading terrain in chunks (3293384, 344566) recommend.

```lua
local CHUNK = 128 -- studs per side, multiple of 4

local function forEachChunk(minPos: Vector3, maxPos: Vector3, fn: (Vector3, Vector3) -> ())
    for x = minPos.X, maxPos.X - 1, CHUNK do
        for z = minPos.Z, maxPos.Z - 1, CHUNK do
            local a = Vector3.new(x, minPos.Y, z)
            local b = Vector3.new(math.min(x + CHUNK, maxPos.X), maxPos.Y, math.min(z + CHUNK, maxPos.Z))
            fn(a, b)
            task.wait() -- one chunk per frame keeps the server responsive
        end
    end
end

forEachChunk(Vector3.new(-512, -40, -512), Vector3.new(512, 40, 512), function(a, b)
    flood(a, b, 0)
end)
```

## Which API to pick

| Task | API |
| --- | --- |
| Restore an exact snapshot | `CopyRegion` / `PasteRegion` |
| Simple shapes (holes, slabs, ramps) | `FillBall`, `FillBlock`, `FillWedge`, `FillCylinder` |
| Swap one material for another | `ReplaceMaterial` |
| Procedural heightmaps | `WriteVoxels` (material + occupancy) |
| Water or shoreline work, partial edits | `ReadVoxelChannels` / `WriteVoxelChannels` |

## Pitfalls

- Arrays must exactly match the region size in voxels or the write errors. Always size from the `Size` field of a read, not from your own math.
- Region3 min/max are world studs; `ExpandToGrid` can grow the region, so recompute offsets from the expanded region (as in the example).
- Writes replicate to all clients. Generate on the server once, or on a client only for client-only previews.
- Very thin water (low `LiquidOccupancy`) still renders a surface; clamp tiny values to 0 when draining.

## Related
[[Terrain Vegetation - Hub]] · [[Procedural Terrain with math.noise and WriteVoxels]] · [[Saving and Resetting Terrain - CopyRegion, PasteRegion and TerrainRegion]] · [[Parallel Luau Actors - A Worked Example]]
