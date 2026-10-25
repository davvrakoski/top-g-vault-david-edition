---
area: "07 AI and Combat"
cluster: "Combat"
title: "Parry, Block and Guard Break - Timing Windows Over the Network"
tags: [roblox, community-knowledge, combat, parry, block, guard-break, melee, latency]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/parry-system-help/3102518
  - https://devforum.roblox.com/t/blocking-system/3137307
  - https://devforum.roblox.com/t/2507486
  - https://devforum.roblox.com/t/help-with-oop-combat-system/4018274
  - https://create.roblox.com/docs/reference/engine/classes/Player#GetNetworkPing
---
# Parry, Block and Guard Break - Timing Windows Over the Network

Anime battlegrounds and sword games live or die on defense. A block that never fails makes fights stall; a parry that works only on 20 ms ping makes mobile players quit. The DevForum threads agree on the basics: the **server** holds a timed block/parry state, and hit resolution checks that state before applying damage. This note fills in what the threads leave open: window lengths, latency handling, block meter and guard break, and the order of checks.

## States

| State | Entered by | Effect on an incoming hit |
| --- | --- | --- |
| Parry window | Block pressed, first `PARRY_WINDOW` seconds | Attack is negated; attacker is stunned (parry reward) |
| Blocking | Block held after the window | Damage reduced (for example 80-100%), block meter drains |
| Guard broken | Block meter hits 0, or hit by an unblockable/heavy | Long stun, takes full damage, cannot block for a few seconds |
| Recovery | Block released | Short lockout (0.3-0.5 s) before blocking again; stops parry spam |

## Server-side state

```lua
-- per combatant, owned by the server
local PARRY_WINDOW = 0.18
local BLOCK_COOLDOWN = 0.4

local function startBlock(c, now)
	if now < c.blockReadyAt or c.stunnedUntil > now then return end
	c.blockStart = now
	c.blocking = true
end

local function endBlock(c, now)
	if not c.blocking then return end
	c.blocking = false
	c.blockReadyAt = now + BLOCK_COOLDOWN
end

local function resolveHit(defender, attacker, hit, now)
	-- 1. i-frames / dodge first (see the hitstun note)
	if defender.invulnerableUntil > now then return "ignored" end
	-- 2. must be facing the attacker to block (front 120 degrees)
	local toAttacker = (attacker.root.Position - defender.root.Position).Unit
	local facing = defender.root.CFrame.LookVector:Dot(toAttacker) > 0.5
	if defender.blocking and facing and not hit.unblockable then
		local held = now - defender.blockStart
		if held <= PARRY_WINDOW + defender.latencyGrace then
			attacker.stunnedUntil = now + 0.8
			return "parried"
		end
		defender.blockMeter -= hit.guardDamage
		if defender.blockMeter <= 0 then
			defender.blocking = false
			defender.stunnedUntil = now + 1.5
			return "guardBroken"
		end
		return "blocked"
	end
	return "hit"
end
```

`facing` uses a dot product of 0.5, which is a 120-degree cone (60 degrees either side). Attacks from behind always land, which rewards flanking.

## Latency: who gets the benefit?

When a defender presses block, the server learns about it half a round trip later. Without compensation, a 150 ms player's parry window is effectively shorter than a 30 ms player's.

- **Defender grace:** add part of the defender's latency to the parry window: `latencyGrace = math.clamp(player:GetNetworkPing() / 2, 0, 0.1)`. `Player:GetNetworkPing()` returns the round-trip estimate in seconds. Clamp it so high-ping players cannot get huge windows.
- **Timestamp the input:** the client can send its `workspace:GetServerTimeNow()` with the block request; the server accepts it only if it is within a small tolerance of server time, and uses it as `blockStart`. Reject timestamps from the future or more than 150 ms in the past.
- **Show feedback immediately on the client** (block pose) but the result (parry flash, stun) only when the server confirms.

## Tuning starting points

- Parry window 0.12-0.25 s (lower = harder, more prestige).
- Block meter 100, regenerates 20/s after 1 s without being hit.
- Heavy attacks: guardDamage 40-60; light attacks 10-15.
- Parry reward stun 0.6-1.0 s, enough for one guaranteed light combo, not a full kill.
- Feints: allow attackers to cancel wind-up before the active frames, so defenders cannot just parry on animation start.

## Readability

Parry and guard break need distinct, loud feedback: a bright flash plus a sound on parry, a shattering effect and a stagger animation on guard break. Without it players cannot learn the timing.

## Pitfalls

- Deciding the parry on the client (the threads correctly reject this).
- Unlimited block with no meter: turtling wins.
- Checking block **after** applying damage, or in a different script from hit detection. One function, fixed order.
- Allowing block while stunned or mid-attack, unless that is a deliberate "parry-cancel" mechanic.

## Related
[[Combat - Hub]] - [[Hitstun, I-Frames, Poise and Super Armor]] - [[Combo Systems and Input Buffering]] - [[Lag Compensation and Server Rewind for Melee and Hitscan]]
