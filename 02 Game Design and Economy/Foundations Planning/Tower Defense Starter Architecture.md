---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
source_note: "25_Legendary_Production_Layer/38_Tower_Defense_Starter_Architecture"
title: "Tower Defense Starter Architecture"
tags: ["roblox", "legendary", "production", "cluster/foundations-planning"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Tower Defense Starter Architecture

## Design target
Deterministic lanes, tower placement, enemy waves, target selection, upgrades and scalable simulation.

## Minimum vertical slice
1. **map/lane graph**.
2. **wave director**.
3. **enemy movement**.
4. **tower placement**.
5. **targeting**.

## Full system dependency map
map/lane graph → wave director → enemy movement → tower placement → targeting → damage/status → economy → upgrade UI.

## Architecture principles
- avoid pathfinding every enemy if lane is fixed.
- spatial queries for targeting.
- server validates placements/purchases.
- batch visual projectiles.
- profile max wave.

## Milestone plan
**Prototype:** prove movement + one core interaction.

**Vertical slice:** one complete 5–15 minute loop with real UI, audio, save/reward path and one polished environment.

**Scale test:** push the intended maximum NPCs/players/effects/content density before building dozens of maps.

**Content production:** only after the pipeline is stable, multiply maps, enemies, items and quests.

**Release candidate:** analytics, onboarding, monetization (if used), device QA, maturity/compliance, rollback and community test.

## “Do not start here” trap
Do not begin by building a huge map, 100 weapons or 50 abilities. Build the smallest loop that proves the game is fun and technically viable.

## Acceptance tests
- [ ] Brand-new player understands the first objective without a developer explaining it.
- [ ] Core loop works with simulated latency and at target device tier.
- [ ] Important rewards and damage cannot be granted by arbitrary client values.
- [ ] Save/rejoin returns a valid state.
- [ ] Worst intended scene has a repeatable performance benchmark.

## Knowledge graph connections

**Primary cluster:** [[Foundations Planning - Hub|Foundations Planning]]

**Related:** [[Legendary Production Hub]] · [[Project Planning]]
