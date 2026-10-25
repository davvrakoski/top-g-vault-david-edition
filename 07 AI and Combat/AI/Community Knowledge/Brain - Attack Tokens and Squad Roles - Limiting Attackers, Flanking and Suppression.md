---
area: "07 AI and Combat"
cluster: "AI"
title: "Attack Tokens and Squad Roles - Limiting Attackers, Flanking and Suppression"
tags: [roblox, community-knowledge, ai, attack-tokens, squad, flanking, suppression, fairness]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/cyber-demons-the-ai-of-doom-2016-
  - https://80.lv/articles/cyber-demons-the-ai-of-doom
  - https://pages.cs.wisc.edu/~dyer/cs540/handouts/gdc2006_orkin_jeff_fear.pdf
  - https://gdcvault.com/play/1013282/Three-States-and-a-Plan
---
# Attack Tokens and Squad Roles - Limiting Attackers, Flanking and Suppression

Ten enemies that all attack the player at once feel unfair and look dumb (they clump into one blob). Action games solve this with an **attack token** pool: an enemy must hold a token to attack, and only a few tokens exist. DOOM (2016) used this for its demons: each attack type had a limited number of tokens at a time, demons requested a token before attacking and released it after, difficulty settings changed the token counts, and a better-positioned demon could take a token from another (Tommy Thompson's write-up of id's GDC talk). Enemies without a token keep moving and threatening, so the fight still feels busy.

## Token pool design

- **Per target, per attack type**: for example per player, 2 melee tokens and 2 ranged tokens. Per-target pools stop five enemies from picking the same weak player in co-op.
- **Difficulty knob**: Easy 1+1, Normal 2+2, Hard 3+3. Changing token counts changes difficulty without changing enemy HP or damage.
- **Hold time**: a token is held from wind-up to recovery; release on death, stun or target change.
- **Stealing**: an enemy that is much closer or has a clear line of sight may take a token from a token holder that is far away or blocked.
- **Cooldown per enemy** after releasing a token (1-2 s) so the same enemy does not re-take it every time.

```lua
local Tokens = {}

function Tokens.request(target, kind, npc, score)
	local pool = Tokens[target] and Tokens[target][kind]
	if not pool then return false end
	if #pool.holders < pool.max then table.insert(pool.holders, { npc = npc, score = score }); return true end
	-- steal from the worst holder if we are clearly better
	table.sort(pool.holders, function(a, b) return a.score < b.score end)
	if score > pool.holders[1].score * 1.5 then
		pool.holders[1].npc:OnTokenLost()
		pool.holders[1] = { npc = npc, score = score }
		return true
	end
	return false
end
```

`score` can be closeness plus line-of-sight plus "is in front of the player's camera" (attacks from on-screen enemies are fairer).

## What token-less enemies do

This is where squad behavior comes from:

| Role | Behavior while waiting |
|---|---|
| **Circler** | Strafe around the target at 10-15 studs, keep facing it |
| **Flanker** | Move to a point 90-140 degrees off the target's look direction, then wait for a token |
| **Suppressor** (ranged) | Fire inaccurate shots near the target (misses that add pressure), keep cover |
| **Blocker** | Stand between the target and the nearest exit or objective |

Pick a flank point by rotating the vector from target to enemy around the target by +/- 100 degrees, then test it with a quick path or raycast. Spread waiting enemies on a ring by giving each an angle slot (360 / n), which kills clumping.

## Squad feel without a squad brain

Jeff Orkin's F.E.A.R. paper ("Three States and a Plan", GDC 2006) explains that soldiers planned individually, and squad behaviors like suppression fire and advancing cover came from a light coordination layer assigning goals. On Roblox, a **squad manager** at 1-2 Hz is enough: count enemies per role around each player, and when there is no flanker, assign the nearest idle enemy "Flank". Add barks ("Flanking!", "Cover me!") from the assigned role: F.E.A.R.'s dialogue made coordination visible, and it is cheap.

## Fairness rules

- Never let more than one enemy attack the player from **outside the camera view** at once.
- Telegraph every attack longer when more tokens are in use.
- Show suppression clearly (tracers, impacts near the player), so it reads as pressure, not random damage.

## Pitfalls

- Tokens never released because an NPC was destroyed: release in the NPC's cleanup.
- Pools keyed by `Player` that leak after the player leaves; clear on `PlayerRemoving`.
- Only melee tokens: ranged enemies then all fire at once.

## Related
[[AI - Hub]] - [[Ranged Enemy Tactics - Cover Points, Line of Sight and Peeking]] - [[GOAP - Goal-Oriented Action Planning for Roblox NPCs]] - [[Threat Tables and Target Selection for Enemies]] - [[Influence Maps for Tactical NPC Positioning]]
