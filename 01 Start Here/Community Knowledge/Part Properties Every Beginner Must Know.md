---
area: "01 Start Here"
cluster: "Start Here"
title: "Part Properties Every Beginner Must Know"
tags: [roblox, community-knowledge, start-here, parts, physics, properties]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/parts
  - https://create.roblox.com/docs/workspace/collisions
---
# Part Properties Every Beginner Must Know

Parts are the bricks of every Roblox world, and a handful of their properties cause most "why is this happening" moments: the map falls apart on Play, a trigger never fires, a raycast hits an invisible wall, a car is impossibly heavy. Learn these properties once and you will diagnose those bugs in seconds instead of hours.

## The big five

| Property | Default | What it controls | Classic bug |
| --- | --- | --- | --- |
| `Anchored` | false | Immune to gravity and pushes; still movable by setting `CFrame` | Map collapses or falls into the void when you press Play |
| `CanCollide` | true | Whether other parts bump into it | Players walk through a wall, or get stuck on an invisible part |
| `CanTouch` | true | Whether `Touched`/`TouchEnded` fire (both parts need it) | Kill brick or checkpoint does nothing |
| `CanQuery` | true | Whether raycasts and spatial queries see it; **only takes effect when `CanCollide` is off** | Bullets hit invisible trigger zones |
| `Transparency` | 0 | 0 = solid, 1 = invisible (still collides!) | Invisible part blocks players |

### Recipes

| You want | Set |
| --- | --- |
| Solid static scenery | Anchored on |
| Invisible wall | Transparency 1, CanCollide on |
| Invisible trigger zone | Transparency 1, CanCollide off, CanTouch on, CanQuery off, Anchored on |
| Pure decoration (no collisions, no events) | CanCollide off, CanTouch off, CanQuery off |
| Pushable crate | Anchored off |

Turning off `CanTouch` and `CanQuery` on decorative parts also saves physics and query work.

## Position and orientation

- `Position` (Vector3) and `Orientation` (degrees) are what you see in Properties.
- `CFrame` combines both; scripts usually set `CFrame` (`part.CFrame = CFrame.new(0, 10, 0)`).
- `Size` is in **studs**. A default character is roughly 5 studs tall (community rule of thumb, unverified for every avatar scale); see [[Scale in Studs - Real-World Sizes Converted]].
- Moving a Model from a script: use `model:PivotTo(cframe)`, not each part.

## Look

| Property | Notes |
| --- | --- |
| `Color` / `BrickColor` | `Color` is any RGB; `BrickColor` is a named palette. Setting one updates the other |
| `Material` | Plastic, SmoothPlastic, Neon (glows), Wood, Metal, Grass... changes look and footstep sound |
| `Reflectance` | Mirror-like 0 to 1; rarely needed with modern materials |
| `CastShadow` | Leave on; turning off can cause shadow artefacts (docs say it is not a performance tool by default) |

## Physics extras

| Property | Use |
| --- | --- |
| `Massless` | A welded decoration that should not add weight (vehicle trim, accessories). Ignored if the part is the assembly root |
| `CustomPhysicalProperties` | Density, Friction, Elasticity (bounciness) per part, such as ice or trampolines |
| `CollisionGroup` | Name of the collision group, so for example players pass through each other but not walls |
| `AssemblyLinearVelocity` | Current velocity; on an anchored part it makes a conveyor belt |

Welded unanchored parts move as one **assembly**. If any part in a welded assembly is anchored, the whole assembly acts anchored.

## Studio-only

- `Locked`: stops you selecting the part by clicking in the viewport. Great for finished terrain-like pieces; confusing when forgotten.
- Attributes and Tags (bottom of Properties) store your own data and group parts for scripts.

## Quick diagnosis table

| Symptom | Check first |
| --- | --- |
| Things fall at game start | `Anchored` |
| Touched never fires | `CanTouch` on both parts; the other part might be an anchored part (two anchored parts never touch each other through physics) |
| Raycast hits nothing / wrong thing | `CanQuery`, `CanCollide`, RaycastParams filter |
| Character stuck on nothing | A transparent part with `CanCollide` on |
| Car or tool behaves heavy | Mass from big parts; use `Massless` on welded decorations |

## Related
[[00 START HERE - Top G Vault]] · [[Explorer, Properties and Toolbox - Beginner Field Guide]] · [[Touched Events - Network Delay and Reliability]] · [[Physics, Collisions and Ragdolls]] · [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart (official)]]
