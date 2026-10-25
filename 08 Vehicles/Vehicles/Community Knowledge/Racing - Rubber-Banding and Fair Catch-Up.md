---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Rubber-Banding and Fair Catch-Up"
tags: [roblox, community-knowledge, vehicles, racing, ai, difficulty, game-design]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/the-pure-advantage-advanced-racing-game-ai
  - https://journals.sagepub.com/doi/10.3233/ICG-220207
  - https://game-wisdom.com/critical/rubber-banding-ai-game-design
  - https://giantbomb.com/wiki/Concepts/Rubber_Band_AI
---
# Racing - Rubber-Banding and Fair Catch-Up

Without catch-up, races spread out after the first corner and become lonely time trials; with crude catch-up, players notice bots teleporting past them at impossible speeds and feel cheated. The goal is "close racing that feels earned". Game Wisdom and Giant Bomb both describe the same trade-off: rubber-banding keeps the challenge alive but easily reads as unfair.

## What Pure (Black Rock) learned

The developers wrote up their AI on gamedeveloper.com. Key ideas worth copying:

- They **rejected classic rubber-banding** (slow the leaders, speed up the trailers) because it felt unfair and punished late mistakes.
- Instead each AI rider has **skills from 0 to 1** (speed, cornering, etc.). Difficulty sets the starting range (normal was about 0.4-0.6) and caps how far skills may shift.
- A designer-written **race script** gives each AI group a target distance relative to the player that changes over the race. Their example: a "close" group of 3 always targets 0 m (beside you); a "back" group starts at 0 and ends 500 m behind; a "middle" group goes from +250 to -250; an "advanced" group from +500 to 0.
- Skill offsets scale with distance to the target point, capped (they used 150 m).
- **Opening**: AI drives at top skill for 10-20 s, then blends to normal over ~5 s, so groups form naturally.
- **Endgame**: target points freeze after 80% of the race, and the maximum skill boost shrinks to zero over the last 20%. The finish is decided by the player, not the system.

## A Roblox-sized version

Use your track progress value (see [[Racing - Track Progress, Wrong-Way Detection and Live Positions]]) in studs.

```lua
-- per bot, every 0.5 s on the server
local function skillOffset(botProgress: number, targetProgress: number, raceFrac: number): number
	local gap = targetProgress - botProgress            -- studs; + = bot is behind its target
	local maxBoost = 0.08 * (raceFrac < 0.8 and 1 or (1 - raceFrac) / 0.2)
	return math.clamp(gap / 600, -1, 1) * maxBoost      -- +-8% max, fades in the last 20%
end
-- final speed scale = baseSkill + skillOffset, clamped 0.85 .. 1.02
```

- `targetProgress` = the human leader's progress + this bot's scripted offset for the current race fraction.
- Apply the offset to **target speed and corner speed**, never to top speed above the car's real cap, so a bot can never be faster than a player could be.
- With several humans, anchor targets to the median human, not the leader, or the best player drags every bot along.

## Player-side catch-up (lighter touch)

- Slipstream: +3-5% acceleration when within ~15 studs directly behind another car. Easy to explain, so it feels fair.
- Position-weighted items (kart modes): see [[Racing - Kart Item Boxes and Position-Weighted Item Odds]].
- Boost refill slightly faster for trailing players (e.g. +15% nitro gain for last place).

## Rules that keep it fair

1. Never exceed physical limits a player could reach.
2. Turn catch-up off (or way down) in ranked and time-trial modes. Say so in the mode description.
3. Fade it out at the end of the race.
4. Hide it: small, continuous changes, not sudden bursts. The Pure write-up credits this subtlety for players feeling they earned their place.
5. Log finish gaps in playtests; if the median gap between 1st and last is under 2 s on every race, your bands are too tight.

## Related
[[Vehicles - Hub]] · [[Racing - AI Racers on a Racing Line Spline]] · [[Racing Starter Architecture]] · [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]]
