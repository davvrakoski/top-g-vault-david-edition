---
area: "07 AI and Combat"
cluster: "AI"
title: "Boss Move Selection - Weighted Pattern Tables, Range Gates and No-Repeat Rules"
tags: [roblox, community-knowledge, ai, bosses, attack-patterns, weighted-random, scripting]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://gameprogrammingpatterns.com/state.html
  - https://riskofrain2.wiki.gg/wiki/Directors
  - https://www.gamedeveloper.com/design/cyber-demons-the-ai-of-doom-2016-
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
---
# Boss Move Selection - Weighted Pattern Tables, Range Gates and No-Repeat Rules

The boss design note covers phases and telegraphs; this note is about the **brain that picks the next move**. Most Roblox bosses use `moves[math.random(#moves)]`, which gives three slams in a row, a ranged attack while the player is hugging the boss, and no sense of personality. A move selector built from a few rules fixes that and stays data-driven, so designers can tune a boss without editing code.

## Move definition

```lua
-- Bosses/Golem/Moves.lua
return {
	{ id = "Slam",      weight = 4, range = { 0, 14 },  cooldown = 6,  phases = { 1, 2, 3 } },
	{ id = "Sweep",     weight = 3, range = { 0, 10 },  cooldown = 4,  phases = { 1, 2, 3 } },
	{ id = "RockThrow", weight = 3, range = { 20, 90 }, cooldown = 5,  phases = { 1, 2, 3 } },
	{ id = "Charge",    weight = 2, range = { 25, 70 }, cooldown = 10, phases = { 2, 3 } },
	{ id = "Quake",     weight = 1, range = { 0, 60 },  cooldown = 25, phases = { 3 }, minTargetsInRange = 2 },
}
```

## Selection rules, in order

1. **Phase filter**: only moves listed for the current phase.
2. **Range gate**: distance to the current target must be inside `range`. This alone makes the boss look intelligent: it throws rocks at kiting players and slams huggers.
3. **Cooldown**: each move has its own `readyAt` timestamp.
4. **Condition checks**: line of sight for ranged moves, `minTargetsInRange` for area moves in co-op.
5. **No-repeat**: weight × 0.25 for the last move used, × 0 if it was used twice in a row.
6. **Weighted pick** among the survivors (the same two-stage weighted lottery Risk of Rain 2's director uses for monster cards: chance = weight / total weight).
7. **Fallback**: if nothing qualifies, reposition (walk toward the preferred range of the highest-weight move) for 0.5-1 s, then retry.

```lua
local rng = Random.new()

local function pickMove(boss, moves, dist, now)
	local pool, total = {}, 0
	for _, m in moves do
		if table.find(m.phases, boss.phase) and dist >= m.range[1] and dist <= m.range[2]
			and now >= (boss.readyAt[m.id] or 0) then
			local w = m.weight
			if boss.lastMove == m.id then w *= (boss.repeatCount >= 2) and 0 or 0.25 end
			if w > 0 then table.insert(pool, { m = m, w = w }); total += w end
		end
	end
	if total == 0 then return nil end
	local r = rng:NextNumber(0, total)
	for _, e in pool do r -= e.w; if r <= 0 then return e.m end end
	return pool[#pool].m
end
```

## Scripted strings and signature sequences

Pure randomness hides a boss's character. Mix in **authored strings**: a move can declare `followUps = { "Sweep" }` with a chance, so "Slam into Sweep" becomes a learnable combo. Phase transitions can trigger a fixed sequence (roar, Quake, summon adds) before returning to the weighted picker.

## State structure

Game Programming Patterns' State chapter describes hierarchical states and pushdown automata. A boss maps cleanly onto that:

- Top level: `Intro`, `Fighting`, `PhaseTransition`, `Staggered`, `Dead`.
- Inside `Fighting`: `Choose` > `Telegraph` > `Active` > `Recover` > `Choose`.
- `Staggered` is **pushed** on top when poise breaks and popped back to the previous sub-state.

Recovery time after each move is the player's damage window; never let the picker skip it.

## Target selection in co-op

Pick the target before the move: use threat (see the threat table note), switch targets at most every 6-8 s, and prefer targets in front of the boss for melee moves. Area moves can target the **group center** instead of one player.

## Tuning with telemetry

Log each move use with phase, target distance and whether it hit. After a playtest, if one move is 40% of all uses or a move never hits, adjust weights or range gates. DOOM's designers stressed that each demon's individuality comes from distinct behaviors; a boss whose move log is dominated by one attack has lost that.

## Pitfalls

- Cooldowns that start at fight start, so the strongest move is available in the first second.
- Range measured from boss center instead of edge: huge bosses never use melee.
- Selecting on the client: all clients must see the same move; pick on the server and broadcast the move id plus a start time.

## Related
[[AI - Hub]] - [[Boss Fight Design - Phases, Telegraphs and Arena Rules]] - [[Threat Tables and Target Selection for Enemies]] - [[Behavior Trees and Utility AI in Luau]]
