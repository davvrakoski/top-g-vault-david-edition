---
area: "07 AI and Combat"
cluster: "Combat"
title: "Status Effect Stacking Rules - Refresh, Intensity, Duration and Caps"
tags: [roblox, community-knowledge, combat, status-effects, buffs, debuffs, stacking]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.guildwars2.com/en/news/game-update-notes-may-11-2021/
  - https://wiki.guildwars2.com/wiki/Stack
  - https://wiki.leagueoflegends.com/en-us/Grievous_Wounds
  - https://devforum.roblox.com/t/stun-system-issues/1570629
  - https://create.roblox.com/docs/reference/engine/classes/Instance#SetAttribute
---
# Status Effect Stacking Rules - Refresh, Intensity, Duration and Caps

"What happens when two players poison the same zombie?" is the question that breaks most status systems. Without a written rule, the second poison either overwrites the first, doubles damage forever, or leaves a stray `task.delay` that removes the effect early. Big games make the rule explicit **per effect**. Guild Wars 2 is the clearest public example: every boon and condition is marked as stacking in **intensity** or **duration**, with caps.

## The five stacking modes

Give every effect definition a `stacking` field with one of these:

| Mode | Second application does | Good for | Real example |
|---|---|---|---|
| `Refresh` | Resets the timer, keeps one copy | Slows, marks, anti-heal | League's Grievous Wounds does not stack; reapplying refreshes it (40% heal cut) |
| `Duration` | Adds remaining time, up to a max | Speed boosts, protection | GW2 duration boons add time from all sources, max 30 s (May 2021 patch) |
| `Intensity` | Adds a separate stack with its own timer, up to a cap | Bleed, burn, "might" damage buffs | GW2 damaging conditions stack intensity |
| `Strongest` | Keeps only the highest magnitude; weaker ones wait | Slows of different strength | Common MMO rule; avoids 3 slows making a target immobile |
| `Unique per source` | One copy per attacker | DoTs in co-op so each player gets credit | |

GW2's 2021 patch removed a hidden 9-stack limit on duration boons and set clear max durations (30 s for boons like Swiftness, 10 s for conditions like Slow and Cripple). The lesson for you: **caps must be visible in data, not side effects of code.**

## Hard rules worth copying

- **Crowd control never stacks in intensity.** Stun, root and silence use `Refresh` or `Strongest`, plus a cap. A DevForum thread on stun bugs shows the usual failure: several overlapping `task.wait` stuns where the first one ends and restores WalkSpeed while a later stun should still be active. Store one end time and compare it.
- **Diminishing returns for repeat CC** in PvP: each new stun within 15 s lasts half as long (tune the numbers yourself).
- **Intensity needs a cap** (for example 10 or 25 stacks). An uncapped bleed in a 20-player raid is an instant kill.
- **Decide what removes stacks**: all at once (cleanse) or one at a time (decay).

## Data shape

```lua
-- Effects/Burn.lua
return {
	id = "Burn",
	stacking = "Intensity",
	maxStacks = 10,
	duration = 4,
	tick = 0.5,
	damagePerStackPerTick = 2,
	tags = { "Debuff", "Fire" },
}
```

## Container logic (server)

```lua
function Container:apply(def, source, now)
	local list = self.effects[def.id]
	if def.stacking == "Refresh" and list then
		list[1].ends = now + def.duration
	elseif def.stacking == "Duration" and list then
		list[1].ends = math.min(list[1].ends + def.duration, now + def.maxDuration)
	elseif def.stacking == "Intensity" then
		list = list or {}
		if #list >= def.maxStacks then table.remove(list, 1) end -- drop oldest
		table.insert(list, { ends = now + def.duration, source = source })
		self.effects[def.id] = list
	else
		self.effects[def.id] = { { ends = now + def.duration, source = source } }
	end
	self:publish(def.id) -- one attribute for UI, e.g. SetAttribute("Burn", #stacks)
end
```

One `Heartbeat` loop per server (not one thread per effect) walks containers, ticks damage and expires stacks. Expiry is computed from `ends`, so there is no stray `task.delay` to cancel.

## Replication for UI

Write a compact summary to attributes on the character (`Burn = 3`, `BurnEnds = 1234.5` using `workspace:GetServerTimeNow()`), so every client can draw icons and timers without remotes.

## Pitfalls

- Restoring a stat by saving the "old value" when the effect starts: two overlapping effects save each other's modified value. Recompute stats from base plus active effects instead.
- Refreshing a DoT also resets its tick timer, so spamming reapplication can delay damage forever. Keep the tick phase.
- Effects on a character that respawns: clear the container on `Humanoid.Died`.

## Related
[[Combat - Hub]] - [[Status Effect Container]] - [[Ability and Status Framework]] - [[Hitstun, I-Frames, Poise and Super Armor]]
