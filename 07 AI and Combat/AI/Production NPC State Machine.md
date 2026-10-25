---
area: "07 AI and Combat"
cluster: "AI"
source_note: "06_AI_NPC_Combat/01_AI_State_Machine_Production"
title: "Production NPC State Machine"
tags: [roblox, premium, "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Production NPC State Machine

A state machine prevents contradictory actions.

```text
Sleep -> Idle
Idle -> Patrol / Investigate / Chase
Patrol -> Investigate / Chase / Idle
Investigate -> Chase / Search / Idle
Chase -> Attack / Search / Retreat
Attack -> Chase / Stunned / Dead
Stunned -> Idle / Chase / Dead
Any live state -> Dead
```

Each state defines:
- `Enter(previousState)`
- `Update(dt)`
- `Exit(nextState)`
- allowed transitions
- timeout/recovery behavior

## Key rule

Perception should produce facts; decision logic chooses a state; state logic performs actions. Do not mix all three into one giant heartbeat function.

## Recovery

Every movement state needs a stuck strategy:
1. detect no meaningful movement
2. retry local move
3. recompute path
4. choose alternate waypoint
5. abandon target/reset if still impossible

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[AI - Hub]]

**Related notes:** [[Final 'ai Read This First' Instruction]] · [[AI Change Log]] · [[NPC Vision and Hearing Model]] · [[Scalable NPC Update Scheduler]]

<!-- TDOD_GRAPH_END -->
