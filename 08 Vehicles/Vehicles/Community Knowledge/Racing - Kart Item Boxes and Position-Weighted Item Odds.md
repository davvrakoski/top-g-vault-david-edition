---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Kart Item Boxes and Position-Weighted Item Odds"
tags: [roblox, community-knowledge, vehicles, racing, kart, items, game-design]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.mariowiki.com/Mario_Kart_7_item_probability_distributions
  - https://www.mariowiki.com/Mario_Kart_Tour_item_probability_distributions
  - https://nintendosoup.com/in-depth-analysis-reveals-how-mario-kart-worlds-item-system-works/
  - https://en.wikipedia.org/wiki/Mario_Kart
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
---
# Racing - Kart Item Boxes and Position-Weighted Item Odds

Items are what make kart racing a party game: a weaker player can still win. The trick that Mario Kart popularised is that **odds depend on your place**: the leader mostly gets defensive items, players at the back get strong catch-up items. Done well, races stay close; done badly, the leader feels robbed. This note covers the box, the odds table, the effects and the server rules. Pads, laps and respawn are in [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]].

## What the reference games do

- Mario Kart 7 picks the odds table by your **current rank** when you open the box (Super Mario Wiki keeps the full tables).
- Mario Kart Tour uses placement rather than distance from the leader, and adds timing rules: for example, no Spiny Shell in the first 30 s and a 30 s cooldown after one appears.
- A 2025 analysis of Mario Kart World concludes items are position-based, with some items excluded during the first 20-30 s.
- Wikipedia summarises the design goal: the far-behind get powerful catch-up items, the leader gets small defensive ones.

## 1. Item boxes

- An anchored, `CanCollide = false` part with a spinning `?` model; detect pickup on the **server** with the same overlap check you use for pads (`workspace:GetPartBoundsInBox` around each kart, 10 Hz is enough).
- On pickup: hide the box (set `Transparency`, disable detection) and respawn it after 2-3 s.
- One held item per player (two with a "double" item). If holding one, the box still breaks but gives nothing (Mario Kart behaviour) or gives coins.

## 2. The odds table

Express odds as **weights per position band** so it works for 4 or 12 players: band = `math.ceil(position / playerCount * 4)` (1 = front quarter, 4 = back quarter).

| Item | Band 1 | Band 2 | Band 3 | Band 4 |
|---|---|---|---|---|
| Banana (drop) | 40 | 20 | 5 | 0 |
| Green shell (straight shot) | 30 | 25 | 15 | 5 |
| Mushroom (short boost) | 15 | 25 | 25 | 15 |
| Red shell (homing) | 5 | 20 | 25 | 20 |
| Triple boost | 0 | 5 | 20 | 25 |
| Lightning (slows everyone ahead) | 0 | 0 | 5 | 15 |
| Bullet (auto-drive catch-up) | 0 | 0 | 0 | 15 |
| Shield | 10 | 5 | 5 | 5 |

These numbers are a starting point of our own, not Nintendo's. Pick with a weighted random (see [[Weighted Loot Table]]) using a server `Random.new()`; never roll on the client.

```lua
local rng = Random.new()
local function roll(weights: { [string]: number }): string
	local total = 0
	for _, w in weights do total += w end
	local r = rng:NextNumber(0, total)
	for item, w in weights do
		r -= w
		if r <= 0 then return item end
	end
	return next(weights) :: string
end
```

## 3. Fairness rules

- **Time gates**: no leader-hitting item (lightning, "blue shell") in the first 30 s, and a global cooldown of 20-30 s between them.
- **Caps**: at most 2 homing items alive on the track at once.
- **Last-lap softening**: reduce band-4 power items a little on the final lap so a leader who drove well is not deleted at the line.
- **Distance tweak** (optional): if the gap to the leader is very small (< 2 s), treat the player one band closer to the front.

## 4. Effects, server-authoritative

- Client presses "use"; server checks the held item, removes it, spawns the projectile/hazard on the server.
- Projectiles: server-owned anchored parts moved along the track by the server (for homing: follow the AI racing line toward the target, see [[Racing - AI Racers on a Racing Line Spline]]). Clients see them via replication; for smoothness, clients may render their own predicted copy.
- Hit: server applies a short spin-out state on the victim (input lock 1-1.5 s, small impulse), then gives a brief invincibility (2 s) so nobody gets stun-locked.

## 5. UI and readability

- Slot in the top-left with a short "roulette" animation (0.8-1.2 s) before the item appears; the item is decided on the server **before** the animation starts.
- Warning icon when something homes in on you.
- Clear silhouettes and colours for each hazard on the track.

## Related
[[Vehicles - Hub]] · [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]] · [[Weighted Loot Table]] · [[Racing - Rubber-Banding and Fair Catch-Up]]
