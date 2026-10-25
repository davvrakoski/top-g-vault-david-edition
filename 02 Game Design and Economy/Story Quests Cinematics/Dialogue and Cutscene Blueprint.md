---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
source_note: "19_System_Blueprints/05_Dialogue_and_Cutscene"
title: "Dialogue and Cutscene Blueprint"
tags: [roblox, blueprint, "cluster/story-quests-cinematics"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Dialogue and Cutscene Blueprint

Dialogue should be data-driven:
- node ID
- speaker
- text/localization key
- choices
- conditions
- actions

Client displays dialogue and camera presentation. Server validates gameplay-changing choices/rewards.

Cutscenes:
- keep skippable when possible
- restore camera/input after interruption
- handle player death/reset/teleport
- never strand controls disabled if a sequence errors

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Story Quests Cinematics - Hub]]

**Related notes:** [[Quest Objective Framework]] · [[Quest System Blueprint]] · [[Cinematic and Cutscene Direction]]

<!-- TDOD_GRAPH_END -->
