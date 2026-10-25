---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
title: "Tower Defense Genre Breakdown - Waves, Placement Economy and Unit Rosters"
tags: [roblox, community-knowledge, genre, tower-defense, waves, economy, balancing]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/experience-genres
  - https://create.roblox.com/docs/production/game-design/core-loops
  - https://www.redblobgames.com/pathfinding/tower-defense/
  - https://create.roblox.com/docs/production/monetization/paid-random-items
---
# Tower Defense Genre Breakdown - Waves, Placement Economy and Unit Rosters

Roblox lists Tower Defense as a subgenre of Strategy: players position defensive units along a path to stop waves of enemies. On Roblox the genre added two layers to the classic formula: **co-op matches** (2-4 players share a map) and a **meta-game of collecting units** (towers obtained through summons, crates or shops). This note breaks down the loops and the numbers you need to tune.

## The three loops

| Loop | Length | Player does |
|---|---|---|
| **In-wave** | seconds | Place, upgrade, sell, target-mode towers; use abilities |
| **Match** | 15-40 min | Survive N waves, earn match cash, beat a boss |
| **Meta** | days-weeks | Spend match rewards on new units, upgrades, cosmetics; unlock harder modes/maps |

The meta loop is where retention and monetization live; the in-wave loop is where fun lives. Prototype the in-wave loop with 3 towers and 10 waves before building any summon system.

## Wave design

- **Health budget per wave.** Define `budget(w)` = total enemy HP in wave w. A common shape is polynomial or gentle exponential growth (e.g. `base * w^1.6`, or `* 1.12^w`), then fill the budget with enemy types.
- **Enemy roles, not just HP:** fast (punishes slow-firing towers), armored/shielded (needs damage-type towers), flying/hidden (needs detection), splitters, healers, and **bosses** every 5-10 waves.
- **Teach one new threat per few waves**, show its icon in a wave preview, then mix.
- **Breathing waves:** after a boss, one easier wave lets players reorganize and spend.

## Placement economy

- Cash per kill + end-of-wave bonus. End-of-wave income makes economy towers ("farms") viable and gives a classic greed-vs-safety choice.
- **Upgrade cost ladder:** each level roughly 1.5-2x the previous, damage gain a bit lower than the cost gain, so spreading towers vs stacking upgrades is a real decision.
- **Sell refund** under 100% (often 50-80%) so placement mistakes cost something.
- **Placement limit per player** in co-op prevents one player hoarding the map, and caps server load.

## Unit roster (meta)

- Each unit needs a **clear job**: single-target DPS, splash, slow/stun, support buff, detection, economy. A roster where every unit is "more damage" collapses to the newest unit.
- **Rarity should add options, not only numbers.** A legendary that does a new thing (chain lightning) ages better than one with 2x damage.
- If units come from **paid** summons (Robux, or a currency bought with Robux), you must disclose odds and handle `ArePaidRandomItemsRestricted` (paid random items policy).
- Offer an earnable path for every unit type so free players can complete a team.

## Pathing and performance

- Enemies follow fixed waypoints on a map path in most Roblox TDs. For open-placement maze TDs, Red Blob Games' **flow field** approach (one BFS from the goal gives every tile a direction) beats per-enemy pathfinding when hundreds of enemies share one goal.
- Simulate enemies on the server as data (position along the path as a number), render on clients. Moving hundreds of physics `Humanoid`s is the usual performance killer.
- Range checks: compare tower position with enemy path progress; avoid `Touched`.

## Tuning checklist

- [ ] Win rate per difficulty from analytics (custom event on match end with wave reached).
- [ ] The wave where most runs end; is it a fair wall or a spike?
- [ ] Usage rate per unit; units under ~5% use need a role, not just a buff.
- [ ] Median match length versus your target.

## Related
[[Foundations Planning - Hub]] - [[Tower Defense Starter Architecture]] - [[Game Design, Balancing and Difficulty]] - [[Weighted Loot Table]]
