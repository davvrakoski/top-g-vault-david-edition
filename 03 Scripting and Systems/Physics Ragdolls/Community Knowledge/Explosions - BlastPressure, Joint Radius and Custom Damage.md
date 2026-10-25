---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Explosions - BlastPressure, Joint Radius and Custom Damage"
tags: [roblox, community-knowledge, physics, explosions, damage, ragdoll, combat]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Explosion
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
---
# Explosions - BlastPressure, Joint Radius and Custom Damage

The built-in `Explosion` instance is the quickest way to get a boom, but its defaults are brutal and unfair for most games: it breaks joints (killing any Humanoid whose neck is inside the joint radius), pushes parts with the same force no matter how close they are, and craters terrain. Almost every shipped game turns most of that off and does damage and knockback itself. This note explains each property and gives the "custom explosion" pattern.

## Property reference (from the API docs)

| Property | Behaviour | Typical game setting |
| --- | --- | --- |
| `BlastRadius` | area of effect in studs, **0 to 100**; parts partially inside count | your design radius |
| `BlastPressure` | push strength. **Does not fall off with distance**: every unanchored part in range accelerates equally. Setting it to 0 removes the physical effect entirely | 0 (do your own falloff) |
| `DestroyJointRadiusPercent` | fraction (0-1) of the radius inside which **all joints** are destroyed. Default behaviour kills characters by breaking the neck | 0 for non-lethal joints |
| `ExplosionType` | whether terrain is cratered (`NoCraters` to keep terrain) | `NoCraters` unless destruction is a feature |
| `Visible` | show the default visual effect | false when you use your own VFX |
| `TimeScale` | speed of the visual effect | |
| `Hit` event | fires once per BasePart in range, with the part and its distance | where your damage code goes |

The visual size is the same no matter the `BlastRadius`, so big custom radii need custom VFX anyway.

## Pattern: custom explosion with falloff (own code)

```lua
local function explode(position: Vector3, radius: number, maxDamage: number, maxSpeed: number, attacker: Player?)
	local ex = Instance.new("Explosion")
	ex.Position = position
	ex.BlastRadius = radius
	ex.BlastPressure = 0                 -- no built-in push
	ex.DestroyJointRadiusPercent = 0     -- no instant joint kills
	ex.ExplosionType = Enum.ExplosionType.NoCraters

	local hitHumanoids = {}
	ex.Hit:Connect(function(part, distance)
		local model = part:FindFirstAncestorOfClass("Model")
		local hum = model and model:FindFirstChildOfClass("Humanoid")
		if hum and not hitHumanoids[hum] then
			hitHumanoids[hum] = true          -- Hit fires per part: damage once per character
			local falloff = 1 - math.clamp(distance / radius, 0, 1)
			if not blockedByWall(position, model) then
				hum:TakeDamage(maxDamage * falloff)
			end
		end
		if not part.Anchored then
			local dir = (part.Position - position).Unit
			part:ApplyImpulse(dir * maxSpeed * falloff * part.AssemblyMass) -- per part; see note below
		end
	end)
	ex.Parent = workspace
end
```

Notes on the snippet:
- **`Hit` fires once per part**, so a character with 15 parts gets 15 calls. Track humanoids already damaged.
- Impulse per part over-pushes multi-part assemblies (each part adds push). Better: collect assemblies (`part.AssemblyRootPart`) in a set and push each root once.
- `blockedByWall` is your own line-of-sight raycast from the centre to the target's root, excluding the target. Without it, explosions damage through walls.
- Player characters are simulated by their own client. A server impulse on a player character may be delayed or ignored; send knockback to the owning client ([[Smooth Knockback - What Works for All Clients]]).

## Alternative: skip the Explosion instance

You can do the same with `workspace:GetPartBoundsInRadius(position, radius, overlapParams)` and your own VFX. That gives you `OverlapParams` filtering (ignore the thrower, ignore pickups) and avoids the instance entirely. Use the `Explosion` instance mainly when you want its stock visual.

## Design checklist
- [ ] Damage falls off with distance and does not pass through cover.
- [ ] Self-damage and team damage decided explicitly.
- [ ] Ragdoll on big hits, not death-by-joint-break ([[R15 Ragdoll with BallSocketConstraints - Setup, Limits and Recovery]]).
- [ ] Server validates who caused the explosion (no client-chosen position/radius).
- [ ] Terrain destruction rate-limited if enabled ([[Smooth Terrain from Code - FillBlock, WriteVoxels and Chunks]]).

## Related
[[Physics Ragdolls - Hub]] · [[Physics, Collisions and Ragdolls]] · [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]] · [[Raycasts and Shapecasts - RaycastParams in 2026]]
