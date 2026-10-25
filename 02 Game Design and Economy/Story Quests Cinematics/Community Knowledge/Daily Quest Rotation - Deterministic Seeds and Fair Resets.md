---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Daily Quest Rotation - Deterministic Seeds and Fair Resets"
tags: [roblox, community-knowledge, quests, missions, liveops, rng]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/resources/feature-packages/missions
  - https://create.roblox.com/docs/production/game-design/season-pass-design
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://create.roblox.com/docs/production/configs
---
# Daily Quest Rotation - Deterministic Seeds and Fair Resets

Daily and weekly quests ("Defeat 20 zombies", "Hatch 5 eggs") give returning players a reason to log in and steer them toward features they'd skip. The technical trap is consistency: every server must agree on today's quests, they must reset at the same moment for everyone, and players must not be able to reroll by rejoining. A **deterministic seed from the UTC day** solves all three without any shared storage.

## Seeded selection

```lua
-- Own example: every server picks the same 3 global dailies for a given UTC day
local POOL = require(script.QuestPool) -- array of quest defs with weight + tags

local function dayIndex(): number
	return os.time() // 86400            -- UTC day number
end

local function dailyQuests(day: number, count: number)
	local rng = Random.new(day * 7919)  -- seed from day (prime spreads seeds)
	local picked, used = {}, {}
	while #picked < count do
		local q = POOL[rng:NextInteger(1, #POOL)]
		if not used[q.id] then
			used[q.id] = true
			table.insert(picked, q)
		end
	end
	return picked
end
```

`Random.new(seed)` gives the same sequence for the same seed on any server, so no DataStore read is needed. For **per-player** dailies (each player gets different quests) seed with `day * 1_000_003 + player.UserId`.

Important: the result depends on the order and contents of `POOL`. Adding a quest to the pool mid-day changes today's picks. Append new quests behind a `startsDay` field, or only change the pool at reset.

## Progress storage

Save only `{ day = 20385, progress = { quest_a = 12 }, claimed = { quest_a = true } }`. On join, if `saved.day ~= dayIndex()`, clear progress. Rerolling by rejoining is impossible because the list is derived, not stored.

## Rotation design (from Roblox's mission guidance)

Roblox's season pass and Missions package docs describe missions in categories and difficulties. Practical rules that follow:

- **Mix difficulty:** one easy (under 5 min), one medium, one hard per day.
- **Tag-based constraints:** never two "PvP" quests in one day; at least one quest touching the feature you want to grow (e.g. trading).
- **Surface progress where play happens** (small tracker on screen), not only in a menu.
- **Weeklies** use the same code with `os.time() // (7 * 86400)` (note: UTC epoch weeks start on Thursday; offset if you want Monday).
- **Reroll token:** one free reroll per day is a nice sink-free comfort feature; store the reroll count per day.

## Live tuning

Put quest targets ("defeat N") and reward amounts in Experience configs (`ConfigService`) so you can tune without republishing; keep the pool order in code so seeds stay stable.

## Pitfalls

- `math.random` without a seed differs per server. Always use a seeded `Random` object.
- Reset timing: show a countdown to the next UTC midnight so players know when new quests arrive.
- Quests that require other players ("win 3 rounds") punish players in empty servers; give solo alternatives.
- Log quest completes as custom/funnel events to spot quests nobody finishes.

## Related
[[Story Quests Cinematics - Hub]] - [[Quest System Blueprint]] - [[Quest Objective Framework]] - [[Streaks With Grace - Freezes, Repairs and Loss Aversion]]
