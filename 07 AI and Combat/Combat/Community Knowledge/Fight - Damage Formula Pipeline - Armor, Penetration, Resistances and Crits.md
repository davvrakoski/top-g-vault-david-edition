---
area: "07 AI and Combat"
cluster: "Combat"
title: "Damage Formula Pipeline - Armor, Penetration, Resistances and Crits"
tags: [roblox, community-knowledge, combat, damage-formula, armor, crits, dps, balancing]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://wiki.leagueoflegends.com/en-us/Armor
  - https://wiki.leagueoflegends.com/en-us/Armor_penetration
  - https://wiki.leagueoflegends.com/en-us/Critical_strike
  - https://minecraft.wiki/w/Damage
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid#TakeDamage
---
# Damage Formula Pipeline - Armor, Penetration, Resistances and Crits

Most Roblox games start with `humanoid:TakeDamage(10)` scattered across twenty scripts. The day you add armor, a crit stat or a fire resistance pet, every one of those calls is wrong in a different way. Games with long-lived stat systems (MOBAs, RPGs, Minecraft) all run damage through **one ordered pipeline** with a published formula. This note gives you a pipeline you can copy and the math to balance it.

## The pipeline (one server function, fixed order)

1. **Base damage** from the weapon/ability config (never from the client).
2. **Attacker multipliers**: buffs, level scaling, charge level, headshot zone.
3. **Crit roll** (multiply).
4. **Defender mitigation**: armor or resistance for this damage type, after penetration.
5. **Flat modifiers** last: shields absorb, then "damage taken +10%" debuffs, then minimum damage clamp.
6. Apply with `Humanoid:TakeDamage` (which respects a ForceField) or by setting `Health`, and log the event for kill credit.

Writing the order down matters more than the exact formulas: two developers who disagree on whether crits apply before or after armor will ship two different games.

## Armor: use the "100 / (100 + armor)" curve

League of Legends documents the classic diminishing-returns formula: damage taken = raw × 100 / (100 + armor). Its key property is that **each point of armor adds exactly 1% effective health** against that damage type: 60 armor on 1000 HP means 1600 damage is needed. That makes armor linear to balance while damage reduction never reaches 100%.

| Armor | Damage taken | Effective HP multiplier |
|---|---|---|
| 0 | 100% | 1.0x |
| 50 | 66.7% | 1.5x |
| 100 | 50% | 2.0x |
| 300 | 25% | 4.0x |

Compare a **flat subtraction** (damage - armor): it is easy to read but makes small hits deal 0 and lets stacking armor make players immune. If you use it, clamp to a minimum (for example 1 damage or 10% of raw).

For **negative armor** League uses raw × (2 - 100 / (100 - armor)), so shredding below zero increases damage smoothly instead of exploding.

## Penetration order

League's wiki lists the order: flat armor reduction, percent armor reduction, percent penetration, then flat penetration (lethality). Only reduction can push armor below zero; penetration stops at 0. Copy this: reductions are debuffs on the target that help the whole team, penetration is the attacker's private stat.

## Resistances per damage type

Keep a table of types (`Physical`, `Fire`, `Poison`, `True`) and give each defender a resistance number that feeds the same curve. `True` damage skips mitigation, which is your tool for fixed-damage mechanics like fall damage or boss enrage.

## Crits and expected damage

- Expected multiplier = 1 + critChance × (critMultiplier - 1). At 25% chance and 2.0x, average damage is 1.25x.
- League's base crit is 200% and it uses a pseudo-random system that raises the chance after each non-crit so streaks feel fair. A simple Luau version: add the base chance to an accumulator each swing and crit when a random roll is under it, resetting on crit.
- Minecraft Java gates crits behind a condition (falling, attack cooldown at least 84.8%) and gives +50%. Conditional crits reward skill instead of stats.

## Luau sketch

```lua
local function mitigate(raw: number, armor: number): number
	if armor >= 0 then
		return raw * 100 / (100 + armor)
	end
	return raw * (2 - 100 / (100 - armor))
end

function Damage.compute(hit)
	local dmg = hit.base * hit.attackerMult
	if math.random() < hit.critChance then dmg *= hit.critMult end
	if hit.type ~= "True" then
		local armor = hit.armor - hit.flatShred -- reduction may go below 0
		if armor > 0 then -- penetration only works on positive armor
			armor = math.max(0, armor * (1 - hit.pctPen) - hit.flatPen)
		end
		dmg = mitigate(dmg, armor)
	end
	return math.max(1, math.floor(dmg + 0.5))
end
```

## DPS sanity checks

- Sustained DPS = damage per hit × hits per second × crit multiplier average × (1 - miss rate), divided by mitigation.
- Time to kill = target effective HP / DPS. Put both in your balance sheet so you can see what an armor buff does to every weapon at once.

## Pitfalls

- Rounding at every step (round once at the end).
- Percent buffs that stack additively in one place and multiplicatively in another; decide per category.
- Showing damage numbers from client-side math that differs from the server.

## Related
[[Combat - Hub]] - [[Damage and Status Effects Blueprint]] - [[Headshots and Hit Zones - Damage Multipliers and Accessory Hits]] - [[Kill Credit, Assists and Damage Attribution]]
