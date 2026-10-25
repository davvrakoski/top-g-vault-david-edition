---
area: "07 AI and Combat"
cluster: "Combat"
title: "Souls-like Stamina Combat - Costs, Regen Delay, Guard Break and Exhaustion"
tags: [roblox, community-knowledge, combat, stamina, souls-like, blocking, dodge]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://darksouls.wiki.fextralife.com/Stamina
  - https://darksouls2.wiki.gg/wiki/Stamina
  - https://darksouls3.wiki.fextralife.com/Stamina
  - https://create.roblox.com/docs/reference/engine/classes/Workspace#GetServerTimeNow
---
# Souls-like Stamina Combat - Costs, Regen Delay, Guard Break and Exhaustion

Stamina is what turns button-mashing into decisions: every swing, roll and block spends from one bar, so the player must choose when to attack and when to back off. Roblox "souls-like" and medieval combat games often copy the bar but miss the rules that make it work: regen pauses, block penalties, guard break and the exhaustion state. Dark Souls wikis document the original numbers, which are a good starting point.

## Reference numbers (Dark Souls 1, per Fextralife wiki)

- Base regeneration **45 stamina per second**, same while walking or standing.
- Raising a shield cuts regeneration by **80%** (encumbrance penalties stack on top).
- Regeneration **stops until the attack animation ends**.
- Running out while sprinting: you must wait **3 seconds** before sprinting again.
- You can still start an attack with too little stamina; stamina goes negative (down to -50) and you cannot block or roll until it is back above 0.
- Blocking a hit that empties stamina causes a **guard break** stun.

Dark Souls II's wiki lists a base of about 51.9/s at low equip load and percentage-based regen; Dark Souls III removed the bonus for very low load. Exact values differ per game: copy the structure, not the numbers.

## The rules to implement

| Rule | Why it matters | Starter value for Roblox |
|---|---|---|
| Action costs | Heavier weapons cost more per swing | Light 12, heavy 25, roll 20, sprint 10/s, max 100 |
| Regen delay | Stops "attack, instant regen, attack" | 0.6 s after any spend |
| Regen while blocking | Turtling must drain you | 20% of normal rate |
| Block cost = incoming damage × weapon factor | Big hits hurt the guard more | Factor 0.5 for shields, 1.0 for weapons |
| Guard break | Holding block is not a perfect answer | Stagger 1.2 s, no block for 2 s |
| Exhaustion | Out of stamina must be scary | No roll/sprint until stamina passes 30% |

The **exhaustion threshold** is a Roblox-friendly variation: instead of negative stamina, lock rolls until the bar refills to a threshold. It reads clearly on a UI bar with a marker line.

## Server-authoritative stamina

Stamina gates rolls and blocks, which grant invulnerability and damage reduction, so the server must own it.

```lua
local Stamina = {}
Stamina.__index = Stamina

function Stamina.new(max) return setmetatable({ max = max, value = max, regenAt = 0, blocking = false }, Stamina) end

function Stamina:update(now, dt)
	if now < self.regenAt then return end
	local rate = self.blocking and 9 or 45
	self.value = math.min(self.max, self.value + rate * dt)
end

function Stamina:spend(amount, now)
	if self.value <= 0 then return false end -- allow going slightly negative like Souls
	self.value -= amount
	self.regenAt = now + 0.6
	return true
end
```

Replicate `value` as an attribute at a capped rate (for example 10 times per second, or only on change of 1+ point) and let the client predict the bar locally between updates.

## Feel tips

- Show **cost previews**: a ghost segment on the bar for the action you are about to do.
- Flash the bar and play a breath sound at guard break; players must understand why they got hit.
- Enemies need stamina too, or at least an attack-chain limit; otherwise the player's patience mechanic has no counterpart.
- Rolling i-frames and stamina cost are tuned together: cheap rolls with long i-frames make rolling the only defense.

## Pitfalls

- Charging stamina on the client only: exploiters roll forever.
- Regenerating during attack recovery: removes the commitment that makes heavy weapons meaningful.
- Penalizing blocks so hard nobody blocks; check block usage in playtests.

## Related
[[Combat - Hub]] - [[Parry, Block and Guard Break - Timing Windows Over the Network]] - [[Hitstun, I-Frames, Poise and Super Armor]] - [[Combat Feel Tuning Worksheet]]
