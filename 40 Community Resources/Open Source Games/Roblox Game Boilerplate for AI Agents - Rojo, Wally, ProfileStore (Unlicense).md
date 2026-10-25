---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/frrazer-game-boilerplate"
title: "Roblox Game Boilerplate for AI Agents - Rojo, Wally, ProfileStore (Unlicense)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", unlicense, template, rojo, wally, profilestore, ai-agents]
verified: 2026-10-25
license: "Unlicense"
sources:
  - https://github.com/frrazer/roblox-game-boilerplate
cssclasses: [tg-a40]
---
# Roblox Game Boilerplate for AI Agents - Rojo, Wally, ProfileStore (Unlicense)

**Author:** frrazer · **License:** Unlicense (public domain) for the repo; vendored and Wally packages keep their own licenses · **GitHub:** about 106 stars, created 24 Sep 2026, last push 8 Oct 2026, marked as a GitHub template repo

## What it is
A genre-neutral starting project for a new Roblox game, written so that AI coding agents (Claude Code, Codex) follow the same rules a senior dev would. It ships `AGENTS.md` and `CLAUDE.md` with naming rules, strict Luau, and setup steps.

**Genre:** game template (any genre).

## What you can reuse
- Rojo + Wally project with strict Luau (`.luaurc`), StyLua config and luau-lsp.
- Typed Packet networking, ProfileStore player data, vendored Replica.
- Service/controller layout and the agent instruction files themselves as a team style guide.

## How to run it
1. Install Aftman (the only prerequisite).
2. Clone the repo (or press "Use this template" on GitHub).
3. `./scripts/install.ps1` - installs the pinned tools, Roblox type definitions, runs `wally install` and `wally-package-types`. Do not run bare `wally install`.
4. `rojo serve default.project.json --address 127.0.0.1`, then connect the Rojo plugin in Studio (localhost:34873).
5. Publish the place and enable Studio access to API services so ProfileStore can save; add `servePlaceIds` to `default.project.json`.

## Caveats
- Brand new (autumn 2026) with only a handful of commits; expect changes.
- No gameplay. Pair it with a genre starter architecture note.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[ProfileStore in 2026 - Status, Wrappers and Lock Lessons]] · [[Script Sync vs Rojo — 2026 Decision Guide]] · [[Git, Github, Rojo and Team Workflow]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
