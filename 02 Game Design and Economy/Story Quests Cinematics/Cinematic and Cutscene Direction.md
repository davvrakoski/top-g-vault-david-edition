---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
source_note: "23_Expanded_Knowledge/13_Cinematic_and_Cutscene_Direction"
title: "Cinematic & Cutscene Direction"
tags: [roblox, premium, "cluster/story-quests-cinematics"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Cinematic & Cutscene Direction

Cutscenes should serve pacing, story or instruction — not hold the player hostage.

## Structure
Establish -> reveal -> change -> hand control back.

## System design
Use timeline data for camera shots, character cues, dialogue, sound and VFX. Keep gameplay state server-authoritative and treat cinematics as presentation layered on top.

## Multiplayer questions
Can one player skip? Does everyone need synchronization? What if someone joins late? What if an NPC dies or leaves before the scene? Decide these before scripting.

## Accessibility
Provide captions and consider skip controls for repeat viewing. Avoid important information that exists only in a brief visual cue.

## Lab
Make a 20-second intro that can be skipped safely at any point without leaving camera/input/UI in a broken state.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Story Quests Cinematics - Hub]]

**Related notes:** [[Quest System Blueprint]] · [[Dialogue and Cutscene Blueprint]] · [[Quest Objective Framework]]

<!-- TDOD_GRAPH_END -->
