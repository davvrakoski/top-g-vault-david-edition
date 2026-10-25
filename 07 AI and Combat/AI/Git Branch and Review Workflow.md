---
area: "07 AI and Combat"
cluster: "AI"
source_note: "13_AI_Claude_MCP_Git/06_Git_Branch_and_Review_Workflow"
title: "Git Branch and Review Workflow"
tags: [roblox, premium, "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Git Branch and Review Workflow

Recommended minimum:

`main` = releasable/stable.

Feature work:
```text
feature/npc-hearing
fix/inventory-duplication
perf/zombie-scheduler
ui/mobile-inventory
```

Before merge:
- diff reviewed
- formatter/linter run if configured
- game-specific tests run
- security impact checked
- performance impact checked
- data migration checked
- no generated junk/secrets committed
- rollback path known

Commit messages should explain intent:
`fix: reject duplicate reward claims`
`perf: stagger NPC perception updates`
`feat: add onboarding funnel events`

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[AI - Hub]]

**Related notes:** [[Scalable NPC Update Scheduler]] · [[Pathfinding Engineering]] · [[Zombie Crowd Director Blueprint]] · [[Advanced NPC - AI Behavior]]

<!-- TDOD_GRAPH_END -->
