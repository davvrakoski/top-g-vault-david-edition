---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Spatial Query Cost - Raycast, Bounds Queries and GetPartsInPart"
tags: [roblox, community-knowledge, optimization, raycast, hitbox, spatial-query]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/datatypes/OverlapParams
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastParams
  - https://devforum.roblox.com/t/getpartsinpart-being-slow/1574764
  - https://devforum.roblox.com/t/magnitude-vs-getpartsinradius-for-capture-point-system-performance/3961816
  - https://devforum.roblox.com/t/what-method-would-you-use-to-make-a-large-moving-hitbox/2636460
---
# Spatial Query Cost - Raycast, Bounds Queries and GetPartsInPart

Hitboxes, area damage, capture points, interaction checks and AI vision all ask the same question: "what is near or inside this shape?" Roblox offers several answers with very different costs. Choosing the cheapest query that is accurate enough, and filtering it well, keeps combat servers responsive when 30 players swing at once.

## The query menu (WorldRoot API)

| Query | Tests against | Relative cost | Use for |
| --- | --- | --- | --- |
| Plain distance check in Luau | your own list of positions | cheapest | Few targets (players, NPC list) |
| `GetPartBoundsInRadius(pos, r, params)` | part bounding boxes vs sphere | cheap | Explosions, pickup magnets |
| `GetPartBoundsInBox(cframe, size, params)` | part bounding boxes vs oriented box | cheap | Melee boxes, zones |
| `Raycast(origin, dir, params)` | exact geometry along a line | cheap per ray | Bullets, line of sight, ground checks |
| `Spherecast` / `Blockcast` / `Shapecast` | exact geometry along a swept shape | moderate | Thick projectiles, swept melee |
| `GetPartsInPart(part, params)` | exact geometry overlap | most expensive | Odd-shaped hitboxes where precision matters |

Bounding-box queries are approximate by design: a long diagonal part has a large box. Forum threads (1574764, 2636460) report `GetPartsInPart` being the slowest because it tests real geometry, and recommend box or radius queries for large or moving hitboxes.

## Filtering is the biggest win

Every query takes `OverlapParams` or `RaycastParams`. A query that only considers characters is much cheaper and simpler than one that returns every grass blade.

```lua
-- Build once, reuse for every swing. Update the list when characters spawn.
local hitParams = OverlapParams.new()
hitParams.IncludeInstances = { workspace.Characters, workspace.Enemies }
-- hitParams.ExcludeInstances = { attackerCharacter } -- set per swing; exclusions win over inclusions
hitParams.MaxParts = 32

local function meleeHits(attackerRoot: BasePart): {BasePart}
    local cf = attackerRoot.CFrame * CFrame.new(0, 0, -3)
    return workspace:GetPartBoundsInBox(cf, Vector3.new(5, 5, 5), hitParams)
end
```

- Use the newer `IncludeInstances` / `ExcludeInstances` properties; the API pages say they supersede `FilterDescendantsInstances` + `FilterType`, and they can be combined (exclusion wins). Careful: `IncludeInstances = {}` includes nothing, `nil` includes everything.
- Prefer a short include list of folders over a growing exclude list.
- Set `MaxParts` so a query never returns hundreds of parts.
- Turn off `CanQuery` on decorative parts (requires `CanCollide` off) so they never enter any query.
- Collision groups also filter queries via `params.CollisionGroup`.

## Distance checks still win for small sets

A capture-point thread (3961816) concluded that looping over the few players in the server and comparing distances is cheaper than running a spatial query every tick. Rule of thumb: if you already have the list of candidates (players, active NPCs), check them in Luau; use spatial queries when the candidates are unknown parts in the world.

```lua
local function playersNear(pos: Vector3, radius: number): {Player}
    local out, r2 = {}, radius * radius
    for _, plr in game.Players:GetPlayers() do
        local root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local d = root.Position - pos
            if d:Dot(d) <= r2 then table.insert(out, plr) end
        end
    end
    return out
end
```

Squared distance avoids a square root; Vector3 math in Luau is allocation-free.

## Frequency matters more than the query

- Capture points and auras: 5-10 checks per second is plenty.
- Melee: query on the active frames of the swing, not every frame of the game.
- AI vision: stagger NPCs so each one raycasts a few times per second.
- Projectiles: one raycast per step from last position to new position (covers the gap, no tunneling).

## Pitfalls

- Filter by folders that persist (a `Characters` folder you parent characters into), not by individual character models, or you must rebuild the list on every respawn.
- Bounding-box queries miss nothing inside the box but include false positives; follow with a cheap check (dot product for a cone, distance for a circle) when it matters.
- Server queries see server positions, which lag the attacker's view; that is a networking problem, not a query problem.

## Related
[[Optimization - Hub]] · [[Spatial Hash for Nearby Queries]] · [[Melee Hitbox Modules - RaycastHitbox to ShapecastHitbox]] · [[Collision Property Tuning - CanCollide, CanQuery, CanTouch and CollisionFidelity]]
