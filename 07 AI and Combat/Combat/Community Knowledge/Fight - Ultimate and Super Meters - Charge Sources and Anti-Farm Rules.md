---
area: "07 AI and Combat"
cluster: "Combat"
title: "Ultimate and Super Meters - Charge Sources and Anti-Farm Rules"
tags: [roblox, community-knowledge, combat, ultimate, meter, awakening, balancing]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://overwatch.fandom.com/wiki/Ultimate_ability
  - https://us.forums.blizzard.com/en/overwatch/t/ult-charge-points/338580
  - https://www.roblox.com/games/10449761463/The-Strongest-Battlegrounds
  - https://create.roblox.com/docs/reference/engine/classes/Instance#SetAttribute
---
# Ultimate and Super Meters - Charge Sources and Anti-Farm Rules

Ultimates, supers and "awakenings" are the peak moments of a fight and the clips players share. The meter that unlocks them decides who gets those moments: if it only fills from damage, support players never ult; if it fills too fast, fights become ult trades. Overwatch is the best documented case of a meter tuned for team play, and battlegrounds games (The Strongest Battlegrounds lists an ultimate key and awakening) use a simpler PvP version.

## How Overwatch fills the meter (per the Overwatch Wiki)

Numbers are patch-dependent; check the wiki before quoting them.

- **Passive charge**: about 5 points per second once the round starts.
- **Combat charge**: 1 point per point of damage dealt to enemy heroes or healing done.
- **Discounts**: damage to overhealth gives half charge; damage or healing on tanks gives 40% less charge (so a big health pool is not an ult battery).
- **Cap**: charge stops at the ultimate's cost.
- **Swap penalty**: when switching hero, you keep at most 15% of the new hero's cost.

The key design ideas: everyone gets passive charge, every role earns from its own job, and the obvious farms are discounted.

## A meter model for Roblox

```lua
-- Config
local ULT = {
	cost = 100,
	passivePerSecond = 0.5,  -- full meter in ~200 s if idle
	perDamage = 0.08,
	perHealing = 0.08,
	perDamageTaken = 0.04,   -- comeback: getting hit charges a little
	tankDiscount = 0.6,      -- targets marked Tank give 60%
	sameTargetDecay = 0.5,   -- repeated hits on one dummy-like target give less
	keepOnDeath = 1.0,       -- or 0.5 for harsher modes
}
```

Server only: add charge inside your single damage function (the same place kill credit is recorded), clamp to `cost`, write an attribute (`UltCharge`) for the UI.

## Anti-farm rules

- **No charge from damaging teammates, yourself, summons you own, or training dummies.**
- **Per-target diminishing**: after N points of charge from one target in 10 s, further damage gives half. This kills the "two friends farm each other in a corner" trick in FFA battlegrounds.
- **No charge while the ult is active.**
- **Healing must be real**: charge only for health actually restored (not overheal on a full-HP player).
- **Charge from damage dealt to players, not to health bars**: if the victim has 5 HP left and you hit for 40, charge for 5.

## Comeback and pacing knobs

- Damage taken charges a little so losing players still get their moment (fighting-game supers often do this).
- Passive charge sets the **minimum** time between ults; combat charge sets how much skill speeds it up.
- Target: 1-2 ults per player per round or per 3-5 minutes of FFA. Measure with analytics events (`UltUsed`) and adjust.

## UI and feel

- Show percent, flash and play a sound at 100% (local to the owner), and show enemy ult status in team games if your design rewards tracking it.
- Voice line or VFX on activation is part of the counterplay: enemies need a tell.

## Pitfalls

- Meter in a client LocalScript: exploiters set it to 100.
- Forgetting multi-hit abilities: a 20-tick DoT that charges per tick can be worth more than intended.
- Saving the meter across rounds unintentionally because it lives on the Player instead of the round state.

## Related
[[Combat - Hub]] - [[Kill Credit, Assists and Damage Attribution]] - [[Case Study - The Strongest Battlegrounds]] - [[Ability and Status Framework]]
