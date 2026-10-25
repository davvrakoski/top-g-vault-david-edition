---
area: "07 AI and Combat"
cluster: "Combat"
title: "Battlegrounds M1 Chains - Hit Strings, Stun Refresh and Combo Reset"
tags: [roblox, community-knowledge, combat, battlegrounds, anime, m1, stun, combos]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/how-do-i-make-the-combo-reset/2968738
  - https://devforum.roblox.com/t/help-with-m1-script/2952845
  - https://devforum.roblox.com/t/how-to-stun-correctly-combat/1272468
  - https://devforum.roblox.com/t/stun-system-issues/1570629
  - https://devforum.roblox.com/t/stun-handler-v2/1072859
  - https://coddy.tech/learn/courses/roblox_game_battlegrounds/stun
  - https://www.roblox.com/games/10449761463/The-Strongest-Battlegrounds
---
# Battlegrounds M1 Chains - Hit Strings, Stun Refresh and Combo Reset

"M1" (left mouse button) is the basic attack string in Roblox anime battlegrounds games such as The Strongest Battlegrounds, whose page lists block, dash and ultimate controls next to M1 combos. The M1 string is the backbone of the genre: a short chain of punches where each hit stuns briefly, the last hit knocks back, and specials are used to extend or finish. DevForum help threads show the same three problems again and again: the combo never resets, stuns stack or end early, and the victim can act between hits. This note is a working spec.

## The standard shape (genre convention)

| Hit | Purpose | Stun on victim | Notes |
|---|---|---|---|
| M1 1-3 | Pressure | ~0.4-0.6 s (refreshes) | Small forward step for attacker |
| M1 4 (finisher) | Knockback / launch | Ragdoll or knockback | Ends the chain, attacker gets a short cooldown |
| Hold Space + finisher | Uppercut variant | Launch upward | Lets players start air combos |
| Air finisher | Downslam | Knockdown | |

Numbers here are a starting point, not taken from any specific game. Tune them so that **all 4 hits connect only if the attacker keeps pace**; a perfectly safe 4-hit string is boring.

## Rule 1: the combo resets on a timer

The DevForum answer is a timestamp per attacker: store `os.clock()` (or server time) on each M1; if more than ~1 s passes before the next press, start again at hit 1. Some games use up to 2 s. Also reset when the attacker is hit.

## Rule 2: stun is an end time, not a wait

Overlapping `task.wait(stun)` blocks are the classic bug: the first stun's timer ends and restores WalkSpeed while a later hit should still hold the victim. The thread fix is to make each new stun **override** the previous one. Store a single `stunnedUntil` and only restore movement when `now >= stunnedUntil`.

```lua
local function applyStun(char: Model, duration: number)
	local now = workspace:GetServerTimeNow()
	local untilT = math.max(char:GetAttribute("StunnedUntil") or 0, now + duration)
	char:SetAttribute("StunnedUntil", untilT)
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum.WalkSpeed = 0; hum.JumpHeight = 0 end
end

-- one server loop restores movement for everyone whose stun ended
```

The movement restore should recompute speed from base stats plus active effects, never from a value saved when the stun began (Coddy's battlegrounds course flags the same "saved zero speed" bug).

## Rule 3: no infinite and no free escape

- **Cap stun per chain**: the finisher always ends the string, and a victim cannot be re-stunned by M1s for ~0.5 s after a finisher (anti-loop).
- **Block** stops M1 damage; a **block break** (often the 4th hit or a special) punishes holding block forever.
- **Combo breaker / evasive**: many battlegrounds games give a cooldown escape (dash or "evasive") usable while stunned, on a long cooldown. This is what keeps 1v1s from being "whoever hits first wins".
- **Hit counter on the victim** (not just the attacker) prevents two attackers from chaining one victim forever: after N hits in X seconds, the victim gets brief immunity.

## Server flow per M1

1. Client plays the swing instantly and sends `M1(comboIndex, aimDir)`.
2. Server checks: not stunned, not on cooldown, `comboIndex` equals expected next index (else treat as hit 1), time since last M1 within rate limit.
3. Server runs the hitbox (shapecast or `GetPartBoundsInBox` in front of the root) at the active frame.
4. On hit: damage, `applyStun`, small knockback, hit VFX broadcast.
5. Finisher: knockback impulse on the victim (apply it where the victim's physics is owned; see the knockback note).

## Feel checklist

- [ ] Attacker gets a tiny forward nudge on each hit so the string stays in range.
- [ ] Hitstop of 2-4 frames per hit, bigger on the finisher.
- [ ] Victim faces the attacker on hit (readability).
- [ ] Combo counter UI for the attacker.
- [ ] Two attackers on one victim tested.

## Related
[[Combat - Hub]] - [[Combo Systems and Input Buffering]] - [[Hitstun, I-Frames, Poise and Super Armor]] - [[Case Study - The Strongest Battlegrounds]] - [[Smooth Knockback - What Works for All Clients]]
