---
area: "07 AI and Combat"
cluster: "Combat"
title: "Healing and Support Roles - Heal Targeting, Overheal, Anti-Heal and Credit"
tags: [roblox, community-knowledge, combat, healing, support, team-play, shields]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://wiki.leagueoflegends.com/en-us/Grievous_Wounds
  - https://overwatch.fandom.com/wiki/Ultimate_ability
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid#MaxHealth
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid#HealthChanged
---
# Healing and Support Roles - Heal Targeting, Overheal, Anti-Heal and Credit

A support class only works if healing is fun to do and visible to the team. In Roblox team shooters and co-op horde games, healing usually means "set Health += 20" and the healer gets no kills, no leaderboard, no reason to play the role. Games built around supports solve four problems: **who to heal, how much is too much, how to counter it, and how to reward it**.

## 1. Heal pipeline (same idea as damage)

Route every heal through one server function, `Heal.apply(target, source, amount, kind)`:

1. Reject dead targets, enemies, and targets out of range or line of sight.
2. Apply healing modifiers on the **target** (anti-heal, healing-received buffs).
3. Clamp to `MaxHealth`; anything above goes to overheal (if the kind allows) or is wasted.
4. Record the **effective** amount (health actually restored) for credit and meters.

Never let the client send the amount.

## 2. Targeting styles

| Style | Example input | Pros / cons |
|---|---|---|
| Beam / lock-on | Hold on a teammate in range | Easy on mobile; needs line-of-sight checks every tick |
| Projectile heal | Shoot allies to heal, enemies to hurt | Skill-based; needs the same hit validation as guns |
| Area / aura | Heal circle on the ground | Easy; reward positioning |
| Smart target | Heals lowest-percent ally in range | Great for console/mobile; less skill |

Smart targeting rule: pick the ally with the lowest `Health / MaxHealth` within range, prefer allies you are already beaming (sticky), and ignore allies at full HP.

## 3. Overheal and shields

Overheal lets supports pre-heal before a fight. Implement it as a **temporary shield value**, not by raising `MaxHealth`:

- `Shield` attribute absorbs damage first in your damage pipeline.
- Cap it (for example 50% of max health) and decay it (for example 3% per second) so it is a pre-fight tool, not a permanent buff.
- Overwatch's ult rules give half charge for damage to overhealth, a hint that shields should not double the value of every hit.

## 4. Anti-heal (counterplay)

League's Grievous Wounds is a clean model: **40% less healing and regeneration**, does **not** affect shields, does not stack, and reapplying refreshes it. Copy those rules:

- One anti-heal debuff with a fixed strength, `Refresh` stacking.
- Apply it from specific tools (fire, poison darts) so teams have to choose it.
- Show it with a clear icon and a green-to-grey health bar tint.

## 5. Reward the role

- **Assist credit**: healing a player who gets a kill within 5-10 s gives the healer an assist (add healers to the attacker's damage ledger entry).
- **Score**: points per effective HP healed, shown on the scoreboard.
- **Ult or meter charge** from effective healing (Overwatch gives charge for healing done).
- End-of-round stat: "healed 2,340".

## 6. Regeneration vs healing

Roblox characters get a default `Health` script that slowly regenerates health (about 1% of MaxHealth per second, unverified; read the script in a test character). To replace it, put your own Script named `Health` in StarterCharacterScripts. For combat games, replace it with your own: regen starts after 5 s without damage, so supports matter in fights and regen matters between them.

## Pitfalls

- Healing NPC enemies through an AoE because the team check is missing.
- Heal-over-time stacking from multiple healers to absurd totals; give each HoT `Unique per source` stacking or a cap.
- `HealthChanged` used for score: it fires for regen and respawn too.

## Related
[[Combat - Hub]] - [[Kill Credit, Assists and Damage Attribution]] - [[Downed, Revive and Bleed-Out States]] - [[Status Effect Container]]
