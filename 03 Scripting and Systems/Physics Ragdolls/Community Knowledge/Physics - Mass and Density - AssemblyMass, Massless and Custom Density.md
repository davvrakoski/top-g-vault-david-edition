---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Physics - Mass and Density - AssemblyMass, Massless and Custom Density"
tags: [roblox, community-knowledge, physics, mass, density, materials]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/datatypes/PhysicalProperties
  - https://create.roblox.com/docs/parts/materials
  - https://create.roblox.com/docs/physics/units
---
# Physics - Mass and Density - AssemblyMass, Massless and Custom Density

Mass decides how hard things are to push, how far they fly from explosions, whether they float, and how much force your constraints need. In Roblox you never type a mass: you set **density** and the size does the rest. Knowing the few mass-related properties prevents the classic bugs: a sword that drags the player sideways, a car that flips because a decorative part weighs a ton, a crate that will not float.

## The properties (API reference)

| Member | Meaning |
| --- | --- |
| `BasePart:GetMass()` | this part's mass (density x volume) |
| `BasePart.AssemblyMass` | mass of the whole assembly (rigidly connected parts) |
| `BasePart.AssemblyCenterOfMass` | world center of mass of the assembly |
| `BasePart.Massless` | part contributes no mass when welded to a non-massless part |
| `BasePart.CustomPhysicalProperties` | override material density, friction, elasticity and their weights |
| `BasePart.RootPriority` | influences which part becomes the assembly root |

Density limits (units page): 0.0001 to 100 RMU/stud3. Water is 1.

## Mass from size (own code)

```lua
local function expectedMass(p: BasePart): number
	local d = p.CurrentPhysicalProperties.Density
	return d * p.Size.X * p.Size.Y * p.Size.Z -- blocks; meshes use their own volume
end
```

Default material densities (Materials page): Plastic 0.7, Fabric 0.7, Neon 0.7, Ice 0.919, Rubber 1.3, Brick 1.922, Concrete 2.403, Foil 2.7, Granite 2.691. A 2x2x2 Concrete block is about 19.2 RMU; the same block in Plastic is 5.6.

## Setting density (own code)

```lua
local function setDensity(p: BasePart, density: number)
	local cur = p.CurrentPhysicalProperties
	p.CustomPhysicalProperties = PhysicalProperties.new(
		density, cur.Friction, cur.Elasticity, cur.FrictionWeight, cur.ElasticityWeight)
end
```

Keep friction/elasticity from the current values so changing weight does not silently change grip.

## Recipes

- **Held tools and accessories:** set `Massless = true` on welded cosmetic parts so they do not unbalance the character or a vehicle.
- **Vehicles:** make the body light and add one dense, low "ballast" part to pull the center of mass down (fewer flips). Check with `AssemblyCenterOfMass`.
- **Throwable props that feel different:** same size, different density (wooden crate 0.35-0.7, metal safe 5+), and use a fixed impulse so the heavy one flies less.
- **Floating loot:** density under 1 floats on terrain water; around 0.5 floats half submerged.

## Massless gotcha

`Massless` only works when the part is welded to a part that is **not** massless. A lone massless part, or the assembly root, still has mass. If an entire model is massless, the engine still gives it mass from its root.

## Pitfalls

- Forces in constraints must scale with `AssemblyMass`; hard-coded forces break when artists change part sizes.
- Very light parts (density near the minimum) welded to very heavy parts can jitter; keep mass ratios within about 1:100 where possible (community guideline, unverified).
- Changing density on the client of a part the server owns does nothing useful; set it on the owner or the server.

## Related
[[Physics Ragdolls - Hub]] · [[Center of Mass, Anti-Flip and Self-Righting]] · [[Physics - Roblox Units Cheat Sheet - Studs, RMU, Rowtons and Gravity]] · [[Physics - Impulse Math - ApplyImpulse, Mass and Velocity Change]]
