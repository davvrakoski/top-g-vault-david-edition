---
area: "13 Growth and Monetization"
cluster: "Monetization"
source_note: "19_System_Blueprints/01_Secure_Shop_and_Currency"
title: "Secure Shop and Currency Blueprint"
tags: [roblox, blueprint, "cluster/monetization"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Secure Shop and Currency Blueprint

## Data model
Server owns currency balance and item definitions. Client owns presentation only.

## Purchase flow
1. Client requests `Buy(itemId)`.
2. Server validates type/rate.
3. Server looks up item definition and server-owned price.
4. Server checks availability/prerequisites/location if required.
5. Server checks current balance.
6. Server performs one authoritative transaction.
7. Server grants item and returns result.
8. Client animates success/failure.

## Never trust
- price from UI
- client's balance
- client's "purchase succeeded" flag
- client-supplied quantity without limits

## Tests
- spam button
- buy with exact balance
- buy without funds
- invalid item ID
- two simultaneous purchase requests
- disconnect during save

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Monetization - Hub]]

**Related notes:** [[Shop UX, Pricing and Player Trust]] · [[Monetization Analytics and Segmentation]] · [[Monetization]] · [[Developer Products, Passes and Subscriptions]]

<!-- TDOD_GRAPH_END -->
