---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Collision Groups - Setup Recipes and the WorldRoot API"
tags: [roblox, community-knowledge, physics, collisions, collision-groups, worldroot]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/workspace/collisions
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/classes/PhysicsService
---
# Collision Groups - Setup Recipes and the WorldRoot API

Collision groups decide which parts physically collide: players walking through each other, projectiles passing through teammates, NPCs ignoring invisible player-only walls, vehicles not colliding with pickups, ragdoll limbs not tangling. They are cheaper and cleaner than toggling `CanCollide` per part, and raycasts can use them too. One important update most tutorials miss: the **PhysicsService** collision-group methods are now **deprecated**; the same methods live on **WorldRoot** (so `workspace:RegisterCollisionGroup(...)`), and each `WorldModel` can have its own groups.

## Facts (from the docs)

- Every BasePart starts in the `Default` group, which cannot be renamed or deleted. Assign with the string property `part.CollisionGroup = "Players"`.
- By default every group collides with every group. You switch pairs off.
- Max **32** groups (`GetMaxCollisionGroups` reports it).
- Registering has a performance cost that grows with part count. Prefer creating groups at **edit time** in the Collision Groups editor (Window > 3D) and avoid renaming/unregistering at runtime.
- Register all groups from **one** script. Spreading registration across scripts risks a race where a script assigns a group that is not registered yet.
- Terrain is a BasePart, so it has a collision group too.

## API map

| Deprecated (PhysicsService) | Current (WorldRoot, e.g. `workspace`) |
| --- | --- |
| `PhysicsService:RegisterCollisionGroup(name)` | `workspace:RegisterCollisionGroup(name)` |
| `PhysicsService:CollisionGroupSetCollidable(a, b, bool)` | `workspace:CollisionGroupSetCollidable(a, b, bool)` |
| `PhysicsService:CollisionGroupsAreCollidable(a, b)` | `workspace:CollisionGroupsAreCollidable(a, b)` |
| `PhysicsService:IsCollisionGroupRegistered(name)` | `workspace:IsCollisionGroupRegistered(name)` |
| `GetRegisteredCollisionGroups`, `RenameCollisionGroup`, `UnregisterCollisionGroup` | same names on WorldRoot |

A `WorldModel` (for example inside a ViewportFrame) can keep separate collision rules, or set `UseWorkspaceCollisionGroups = true` to share Workspace's for queries.

## Recipe: players pass through players (own code)

```lua
-- ServerScriptService/CollisionGroups.server.luau (the ONLY place groups are registered)
local Players = game:GetService("Players")
local GROUP = "Players"

if not workspace:IsCollisionGroupRegistered(GROUP) then
	workspace:RegisterCollisionGroup(GROUP)
end
workspace:CollisionGroupSetCollidable(GROUP, GROUP, false)

local function setGroup(model: Model)
	for _, d in model:GetDescendants() do
		if d:IsA("BasePart") then d.CollisionGroup = GROUP end
	end
	model.DescendantAdded:Connect(function(d)
		if d:IsA("BasePart") then d.CollisionGroup = GROUP end -- accessories, tools
	end)
end

Players.PlayerAdded:Connect(function(p)
	p.CharacterAdded:Connect(setGroup)
end)
```

## Common group matrices

| Game type | Groups | Off pairs |
| --- | --- | --- |
| Obby / social | Players | Players-Players |
| Team shooter | RedTeam, BlueTeam, Projectiles | Projectiles-own team (handled in code), Players-Players |
| Vehicles | Vehicles, Pickups, Players | Vehicles-Pickups |
| NPC pathing barrier | NPCOnly (invisible walls), Players | NPCOnly-Players |
| Ragdolls | Ragdoll | Ragdoll-Ragdoll (limbs don't tangle) |
| Doors only some can pass | VIPDoor, VIPPlayers | VIPDoor-VIPPlayers |

## Collision groups and queries

- `RaycastParams.CollisionGroup` (and `OverlapParams`) make a cast behave like a part of that group: parts in groups that don't collide with it are ignored. A bullet cast as `"Projectiles"` automatically skips anything Projectiles shouldn't hit ([[Raycasts and Shapecasts - RaycastParams in 2026]]).
- `CanCollide = false` still overrides everything for physics; `CanQuery = false` hides a part from casts; `CanTouch = false` stops `Touched` events. Groups and these flags combine.

## Pitfalls
1. **Client-side changes** to `CollisionGroup` on parts the client doesn't own may not stick or may desync; set groups on the server (characters: server on spawn, as above).
2. **Using the deprecated PhysicsService calls** still works today, but new features (WorldModel scopes) only exist on WorldRoot; migrate.
3. **Running out of groups.** 32 sounds like a lot until each team, each vehicle type and each effect gets one. Plan a matrix up front.
4. **Touch logic.** Whether `Touched` fires between groups set not to collide is easy to get wrong; test it in your place before relying on `Touched` for those pairs, or use spatial queries instead (behaviour not re-verified for this note; see [[Touched Events - Network Delay and Reliability]]).

## Related
[[Physics Ragdolls - Hub]] · [[Physics, Collisions and Ragdolls]] · [[R15 Ragdoll with BallSocketConstraints - Setup, Limits and Recovery]] · [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]]
