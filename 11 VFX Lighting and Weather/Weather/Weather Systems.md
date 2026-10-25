---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
source_note: "05_VFX_Weather_Destruction/14_WEATHER_SYSTEMS"
title: "WEATHER SYSTEMS"
tags: [roblox, tdod-vault, reference, "cluster/weather"]
status: verified-baseline
cssclasses: [tg-a11]
---

# WEATHER SYSTEMS

=================================================

WEATHER STATE MACHINE:
Clear
Cloudy
Rain
Storm
Fog
Snow (if game supports it)
Special

Each state can control:
- cloud cover/density
- atmosphere density/haze
- lighting brightness
- color correction
- particle emitters
- wind
- sound
- puddle/wet material illusion
- thunder timing
- NPC reactions
- gameplay modifiers

RAIN OPTIMIZATION:
Do not spawn rain across the entire world.
Use a local camera-following rain volume or regional emitters.
Use raycasts selectively if you need indoor/outdoor detection.
Fade audio and particles smoothly.

LIGHTNING:
1. choose distant strike point
2. flash sky/light briefly
3. spawn bolt VFX
4. delay thunder based on distance
5. randomize timing
6. avoid seizure-inducing rapid flashing
7. add accessibility toggle for intense flashes

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Weather - Hub]]

**Related notes:** [[Fog, Snow, Wind and Layered Weather]] · [[Production Weather State Machine]] · [[Rain Production System]] · [[Thunder, Lightning and Accessibility]]

<!-- TDOD_GRAPH_END -->
