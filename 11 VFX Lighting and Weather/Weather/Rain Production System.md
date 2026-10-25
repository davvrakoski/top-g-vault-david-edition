---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
source_note: "23_Expanded_Knowledge/45_Rain_Production_System"
title: "Rain Production System"
tags: [roblox, premium, "cluster/weather"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Rain Production System

Rain is a layered illusion: local particles, world ambience, surface response, sky/lighting changes and optional wetness cues.

## Performance
Do not emit rain over the entire map. Keep effects near relevant players/camera volumes and reduce particles indoors or under cover.

## Indoor detection
Use sensible low-frequency checks or zone logic; avoid excessive raycasts every frame.

## Lab
Measure clear weather vs heavy rain in the worst gameplay scene and set a particle budget from evidence.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Weather - Hub]]

**Related notes:** [[Production Weather State Machine]] · [[Weather Systems]] · [[Thunder, Lightning and Accessibility]] · [[Fog, Snow, Wind and Layered Weather]]

<!-- TDOD_GRAPH_END -->
