---
area: "09 Maps and Worlds"
cluster: "Maps"
source_note: "03_Data_Performance_Worlds/09_LARGE_MAPS_STREAMING_and_WORLD_DESIGN"
title: "LARGE MAPS, STREAMING & WORLD DESIGN"
tags: [roblox, tdod-vault, reference, "cluster/maps"]
status: verified-baseline
cssclasses: [tg-a09]
---

# LARGE MAPS, STREAMING & WORLD DESIGN

=================================================

For large Roblox worlds:
- Enable instance streaming.
- Design scripts so streamed-out objects may not exist on the client.
- Avoid "wait for entire map" logic.
- Divide the world into gameplay districts/cells.
- Keep far-away AI asleep.
- Use LOD/render fidelity.
- Do not make every prop unique.
- Reuse modular pieces.
- Hide inaccessible interiors.
- Use occlusion naturally: buildings, hills, tunnels, corners.
- Keep important landmarks visually distinctive.

WORLD DESIGN RULES:
Players need:
- a landmark
- a goal
- a path
- a reward
- a reason to explore

GOOD OPEN WORLD:
dense meaningful space > giant empty terrain.

MAP HIERARCHY:
World
  District_01
    Gameplay
    Buildings
    Props
    VFX
    Audio
    NPCSpawns
  District_02
  SharedSystems

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps - Hub]]

**Related notes:** [[Multi-Place Experience Architecture]] · [[Roblox Studio Basics]] · [[World Interaction System Blueprint]] · [[World Streaming Zones Blueprint]]

<!-- TDOD_GRAPH_END -->
