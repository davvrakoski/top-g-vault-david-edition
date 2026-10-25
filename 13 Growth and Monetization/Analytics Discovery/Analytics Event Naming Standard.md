---
area: "13 Growth and Monetization"
cluster: "Analytics Discovery"
source_note: "15_Code_Patterns/06_Analytics_Event_Naming"
title: "Analytics Event Naming Standard"
tags: [roblox, premium, "cluster/analytics-discovery"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Analytics Event Naming Standard

Use stable names that describe behavior, not implementation.

Good:
- `Tutorial_Started`
- `Tutorial_Completed`
- `Boss_Attempted`
- `Boss_Defeated`
- `Shop_Opened`

Bad:
- `Button3Clicked`
- `NewEvent2`
- names that change every redesign

Keep an analytics dictionary documenting:
- event name
- trigger condition
- server/client source
- fields
- product question it answers

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Analytics Discovery - Hub]]

**Related notes:** [[Analytics Instrumentation Plan]] · [[First 10 Minutes Retention Design]] · [[Tutorial, Onboarding and FTUE]] · [[Discovery, Retention and Analytics]]

<!-- TDOD_GRAPH_END -->
