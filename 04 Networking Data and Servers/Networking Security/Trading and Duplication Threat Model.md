---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "23_Expanded_Knowledge/17_Trading_and_Duplication_Threat_Model"
title: "Trading & Duplication Threat Model"
tags: [roblox, premium, "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Trading & Duplication Threat Model

Trading is one of the highest-risk systems in a persistent game.

## Transaction rule
A trade must be atomic: either both sides commit or neither side does. Never remove an item from one player and hope the second update succeeds later.

## Locking
Items offered in a trade need a temporary locked state so they cannot also be sold, dropped, crafted or traded elsewhere.

## Identity
Unique items need stable IDs. Quantities need server-side validation. Reconnect and retry logic must not replay the same completed transaction.

## Audit
Record transaction ID, participants, before/after summaries and result. Logs should support investigation without storing unnecessary sensitive data.

## Lab
Simulate disconnect at every step of a trade. The test passes only when no sequence creates or deletes value unintentionally.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Networking Security - Hub]]

**Related notes:** [[Remote Type and Allowlist Validation]] · [[Security and Anti-exploit Design]] · [[Network Ownership and Physics Replication]] · [[Latency, Prediction and Reconciliation]]

<!-- TDOD_GRAPH_END -->
