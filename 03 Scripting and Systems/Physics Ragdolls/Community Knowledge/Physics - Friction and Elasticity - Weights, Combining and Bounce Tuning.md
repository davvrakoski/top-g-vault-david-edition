---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Physics - Friction and Elasticity - Weights, Combining and Bounce Tuning"
tags: [roblox, community-knowledge, physics, friction, elasticity, materials]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/PhysicalProperties
  - https://create.roblox.com/docs/parts/materials
  - https://create.roblox.com/docs/physics/units
---
# Physics - Friction and Elasticity - Weights, Combining and Bounce Tuning

Ice levels, bouncy castles, sticky climbing walls, sliding crates and bouncing balls are all made with two numbers per part, **Friction** and **Elasticity**, plus two often-ignored **weights** that decide which surface wins when two parts touch. Getting the weights right is what makes "this floor is ice for everyone" work without editing every character.

## Ranges (units page)

| Property | Min | Max |
| --- | --- | --- |
| Friction | 0 | 2 |
| Elasticity | 0 | 1 |
| FrictionWeight | 0 | 100 |
| ElasticityWeight | 0 | 100 |

## How two parts combine (PhysicalProperties docs)

The contact value is a **weighted average** of both parts:

```
friction = (fA * wA + fB * wB) / (wA + wB)
```

Elasticity uses the same formula with the elasticity weights. So a part with weight 100 almost completely dictates the result against default parts (weight 1).

Example: Ice (friction 0.02, FrictionWeight 3 per the Materials table) against a character foot of Plastic (0.3, weight 1) gives `(0.02*3 + 0.3*1) / 4 = 0.09`. Set the ice floor's FrictionWeight to 100 and it becomes about 0.023: true ice.

## Recipes (own code)

```lua
local function surface(p: BasePart, friction: number, elasticity: number, fw: number, ew: number)
	local d = p.CurrentPhysicalProperties.Density
	p.CustomPhysicalProperties = PhysicalProperties.new(d, friction, elasticity, fw, ew)
end

surface(iceFloor, 0, 0, 100, 1)          -- slippery for everything that touches it
surface(trampoline, 0.3, 1, 1, 100)      -- trampoline decides the bounce
surface(stickyWall, 2, 0, 100, 1)         -- maximum grip
surface(ball, 0.3, 0.8, 1, 1)            -- bouncy ball that still loses energy
```

Keep density from the current properties so you do not change mass by accident.

## Elasticity is not "bounce height" exactly

Elasticity behaves like a coefficient of restitution: the share of the impact speed kept after a bounce. Since height scales with speed squared, a ball dropped with elasticity `e` returns to roughly `e^2` of its height (0.8 gives about 64%), before friction, spin and solver effects. Elasticity 1 with weight 100 can still lose or gain a little energy per bounce in practice; test rather than expect a perfect loop.

## Characters and friction

Humanoid walking is driven by the character controller, so floor friction affects players less than it affects loose parts. Low-friction floors with high weight do make characters slide when they stop and on slopes; very slippery games often add custom movement on top. Sliding props (crates, pucks) respond fully to friction.

## Vehicles

Tyres are where friction tuning matters most: grip comes from wheel friction against the road, so high wheel FrictionWeight lets wheels behave the same on any floor material. See the tyre note below.

## Pitfalls

- Editing `Material` resets the default physical properties unless `CustomPhysicalProperties` is set.
- Elasticity on both parts set high, but weights left at 1, averages with the other object; give the surface you care about the high weight.
- Terrain materials have their own physical properties; parts with high weights still win against terrain.

## Related
[[Physics Ragdolls - Hub]] · [[Tyre Friction with CustomPhysicalProperties]] · [[Physics - Mass and Density - AssemblyMass, Massless and Custom Density]] · [[Physics, Collisions and Ragdolls]]
