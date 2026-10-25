---
area: "15 AI Tools and Workflow"
cluster: "Git Version Control"
source_note: "10_QA_Tooling_AI_Obsidian/37_GIT_GITHUB_ROJO_and_TEAM_WORKFLOW"
title: "GIT, GITHUB, ROJO & TEAM WORKFLOW"
tags: [roblox, tdod-vault, reference, "cluster/git-version-control"]
status: verified-baseline
cssclasses: [tg-a15]
---

# GIT, GITHUB, ROJO & TEAM WORKFLOW

=================================================

WHY GIT:
- history
- backup
- branches
- review
- rollback
- collaboration

WHY ROJO:
Rojo lets Roblox developers work with filesystem scripts/models and tools such as VS Code + Git, and sync supported project content into Studio.

BASIC CONCEPT:
Roblox Studio <-> Rojo plugin/server <-> local files <-> Git/GitHub.

DO NOT:
Commit API keys/secrets.

.GITIGNORE SHOULD EXCLUDE:
- secrets
- temporary builds
- local caches
- editor junk
- generated files not needed in repo

BRANCHES:
main = stable
dev = integration
feature/ai-combat
fix/inventory-duplication

COMMIT MESSAGE:
fix: stop duplicate reward claim
feat: add NPC investigation state
perf: sleep distant zombies
ui: improve inventory gamepad focus

PULL REQUEST CHECK:
What changed?
Why?
How tested?
Performance impact?
Security impact?
Screenshots/video?
Rollback plan?

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Git Version Control - Hub]]

**Related notes:** [[Script Sync vs Rojo — 2026 Decision Guide]] · [[Studio Collaboration and Team Workflow]]

<!-- TDOD_GRAPH_END -->
