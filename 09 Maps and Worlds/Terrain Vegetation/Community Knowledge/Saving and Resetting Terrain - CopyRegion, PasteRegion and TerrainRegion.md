---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Saving and Resetting Terrain - CopyRegion, PasteRegion and TerrainRegion"
tags: [roblox, community-knowledge, terrain, rounds, map-reset]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://create.roblox.com/docs/reference/engine/classes/TerrainRegion
  - https://devforum.roblox.com/t/map-reset-after-match-end/592166
  - https://devforum.roblox.com/t/2507728
  - https://devforum.roblox.com/t/problem-with-copying-terrain/2869188
  - https://devforum.roblox.com/t/writevoxels-vs-pasteregion/137293
---
# Saving and Resetting Terrain - CopyRegion, PasteRegion and TerrainRegion

Round-based games with terrain maps (destructible battlegrounds, digging games, terrain obbies with map rotation) need a way to put terrain back exactly as it was. Parts can be cloned from ServerStorage, but terrain is a single voxel object and cannot be cloned. The built-in answer is `Terrain:CopyRegion`, which snapshots voxels into a `TerrainRegion` instance that you can store and paste back later.

## The API in one table (Engine API)

| Call | Takes | Notes |
| --- | --- | --- |
| `Terrain:CopyRegion(region)` | `Region3int16` in **cell** coordinates | Returns a `TerrainRegion`; data does not replicate between server and client |
| `Terrain:PasteRegion(tr, corner, pasteEmptyCells)` | `TerrainRegion`, `Vector3int16` cell corner, boolean | `pasteEmptyCells = true` overwrites existing terrain with the region's air |
| `Terrain:Clear()` | nothing | Removes every voxel in the place |
| `Terrain.MaxExtents` | property | Largest editable `Region3int16`; convenient for "copy everything" |
| `Terrain:WorldToCell(pos)` | world `Vector3` | Converts a world position to the cell grid (4 studs per cell) |

Because a `TerrainRegion` does not replicate, do every save and paste on the **server**. The pasted voxels themselves replicate like any other terrain change.

## Pattern A: whole-map snapshot

Good when the only terrain in the place is the arena.

```lua
-- Server
local Terrain = workspace.Terrain
local ServerStorage = game:GetService("ServerStorage")

local function saveBaseline()
    local snap = Terrain:CopyRegion(Terrain.MaxExtents)
    snap.Name = "TerrainBaseline"
    snap.Parent = ServerStorage
end

local function resetTerrain()
    local snap = ServerStorage:FindFirstChild("TerrainBaseline")
    Terrain:Clear()
    Terrain:PasteRegion(snap, Terrain.MaxExtents.Min, true)
end
```

A DevForum reply in "Map reset after match end" (592166) describes exactly this save, clear, paste flow, and points out the replication limitation.

## Pattern B: reset only the arena, keep the lobby

1. Mark the arena with an invisible anchored part `ArenaBounds`.
2. Convert its corners with `WorldToCell` and build a `Region3int16` from those cell coordinates.
3. Copy once at server start; on reset, paste with `pasteEmptyCells = true` only if the arena box contains nothing you want to keep.

```lua
local function cellRegionFromPart(p: BasePart): Region3int16
    local half = p.Size / 2
    local a = Terrain:WorldToCell(p.Position - half)
    local b = Terrain:WorldToCell(p.Position + half)
    return Region3int16.new(
        Vector3int16.new(a.X, a.Y, a.Z),
        Vector3int16.new(b.X, b.Y, b.Z))
end
```

Two community bug reports explain the common mistakes: in thread 2869188, a reset only worked near the map origin until positions were converted with `WorldToCell` (world studs and cells are different units); in thread 2507728, the lobby vanished because `pasteEmptyCells` was `true`, and passing `false` kept other terrain.

## Saving snapshots in Studio

Running `CopyRegion` from the Studio command bar and parenting the result to ServerStorage lets you keep snapshots in the place file (confirm the object survives a save and reopen before relying on it). Check `TerrainRegion.SizeInCells` to see how big each snapshot is. This way a level designer can keep several terrain variants (`Map_Desert`, `Map_Swamp`) in ServerStorage and paste whichever one the vote picks. Keep each snapshot as small as the playable area: a `MaxExtents` copy of a mostly empty world still records a huge region.

## When to use WriteVoxels instead

The old "WriteVoxels vs PasteRegion" thread (137293) is the usual reference: `PasteRegion` restores a stored snapshot in one call, while `WriteVoxels` writes arrays you generate or edit in Luau. Use voxels for procedural or partial edits, regions for "put it back exactly".

## Pitfalls

- Large pastes are a server hitch plus a replication burst. Reset during the intermission with players in the lobby, not mid-round.
- Players standing in the arena during a paste can end up inside new terrain; teleport them out first.
- Parts sitting on terrain are not part of the snapshot. Reset props separately (clone the props folder).
- Water is part of the voxel data and resets with the snapshot.

## Related
[[Terrain Vegetation - Hub]] · [[Terrain Tools, Expanded Terrain and Material Variants]] · [[Map Rotation and Voting - Loading Maps from ServerStorage]] · [[Procedural Terrain with math.noise and WriteVoxels]]
