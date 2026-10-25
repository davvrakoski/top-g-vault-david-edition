---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Destructible Map Pieces - FragmentAsync, Pre-Fractured Models and Debris Budgets"
tags: [roblox, community-knowledge, maps, destruction, csg, physics]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/GeometryService
  - https://create.roblox.com/docs/parts/solid-modeling
  - https://create.roblox.com/docs/performance-optimization/improve
---
# Destructible Map Pieces - FragmentAsync, Pre-Fractured Models and Debris Budgets

Breakable walls, crates, glass and cover change how a map plays: sightlines open up, chokepoints collapse, and players feel powerful. They are also one of the fastest ways to tank a server, because every fragment is a new physics assembly that replicates to all clients. Roblox now offers runtime fracturing through `GeometryService`, alongside the older approach of building pieces already broken. Pick per object, and budget the debris.

## Option A: runtime fracture with GeometryService (Engine API)

- `GeometryService:GenerateFragmentSites(part, options)` returns points for `FragmentAsync`. Options: `SiteSpacing` (approximate fragment diameter), and `Origin` + `Radius` to fracture only a local area (both or neither). Output is partly random, so the same call will not give identical pieces.
- `GeometryService:FragmentAsync(part, sites, options)` splits a Part, PartOperation or MeshPart into MeshParts by Voronoi decomposition. It yields, does not support Terrain, and returns parts with no Parent set (you parent them). Options include `CollisionFidelity`, `RenderFidelity`, `FluidFidelity` and `SplitApart` (default true).
- The Solid Modeling page warns that in-experience CSG is asynchronous and you should not fire many calls in quick succession.

```lua
-- Server: punch a local hole into a wall where a rocket hit.
local GeometryService = game:GetService("GeometryService")
local Debris = game:GetService("Debris")

local function shatterAt(wall: BasePart, hitPos: Vector3)
    local sites = GeometryService:GenerateFragmentSites(wall, {
        Origin = hitPos, Radius = 6, SiteSpacing = 2.5,
    })
    local ok, results = pcall(GeometryService.FragmentAsync, GeometryService, wall, sites, {
        CollisionFidelity = Enum.CollisionFidelity.Hull,
        RenderFidelity = Enum.RenderFidelity.Automatic,
    })
    if not ok then return end
    for _, entry in results do
        local piece = entry.Instance
        piece.Anchored = true
        piece.Parent = wall.Parent
    end
    wall:Destroy()
end
```

Afterwards, unanchor only the small pieces near the hit and leave the rest anchored as the remaining wall. Give loose pieces a short life with `Debris:AddItem(piece, 8)`.

## Option B: pre-fractured models

Build the object already split (in Blender or Studio), welded or anchored together. On damage, unanchor or break welds for the pieces in range. This is predictable, art-directable, and costs nothing at runtime except physics. It is the better choice for glass panes, crates and set-piece collapses, and for anything that must look the same every time.

## Option C: swap models

For big set pieces (a bridge collapsing), swap the intact model for a broken one and play an effect. No physics, no fragments, perfect control.

## Debris budget

| Rule | Starting value (ours) |
| --- | --- |
| Max loose physics fragments in the server | 150-300 |
| Fragment lifetime | 5-10 s, then destroy or anchor and fade |
| Minimum fragment size to simulate | Below about 1 stud, anchor or delete instead |
| Fragment collision | `Hull` or `Box`; never Precise on debris |
| Fragment collision with players | Off (collision group), so debris cannot fling characters |
| `CanTouch` on debris | Off |

Track a global count; when it is over budget, destroy the oldest fragments first.

## Networking and resets

- Every new part created on the server replicates. The Improve Performance guide calls out creating and destroying large instance trees at runtime as network-heavy; fracture locally sized areas, not whole buildings.
- For purely cosmetic debris, create fragments on each client from a server event and keep only the gameplay result (hole in the wall) on the server.
- Round-based games must restore destructible pieces: keep originals in ServerStorage and clone them back at round start.

## Level design notes

- Mark destructible materials consistently (one wood plank style, one cracked concrete style) so players learn what breaks.
- Never let destruction remove the only route; keep indestructible cores in walls that hold up floors and objectives.
- Destruction should open sightlines on purpose: plan the "after" layout as carefully as the "before".

## Related
[[Maps - Hub]] · [[Unions vs MeshParts - When CSG Costs More Than It Saves]] · [[Physics Throttling, Sleep and Adaptive Timestepping]] · [[Sightlines, Cover and Chokepoints for PvP Maps]]
