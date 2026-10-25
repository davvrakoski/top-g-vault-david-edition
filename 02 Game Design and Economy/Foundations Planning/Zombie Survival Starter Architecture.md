---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
source_note: "25_Legendary_Production_Layer/32_Zombie_Survival_Starter_Architecture"
title: "Zombie Survival Starter Architecture"
tags: ["roblox", "legendary", "production", "cluster/foundations-planning"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Zombie Survival Starter Architecture

## Design target
Crowd pressure, scavenging, melee/ranged combat, interactable world and scalable NPC populations.

## Minimum vertical slice
1. **movement/combat**.
2. **inventory + loot**.
3. **zombie brain**.
4. **crowd director**.
5. **spawn zones**.

## Full system dependency map
movement/combat → inventory + loot → zombie brain → crowd director → spawn zones → safe areas → weapons/crafting → save/progression.

## Architecture principles
- sleep distant zombies.
- stagger AI ticks.
- server validates damage/loot.
- stream world districts.
- limit persistent debris/blood decals.

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
