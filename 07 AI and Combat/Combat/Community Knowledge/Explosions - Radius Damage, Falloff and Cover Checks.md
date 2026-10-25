---
area: "07 AI and Combat"
cluster: "Combat"
title: "Explosions - Radius Damage, Falloff and Cover Checks"
tags: [roblox, community-knowledge, combat, explosions, aoe, damage]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Explosion
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#GetPartBoundsInRadius
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#Raycast
---
# Explosions - Radius Damage, Falloff and Cover Checks

Grenades, rockets, barrels and boss slams all need area damage. Roblox's built-in `Explosion` instance is convenient but its default behavior kills any Humanoid in range by breaking joints, ignores walls, and fires `Hit` once per part, so a character can be "hit" 15 times. The Explosion reference itself recommends turning the destructive parts off and applying your own damage through `Hit`. This note shows that pattern and a cheaper custom version with falloff and cover checks.

## The built-in Explosion, tamed

Properties that matter: `BlastRadius` (studs), `BlastPressure` (force on parts), `DestroyJointRadiusPercent` (0-1 share of the radius where joints break), `ExplosionType`, `Visible`, and the `Hit(part, distance)` event.

```lua
local function explode(position: Vector3, radius: number, maxDamage: number, attacker: Player?)
	local e = Instance.new("Explosion")
	e.Position = position
	e.BlastRadius = radius
	e.BlastPressure = 0 -- or a small value for a push
	e.DestroyJointRadiusPercent = 0 -- never break joints / insta-kill
	local damaged = {}
	e.Hit:Connect(function(part, distance)
		local model = part:FindFirstAncestorOfClass("Model")
		local hum = model and model:FindFirstChildOfClass("Humanoid")
		if hum and not damaged[model] then
			damaged[model] = true -- one hit per character, not per limb
			local falloff = 1 - math.clamp(distance / radius, 0, 1)
			hum:TakeDamage(maxDamage * falloff) -- TakeDamage respects ForceFields
		end
	end)
	e.Parent = workspace
end
```

The docs' own sample uses the same three ideas: zero joint destruction, a per-model "already damaged" table, and distance-based falloff with `TakeDamage`.

## A custom version (more control, fewer surprises)

For gameplay explosions you often want walls to block damage and a minimum damage ring. Skip the `Explosion` damage entirely (keep it or particles purely for visuals) and query:

1. `workspace:GetPartBoundsInRadius(position, radius, overlapParams)` with an `OverlapParams` filter that includes only character models (or a collision group of hitboxes).
2. Collect unique Humanoids from the returned parts.
3. For each, raycast from the explosion center to the target's root part (excluding characters). If geometry blocks it, apply a cover multiplier (0 for full cover, or 0.3 for "partial" games) or test a second ray to the head.
4. Damage curve: full damage inside an inner radius (for example 30% of radius), linear or squared falloff to a minimum (for example 15%) at the edge.

```lua
local function damageAt(distance: number, radius: number, maxD: number, minD: number): number
	local inner = radius * 0.3
	if distance <= inner then return maxD end
	local t = (distance - inner) / (radius - inner)
	return maxD + (minD - maxD) * t
end
```

## Knockback

Push characters away from the center with `AssemblyLinearVelocity` set or an `ApplyImpulse` on the root part, scaled by falloff. Player characters are owned by their clients, so a server impulse can be overridden; the community knockback notes recommend applying it on the owning client as well (or a short-lived `LinearVelocity` instance) for consistent results.

## Gameplay rules worth deciding

- **Self-damage:** rocket jumping (reduced self-damage) vs none.
- **Friendly fire:** usually off for teammates, on for the thrower at reduced value.
- **Damage attribution:** pass `attacker` through so kills and assists credit the thrower even if they died after throwing.
- **Destruction:** if you want walls to break, do it explicitly on tagged breakables, not with `DestroyJointRadiusPercent` on the whole map.

## Pitfalls

- Default Explosion with `DestroyJointRadiusPercent = 1`: every character in range dies instantly regardless of health.
- Damaging per `Hit` without the per-model table: one grenade does 10x damage.
- Running explosions from the client: other players see them but the damage must be server-side.
- Large `BlastPressure` near unanchored builds creates physics spikes on the server.

## Related
[[Combat - Hub]] - [[Damage and Status Effects Blueprint]] - [[Smooth Knockback - What Works for All Clients]] - [[Kill Credit, Assists and Damage Attribution]]
