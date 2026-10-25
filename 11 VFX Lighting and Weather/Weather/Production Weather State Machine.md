---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
source_note: "08_VFX_Lighting_Weather/02_Weather_State_Machine_Production"
title: "Production Weather State Machine"
tags: [roblox, premium, "cluster/weather"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Production Weather State Machine

Weather should be state + transitions, not dozens of unrelated scripts.

```text
WeatherState
  id
  durationRange
  lighting profile
  atmosphere profile
  cloud profile
  local particles
  audio profile
  wind profile
  gameplay modifiers
```

Transition controller interpolates from current profile to next profile over a configurable duration.

## Rain implementation idea
- local/camera-following emitter for visible rain
- regional ambience
- selective roof/cover detection
- ground splash only near camera
- wetness material illusion where appropriate

## Storm safety
- avoid rapid flashing
- provide flash/intensity accessibility setting
- thunder delay can scale with strike distance for believability

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Weather - Hub]]

**Related notes:** [[Thunder, Lightning and Accessibility]] · [[Fog, Snow, Wind and Layered Weather]] · [[Weather Systems]] · [[Rain Production System]]

<!-- TDOD_GRAPH_END -->
