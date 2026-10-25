---
area: "09 Maps and Worlds"
cluster: "Maps"
source_note: "19_System_Blueprints/11_Interaction_System"
title: "World Interaction System Blueprint"
tags: [roblox, blueprint, "cluster/maps"]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# World Interaction System Blueprint

Use a common interaction contract rather than one LocalScript per object.

Interactable data:
- ID/type
- prompt text
- max distance
- hold time
- allowed states

Client finds/visualizes candidate. Server validates actual interaction for important outcomes.

Tags via CollectionService can help register interactable categories cleanly.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps - Hub]]

**Related notes:** [[Roblox Studio Basics]] · [[Large Maps, Streaming and World Design]] · [[World Streaming Zones Blueprint]] · [[Advanced Map Readability and Navigation]]

<!-- TDOD_GRAPH_END -->
