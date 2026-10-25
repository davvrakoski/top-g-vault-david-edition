---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Roads, Paths and Rivers on Terrain - Carving Along a Curve"
tags: [roblox, community-knowledge, terrain, roads, rivers, procedural]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://devforum.roblox.com/t/faster-road-creation/329327
  - https://devforum.roblox.com/t/1968383
  - https://devforum.roblox.com/t/bug-with-terrain/3914377
  - https://devforum.roblox.com/t/plugin-terrain-studio-v2-generate-paint-and-finish-terrain/4728181
---
# Roads, Paths and Rivers on Terrain - Carving Along a Curve

Hand-painting a road across a mountainside with terrain brushes takes hours and still comes out bumpy. A script can do it in seconds: sample a curve through a few waypoints, flatten a road bed along it, paint the surface material, and optionally cut a channel and fill it with water for a river. The same routine gives you footpaths through forests and dry riverbeds. Community plugins exist for this (a Bezier road plugin in "Faster Road Creation", and the Terrain Studio v2 plugin that carves graded roads and rivers from waypoints), but knowing the method lets you run it from your own tools or procedural generators.

## The method

1. **Waypoints:** place small anchored parts named `WP1`, `WP2`, ... in a folder along the route.
2. **Curve:** run a Catmull-Rom spline through them so the route passes through every waypoint smoothly.
3. **Sample** the curve every 2-4 studs (half a voxel to one voxel).
4. **At each sample**, oriented along the curve tangent:
   - `FillBlock` Air above the road bed to cut through hills.
   - `FillBlock` the road material for the bed itself, a few studs thick, so dips get filled.
5. **Edges:** a second, wider and thinner pass in a shoulder material (`Ground`, `Mud`) blends the road into the grass.

## Code (command bar or plugin)

```lua
local T = workspace.Terrain

local function catmull(p0, p1, p2, p3, t)
    local t2, t3 = t * t, t * t * t
    return 0.5 * ((2 * p1) + (-p0 + p2) * t + (2 * p0 - 5 * p1 + 4 * p2 - p3) * t2 + (-p0 + 3 * p1 - 3 * p2 + p3) * t3)
end

local function carveRoad(points: {Vector3}, width: number, material: Enum.Material)
    local STEP = 3
    for i = 1, #points - 1 do
        local p0 = points[math.max(i - 1, 1)]
        local p1, p2 = points[i], points[i + 1]
        local p3 = points[math.min(i + 2, #points)]
        local segments = math.max(1, math.ceil((p2 - p1).Magnitude / STEP))
        for s = 0, segments - 1 do
            local a = catmull(p0, p1, p2, p3, s / segments)
            local b = catmull(p0, p1, p2, p3, (s + 1) / segments)
            local dir = b - a
            if dir.Magnitude > 0.01 then
                local flat = Vector3.new(dir.X, 0, dir.Z)
                local cf = CFrame.lookAt(a, a + (flat.Magnitude > 0.01 and flat or dir))
                local len = dir.Magnitude + 1
                T:FillBlock(cf * CFrame.new(0, 8, 0), Vector3.new(width + 4, 16, len), Enum.Material.Air)
                T:FillBlock(cf * CFrame.new(0, -2, 0), Vector3.new(width, 4, len), material)
            end
        end
    end
end

local pts = {}
for i = 1, 100 do
    local wp = workspace.RoadWaypoints:FindFirstChild("WP" .. i)
    if not wp then break end
    pts[#pts + 1] = wp.Position
end
carveRoad(pts, 12, Enum.Material.Pavement)
```

Keep the road bed level across its width (the `flat` direction keeps the block from rolling). Change waypoint heights to grade the road; avoid slopes steeper than vehicles and characters can climb.

## Rivers

1. Carve a channel: Air block about 6-10 studs deep, then a bed of `Mud` or `Sand` at the bottom.
2. Fill the channel with water. A DevForum terrain bug thread (3914377) reported thin layers of old material left behind when writing water into existing terrain; clearing the channel to Air first and making the water at least 2-3 voxels deep avoided it.
3. Rivers should run downhill: sort waypoints by height or check that each waypoint is not higher than the previous.
4. Terrain water does not flow; for visible current, add particle or beam effects on the surface and a gentle push force on swimmers.

## Paths through forests

For footpaths, use a narrow width (4-6 studs), skip the Air pass so the path follows the ground, and paint with `ReplaceMaterial` inside small regions along the curve (`Grass` to `Ground`) instead of `FillBlock`. This keeps the natural slope.

## Pitfalls

- `FillBlock` volumes snap to the 4-stud grid; very narrow roads (under 8 studs) come out blobby. Use parts or meshes on top for crisp road edges and markings.
- Large maps: carve a few segments per frame from a plugin to avoid freezing Studio.
- Run vegetation scatter after carving, and exclude points within `width` of the curve so trees do not grow on the road.
- Save a terrain snapshot before carving so you can undo the whole pass.

## Related
[[Terrain Vegetation - Hub]] · [[Poisson Disk Scatter for Trees, Rocks and Props]] · [[Terrain Voxel Channels - ReadVoxelChannels, WriteVoxelChannels and Chunked Edits]] · [[Saving and Resetting Terrain - CopyRegion, PasteRegion and TerrainRegion]]
