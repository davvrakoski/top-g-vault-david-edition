---
area: "15 AI Tools and Workflow"
cluster: "Git Version Control"
source_note: "12_Tooling_Workflow/01_Script_Sync_vs_Rojo"
title: "Script Sync vs Rojo — 2026 Decision Guide"
tags: [roblox, premium, "cluster/git-version-control"]
verified: 2026-10-25
cssclasses: [tg-a15]
---

# Script Sync vs Rojo — 2026 Decision Guide

Roblox now provides **Script Sync** natively.

## Use Script Sync when
- you mainly want external code editing
- you want Git/version control for scripts
- Studio remains the main project editor/source of truth
- you use Team Create heavily
- you want an easy path for an existing Studio project

Roblox currently documents Script Sync limits of up to 10,000 scripts per top-level synced instance and 128 top-level synced instances.

## Use Rojo when
- filesystem should be the source of truth for more of the project
- you want a mature file-oriented build/sync pipeline
- your team already uses Rojo/Wally/tooling
- command-line builds/deployment fit your workflow

## Do not blindly stack tools

Choose a clear source of truth and understand synchronization ownership. Conflicting sync systems can create confusing overwrite behavior.

Sources:
- https://create.roblox.com/docs/scripting/sync
- https://create.roblox.com/docs/projects/external-tools
- https://github.com/rojo-rbx/rojo

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Git Version Control - Hub]]

**Related notes:** [[Studio Collaboration and Team Workflow]] · [[Git, Github, Rojo and Team Workflow]]

<!-- TDOD_GRAPH_END -->
