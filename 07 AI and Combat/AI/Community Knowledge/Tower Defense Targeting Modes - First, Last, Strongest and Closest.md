---
area: "07 AI and Combat"
cluster: "AI"
title: "Tower Defense Targeting Modes - First, Last, Strongest and Closest"
tags: [roblox, community-knowledge, ai, tower-defense, targeting, turrets]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/help-with-tower-defense-%E2%80%9Cfirst%E2%80%9D-and-last-targeting/2690540
  - https://devforum.roblox.com/t/first-targetting-being-basically-random/3028488
  - https://devforum.roblox.com/t/why-doesnt-this-tower-attack-the-first-zombie-sometimes/2723571
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#GetPartBoundsInRadius
---
# Tower Defense Targeting Modes - First, Last, Strongest and Closest

Tower defense is one of Roblox's biggest genres, and "my tower shoots the wrong enemy" is one of its most common DevForum threads. The bug is almost always the same: "First" was implemented as "closest to the tower" or "first child in the Enemies folder", which looks right on straight paths and breaks the moment the path turns a corner. The fix is to track **path progress** per enemy and build every targeting mode from three numbers: progress, distance to tower, and health.

## Track progress, not position

Each enemy stores (server-side) the index of the waypoint it is walking to and how far it is from it. Convert that to one comparable number:

```lua
-- cumulative[i] = total path length from start to waypoint i (precompute once per map)
local function progress(enemy): number
	local i = enemy.targetWaypoint -- index of next waypoint
	local remaining = (waypoints[i] - enemy.position).Magnitude
	return cumulative[i] - remaining -- studs travelled along the path
end
```

Higher progress = closer to the base. This is the number the DevForum threads converge on (waypoint index, tie-broken by distance to the next waypoint), turned into a single float.

## The modes

| Mode | Pick the in-range enemy with... |
| --- | --- |
| First | highest progress |
| Last | lowest progress |
| Strongest | highest current health (tie: highest progress) |
| Weakest | lowest current health (tie: highest progress) |
| Closest | smallest distance to the tower |
| Furthest | largest distance within range |

```lua
local SCORERS = {
	First     = function(e, d) return progress(e) end,
	Last      = function(e, d) return -progress(e) end,
	Strongest = function(e, d) return e.health * 1e4 + progress(e) end,
	Weakest   = function(e, d) return -e.health * 1e4 + progress(e) end,
	Closest   = function(e, d) return -d end,
	Furthest  = function(e, d) return d end,
}

local function pickTarget(tower, enemies)
	local best, bestScore = nil, -math.huge
	local score = SCORERS[tower.mode]
	for _, e in enemies do
		local d = (e.position - tower.position).Magnitude
		if d <= tower.range and (not e.hidden or tower.canSeeHidden) then
			local s = score(e, d)
			if s > bestScore then best, bestScore = e, s end
		end
	end
	return best
end
```

Note the parentheses around the hidden check: without them, Luau's `and`/`or` precedence lets towers with `canSeeHidden` target enemies outside their range.

## Doing it at scale

- **Keep enemies as data**, not instances you query. A server table of enemy records (position, progress, health, flags) updated by your movement loop is far faster than `GetPartBoundsInRadius` per tower per tick. Use spatial queries only if you do not already have the list.
- **Retarget on a timer** (every 0.1-0.25 s) or when the current target dies or leaves range, not every frame.
- **Sticky targets for beam towers.** Lasers that switch targets constantly look broken; keep the current target until it leaves range unless the mode is First and a new enemy is clearly ahead.
- **Overkill protection.** Track "pending damage" from projectiles in flight; skip enemies that will already die. Big quality-of-life gain for multi-tower setups.
- **Move enemies on the client for visuals.** Many large TD games keep enemies as server data and render them on clients with interpolation along the path, which is why progress-based targeting is natural: the server never needs physics.

## Special flags

- **Hidden / flying / armored** enemies: boolean flags per enemy; towers have matching `canSee`/`canHit` flags. Check flags before scoring.
- **Boss priority:** some games add "Boss first" as a mode; implement as a large bonus to the score for boss-flagged enemies.

## Pitfalls

- "First" = lowest index in the enemies folder: wrong after spawns interleave.
- Measuring progress as distance to the base in a straight line: wrong on winding paths.
- Calculating targets on clients and sending "I hit enemy 42": exploitable; the server picks targets and applies damage.

## Related
[[AI - Hub]] - [[Tower Defense Starter Architecture]] - [[Flow Fields for Large Hordes]] - [[Scalable NPC Update Scheduler]]
