---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "23_Expanded_Knowledge/48_Weather_Performance_Budgets"
title: "Weather Performance Budgets"
tags: [roblox, premium, "cluster/weather", "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Weather Performance Budgets

Define weather budgets separately from normal gameplay so storms do not become the worst performance bug in the game.

Track active emitters, particles, dynamic lights, raycasts, audio sources and material changes. Give each weather state a low/medium/high quality configuration if needed.

## Rule
Weather should scale down cosmetic density before it affects controls, objective visibility or core game rules.

## Lab
Profile the exact same combat encounter in Clear and your heaviest weather preset.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance - Hub]]

**Related notes:** [[Mobile Performance Deep Dive]] · [[Performance and Profiling]] · [[Performance Log]] · [[Performance Audit Procedure]]

<!-- TDOD_GRAPH_END -->
