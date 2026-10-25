---
area: "13 Growth and Monetization"
cluster: "Analytics Discovery"
source_note: "10_Analytics_Growth/01_Analytics_Instrumentation_Plan"
title: "Analytics Instrumentation Plan"
tags: [roblox, premium, "cluster/analytics-discovery"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Analytics Instrumentation Plan

Do not log everything. Log decisions you can act on.

## Onboarding funnel
1. Join
2. Spawn ready
3. First movement/objective shown
4. First interaction
5. First combat/action
6. First reward
7. Tutorial complete

## Economy events
Track major resource sources/sinks so inflation and dead currencies become visible.

## Custom events
Examples:
- AbilityUsed
- WeaponEquipped
- BossAttempt
- BossDefeated
- UIShopOpened
- MatchAbandoned

Current Roblox AnalyticsService documentation supports economy, funnel, and custom analytics workflows. The custom-event docs currently describe up to 100 custom events, and funnel documentation describes up to ten funnel dashboard tabs.

Sources:
- https://create.roblox.com/docs/production/analytics/event-types
- https://create.roblox.com/docs/production/analytics/custom-events
- https://create.roblox.com/docs/production/analytics/funnel-events

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Analytics Discovery - Hub]]

**Related notes:** [[Tutorial, Onboarding and FTUE]] · [[Discovery, Retention and Analytics]] · [[First 10 Minutes Retention Design]] · [[Analytics Event Naming Standard]]

<!-- TDOD_GRAPH_END -->
