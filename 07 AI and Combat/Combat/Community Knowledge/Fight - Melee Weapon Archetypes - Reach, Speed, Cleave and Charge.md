---
area: "07 AI and Combat"
cluster: "Combat"
title: "Melee Weapon Archetypes - Reach, Speed, Cleave and Charge"
tags: [roblox, community-knowledge, combat, melee, weapons, balancing, cleave]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://minecraft.wiki/w/Damage
  - https://minecraft.wiki/w/Sword
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#GetPartBoundsInBox
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#Blockcast
---
# Melee Weapon Archetypes - Reach, Speed, Cleave and Charge

A melee roster where every weapon is "sword with more damage" collapses to the newest sword. Variety comes from trading off a few **axes**: reach, speed, number of targets (cleave), commitment (wind-up and recovery) and charge. Minecraft Java is a well documented example of a tiny ruleset that creates real choices: an attack cooldown scales damage, swords sweep, and crits need conditions.

## The axes

| Axis | Data field | What it changes |
|---|---|---|
| Reach | `range` (studs), hitbox length | Safety, spacing game |
| Speed | `windup`, `active`, `recovery` (s) | DPS and how punishable a miss is |
| Cleave | `maxTargets`, hitbox width/arc | Crowd control vs single target |
| Damage | `damage`, `staggerPower` | Burst and poise break |
| Movement | `moveSpeedWhileSwinging` | Kiting vs committing |
| Charge | `chargeTime`, `chargeMult` | Skill expression |

## Minecraft's rules as a reference

- **Attack cooldown**: cooldown length is 20 / attackSpeed ticks; damage multiplier is 0.2 + ((t + 0.5) / T)^2 × 0.8, clamped 0.2-1. Spam-clicking deals 20% damage, so timing beats CPS.
- **Sword**: attack speed 1.6 (0.625 s cooldown), 4-8 damage by tier, reach 3 blocks.
- **Sweep**: on the ground, not sprinting, at 84.8%+ charge, the sword also hits enemies near the target for 1 damage (Sweeping Edge raises this to 50-75% of base).
- **Crit**: falling attack at 84.8%+ charge, ×1.5.

Takeaways you can copy: a **charge curve** removes the autoclicker advantage; **cleave as a separate, weaker hit** keeps single-target weapons relevant; **conditional crits** reward movement skill.

## Five starter archetypes for a Roblox game

| Archetype | Range | Windup / recovery | Targets | Identity |
|---|---|---|---|---|
| Dagger | 5 | 0.10 / 0.20 | 1 | Fast, backstab bonus ×2 |
| Sword | 7 | 0.20 / 0.30 | 2 (sweep 40%) | All-rounder |
| Spear | 11 (thin box) | 0.30 / 0.35 | 2 in a line | Spacing, poke |
| Greataxe | 8 (wide arc) | 0.55 / 0.60 | 5 | Crowd clear, poise break |
| Hammer | 6 | 0.70 / 0.70 | 3 + shockwave | Knockdown, slow |

Starter numbers, not from a shipped game; balance with the DPS columns below.

## Shape the hitbox to the weapon

- Spear: long thin `GetPartBoundsInBox` or a `Blockcast` along the thrust direction.
- Axe: wide box in front, or several shapecasts sweeping an arc during the active window.
- Dagger: small box, and an angle test for backstab (attacker in the rear 90 degrees of the victim's LookVector).
- Use one `OverlapParams` per attack with the attacker's character in the exclude list, and de-duplicate victims per swing.

## Balance columns (put these in your sheet)

- **Cycle time** = windup + active + recovery.
- **Single-target DPS** = damage / cycle time.
- **Crowd DPS** = single DPS × average targets hit (playtest number, not max).
- **Punish window** = recovery + (windup of the defender's fastest counter). If negative, misses are free.
- **Effective reach** = range + lunge distance.

Rule of thumb: when one axis goes up, pay for it on another. A greataxe can have the best crowd DPS if it has the worst punish window.

## Pitfalls

- Hitbox size scaling with tool size accidentally (a huge cosmetic sword with huge reach).
- Different weapons sharing one animation speed, so speed stats do nothing.
- Cleave weapons used as the best single-target weapon because extra targets were free. Reduce damage for secondary targets.

## Related
[[Combat - Hub]] - [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]] - [[Melee Combo Blueprint]] - [[Config-Driven Weapons]] - [[Melee Hitbox Modules - RaycastHitbox to ShapecastHitbox]]
