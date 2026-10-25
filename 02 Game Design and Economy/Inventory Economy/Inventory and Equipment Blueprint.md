---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
source_note: "19_System_Blueprints/02_Inventory_and_Equipment"
title: "Inventory and Equipment Blueprint"
tags: [roblox, blueprint, "cluster/inventory-economy"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Inventory and Equipment Blueprint

Separate **item definitions** from **owned item instances**.

Definition: name, icon, category, base stats, stack size.
Owned item: unique ID, definition ID, quantity, durability, rolls/skin.

Server owns inventory. Client receives a view/snapshot and requests actions.

Actions:
- equip
- unequip
- use
- drop
- split
- merge
- move slot

Every action validates ownership and current state. Use unique IDs for non-stackable valuable items to make dupes easier to detect and audit.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Inventory Economy - Hub]]

**Related notes:** [[Inventory, Items and Equipment]] · [[Crafting Data and Content Tools]] · [[Crafting System Blueprint]] · [[Experiment Design for Roblox Games]]

<!-- TDOD_GRAPH_END -->
