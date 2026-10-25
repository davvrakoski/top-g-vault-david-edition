---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Runtime Terrain Destruction and Digging - Craters, FillBall and Replication"
tags: [roblox, community-knowledge, terrain, destruction, digging, replication]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://create.roblox.com/docs/reference/engine/classes/Explosion
  - https://create.roblox.com/docs/reference/engine/enums/ExplosionType
  - https://devforum.roblox.com/t/how-to-make-a-terrain-modifier/1429551
  - https://devforum.roblox.com/t/deleting-a-big-chunk-of-terrain/2832224
  - https://devforum.roblox.com/t/need-help-finding-what-is-causing-lag-spikes/3987926
---
# Runtime Terrain Destruction and Digging - Craters, FillBall and Replication

Mining games, artillery games and "dig to the core" experiences change terrain while players are in the server. Terrain edits are authoritative on the server and replicate to every client, so the design questions are: who is allowed to dig, how big each edit is, and how often edits happen. Get those wrong and the game hitches every time a grenade lands.

## The building blocks (Engine API)

| Tool | Use |
| --- | --- |
| `Terrain:FillBall(center, radius, Enum.Material.Air)` | Spherical hole; the basic shovel or crater |
| `Terrain:FillBlock(cframe, size, Enum.Material.Air)` | Box-shaped tunnel step or mine shaft |
| `Terrain:FillCylinder(cframe, height, radius, material)` | Drill holes, wells |
| `Terrain:ReadVoxels` / `WriteVoxels` | Partial removal (lower occupancy instead of deleting), mining yields |
| `Explosion.ExplosionType` | `Craters` makes an Explosion carve terrain; `NoCraters` leaves it alone |

Voxels are 4 studs wide, so a very small `FillBall` only lowers the occupancy of a few cells and can look like nothing happened. Design tool sizes around multiples of 4.

## Server-authoritative dig flow

```lua
-- Server: validated dig request. Client sends only the target point.
local Terrain = workspace.Terrain
local DIG_RADIUS = 6
local MAX_REACH = 18
local COOLDOWN = 0.25
local lastDig: {[Player]: number} = {}

game.ReplicatedStorage.Dig.OnServerEvent:Connect(function(player, point)
    if typeof(point) ~= "Vector3" then return end
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root or (root.Position - point).Magnitude > MAX_REACH then return end
    local now = os.clock()
    if now - (lastDig[player] or 0) < COOLDOWN then return end
    lastDig[player] = now
    Terrain:FillBall(point, DIG_RADIUS, Enum.Material.Air)
end)

game.Players.PlayerRemoving:Connect(function(p) lastDig[p] = nil end)
```

The reach check and cooldown are the anti-exploit layer; without them one client can erase the map with a loop.

## Reading what was dug (mining rewards)

Before deleting, read the voxels inside the dig box with `ReadVoxels` (region aligned to the 4-stud grid, resolution 4) and count materials weighted by occupancy. Award ore based on that count, then write Air. This keeps rewards tied to what was really there instead of trusting the client.

## Smoothing out big edits

- The "Deleting a big chunk of terrain" thread (2832224) hit a case where one huge `FillBall` did not clear everything; the suggested fix was growing the radius step by step over several frames.
- A DevForum lag thread (3987926) describes freezes that grew with explosion radius even though network traffic stayed low, with MicroProfiler labels pointing at commit and send work. The thread does not show a confirmed fix, so treat large single edits as a known risk and measure.
- The terrain modifier tutorial (1429551) discusses the trade-off for continuous tools like a sculpting brush: sending edits every frame replicates smoothly but loads the server, while batching every few frames or once at the end is cheaper with more visible delay for other players.

## Budget rules that work

| Rule | Value to start with |
| --- | --- |
| Max dig radius per edit | 8-12 studs |
| Max edits per player per second | 4 |
| Max explosion crater radius | Cap it; split bigger blasts into 2-3 staggered `FillBall` calls |
| Server-wide edit queue | Process up to N edits per Heartbeat, drop or merge overlapping ones |

These starting values are our suggestions, not engine limits; profile and adjust.

## Pitfalls

- Clients can call terrain methods locally, but the change will not replicate and will desync collisions. Keep edits on the server.
- Players can dig under spawn or out of the map. Protect zones by checking the dig point against no-dig boxes.
- Terrain edits are not saved between servers. For persistent digging, store edits (center, radius) in a DataStore and replay them on load, or store per-chunk diffs.
- Pair destructible terrain with a reset system for round games.

## Related
[[Terrain Vegetation - Hub]] · [[Saving and Resetting Terrain - CopyRegion, PasteRegion and TerrainRegion]] · [[Remote Rate Limiting Pattern]] · [[Terrain Tools, Expanded Terrain and Material Variants]]
