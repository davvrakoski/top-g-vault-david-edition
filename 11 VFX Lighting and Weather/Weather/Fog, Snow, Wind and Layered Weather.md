---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
source_note: "23_Expanded_Knowledge/47_Fog_Snow_Wind_and_Weather_Layers"
title: "Fog, Snow, Wind & Layered Weather"
tags: [roblox, premium, "cluster/weather"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Fog, Snow, Wind & Layered Weather

Weather states can share a common controller while driving different layers: Atmosphere, Clouds, particles, wind vectors, sounds, visibility and gameplay modifiers.

## Layering
Use transitions rather than instantly swapping all values. Wind can influence foliage/VFX without physically simulating every leaf. Snow accumulation should be an art/gameplay choice, not a promise of expensive global simulation.

## Lab
Create Clear -> Fog -> Storm transitions and verify every intermediate state is readable and performant.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Weather - Hub]]

**Related notes:** [[Rain Production System]] · [[Thunder, Lightning and Accessibility]] · [[Production Weather State Machine]] · [[Weather Systems]]

<!-- TDOD_GRAPH_END -->
