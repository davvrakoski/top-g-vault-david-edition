---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Collision Groups for Vehicles - Wheels, Riders and Traffic"
tags: [roblox, community-knowledge, vehicles, collision-groups, physics]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/workspace/collisions
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/classes/PhysicsService
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
---
# Collision Groups for Vehicles - Wheels, Riders and Traffic

Vehicles collide with far more than the road: the driver's own legs, passengers, wheel wells, other cars, ragdolls and pickups. Collision groups let you say "wheels never hit the body, riders never hit their own car, traffic ghosts through spawn". Getting this right removes a whole class of jitter and launch bugs.

## The API changed: use Workspace, not PhysicsService
The current docs mark the `PhysicsService` collision-group methods as **deprecated**, superseded by the same methods on `WorldRoot` (so `workspace:` in practice):

```lua
-- Server Script, once at startup
local GROUPS = {"VehicleBody", "VehicleWheel", "Riders", "Traffic"}
for _, name in GROUPS do
	if not workspace:IsCollisionGroupRegistered(name) then
		workspace:RegisterCollisionGroup(name)
	end
end
workspace:CollisionGroupSetCollidable("VehicleBody", "VehicleWheel", false)
workspace:CollisionGroupSetCollidable("Riders", "VehicleBody", false)
workspace:CollisionGroupSetCollidable("Riders", "VehicleWheel", false)
workspace:CollisionGroupSetCollidable("Traffic", "Traffic", true)
```

Then assign parts with `part.CollisionGroup = "VehicleWheel"` (a string property). Old tutorials using `PhysicsService:SetPartCollisionGroup` still work for now but should not be copied into new code. Creating and changing relationships is server-only; you can also set groups up in Studio's **Collision Groups** editor (Window > 3D menu).

Limits: there is a maximum number of groups (`workspace:GetMaxCollisionGroups()`); plan a small fixed set, not one group per car.

## Recipes
**Wheels vs body.** Fat tyres near arches touch the body on full suspension compression and cause shaking. Put wheels in `VehicleWheel`, body in `VehicleBody`, make them non-collidable with each other.

**Riders.** When a player sits, move their character parts into `Riders` and restore on exit:
```lua
local function setCharacterGroup(character: Model, group: string)
	for _, d in character:GetDescendants() do
		if d:IsA("BasePart") then d.CollisionGroup = group end
	end
end
seat:GetPropertyChangedSignal("Occupant"):Connect(function()
	local hum = seat.Occupant
	if hum then setCharacterGroup(hum.Parent, "Riders") end
end)
```
Remember the character you set when they leave (Occupant becomes nil, so cache it). Riders still collide with other cars and the world, so drive-bys still hit pedestrians.

**Spawn ghosting.** Freshly spawned cars in a `SpawnGhost` group that does not collide with other vehicles for 2 seconds avoids two cars spawning into each other and exploding apart.

**Pickups and triggers.** Coins and checkpoints should use `CanCollide = false` and only `CanTouch`. For query-only parts set `CanTouch = false` too; the collisions docs recommend turning off `CanTouch` where you do not need events, for performance.

## Per-part flags still matter
| Flag | Effect |
|---|---|
| `CanCollide` | Physical collision |
| `CanTouch` | `Touched` / `TouchEnded` events |
| `CanQuery` | Raycasts and spatial queries (raycast suspension must be able to hit the road but should ignore its own car via `RaycastParams`) |

For decorative car parts (mirrors, badges, interior) set all three false and `Massless = true`.

## Pitfalls
- Characters respawn with Default group parts; reapply on `CharacterAdded` if your game uses rider groups.
- `Terrain` is a BasePart and can be put in a group, which is handy for "this hover vehicle ignores terrain grass but hits roads".
- Collision groups do not affect raycasts unless you set `RaycastParams.CollisionGroup`.

## Related
[[Vehicles - Hub]] · [[Vehicle jitters - wrong player controls physics]] · [[Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions]] · [[Raycast Suspension Car - Spring-Damper Pattern and Pitfalls]]
