---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
source_note: "25_Legendary_Production_Layer/33_Horror_Starter_Architecture"
title: "Horror Starter Architecture"
tags: ["roblox", "legendary", "production", "cluster/foundations-planning"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Horror Starter Architecture

## Design target
Tension through audio, lighting, pursuit, scarce information and controlled pacing rather than only jumpscares.

## Minimum vertical slice
1. **player movement**.
2. **interaction**.
3. **objective state**.
4. **threat AI**.
5. **audio zones**.

## Full system dependency map
player movement → interaction → objective state → threat AI → audio zones → lighting/weather → checkpoint/save → cinematic triggers.

## Architecture principles
- fair telegraphing.
- AI cannot see through everything.
- audio hierarchy matters.
- camera effects need accessibility controls.
- keep scripted scares state-safe.

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
