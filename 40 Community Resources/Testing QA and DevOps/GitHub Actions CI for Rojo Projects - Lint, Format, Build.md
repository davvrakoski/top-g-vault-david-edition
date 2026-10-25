---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/github-actions-rojo-ci"
title: "GitHub Actions CI for Rojo Projects - Lint, Format, Build"
tags: [roblox, community, "cluster/testing-qa-and-devops", ci, github-actions, rojo]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "setup-rokit MIT; Rokit MIT; Rojo MPL-2.0; selene MPL-2.0; StyLua MPL-2.0; Lune MPL-2.0. Workflow below is original"
sources:
  - https://github.com/CompeyDev/setup-rokit
  - https://github.com/rojo-rbx/rokit
  - https://github.com/rojo-rbx/rojo
  - https://github.com/Roblox/place-ci-cd-demo
---
# GitHub Actions CI for Rojo Projects - Lint, Format, Build

**Goal:** every pull request gets the same checks, in the same order, with the same tool versions, before anyone merges. No API key is needed for anything on this page, so it is safe to run on pull requests from forks.

## Order matters: cheapest failure first
1. Format check (StyLua) - seconds.
2. Lint (selene) - seconds.
3. Type check (luau-lsp, optional) - seconds.
4. Pure-Luau tests under Lune - seconds.
5. Build the place (Rojo) - proves the project file and tree are valid.
6. Engine tests through Open Cloud (separate workflow, needs secrets) - minutes.

## Tool install: setup-rokit
`CompeyDev/setup-rokit` (MIT, a fork of ok-nick's setup-aftman) installs Rokit and then the tools listed in your `rokit.toml` (it also reads `aftman.toml` or `foreman.toml`). Inputs from its README: `version` (Rokit release, latest by default), `path` (folder with the toolchain file), `cache` (off by default; the README says to benchmark before enabling it) and `token` (defaults to `github.token`). Your `rokit.toml` lists rojo, selene, stylua, lune and wally with exact versions.

## The workflow (original)

```yaml
# .github/workflows/ci.yml
name: ci

on:
  pull_request:
  push:
    branches: [main]

permissions:
  contents: read

jobs:
  checks:
    runs-on: ubuntu-latest
    timeout-minutes: 15
    steps:
      - uses: actions/checkout@v4

      - name: Install toolchain (rokit.toml)
        uses: CompeyDev/setup-rokit@v0.2.1

      - name: Install packages
        run: wally install

      - name: Format
        run: stylua --check --output-format summary src

      - name: Lint
        run: selene src

      - name: Pure Luau tests
        run: lune run tests/run.luau

      - name: Build test place
        run: rojo build test.project.json --output test.rbxl

      - name: Build release place
        run: rojo build default.project.json --output game.rbxl

      - name: Keep the release build
        uses: actions/upload-artifact@v4
        with:
          name: game-${{ github.sha }}
          path: game.rbxl
          retention-days: 30
```

Why upload the release build: the exact file that passed CI is what you deploy later, and an old artifact is your fastest code rollback ([[Rollback Drills - Rehearsing a Bad Release]]).

## Branch protection
In the GitHub repo settings, mark the `checks` job as a **required status check** on `main`. Without that, CI is advice, not a gate.

## How Roblox's own sample does it
Roblox's `place-ci-cd-demo` (MIT, now archived) splits the same idea into jobs: install tools (Foreman, cached by the hash of `foreman.toml`), then lint, format and Luau tests in parallel, and a deploy job that only runs on pushes to its `production` branch after all three pass. See [[Roblox place-ci-cd-demo - What the Official Sample Shows]].

## Common mistakes
- Installing tools with `cargo install` in CI: slow, and versions drift from your machines.
- Running the Open Cloud job on fork pull requests: secrets are not available there, and you should not want them to be.
- No `timeout-minutes`: a hung step burns CI minutes for hours.
- Building only the test project, so a broken `default.project.json` reaches release day.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Toolchain Managers - Rokit, Foreman and Aftman]] · [[StyLua for Roblox - Config, Ignore Rules and CI Check]] · [[selene for Roblox - Config, Std and Inline Filters]] · [[Lune Test Harness for Pure Luau Modules]] · [[Git, Github, Rojo and Team Workflow]]

<!-- TDOD_GRAPH_END -->
