---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Submarines - Ballast Tanks, Depth Hold and Crush Depth"
tags: [roblox, community-knowledge, vehicles, submarine, buoyancy, water]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BuoyancySensor
  - https://create.roblox.com/docs/reference/engine/classes/VectorForce
  - https://create.roblox.com/docs/reference/engine/datatypes/PhysicalProperties
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://coeng.uaa.alaska.edu/innovation/wp-content/uploads/2020/10/2015-Submersible-Ballast-Control-Poster.pdf
---
# Ride - Submarines - Ballast Tanks, Depth Hold and Crush Depth

A submarine is a boat that must also be able to *not* float. On Roblox that means you control buoyancy instead of letting terrain water push you up forever. Players expect three things: dive and surface on command, stay at a chosen depth without fighting the controls, and feel danger the deeper they go. All three are cheap to build once you separate "how heavy am I" (ballast) from "how do I hold a depth" (a controller).

## How real subs do it (and what to copy)
Real boats flood ballast tanks with sea water to sink and blow them with compressed air to rise. Fine depth is held with hydroplanes (small fins) and a feedback loop on a pressure sensor. The University of Alaska student ballast project linked above uses exactly that split: pumps and a valve move water, a pressure sensor reads depth, and later PID logic replaced on/off switching. Copy the split: ballast = coarse, controller = fine.

## Roblox building blocks
| Need | API |
|---|---|
| Am I in water / fully under? | `BuoyancySensor` parented to the hull part: `TouchingSurface`, `FullySubmerged` |
| Change heaviness | `CustomPhysicalProperties` on a hidden ballast part (density changes mass) |
| Push up/down smoothly | `VectorForce` (world space, `RelativeTo = World`) |
| Keep level | `AlignOrientation` with a small `MaxTorque` |
| Forward thrust / turn | `LinearVelocity` (Line mode) and `AngularVelocity` on Y |

Terrain water already gives buoyancy based on density: low-density parts float, dense parts sink. A density near the water reference gives near-neutral buoyancy (community rule of thumb, tune by testing).

## Ballast as a 0-1 value
Keep `ballast` (0 = blown, 1 = flooded). Each frame lerp the ballast part's density between a "surface" value and a "sunk" value. Change it slowly (fill rate around 0.1 per second) so diving takes several seconds, which reads as weight.

```lua
local function setBallast(part, t)
	local d = 0.3 + (2.0 - 0.3) * t -- tune both numbers
	part.CustomPhysicalProperties = PhysicalProperties.new(d, 0.3, 0, 1, 1)
end
```

## Depth hold (a PD controller)
Once `FullySubmerged` is true, add a vertical correction force from the depth error:

```lua
local err = targetY - hull.Position.Y
local vy = hull.AssemblyLinearVelocity.Y
local fy = (err * kP - vy * kD) * hull.AssemblyMass
force.Force = Vector3.new(0, math.clamp(fy, -maxF, maxF), 0)
```

- Start with kP about 2 and kD about 1.5, then tune. Clamp the force or the sub rockets out of the water when the target changes.
- Driver input (Q/E or triggers) moves `targetY`, not the force. That is what makes it feel easy.
- Turn the controller off while surfaced (`TouchingSurface` but not `FullySubmerged`) so waves and buoyancy do the work.

## Crush depth and danger
- Pick a `crushY`. Below it, tick hull damage every second and play creaks; past a second line, flood (force ballast to 1 and disable blow).
- Show depth on a gauge as "meters below surface": surface Y minus hull Y, divided by your studs-per-meter choice.
- Oxygen timer per seat is a cheap second pressure system for survival games.

## Underwater feel
- Detect whether the camera is in water with `Terrain:ReadVoxels` on a tiny `Region3` around the camera (expand to the 4-stud grid with `ExpandToGrid(4)`), then check for `Enum.Material.Water`. Swap fog, colour correction and muffle audio when true.
- Use sonar pings (a `Sound` plus a radial UI sweep) instead of long view distance; it hides streaming and saves performance.

## Pitfalls
- Changing density on every part of a big model is costly and makes mass jump; use one ballast part.
- `BuoyancySensor` only knows about terrain water. For part-based oceans, compute depth yourself (see the custom buoyancy note).
- Give network ownership to the pilot or controls lag (see ownership recipes).

## Checklist
- [ ] Dive takes 3-6 s, surface takes 2-4 s
- [ ] Sub holds depth within about 1 stud with no input
- [ ] Damage starts at crush depth with clear audio warning
- [ ] Surface state disables the depth controller

## Related
[[Vehicles - Hub]] - [[Boats and Ocean Resources - BuoyancySensor, Gerstner Waves and FFT Ocean]] - [[Physics - Custom Buoyancy Math - Archimedes with VectorForce]] - [[Hover, Boat and Flying Vehicles with Mover Constraints]]
