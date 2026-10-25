---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "23_Expanded_Knowledge/19_Latency_Prediction_and_Reconciliation"
title: "Latency, Prediction & Reconciliation"
tags: [roblox, premium, "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Latency, Prediction & Reconciliation

Responsive multiplayer games often let the client predict presentation while the server remains authoritative.

## Pattern
1. Player presses input.
2. Client immediately plays safe local presentation.
3. Client sends intent.
4. Server validates and computes authoritative result.
5. Client reconciles if prediction was wrong.

## Good prediction targets
Animation start, muzzle flash, local sound, reticle feedback and movement presentation.

## Bad trust targets
Currency grants, final damage, item ownership, purchase results and permanent progression.

## Reconciliation
Corrections should be rare and smooth when possible. If the client predicts impossible state too aggressively, players see snapping and rollback.

## Lab
Use simulated latency and test melee, shooting, doors and pickups. Record what feels delayed and decide which presentation can safely predict.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Networking Security - Hub]]

**Related notes:** [[Trading and Duplication Threat Model]] · [[Network Ownership and Physics Replication]] · [[Anti-Dupe Transaction Blueprint]] · [[Threat Modeling Every Roblox Feature]]

<!-- TDOD_GRAPH_END -->
