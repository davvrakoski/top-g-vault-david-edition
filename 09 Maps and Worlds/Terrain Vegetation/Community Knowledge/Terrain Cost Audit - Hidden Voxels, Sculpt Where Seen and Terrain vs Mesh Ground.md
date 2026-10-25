---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Terrain Cost Audit - Hidden Voxels, Sculpt Where Seen and Terrain vs Mesh Ground"
tags: [roblox, community-knowledge, terrain, performance, memory, audit]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://create.roblox.com/docs/studio/terrain-editor
  - https://devforum.roblox.com/t/thick-terrain-hurts-performance/354748
  - https://devforum.roblox.com/t/terrain-optimization/180380
  - https://devforum.roblox.com/t/optimize-smooth-terrain-better/3781706
  - https://devforum.roblox.com/t/roblox-terrain-or-part-terrain/1528262
---
# Terrain Cost Audit - Hidden Voxels, Sculpt Where Seen and Terrain vs Mesh Ground

Generated terrain (Terrain Editor Generate, heightmap import, procedural scripts) fills whole volumes: hundreds of studs of rock and magma under the surface nobody will ever see, oceans 200 studs deep, mountain ranges far outside the play space. That data still ships in the place file, loads into client memory and replicates on join. Terrain also has a fixed rendering cost per visible area. This audit trims what players cannot see and decides where terrain is the right tool at all.

## What the community has measured

| Finding | Source | Confidence |
| --- | --- | --- |
| Clearing about 2000 x 250 x 2000 studs of unseen underground terrain cut client memory by about 30 MB | "Thick terrain hurts performance?" (354748), community members | One map, one measurement |
| A terrain optimizer that rounded fractional occupancy in hidden voxels cut terrain file size about 36% (up to 57% on some islands) and helped load times, with no visible change and no LOD effect | "Terrain Optimization" (180380) | Author's own tool and numbers |
| Removing underground terrain saves memory but can cost performance in some cases; it is a trade-off | Same thread, a reply | Opinion |
| The default terrain baseplate showed over 108,000 triangles and 247 draw calls | "Optimize Smooth Terrain Better" (3781706) | One user's capture |
| Lag usually comes from part detail and scripts, not terrain | 354748, a reply | Opinion |

The pattern: hidden terrain mostly costs **memory, file size and join time**; visible terrain costs **draw calls and triangles**. Measure both.

## Audit steps

1. **Measure baseline:** Developer Console memory on a phone after joining (look at terrain-related categories in the memory view), place file size, and Render stats (Shift+F2) looking across the map.
2. **Find the floor of play:** the lowest point players, cameras and vehicles can reach. Everything 16+ studs below it is a candidate.
3. **Clear below the floor** with the Terrain Editor's region tools, or from the command bar in chunks:

```lua
-- Command bar: clear terrain below Y = -40 across the map, in 256-stud chunks.
local T = workspace.Terrain
local FLOOR_Y, BOTTOM_Y, HALF = -40, -512, 2048
for x = -HALF, HALF - 1, 256 do
    for z = -HALF, HALF - 1, 256 do
        local region = Region3.new(Vector3.new(x, BOTTOM_Y, z), Vector3.new(x + 256, FLOOR_Y, z + 256)):ExpandToGrid(4)
        T:FillRegion(region, 4, Enum.Material.Air)
    end
end
```

4. **Leave a skin:** keep at least 8-16 studs of solid under walkable surfaces so digging tools, explosions and physics still find ground. Do not hollow mountains into thin shells (forum advice warns hollowing can backfire, and thin shells break when players clip in).
5. **Trim the outside:** remove terrain beyond the playable boundary and distant backdrop range; replace far mountains with a few low-poly meshes or a skybox layer.
6. **Shallow oceans:** water players never dive into does not need to be 100 studs deep; 12-20 studs looks the same from above.
7. **Re-measure** and record the before/after in the performance log.

## Terrain or meshes for the ground?

| Situation | Better choice |
| --- | --- |
| Large natural open world, digging, water | Terrain |
| Small arena, city streets, interiors | Parts / meshes |
| Stylized low-poly look | Meshes (terrain is always smooth voxels) |
| Mobile-first map with long view distance | Terrain only near play, meshes or skybox for the far distance |
| Cliffs and rock faces | Terrain base plus reused rock meshes for silhouette |

The "Terrain or Part Terrain?" thread (1528262) is a long-running version of this debate; the honest summary is that both work and the cost depends on how much is visible at once.

## Pitfalls

- `FillRegion` with Air on a huge region in one call can error or hitch; chunk it as above.
- Terrain removed under spawn or under vehicles' routes makes players fall when streaming lags; keep the skin.
- Clearing "hidden" voxels under water exposes the lake bed's underside if the camera can go underwater.
- Re-generating terrain later refills everything; repeat the audit after each regeneration.

## Related
[[Terrain Vegetation - Hub]] · [[Terrain Tools, Expanded Terrain and Material Variants]] · [[Terrain Voxel Channels - ReadVoxelChannels, WriteVoxelChannels and Chunked Edits]] · [[Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory]]
