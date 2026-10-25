---
area: "07 AI and Combat"
cluster: "Combat"
title: "Boss Fight Design - Phases, Telegraphs and Arena Rules"
tags: [roblox, community-knowledge, combat, bosses, telegraphs, encounter-design]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/boss-battle-design-and-structure
  - https://www.gamedeveloper.com/design/design-deep-dive-angelical-echo-boss-fight
  - https://create.roblox.com/docs/reference/engine/classes/Workspace#GetServerTimeNow
---
# Boss Fight Design - Phases, Telegraphs and Arena Rules

Bosses are the moments players record and share, and the content Roblox games most often get wrong: a big Humanoid with lots of health that swings at the nearest player. Mike Stout's "Boss Battle Design and Structure" (Game Developer) breaks good boss fights into a sequence of beats with escalation; the "Angelical Echo" design deep dive on the same site shows a concrete structure with HP thresholds that boost the boss and a controlled order in which skills appear. This note turns those ideas into a Roblox-ready structure: data-driven phases, readable telegraphs, server-timed attacks, and rules for multiplayer arenas.

## Structure: phases by health threshold

```lua
local Boss = {
	maxHealth = 20000,
	phases = {
		{ untilPct = 0.70, moves = { "Slam", "Sweep" },              cadence = 3.0 },
		{ untilPct = 0.35, moves = { "Slam", "Sweep", "Adds" },      cadence = 2.4, intro = "Roar" },
		{ untilPct = 0.00, moves = { "Slam", "Sweep", "Adds", "Beam" }, cadence = 1.8, intro = "Enrage" },
	},
}
```

- Each phase **adds** a move instead of replacing everything: the player's knowledge carries forward, and the new move is the "test" of that phase.
- A phase transition is its own beat: the boss becomes invulnerable for a short intro (roar, arena change), which also prevents burst damage skipping a whole phase. Clamp damage so one hit cannot cross two thresholds.
- Order matters: introduce each move alone first (a "casting order"), then combine.

## Telegraphs: the fairness contract

Every damaging move has three timed parts, defined in data and run by the **server**:

| Part | Length (starting point) | What players see |
| --- | --- | --- |
| Wind-up / telegraph | 0.6-1.2 s (shorter in later phases) | Ground decal showing the exact area, glow, sound cue, animation pose |
| Active | 0.1-0.4 s | Hitbox checks run only now |
| Recovery | 0.8-2 s | Boss is vulnerable: the reward window |

The telegraph area must match the hitbox exactly. Server sends `{move, startsAt = workspace:GetServerTimeNow() + 0.1, areaCFrame, size}`; clients draw the decal and time animations from `startsAt`, so every player sees the same countdown regardless of ping. The server checks hits at `startsAt + windup` using its own geometry.

## Multiplayer arena rules

- **Scale health with player count** (for example `base * (0.6 + 0.4 * players)`), recalculated when players join or leave mid-fight, preserving the health percentage.
- **Spread targeting:** use a threat table for the main target, plus moves that target "random player", "farthest player" or "everyone", so ranged players cannot stand still.
- **Adds** keep groups busy but cap their number per player.
- **Arena boundaries:** invisible walls or a leash radius so the boss cannot be dragged out and players cannot cheese from outside. If all players leave the arena, reset the boss after 10-15 s.
- **Late joiners:** either lock the arena door when the fight starts or let them join as spectators.

## Reward and pacing

- Fight length target: 2-5 minutes for a regular boss, 5-10 for a raid boss. Track average kill time per player count in analytics and tune health to it.
- Rewards by contribution (damage ledger share) plus a participation floor, so healers and weak players are not punished.
- Clear victory moment: slow motion or a camera shot, loot burst, title on screen.

## Performance

A boss is one complex NPC; the cost is the effects. Spawn telegraph decals and VFX on clients, not as server parts; send one event per move. Hitboxes are server spatial queries (`GetPartBoundsInBox` with the telegraph's CFrame and size) only during active frames.

## Pitfalls

- Telegraph visuals that are smaller or larger than the real hitbox: players feel cheated instantly.
- Attack timing from server `task.wait` sent as "attack now": high-ping players see it late. Send the start time.
- Instant-kill mechanics in phase 1 before players have learned them.
- Boss health so high that fights become damage races instead of pattern learning.

## Related
[[Combat - Hub]] - [[Threat Tables and Target Selection for Enemies]] - [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]] - [[Encounter Director and Pacing]]
