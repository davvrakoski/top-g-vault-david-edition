---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
source_note: "23_Expanded_Knowledge/10_Asset_Naming_and_Project_Hygiene"
title: "Asset Naming & Project Hygiene"
tags: [roblox, premium, "cluster/foundations-planning"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Asset Naming & Project Hygiene

A messy project gets slower every month.

## Naming
Use names that answer what an object is and what system owns it. Avoid final_final2, NewFolder, Script1 and Part123.

Example:
`NPC_Zombie_Brute_A`
`VFX_Hit_Metal_Sparks`
`UI_Inventory_ItemSlot`
`SFX_Footstep_Concrete_03`

## Folder rules
Group by system or responsibility, not by whichever developer created the object. Shared modules need a clear shared home; server-only secrets do not belong in replicated containers.

## Asset registry
Track external asset source, creator, license, date acquired, modifications and where it is used. This is critical when a project grows or changes owners.

## Lab
Audit 100 randomly selected instances/assets. If a new developer cannot tell what 90% do from name/location, create a cleanup plan.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Foundations Planning - Hub]]

**Related notes:** [[The Roblox Game Development Mindset]] · [[Project Planning]] · [[Game Design, Balancing and Difficulty]] · [[Master Build Order]]

<!-- TDOD_GRAPH_END -->
