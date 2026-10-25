---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Hot Air Balloons and Blimps - Lift Gas, Wind Drift and Altitude Layers"
tags: [roblox, community-knowledge, vehicles, balloon, airship, wind]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/is-there-a-zeppelin-physics/2839102
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/enums/FluidForces
  - https://create.roblox.com/docs/reference/engine/classes/VectorForce
  - https://howthingsfly.si.edu/ask-an-explainer/how-does-hot-air-balloon-fly
---
# Ride - Hot Air Balloons and Blimps - Lift Gas, Wind Drift and Altitude Layers

Balloons and airships are slow, relaxing vehicles that work great for sightseeing, travel between islands and social rides. Their charm is that you do not steer them directly: a balloon only goes up or down, and the wind decides where you end up. A blimp adds weak engines. Both are easy to build with one vertical force and a wind field.

## The physics in one paragraph
The Smithsonian's explainer: a balloon is heavier than air, so it has to hold a big volume of something lighter (hot air or a light gas). Heat the air = more lift; let it cool or vent = sink. In a game you track one number, `heat` (0-1), and turn it into upward force.

## Two ways to get lift on Roblox
1. **Engine air buoyancy (beta).** In February 2024 Roblox lowered the minimum part density from 0.01 to 0.0001 so the air buoyancy part of the aerodynamics model could lift very light parts (staff note linked in the zeppelin thread). It needs `Workspace.FluidForces = Experimental` (Studio only, not scriptable) and parts with `EnableFluidForces`. Behaviour can change during the beta, so test before shipping.
2. **Scripted lift (recommended for control).** One `VectorForce` on the basket's root, world space:

```lua
local g = workspace.Gravity
local function liftForce(mass, heat)
	-- heat 0.5 = hover; above rises, below sinks
	return Vector3.new(0, mass * g * (0.6 + heat * 0.8), 0)
end
```
Add vertical damping (`-vy * mass * 0.8`) so it drifts rather than bounces.

## Controls
| Input | Balloon | Blimp |
|---|---|---|
| Hold burner (Space) | heat +0.15/s, burner flame + roar | ballonet/elevator: pitch up |
| Vent (Ctrl) | heat -0.3/s | pitch down |
| W/S | none | weak thrust, max about 25 studs/s |
| A/D | none | rudder yaw |

Natural cooling (heat -0.03/s) forces players to keep burning, which is the whole game loop of a balloon.

## Wind layers: steering by altitude
Real balloonists steer by picking an altitude where the wind blows the right way. Copy that:

```lua
local layers = { {y = 0, wind = Vector3.new(8,0,0)},
                 {y = 300, wind = Vector3.new(0,0,-12)},
                 {y = 700, wind = Vector3.new(-15,0,4)} }
```
Interpolate between layers by height and apply the wind as a gentle `LinearVelocity` in Plane mode (horizontal only) with small `MaxForce`, so collisions still push. Show the layer directions on a HUD with arrows. Optionally set `Workspace.GlobalWind` to match the ground layer so grass, clouds and particles agree with the drift.

## Ride design tips
- Baskets need standing passengers. Use the riding-moving-vehicles approach, or seats along the edge.
- Mooring masts for blimps: a rope at the nose (see the anchors note) and a ProximityPrompt to board.
- Ceiling: above a max height, reduce lift to zero (thin air), which matches the engine's own air density falling with altitude.
- Weather events: storm = turbulence (random wind changes) and a forced descent.

## Pitfalls
- Huge invisible envelope parts with collision snag on everything. Make the envelope `CanCollide = false`, use a smaller hitbox.
- Lift scaled to a fixed mass breaks when passengers board; read `AssemblyMass` every frame.

## Related
[[Vehicles - Hub]] - [[Aerodynamic Fluid Forces Beta - Planes, Gliders and Wind]] - [[Riding Moving Vehicles - Keeping Standing Players Onboard]] - [[Ride - Anchors and Mooring with RopeConstraint]]
