---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
source_note: "23_Expanded_Knowledge/33_Crafting_Recipe_Data_and_Content_Tools"
title: "Crafting Data & Content Tools"
tags: [roblox, premium, "cluster/inventory-economy"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Crafting Data & Content Tools

Crafting scales better when recipes are data, not individual scripts.

## Recipe schema
ID, inputs, quantities, outputs, station requirement, unlock rule, craft time, cost and tags.

## Validation
The server validates ingredients and consumes/grants as one logical transaction. Client previews are presentation only.

## Content tooling
Designers should be able to add a recipe through config without copying code. Build validation that catches missing item IDs, negative quantities and impossible cycles.

## Lab
Generate a report of every recipe and its net currency/resource flow to find accidental infinite-value loops.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Inventory Economy - Hub]]

**Related notes:** [[Economy - Inflation, Sources and Sinks]] · [[Inventory, Items and Equipment]] · [[Inventory and Equipment Blueprint]] · [[Crafting System Blueprint]]

<!-- TDOD_GRAPH_END -->
