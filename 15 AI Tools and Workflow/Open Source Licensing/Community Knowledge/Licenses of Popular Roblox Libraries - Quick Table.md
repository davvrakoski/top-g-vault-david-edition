---
area: "15 AI Tools and Workflow"
cluster: "Open Source Licensing"
title: "Licenses of Popular Roblox Libraries - Quick Table"
tags: [roblox, community-knowledge, licensing, open-source, libraries, wally]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/evaera/roblox-lua-promise
  - https://github.com/dphfox/Fusion
  - https://github.com/jsdotlua/react-lua
  - https://github.com/Roblox/rodux
  - https://github.com/Sleitnick/RbxUtil
  - https://github.com/howmanysmall/Janitor
  - https://gist.github.com/stravant/b75a322e0919d60dde8a0316d1f09d2f
  - https://github.com/evaera/Cmdr
  - https://github.com/SirMallard/Iris
  - https://github.com/MadStudioRoblox/ReplicaService
  - https://github.com/UpliftGames/wally
  - https://github.com/JohnnyMorganz/luau-lsp
  - https://github.com/Roblox/studio-rust-mcp-server
---
# Licenses of Popular Roblox Libraries - Quick Table

Before a library goes into a game, someone has to answer "what license is it, and what do we owe?". This table records the licenses checked on **2026-10-25** for libraries this vault documents, with the vault rating (bundle-safe = CC0 / CC BY 4.0 / MIT only; everything else link only). Licenses can change between versions: re-check the LICENSE file of the exact version you install, and log it in [[Asset and License Log Template]].

## Runtime libraries (ship inside your game)

| Library | Purpose | License | Vault rating | Where checked | Note in vault |
| --- | --- | --- | --- | --- | --- |
| evaera Promise (`evaera/promise@4.0.0`) | async chaining, cancellation | MIT | bundle-safe | repo + wally.toml | [[evaera Promise - Async Recipes for Roblox]] |
| Fusion (`elttob/fusion`) | reactive UI | MIT | bundle-safe | README | [[Fusion 0.3 - Scopes, State and Reactive UI]] |
| React-Lua (jsdotlua fork) | React for Luau | MIT | bundle-safe | repo sidebar | [[React-Lua on Roblox - Packages, Hooks and Roact Migration]] |
| Rodux | Redux-style store | Apache-2.0 | link only | README | [[Rodux - Store, Reducers and Actions]] |
| RbxUtil (Trove, Signal, Comm, Component, TableUtil, Timer, ...) | utilities | MIT | bundle-safe | README | [[Trove vs Janitor - Cleanup API Side by Side]], [[Comm - Namespaced Remotes with Middleware]] |
| Janitor | cleanup | MIT | bundle-safe | repo sidebar | [[Trove vs Janitor - Cleanup API Side by Side]] |
| GoodSignal (gist) | fast signals | MIT (stated in file header) | bundle-safe | gist header | [[GoodSignal - Pure-Luau Signals and Their Caveats]] |
| Cmdr | admin console | MIT | bundle-safe | repo sidebar | [[Cmdr Permissions - BeforeRun Hooks Done Right]] |
| Iris (`sirmallard/iris`) | immediate-mode debug UI | MIT | bundle-safe | README | [[Iris - Immediate-Mode Debug Panels]] |
| ReplicaService | state replication | Apache-2.0; README says no longer supported, points to its successor "Replica" | link only | repo page | - |

## Tools (run on your machine or CI, not shipped)

| Tool | License | Note |
| --- | --- | --- |
| Wally | MPL-2.0 | the CLI's license; packages have their own ([[Wally Package Manager - Manifest, Realms and Commands]]) |
| luau-lsp | MIT | [[Rojo, VS Code and luau-lsp - Local Setup from Zero]] |
| studio-rust-mcp-server (Roblox) | MIT | archived; Roblox points users to the built-in Studio MCP server |

Tool licenses matter less for the game (you don't distribute them), but they matter if you fork or redistribute the tool itself.

## Not verified in this pass
- **Knit**: archived; license not re-checked here ([[Knit Is Archived - Frameworks vs Your Own Module Loader]]).
- **Replica** (the successor to ReplicaService) and **ProfileStore**: licenses not re-checked in this pass ([[ProfileStore in 2026 - Status, Wrappers and Lock Lessons]]).
- **Wave Function Collapse reference implementation** (mxgmn): has a LICENSE file; reported as MIT but text not confirmed.

## How to check a license in two minutes
1. Open the repo's `LICENSE` / `LICENSE.md` file itself, not just the GitHub sidebar badge (the badge is auto-detected and can be wrong for dual-licensed or modified texts).
2. Check the package manifest (`wally.toml` has a `license` field) for the version you install.
3. Look for extra files: `NOTICE` (Apache), per-file headers (MPL), or third-party folders with different licenses.
4. Record it with the date. If unclear, treat it as link only and ask the author.

## Related
[[Open Source Licensing - Hub]] · [[Code Licenses Compared for Roblox Devs - MIT, Apache, MPL, GPL, AGPL]] · [[Open-Source Roblox Shortlist — Reviewed Starting Points]] · [[Open-Source Evaluation Rubric]]
