---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/lune"
title: "Lune - Run Luau Outside Studio"
tags: [roblox, community, tools, luau, toolchain, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "MPL-2.0"
sources:
  - https://github.com/lune-org/lune
  - https://lune-org.github.io/docs
cssclasses: [tg-a40]
---

# Lune - Run Luau Outside Studio

| | |
|---|---|
| **What** | A standalone Luau runtime (like Node or Deno, but for Luau), written in Rust |
| **Maintainer** | lune-org (GitHub, active: pushed 2026-10-21) |
| **License** | MPL-2.0 |
| **Bundle-safe?** | No - link only (use it freely; don't copy its source into the vault) |
| **Link** | https://github.com/lune-org/lune · docs https://lune-org.github.io/docs |

## Why Roblox devs use it
Lune lets you write **build scripts in the same language as your game**, instead of Python or Bash. Its built-in libraries (per the docs): DateTime, FS, Luau, Net, Process, Regex, **Roblox**, Serde, Stdio and Task.

The **Roblox** library reads and writes place and model files and their instances. That unlocks jobs like:
- Batch-renaming or re-tagging thousands of instances in a `.rbxl` without opening Studio.
- Exporting data (prices, item stats) from a place file into JSON for a spreadsheet, or the other way round.
- Checking a place in CI: "no Script outside ServerScriptService", "every MeshPart has CollisionFidelity set".
- Replacing the old **Remodel** tool, which earlier tutorials use for the same jobs.

## Getting it
Add it to your project with a toolchain manager (`rokit add lune-org/lune`, see [[Toolchain Managers - Rokit, Foreman and Aftman]]), then follow the docs' Getting Started pages to run your first script. Remodel's own README says it is deprecated in favor of Lune and links a migration guide: https://lune-org.github.io/docs/roblox/3-remodel-migration

## Cautions
- Lune scripts run on your PC with full file and network access. Read any script you download before running it.
- Lune is not the Roblox engine: no physics, no rendering, no DataStores. It's for tooling and tests, not for running your game.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[darklua - Transform and Convert Luau]] · [[Unit Testing Luau with Jest-Lua and TestEZ]] · [[Open Cloud and External Tooling]] · [[Asset Pipelines as Code - Asphalt, Tarmac and Mantle]]

<!-- TDOD_GRAPH_END -->
