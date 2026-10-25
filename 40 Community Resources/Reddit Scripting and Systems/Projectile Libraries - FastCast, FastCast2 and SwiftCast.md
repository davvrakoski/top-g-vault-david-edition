---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/projectile-libraries"
title: "Projectile Libraries - FastCast, FastCast2 and SwiftCast"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/fastcast2-an-improved-version-of-fastcast-with-parallel-scripting-more-extensions-and-statically-typed-a-powerful-modern-projectile-library/4093890
  - https://devforum.roblox.com/t/swiftcast-simple-fast-and-easy-projectiles/4477145
  - https://devforum.roblox.com/t/shots-don%E2%80%99t-hit-while-moving-%E2%80%94-fastcast-delay-causing-accuracy-issues/3828038
cssclasses: [tg-a40]
---

# Projectile Libraries - FastCast, FastCast2 and SwiftCast

Gun and spell games almost always reach for a projectile library instead of physical bullet parts.

## Why not just fire a physical part?

Physics projectiles are owned and replicated like any part: they lag, tunnel through thin walls at high speed, and cost physics time. Libraries instead **simulate the projectile mathematically** each frame (position + velocity + gravity) and cast a ray/shape between the last and next position to detect hits. The visible bullet is just a cosmetic part moved along that path.

## The options

| Library | Status (Oct 2026) | Highlights |
|---|---|---|
| **FastCast** (EtiTheSpirit) | No longer actively maintained | The original; huge number of tutorials use it. |
| **FastCast2** (@Mawin_CK) | Active continuation, 500+ likes | Parallel Luau support (uses `ConnectParallel`), static typing, extensions; built to simulate thousands of projectiles without physics replication. |
| **SwiftCast** (@23sinek345 and co-authors) | Released Mar 2026 | Ray/block/shape/sphere casts, BulkMoveTo or Transform movement, per-projectile stepping, deferred callbacks so you can safely edit or remove projectiles inside hit handlers. |

Benchmark shared in the SwiftCast thread by FastCast2's author on a low-end PC: roughly 6,000 FastCast2 projectiles vs 8,000 SwiftCast projectiles at similar 11-13 FPS client-side. Treat one-machine numbers as rough.

## Defending FastCast's value

When someone said FastCast is just raycast middleware, @Eniiqz answered that its point is simulated projectile physics with built-in penetration and bullet drop, which you won't get in 20 lines.

## Common bugs from help threads

- **"Shots don't hit while moving"** (2025-26 thread): hit detection ran on the server from a screen ray, so moving shooters missed. The fix that worked: run hit detection on the firing client every frame (cast from last to current bullet position), send the server the origin and hit for validation, and raise bullet speed (one poster went from 800 to 2200 studs/s). See [[Client-Predicted, Server-Validated Projectiles]].
- **Laggy with model projectiles**: move cosmetic bullets with `BulkMoveTo` / pooled parts, not new parts each shot ([[Object Pooling Without Making a Mess]]).

## Own minimal step (to understand what the libraries do)

```lua
local GRAVITY = Vector3.new(0, -workspace.Gravity, 0)

local function stepProjectile(pos: Vector3, vel: Vector3, dt: number, params: RaycastParams)
	local nextVel = vel + GRAVITY * dt
	local nextPos = pos + vel * dt + 0.5 * GRAVITY * dt * dt
	local hit = workspace:Raycast(pos, nextPos - pos, params)
	if hit then
		return hit.Position, nextVel, hit
	end
	return nextPos, nextVel, nil
end
```

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Client-Predicted, Server-Validated Projectiles]] · [[Hitscan and Projectile Weapon Blueprint]] · [[Parallel Luau Actors - A Worked Example]] · [[Melee Hitbox Modules - RaycastHitbox to ShapecastHitbox]]

<!-- TDOD_GRAPH_END -->
