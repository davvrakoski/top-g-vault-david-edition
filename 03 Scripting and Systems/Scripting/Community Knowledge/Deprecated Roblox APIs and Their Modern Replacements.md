---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Deprecated Roblox APIs and Their Modern Replacements"
tags: [roblox, community-knowledge, scripting, deprecated, migration, code-review, ai-code]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/globals/RobloxGlobals
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastParams
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/Model
  - https://create.roblox.com/docs/reference/engine/classes/BodyVelocity
---
# Deprecated Roblox APIs and Their Modern Replacements

Old tutorials, free models and AI code assistants trained on years of forum posts still produce code that uses APIs Roblox has deprecated. Deprecated APIs usually keep working, but they are throttled, less precise, missing features, or ignored by new engine work. This table is a review checklist: if you see the left column in a pull request or an AI answer, ask for the right column. Every "Deprecated" status below was checked against the API reference mirrored in this vault (`30 Official Roblox Docs/API Reference`).

## Scheduling (Roblox globals)

| Deprecated | Use instead | Why |
| --- | --- | --- |
| `wait(n)` | `task.wait(n)` | old one is throttled and can resume late |
| `spawn(fn)` | `task.spawn(fn)` (runs now) or `task.defer(fn)` | throttled; different first-run timing |
| `delay(n, fn)` | `task.delay(n, fn)` | throttled; `task.delay` returns a cancellable thread |

Details and timing differences: [[Coroutines vs the task Library]].

## Raycasting and spatial queries

| Deprecated / superseded | Use instead |
| --- | --- |
| `workspace:FindPartOnRay(Ray.new(...))` and its `WithIgnoreList` / `WithWhitelist` variants | `workspace:Raycast(origin, direction, params)` |
| `RaycastParams.FilterDescendantsInstances` + `FilterType` | still work, but superseded by `ExcludeInstances` / `IncludeInstances` for new work |
| `FindPartsInRegion3` and its ignore/whitelist variants | `workspace:GetPartBoundsInBox`, `GetPartBoundsInRadius`, `GetPartsInPart` with `OverlapParams` |
| Thin rays for melee/projectiles | `Blockcast`, `Spherecast`, `Shapecast` |

See [[Raycasts and Shapecasts - RaycastParams in 2026]].

## Physics movers (legacy Body movers)

`BodyVelocity`, `BodyGyro`, `BodyPosition` and `BodyForce` are deprecated. Replacements:

| Legacy | Constraint-based mover |
| --- | --- |
| BodyVelocity | `LinearVelocity` |
| BodyGyro | `AlignOrientation` |
| BodyPosition | `AlignPosition` |
| BodyForce | `VectorForce` |
| BodyAngularVelocity | `AngularVelocity` |

Collision groups: `PhysicsService:RegisterCollisionGroup`, `CollisionGroupSetCollidable` and related methods are deprecated in favour of the same methods on WorldRoot (`workspace:RegisterCollisionGroup(...)`); see [[Collision Groups - Setup Recipes and the WorldRoot API]].

One-off pushes do not need a mover at all: use `BasePart:ApplyImpulse` / `ApplyImpulseAtPosition`, or set `AssemblyLinearVelocity`. See [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]].

## Characters and models

| Deprecated | Use instead |
| --- | --- |
| `Humanoid:LoadAnimation(anim)` | `humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(anim)` |
| `Model:SetPrimaryPartCFrame(cf)` | `model:PivotTo(cf)` (works without a PrimaryPart) |
| `Model:GetModelCFrame()` | `model:GetPivot()` or `model:GetBoundingBox()` |
| `Model:moveTo` (lowercase) | `Model:MoveTo` or `PivotTo` |

## Instance methods (lowercase and legacy)

| Deprecated | Use instead |
| --- | --- |
| `obj:remove()` / `obj:Remove()` | `obj:Destroy()` (also locks Parent and disconnects events) |
| `obj:children()`, `obj:getChildren()` | `obj:GetChildren()` |
| `obj:clone()` | `obj:Clone()` |
| `signal:connect(fn)` (lowercase) | `signal:Connect(fn)` |

Lowercase aliases are a strong sign the snippet is very old; review the whole thing, not just the call.

## Patterns that are not "deprecated" but are outdated

- `game.Players` style service access works, but `game:GetService("Players")` is the documented, rename-safe way.
- `Instance.new("Part", parent)` with a parent argument sets Parent first and then every property replicates as a change; set properties, then Parent last ([[Set Parent Last - The Instance.new Parent Argument]]).
- `while true do wait() end` polling: prefer events or `RunService` signals ([[while true vs RunService Events - Community Answer]]).
- `loadstring` for "dynamic" code: keep `LoadStringEnabled` off ([[loadstring and Code-From-Strings - Why to Keep It Off]]).

## How to enforce this
1. **Linting:** selene flags deprecated Roblox APIs when configured with the Roblox standard library ([[selene for Roblox - Config, Std and Inline Filters]]); the Studio Script Editor also marks deprecated members in autocomplete (exact display unverified).
2. **AI prompts:** add a line to your project instructions such as "Never use wait/spawn/delay, Body movers, FindPartOnRay or Humanoid:LoadAnimation" ([[Claude Project Instructions — Production Version]]).
3. **Search the codebase** once per release for the left column.

## Related
[[Scripting - Hub]] · [[Coroutines vs the task Library]] · [[AI Code Review Prompt]] · [[Works in Studio, Breaks Live - Checklist]]
