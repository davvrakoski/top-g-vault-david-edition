---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
source_note: "25_Legendary_Production_Layer/35_Open_World_RPG_Starter_Architecture"
title: "Open World RPG Starter Architecture"
tags: ["roblox", "legendary", "production", "cluster/foundations-planning"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Open World RPG Starter Architecture

## Design target
Streaming districts, quests, NPCs, combat, progression, inventories and fast travel in a persistent world.

## Minimum vertical slice
1. **world streaming**.
2. **spawn/fast travel**.
3. **quest state**.
4. **NPC activation**.
5. **combat**.

## Full system dependency map
world streaming → spawn/fast travel → quest state → NPC activation → combat → inventory/equipment → save schema → map/navigation.

## Architecture principles
- stream-safe references.
- zone-based AI activation.
- save IDs not instance references.
- district performance budgets.
- fast-travel loading handshake.

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
