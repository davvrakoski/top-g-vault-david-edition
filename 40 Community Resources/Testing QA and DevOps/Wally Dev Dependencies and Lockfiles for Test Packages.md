---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/wally-dev-dependencies"
title: "Wally Dev Dependencies and Lockfiles for Test Packages"
tags: [roblox, community, "cluster/testing-qa-and-devops", wally, packages, ci]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MPL-2.0 (Wally)"
sources:
  - https://github.com/UpliftGames/wally
  - https://jsdotlua.github.io/jest-lua/
---
# Wally Dev Dependencies and Lockfiles for Test Packages

| | |
|---|---|
| **What** | Package manager for Roblox (like npm/Cargo) |
| **Maintainer** | UpliftGames (GitHub) |
| **License** | MPL-2.0 |
| **Binaries** | Windows, macOS, Linux (x86_64 and aarch64); README recommends installing with Rokit |
| **Link** | https://github.com/UpliftGames/wally |

## Three dependency tables, three jobs
From the README's manifest section:

| Table | Use for | Examples |
|---|---|---|
| `[dependencies]` | Code the game needs on client and server | UI library, signal, promise |
| `[server-dependencies]` | Server-only code | data store wrapper |
| `[dev-dependencies]` | **Only needed while developing** | Jest Lua, TestEZ, test fakes |

Test frameworks always go in `[dev-dependencies]`. Your Rojo **release** project then simply does not map the dev package folder, so tests can never ship.

## Example manifest (original)

```toml
[package]
name = "mystudio/obby-game"
version = "0.4.2"
realm = "shared"
registry = "https://github.com/UpliftGames/wally-index"
private = true

[dependencies]
# runtime packages go here

[dev-dependencies]
Jest = "jsdotlua/jest@3.10.0"
JestGlobals = "jsdotlua/jest-globals@3.10.0"
```

Version requirements follow Cargo/npm caret rules by default (`3.10.0` allows compatible 3.x updates). For test tooling, that is usually fine **because the lockfile pins the real version**.

## The lockfile is the CI contract
- `wally install` writes `wally.lock`: the exact resolved version (and checksum) of every package.
- **Commit `wally.lock`.** The README's stated goal is that everyone on the game gets the exact same version of every package; that includes your CI runner.
- Upgrading is a deliberate pull request: run `wally update`, review the lockfile diff, let CI run the whole suite.
- Never hand-edit `wally.lock`.

## Rojo mapping pattern
Keep two project files:
- `default.project.json` (release): maps `src` and the runtime `Packages` folder only.
- `test.project.json`: everything in release **plus** the dev packages folder and spec files.

Your CI builds `test.project.json` for test runs and `default.project.json` for deploys ([[GitHub Actions CI for Rojo Projects - Lint, Format, Build]]).

## Common mistakes
- Putting Jest in `[dependencies]`: it then ships to every server and client.
- Ignoring `wally.lock` in `.gitignore`: CI silently drifts to newer packages.
- Mixing vendored copies and Wally copies of the same library.
- Running `wally install` in CI without the toolchain manager pinning Wally itself ([[Toolchain Managers - Rokit, Foreman and Aftman]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Jest Lua Setup Checklist - Wally, jest.config and runCLI]] · [[Toolchain Managers - Rokit, Foreman and Aftman]] · [[Plugin and MCP Supply-Chain Security]] · [[Open-Source Evaluation Rubric]]

<!-- TDOD_GRAPH_END -->
