---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
source_note: "25_Legendary_Production_Layer/31_Anime_Action_Starter_Architecture"
title: "Anime Action Starter Architecture"
tags: ["roblox", "legendary", "production", "cluster/foundations-planning"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Anime Action Starter Architecture

## Design target
Fast ability combat with readable elemental VFX, combo states, progression and boss encounters.

## Minimum vertical slice
1. **character controller + camera**.
2. **combat state machine**.
3. **ability/status framework**.
4. **enemy AI + bosses**.
5. **VFX quality tiers**.

## Full system dependency map
character controller + camera → combat state machine → ability/status framework → enemy AI + bosses → VFX quality tiers → inventory/equipment → quests/progression → analytics onboarding.

## Architecture principles
- server-authoritative damage/cooldowns.
- animation markers for active windows.
- client-rendered VFX.
- lock-on/mobile target UX.
- VFX accessibility and clutter control.

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
