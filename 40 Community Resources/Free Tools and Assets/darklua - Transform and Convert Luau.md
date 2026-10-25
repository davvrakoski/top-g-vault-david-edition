---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/darklua"
title: "darklua - Transform and Convert Luau"
tags: [roblox, community, tools, luau, toolchain, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/seaofvoices/darklua
  - https://darklua.com/docs/rules-reference/
cssclasses: [tg-a40]
---

# darklua - Transform and Convert Luau

| | |
|---|---|
| **What** | A command-line tool that rewrites Lua 5.1 / Luau code using rules you pick in a config file |
| **Maintainer** | seaofvoices (GitHub, pushed 2026-07) |
| **License** | MIT |
| **Bundle-safe?** | YES for its code (keep LICENSE.txt); in practice just link it |
| **Link** | https://github.com/seaofvoices/darklua · rules https://darklua.com/docs/rules-reference/ |

## Why it shows up in Roblox projects
darklua sits between your source folder and Rojo. Common jobs:

| Job | Rule(s) from the rules reference |
|---|---|
| Use string-path requires in your editor, convert them to Roblox instance requires for the build | `convert_require` |
| Strip type annotations (for code shared with non-Luau tools) | `remove_types` |
| Remove debug-only code from a release build | `remove_assertions`, `remove_debug_profiling` |
| Inject a build flag like `DEV = false` | `inject_global_value` |
| Strip comments / shrink output | `remove_comments`, `remove_spaces`, `rename_variables` |
| Down-level newer Luau syntax for plain-Lua tools | `remove_interpolated_string`, `remove_if_expression`, `remove_compound_assignment`, `remove_continue` |

## Typical setup
1. Install with Rokit (`rokit add seaofvoices/darklua`); see [[Toolchain Managers - Rokit, Foreman and Aftman]].
2. Keep source in `src/`, write processed code to a separate output folder, point the Rojo project at that output.
3. Run darklua before `rojo build` in CI so the published place uses the processed code.

## Caution
Renaming and minifying make error stack traces harder to read. Keep a non-minified build for testing, and don't treat minifying as protection: client code can still be read.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Lune - Run Luau Outside Studio]] · [[Luau Strict Mode and Type Checking in Practice]] · [[Git, Github, Rojo and Team Workflow]]

<!-- TDOD_GRAPH_END -->
