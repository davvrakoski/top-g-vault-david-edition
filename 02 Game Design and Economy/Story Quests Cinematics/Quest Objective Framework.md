---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
source_note: "23_Expanded_Knowledge/34_Quest_Objective_Framework"
title: "Quest Objective Framework"
tags: [roblox, premium, "cluster/story-quests-cinematics"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Quest Objective Framework

Quest systems become unmaintainable when every quest has custom condition code.

## Objective types
Visit, interact, collect, defeat, survive, escort, talk, craft, deliver and custom scripted objective.

## Data-driven design
A quest definition should reference objective modules/config instead of embedding a giant script. Track progress server-side and save only durable state.

## Edge cases
Disconnect, party credit, duplicate kills, objective object destroyed, quest updated between versions and reward already claimed.

## Lab
Build three quests using the same framework and zero copied quest scripts.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Story Quests Cinematics - Hub]]

**Related notes:** [[Dialogue and Cutscene Blueprint]] · [[Cinematic and Cutscene Direction]] · [[Quest System Blueprint]]

<!-- TDOD_GRAPH_END -->
