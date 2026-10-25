---
area: "07 AI and Combat"
cluster: "AI"
source_note: "06_Characters_Animation_AI_Combat_Vehicles/21_ADVANCED_NPC_-_AI_BEHAVIOR"
title: "ADVANCED NPC / AI BEHAVIOR"
tags: [roblox, tdod-vault, reference, "cluster/ai"]
status: verified-baseline
cssclasses: [tg-a07]
---

# ADVANCED NPC / AI BEHAVIOR

=================================================

"AI AWAKE" SHOULD MEAN:
NPCs do useful work only when they need to.

NPC ARCHITECTURE:
Perception
Decision
Navigation
Action
Animation
Combat
Memory
Cooldowns
Sleep/LOD

STATES:
Idle
Patrol
Investigate
Chase
Search
Attack
Retreat
Stunned
Dead
Sleep

PERCEPTION:
Vision:
- distance
- field of view
- line of sight
- visibility modifiers

Hearing:
- sound event location
- loudness radius
- suspicious event category

MEMORY:
lastSeenPosition
lastHeardPosition
target
alertLevel
timeSinceContact

DO NOT PATHFIND EVERY FRAME.

BETTER:
- recompute when target moved far enough
- recompute when path blocked
- recompute on timed intervals
- use direct movement if line of sight is clear and safe
- lower update rate at distance

PATHFINDING:
Use PathfindingService.
Set agent dimensions.
Use costs/modifiers.
React to Path.Blocked.
Visualize navigation during debugging.

CROWD AI:
- share perception data where appropriate
- stagger brain ticks
- spatially partition NPCs
- cap simultaneous path calculations
- sleep distant NPCs
- simplify animation at distance

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[AI - Hub]]

**Related notes:** [[Git Branch and Review Workflow]] · [[Zombie Crowd Director Blueprint]] · [[Encounter Director and Pacing]] · [[How to Save AI Usage - Context]]

<!-- TDOD_GRAPH_END -->
