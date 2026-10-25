---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Physics - Impulse Math - ApplyImpulse, Mass and Velocity Change"
tags: [roblox, community-knowledge, physics, impulse, knockback, velocity]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/physics/assemblies
---
# Physics - Impulse Math - ApplyImpulse, Mass and Velocity Change

Knockback, jump pads, launchers, explosions and "kick the ball" all want to change something's velocity right now. There are two tools: set `AssemblyLinearVelocity` directly, or call `ApplyImpulse`. They are related by one formula, and choosing between them decides whether heavy objects feel heavy.

## The formula

An impulse `J` changes velocity by `dv = J / m`, where `m` is the **assembly** mass (all parts welded together). So:

- `part:ApplyImpulse(J)` with `J = m * dv` gives exactly `dv`, whatever the mass.
- A fixed `J` moves a light crate fast and a heavy truck barely: mass-aware, physical feel.
- Setting `part.AssemblyLinearVelocity = v` ignores mass completely: the same result on a pebble and a truck.

From the API reference: `ApplyImpulse` applies at the assembly's center of mass (pure linear motion); `ApplyImpulseAtPosition(impulse, position)` applies at a world point and can add spin; `ApplyAngularImpulse` adds spin only. If the part is owned by the server, the call must be made from a server Script.

## Recipes (own code)

**Same knockback speed on everything (arcade):**
```lua
local function knock(root: BasePart, dir: Vector3, speed: number)
	root:ApplyImpulse(dir.Unit * speed * root.AssemblyMass)
end
```

**Mass-aware hit (physical):** heavier enemies fly less.
```lua
local HIT = 600 -- RMU*stud/s
crate:ApplyImpulse(dir.Unit * HIT)
```

**Jump pad to an exact height** (vertical speed from `v = sqrt(2gh)`), cancelling current fall speed first:
```lua
local function launch(root: BasePart, height: number)
	local vNeeded = math.sqrt(2 * workspace.Gravity * height)
	local vNow = root.AssemblyLinearVelocity.Y
	root:ApplyImpulse(Vector3.new(0, (vNeeded - vNow) * root.AssemblyMass, 0))
end
```

**Bat swing that spins the target:** apply at the contact point.
```lua
target:ApplyImpulseAtPosition(dir.Unit * 400, hitPosition)
```

## Characters are special

A standing Humanoid fights sideways velocity with its own movement controller, so a horizontal impulse is often eaten within a few frames. Common fixes: add an upward component (lifting the character off the ground reduces friction), briefly switch to a physics/ragdoll state, or use a short-lived `LinearVelocity` instead. See the knockback note below for what works across clients.

## Network ownership decides who must call it

Player characters are owned by their client. A server `ApplyImpulse` on another player's character may not produce the result you expect because the owning client simulates it. Patterns: fire a remote so the owning client applies the impulse to itself, or briefly take ownership of unanchored NPCs/props with `SetNetworkOwner(nil)` (server only).

## Pitfalls

- Using `GetMass()` (one part) instead of `AssemblyMass` (whole welded assembly) under-pushes characters and vehicles.
- Impulses on anchored parts do nothing.
- Repeating an impulse every frame is a force, not an impulse; use a `VectorForce` or `LinearVelocity` for continuous pushes.
- Cap the final speed (`math.min`) so stacked hits do not fling players across the map.

## Related
[[Physics Ragdolls - Hub]] · [[Smooth Knockback - What Works for All Clients]] · [[Explosions - BlastPressure, Joint Radius and Custom Damage]] · [[Physics - Mass and Density - AssemblyMass, Massless and Custom Density]]
