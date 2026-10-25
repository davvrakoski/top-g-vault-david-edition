---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
source_note: "19_System_Blueprints/04_Quest_System"
title: "Quest System Blueprint"
tags: [roblox, blueprint, "cluster/story-quests-cinematics"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Quest System Blueprint

Quest definition:
- ID
- prerequisites
- objectives
- rewards
- repeatability
- dialogue hooks

Player quest state:
- status
- objective progress
- completion timestamp/version

Gameplay systems publish semantic events such as `EnemyDefeated(enemyType)` or `ItemCollected(itemId)`; the QuestService listens and updates relevant objectives. Avoid putting quest-specific code inside every enemy/item.

Rewards are granted on the server once, with a completion flag protecting against duplicate claims.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Story Quests Cinematics - Hub]]

**Related notes:** [[Cinematic and Cutscene Direction]] · [[Quest Objective Framework]] · [[Dialogue and Cutscene Blueprint]]

<!-- TDOD_GRAPH_END -->
