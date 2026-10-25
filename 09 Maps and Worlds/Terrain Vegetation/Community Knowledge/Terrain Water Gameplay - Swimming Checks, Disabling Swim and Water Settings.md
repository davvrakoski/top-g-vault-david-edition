---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Terrain Water Gameplay - Swimming Checks, Disabling Swim and Water Settings"
tags: [roblox, community-knowledge, terrain, water, swimming, humanoid]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://create.roblox.com/docs/parts/terrain
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://devforum.roblox.com/t/detecting-if-user-is-in-water/560774
  - https://devforum.roblox.com/t/2391568
  - https://devforum.roblox.com/t/disabling-swimming-in-water/2947674
---
# Terrain Water Gameplay - Swimming Checks, Disabling Swim and Water Settings

Terrain water gives you free swimming, buoyancy and a decent surface shader, which is why most lakes and oceans on Roblox are terrain. Gameplay around water is less free: drowning timers, "lava-like" deadly water, fishing spots, boats that need to know they are afloat, and maps where swimming should be disabled. Touch events do not help here, because terrain is one object. This note gathers the techniques that work.

## Water settings (Terrain properties)

| Property | Range in docs | Typical use |
| --- | --- | --- |
| `WaterColor` | Color3 | One global tint for all terrain water |
| `WaterTransparency` | 0 (opaque) to 1 (clear) | Lower it for murky swamps, horror |
| `WaterReflectance` | 0 to 1 | Calm lakes high, rivers lower |
| `WaterWaveSize` | max wave height in studs | Ocean 0.15-0.4, pond 0.05 (our starting values) |
| `WaterWaveSpeed` | waves per minute | Keep low for calm water |

These are global: every body of water in the place shares them. For a red lava river next to a blue lake, use terrain water for one and a part or mesh with a custom material for the other. The Terrain guide notes some water properties only show while playtesting unless Studio's editor quality setting is raised.

## Detecting "is this character in water"

Three community approaches, best first:

1. **Humanoid state:** `Humanoid.StateChanged` reporting `Enum.HumanoidStateType.Swimming` is the cheapest check and is fine for drowning timers.
2. **Voxel probe:** read a tiny region at the head (or root) and check for water. The "Detecting if user is in water" thread (560774) uses `ReadVoxels` on a grid-expanded Region3 around the head. With the channel API, read `LiquidOccupancy` instead of the material.
3. **FloorMaterial filter:** `Humanoid.FloorMaterial` is `Air` while swimming or floating, so a probe that finds water plus `FloorMaterial == Air` separates swimmers from players wading on a shallow floor.

```lua
-- Client or server: true if the point is inside terrain water (more than half full).
local Terrain = workspace.Terrain
local function isWaterAt(pos: Vector3): boolean
    local region = Region3.new(pos - Vector3.new(2, 2, 2), pos + Vector3.new(2, 2, 2)):ExpandToGrid(4)
    local data = Terrain:ReadVoxelChannels(region, 4, {"LiquidOccupancy"})
    local liquid = data.LiquidOccupancy
    for x = 1, data.Size.X do
        for y = 1, data.Size.Y do
            for z = 1, data.Size.Z do
                if liquid[x][y][z] > 0.5 then return true end
            end
        end
    end
    return false
end
```

Run it a few times per second, not every frame, unless you need instant response. Raycasts are unreliable here: a thread poster reported that rays cast from inside water do not hit it.

## Disabling swimming

Calling `Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)` on the client that owns the character stops swimming, and characters sink and walk on the bottom. A thread on disabling swimming (2947674) points out the side effect: you can no longer use the Swimming state as your water signal, so switch to the voxel probe. Re-apply the setting on every `CharacterAdded`.

## Deadly water pattern

```lua
-- Server: damage players whose head is in water, twice per second.
local Players = game:GetService("Players")
task.spawn(function()
    while true do
        for _, plr in Players:GetPlayers() do
            local head = plr.Character and plr.Character:FindFirstChild("Head")
            local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
            if head and hum and hum.Health > 0 and isWaterAt(head.Position) then
                hum:TakeDamage(10)
            end
        end
        task.wait(0.5)
    end
end)
```

## Level design notes

- Mark swimmable boundaries: shallow shelves at the shore let players see where water starts.
- Underwater areas need extra light or `Atmosphere` tweaks; murky water plus low light hides everything.
- Boats on terrain water use buoyancy from part density; test with real player counts before relying on it for races.
- Give every big water body an exit ramp; terrain cliffs at the waterline trap swimmers.

## Related
[[Terrain Vegetation - Hub]] · [[Lake, Dock and Stylized Water Scene]] · [[Terrain Voxel Channels - ReadVoxelChannels, WriteVoxelChannels and Chunked Edits]] · [[Waterfall and Stream VFX — Layered Roblox Recipe]]
