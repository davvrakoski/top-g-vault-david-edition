---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
source_note: "11_Prompts_Debugging_Release_Community/41_PROMPT_LIBRARY_FOR_CLAUDE"
title: "PROMPT LIBRARY FOR CLAUDE"
tags: [roblox, tdod-vault, reference, "cluster/claude-mcp-ai-workflow"]
status: verified-baseline
cssclasses: [tg-a15]
---

# PROMPT LIBRARY FOR CLAUDE

=================================================

A. MASTER ROBLOX PROJECT INSPECTION

"You are working on a Roblox project. Do not modify anything yet.
First inspect the project structure and identify:
1. client/server/shared architecture
2. major gameplay systems
3. RemoteEvents/RemoteFunctions
4. persistent data flow
5. performance risks
6. security risks
7. duplicated systems
8. dead/unused code
9. dependencies between systems
10. the smallest safe improvement plan

Use Roblox-supported APIs and current Luau patterns.
Do not invent files that do not exist.
Do not replace working code just to make it look different.
After inspection, write a prioritized plan:
CRITICAL, HIGH, MEDIUM, LOW.
For each issue include exact file, reason, risk, and test."

B. FIX A BUG

"Investigate this bug like a senior Roblox engineer.
Expected:
[EXPECTED]
Actual:
[ACTUAL]
Steps:
[STEPS]
Logs:
[LOGS]

Rules:
- reproduce or trace before editing
- find root cause, not symptom
- inspect all callers/dependencies
- make smallest safe fix
- preserve existing features
- add defensive validation
- test client/server behavior
- check mobile/gamepad impact if relevant
- check performance/security impact
- document files changed"

C. PERFORMANCE AUDIT

"Audit this Roblox project for frame time, server CPU, memory, load time, network traffic, physics, particles, lights, AI, and script cost.

Look specifically for:
- expensive RunService callbacks
- loops that scan large tables
- remote spam
- over-replication
- huge ReplicatedStorage
- unnecessary PreloadAsync
- pathfinding frequency
- active distant NPCs
- excessive physics/debris
- particle overdraw
- unnecessary shadows
- texture/mesh waste
- memory leaks/event connections
- opportunities for instance streaming
- client-only cosmetic effects
- object pooling
- spatial partitioning
- Parallel Luau ONLY where justified

Do not optimize blindly. Rank findings by measured or likely impact.
Give a before/after testing method for every change."

D. ADVANCED NPC AI

"Design a scalable Roblox NPC AI with:
Idle, Patrol, Investigate, Chase, Search, Attack, Stunned, Dead, Sleep.

Perception:
- field of view
- line of sight
- hearing events
- last seen/heard positions
- target memory

Performance:
- distance-based tick rates
- sleeping
- staggered updates
- path recomputation only when necessary
- Path.Blocked handling
- direct movement when line of sight is clear
- spatial partitioning
- cap simultaneous path requests

Combat must remain server-authoritative.
Cosmetic animation/VFX can be client-assisted.
Document state transitions and failure recovery."

E. UI POLISH

"Audit this Roblox UI for:
visual hierarchy, spacing, alignment, typography, contrast, responsiveness, safe areas, touch, keyboard/mouse, gamepad focus, readability, accessibility, animation, and clutter.

Target:
premium but still clearly Roblox.
Do not make it look like an overprocessed AI mockup.
Use fewer stronger visual choices.
Preserve fast interaction.
Provide exact changes and why each helps UX."

F. THUMBNAIL BRIEF

"Create a Roblox thumbnail art direction brief based on actual gameplay.
Rules:
- Roblox proportions and materials
- one focal subject
- readable at small size
- no misleading features
- no fake destruction if destruction is not in game
- restrained bloom
- no random neon
- no hyperreal AI skin
- believable in-game lighting
- clear action
- strong silhouette
- simple background hierarchy
- looks like a polished screenshot, not AI concept art"

G. BLENDER MODEL AUDIT

"Inspect this model as a game-ready Roblox asset.
Check:
scale, transforms, topology, deformation loops, non-manifold geometry, duplicate vertices/faces, normals, UVs, material slots, texture resolution, hidden geometry, rig hierarchy, weights, clipping, LOD potential, collision strategy, and export settings.

Do not just say 'looks good.'
List exact defects and exact fixes.
Prioritize silhouette/deformation/performance."

H. WEATHER SYSTEM

"Build a Roblox weather state machine with Clear, Cloudy, Rain, Storm, and Fog.
Use Lighting, Atmosphere, Clouds, particles, wind, audio, and restrained post effects.
Transitions must be smooth.
Rain should be localized around relevant players/areas rather than filling the whole world unnecessarily.
Support indoor detection.
Provide accessibility options for intense lightning flashes.
Profile particles/lights."

I. SECURE INVENTORY

"Design a server-authoritative Roblox inventory.
The client may request actions but cannot directly set inventory.
Support stack, split, equip, drop, use, persistence, validation, and rollback-safe handling.
Include rate limits and duplicate-item protection.
Separate item definitions from player-owned instances."

J. SESSION END / RESUME

"Stop feature work.
Update RESUME_NOTE.md with:
- goal
- current working state
- exact files changed
- tests passed
- tests failed
- unresolved bugs
- next exact command/action
- things the next AI must not redo
Then update CHANGELOG_AI.md."

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Claude MCP AI Workflow - Hub]]

**Related notes:** [[Plugin and MCP Supply-Chain Security]] · [[MCP - Claude - AI Assistant Workflow]] · [[Claude Project Instructions — Production Version]] · [[Claude Context Efficiency]]

<!-- TDOD_GRAPH_END -->
