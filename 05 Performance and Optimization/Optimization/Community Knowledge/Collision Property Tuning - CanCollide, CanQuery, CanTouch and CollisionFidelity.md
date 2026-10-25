---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Collision Property Tuning - CanCollide, CanQuery, CanTouch and CollisionFidelity"
tags: [roblox, community-knowledge, optimization, physics, collisions]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/enums/CollisionFidelity
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art/assemble-an-asset-library
  - https://devforum.roblox.com/t/2484027
  - https://devforum.roblox.com/t/make-collision-fidelity-not-show-parts-with-all-collision-properties-false/4067467
---
# Collision Property Tuning - CanCollide, CanQuery, CanTouch and CollisionFidelity

Every BasePart carries four collision switches, and almost every map ships with them left at the defaults. Decorative props, foliage and trim then take part in physics broadphase, raycasts, touch events and physics memory for no gameplay reason. Tuning them is one of the cheapest wins on large maps: no art changes, no visual difference, and fewer surprises for weapon raycasts that hit grass.

## What each switch actually does (Engine API)

| Property | Controls | Gotcha |
| --- | --- | --- |
| `CanCollide` | Physical collisions with other parts and characters | Must be `false` before `CanQuery` can be turned off |
| `CanQuery` | Whether `Raycast`, `Shapecast`, `GetPartBoundsInBox` and other spatial queries see the part | Ignored while `CanCollide` is `true` |
| `CanTouch` | Whether `Touched` / `TouchEnded` fire | Both parts need `CanTouch = true`; setting it `false` removes an existing `TouchTransmitter` and disconnects the event |
| `CollisionFidelity` (MeshPart, union) | Shape of the collision hull | Hull geometry is kept in memory even when `CanCollide` is off |

The BasePart page states that parts with both `CanTouch` and `CanCollide` off get a small performance gain because they never compute part-to-part contacts. They can still be hit by raycasts unless `CanQuery` is off too.

## CollisionFidelity choices

`Enum.CollisionFidelity` has `Default`, `Hull`, `Box`, `PreciseConvexDecomposition` and `Tunable`. The Improve Performance guide gives the order of cost: `Box` is cheapest in memory, `Default` and `Precise` are more expensive, and Precise is the slowest to compute. The guide's rules, condensed:

- Small or non-interactive objects: `Box`.
- Small to medium objects: `Box` or `Hull` depending on shape.
- Large complex objects: build invisible collision from simple parts instead of a precise hull.
- Objects with no collisions at all: still set `Box` or `Hull`, because the hull is stored anyway.

The environmental art curriculum adds a gameplay check: a `Box` hull on wall trim makes players snag when they jump beside the wall, so trim gets `Hull`. Doorways are the case where `PreciseConvexDecomposition` earns its cost, since a convex hull would seal the opening.

## A prop profile table to agree on as a team

| Prop type | CanCollide | CanQuery | CanTouch | CastShadow | Fidelity |
| --- | --- | --- | --- | --- | --- |
| Grass tufts, flowers, small debris | false | false | false | false | Box |
| Bushes players walk through | false | false | false | true | Box |
| Wall trim, pipes, signs on walls | true | true | false | true | Hull |
| Large walls, floors, cliffs | true | true | false | true | Box or simple proxy parts |
| Doorways, arches | true | true | false | true | PreciseConvexDecomposition |
| Bullet-blocking cover | true | true | false | true | Hull |

CastShadow is not a collision property, but forum advice (DevForum thread 2484027) usually tunes it in the same pass, so it is in the table.

## Apply a profile with tags (command bar or plugin)

```lua
-- Tag props in Studio ("NoCollideProp"), then run once in the command bar.
local CollectionService = game:GetService("CollectionService")
for _, inst in CollectionService:GetTagged("NoCollideProp") do
    for _, p in (inst:IsA("BasePart") and {inst} or inst:GetDescendants()) do
        if p:IsA("BasePart") then
            p.CanCollide = false
            p.CanQuery = false   -- only works because CanCollide is now false
            p.CanTouch = false
            if p:IsA("MeshPart") then p.CollisionFidelity = Enum.CollisionFidelity.Box end
        end
    end
end
```

Note: `CollisionFidelity` on MeshParts is usually set at edit time; changing it in Studio rebuilds the hull. Do it before publishing, not at runtime.

## Auditing

- Studio Visualization Options > Collision fidelity draws hulls. A DevForum feature request points out that it still draws parts with every collision switch off, so use the Explorer filter `CollisionFidelity=PreciseConvexDecomposition` (named in the Improve Performance guide) to count precise meshes.
- Watch `PhysicsParts` in the Developer Console memory view; high numbers point at fidelity.
- MicroProfiler scopes `physicsStepped` and `worldStep` show the compute side.

## Pitfalls

- Turning `CanQuery` off on floors breaks footstep raycasts, camera collision and placement systems. Only remove it from things nothing should ever hit.
- Weapon raycasts should still use a `RaycastParams` filter; collision tuning is not a hit filter.
- `Workspace.TouchesUseCollisionGroups = true` makes non-colliding groups ignore touches too, which can silently break kill bricks.

## Related
[[Optimization - Hub]] · [[Instance Count and Part Budgets]] · [[Physics Throttling, Sleep and Adaptive Timestepping]] · [[Draw Calls and Mesh Instancing - Official Rules vs Forum Lore]]
