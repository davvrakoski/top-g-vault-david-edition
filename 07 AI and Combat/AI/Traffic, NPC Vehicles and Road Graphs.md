---
area: "07 AI and Combat"
cluster: "AI"
source_note: "23_Expanded_Knowledge/44_Traffic_NPC_Vehicles_and_Road_Graphs"
title: "Traffic, NPC Vehicles & Road Graphs"
tags: [roblox, premium, "cluster/vehicles", "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Traffic, NPC Vehicles & Road Graphs

NPC traffic should follow a simplified road network rather than solving expensive general navigation every frame.

## Road graph
Nodes describe intersections/waypoints; edges describe lanes, direction, speed and turn rules. Vehicles look ahead, reserve space when needed and recover if blocked.

## Performance
Far traffic can be simplified, spawned/despawned outside view and updated less frequently. Only nearby vehicles need detailed obstacle checks.

## Lab
Run 10, 25 and 50 traffic vehicles and record server/frame cost before choosing the production budget.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[AI - Hub]]

**Related notes:** [[Encounter Director and Pacing]] · [[How to Save AI Usage - Context]] · [[Final 'ai Read This First' Instruction]] · [[AI Change Log]]

<!-- TDOD_GRAPH_END -->
