---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/toolchain-managers"
title: "Toolchain Managers - Rokit, Foreman and Aftman"
tags: [roblox, community, tools, toolchain, rojo, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "MIT (all three)"
sources:
  - https://github.com/rojo-rbx/rokit
  - https://github.com/Roblox/foreman
  - https://github.com/LPGhatguy/aftman
  - https://github.com/UpliftGames/wally
cssclasses: [tg-a40]
---

# Toolchain Managers - Rokit, Foreman and Aftman

A toolchain manager installs **pinned versions** of CLI tools (Rojo, Wally, selene, StyLua, Lune, darklua) per project, so every teammate and CI machine runs the same versions. The tools themselves are listed in [[Open-Source Roblox Shortlist — Reviewed Starting Points]]; this note covers the installer layer.

| Tool | Maintainer | Status (GitHub, 2026-10-25) | License | Bundle-safe? | Link |
|---|---|---|---|---|---|
| **Rokit** | rojo-rbx | Active (pushed 2026-09) | MIT | YES (code, keep LICENSE) | https://github.com/rojo-rbx/rokit |
| Foreman | Roblox | Maintained (pushed 2026-05) | MIT | YES (code, keep LICENSE) | https://github.com/Roblox/foreman |
| Aftman | LPGhatguy | **Archived** | MIT | YES (code, keep LICENSE) | https://github.com/LPGhatguy/aftman |

## What to use in 2026
- **New project: Rokit.** Wally's own README now points to Rokit for installing it.
- **Old project with `aftman.toml` or `foreman.toml`:** Rokit reads both, so you can switch without rewriting the file (Rokit's README notes Foreman and Aftman are not compatible with each other, but Rokit works with either).

## Rokit commands (from its README)
| Command | Does |
|---|---|
| `rokit init` | Start a project tool list in the current folder |
| `rokit add <tool>` | Add and install a tool, e.g. `rokit add rojo-rbx/rojo` |
| `rokit install` | Install every tool the project lists (run after cloning) |
| `rokit list` / `rokit update` | Show / update tools |
| `rokit authenticate` | Log in to GitHub so downloads don't hit rate limits |
| `rokit self-update` | Update Rokit itself |

Windows install: the README offers a PowerShell install script or the `rokit.exe` release. (No install was run for this note.)

## Tips
- Commit the tool list file to Git; never commit the downloaded binaries.
- Pin exact versions in the file, then update on purpose, one tool at a time.
- In CI, run `rokit install` before `rojo build`, `selene` and `stylua --check`.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Modern Roblox Toolchain Menu]] · [[Script Sync vs Rojo — 2026 Decision Guide]] · [[Lune - Run Luau Outside Studio]] · [[Unit Testing Luau with Jest-Lua and TestEZ]]

<!-- TDOD_GRAPH_END -->
