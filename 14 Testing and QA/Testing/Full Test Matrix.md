---
area: "14 Testing and QA"
cluster: "Testing"
source_note: "11_QA_Production/01_Test_Matrix"
title: "Full Test Matrix"
tags: [roblox, premium, "cluster/testing"]
verified: 2026-10-25
cssclasses: [tg-a14]
---

# Full Test Matrix

## Devices
- low-end phone
- modern phone
- tablet
- desktop integrated graphics
- desktop dedicated GPU
- gamepad/console target

## Network
- good connection
- simulated latency
- brief packet issues/reconnect behavior where testable

## Player count
- 1
- typical
- maximum target

## Save/data
- new player
- returning player
- migration from previous schema
- save API failure
- disconnect during transaction

## Combat
- high latency attack
- simultaneous kill
- target despawns mid-attack
- spam input
- invalid remote parameters

## Streaming
- fast vehicle
- teleport
- respawn
- objective outside current streamed region
- model streams out during local interaction

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing - Hub]]

**Related notes:** [[Debugging Playbook]] · [[Thumbnail A - B Test Interpretation]] · [[Definition of Done]] · [[Bug Report Template]]

<!-- TDOD_GRAPH_END -->
