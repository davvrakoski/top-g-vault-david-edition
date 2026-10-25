---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Poisson Disk Scatter for Trees, Rocks and Props"
tags: [roblox, community-knowledge, vegetation, procedural, scatter, foliage]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.cs.ubc.ca/~rbridson/docs/bridson-siggraph07-poissondisk.pdf
  - https://devmag.org.za/2009/05/03/poisson-disk-sampling/
  - https://devforum.roblox.com/t/poisson-sampling-example/2185617
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Poisson Disk Scatter for Trees, Rocks and Props

Random scatter (`math.random` X and Z per tree) produces clumps and bald patches, and trees end up intersecting. Grid scatter looks planted. Poisson disk sampling gives "natural but even" spacing: every point is at least `r` studs from every other point, with no visible pattern. It is the standard method for forests, rock fields, flower patches and enemy spawn points, and Robert Bridson's 2007 algorithm makes it fast enough to run in a Studio plugin or at server start.

## How Bridson's algorithm works

From Bridson's SIGGRAPH 2007 sketch (and the Dev.Mag walkthrough):

1. Make a background grid with cell size `r / sqrt(2)`, so each cell holds at most one point.
2. Place a first point, add it to an **active list**.
3. Pick a random active point. Try up to `k` candidates (Bridson uses `k = 30`) at random distances between `r` and `2r` around it.
4. Accept a candidate if no point within `r` exists, checking only nearby grid cells. Add accepted points to the active list.
5. If all `k` tries fail, remove the point from the active list. Stop when the list is empty.

The cost grows linearly with the number of points, which is why it scales to thousands of trees.

## Luau implementation (2D, X/Z plane)

```lua
local function poisson(width: number, depth: number, r: number, rng: Random, k: number?)
    k = k or 30
    local cell = r / math.sqrt(2)
    local gw, gd = math.ceil(width / cell), math.ceil(depth / cell)
    local grid, points, active = {}, {}, {}

    local function gridIndex(p: Vector2) return math.floor(p.X / cell) + math.floor(p.Y / cell) * gw end
    local function farEnough(p: Vector2): boolean
        local cx, cz = math.floor(p.X / cell), math.floor(p.Y / cell)
        for x = math.max(cx - 2, 0), math.min(cx + 2, gw - 1) do
            for z = math.max(cz - 2, 0), math.min(cz + 2, gd - 1) do
                local q = grid[x + z * gw]
                if q and (q - p).Magnitude < r then return false end
            end
        end
        return true
    end
    local function add(p: Vector2)
        table.insert(points, p); table.insert(active, p); grid[gridIndex(p)] = p
    end

    add(Vector2.new(rng:NextNumber() * width, rng:NextNumber() * depth))
    while #active > 0 do
        local i = rng:NextInteger(1, #active)
        local base, placed = active[i], false
        for _ = 1, k do
            local a, d = rng:NextNumber() * math.pi * 2, r * (1 + rng:NextNumber())
            local p = base + Vector2.new(math.cos(a), math.sin(a)) * d
            if p.X >= 0 and p.Y >= 0 and p.X < width and p.Y < depth and farEnough(p) then
                add(p); placed = true; break
            end
        end
        if not placed then active[i] = active[#active]; active[#active] = nil end
    end
    return points
end
```

A DevForum community resource by azqjanna ("Poisson Sampling Example", 2023) shows a similar Bridson implementation in Luau and suggests the parent links between points could drive rivers or branches. No license is stated there, so use the version above.

## From points to a forest

1. Sample in local X/Z over your forest bounds, with `r` = tree canopy radius.
2. For each point, `workspace:Raycast` straight down from above the terrain with a `RaycastParams` that includes only `workspace.Terrain` (or your ground folder).
3. Reject the point if the hit material is not allowed (no trees on `Sand`, `Rock`, water), the surface normal is too steep (`hit.Normal.Y < 0.8`), or it falls inside an exclusion box (paths, spawn, buildings).
4. Clone one of a few tree Models, randomize yaw and scale (0.85-1.15), sink it 0.5-1 stud into the ground, and `PivotTo` the hit position.
5. Seed the `Random` so the same layout regenerates.

## Variable density

Sample once with a small `r`, then thin points with a density mask: keep a point only if `math.noise(x / 200, z / 200) > threshold`. This creates clearings and thickets while keeping minimum spacing. For layered vegetation, run separate passes: big trees with large `r`, then bushes with smaller `r` rejecting points too close to trees.

## Performance notes

- Do the sampling in plain Luau (fast), and do raycasts and cloning in batches across frames.
- Reuse the same few tree meshes so copies instance; set foliage collision and shadow settings before cloning (see the collision tuning note).
- Bake the result in Studio for static maps; runtime scatter is only needed for procedural worlds.

## Related
[[Terrain Vegetation - Hub]] · [[Procedural Vegetation Scatter and Biome Rules]] · [[Vegetation Layering and Composition]] · [[Collision Property Tuning - CanCollide, CanQuery, CanTouch and CollisionFidelity]]
