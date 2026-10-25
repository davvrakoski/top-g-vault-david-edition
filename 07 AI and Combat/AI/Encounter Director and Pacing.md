---
area: "07 AI and Combat"
cluster: "AI"
source_note: "23_Expanded_Knowledge/27_Encounter_Director_and_Pacing"
title: "Encounter Director & Pacing"
tags: [roblox, premium, "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Encounter Director & Pacing

A director controls pressure over time instead of simply spawning enemies whenever a cooldown reaches zero.

## Inputs
player count, health/resources, recent deaths, time since action, location, objective state, enemy budget and server performance.

## Output
spawn intensity, enemy mix, rest windows, special encounters and reinforcement timing.

## Performance budget
The director must know the maximum active AI budget. When server load is high, it should reduce or postpone nonessential spawns rather than collapsing performance.

## Fairness
Do not spawn threats directly in view or inside the player's unavoidable path unless the game intentionally telegraphs it.

## Lab
Graph intensity over a 10-minute session: warmup, first peak, recovery, escalation, climax. Then match spawns to that curve.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[AI - Hub]]

**Related notes:** [[Zombie Crowd Director Blueprint]] · [[Advanced NPC - AI Behavior]] · [[How to Save AI Usage - Context]] · [[Traffic, NPC Vehicles and Road Graphs]]

<!-- TDOD_GRAPH_END -->
