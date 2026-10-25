---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Agent Self-Check Loop - Lint, Types, Tests and Build Before You Read the Diff"
tags: [roblox, community-knowledge, ai-workflow, agents, testing, rojo]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://rojo.space/docs/v7/
  - https://github.com/Kampfkarren/selene
  - https://github.com/JohnnyMorganz/StyLua
  - https://github.com/JohnnyMorganz/luau-lsp
  - https://create.roblox.com/docs/cloud/reference/features/luau-execution
---
# Agent Self-Check Loop - Lint, Types, Tests and Build Before You Read the Diff

Coding agents (Claude Code, Codex, Cursor agents, the Roblox Assistant with tools) get dramatically better when they can **run checks themselves** and fix their own errors before handing work to you. Your review time is the scarcest resource; spend it on logic, not on typos a linter would catch. In a Rojo repo you can give an agent one command that runs every machine check, and a rule that it must pass before it says "done".

## The loop

1. Agent edits files on a branch.
2. Agent runs `check` (below).
3. If anything fails, agent reads the error and fixes it; repeat (cap at ~3 tries, then stop and report).
4. Agent reports: what changed, what checks ran, anything it could not verify (e.g. "needs a 2-player playtest").
5. You review the diff and do the human-only tests.

## One script that runs everything

Put this in `scripts/check.sh` (or a `.ps1` twin on Windows) so humans, CI and agents run the identical steps:

```sh
#!/bin/sh
set -e
rojo sourcemap default.project.json -o sourcemap.json
stylua --check src
selene src
luau-lsp analyze --sourcemap=sourcemap.json --definitions=globalTypes.d.luau src
lune run tests          # pure-logic tests that need no Studio
rojo build default.project.json -o build/check.rbxl
echo "ALL CHECKS PASSED"
```

Tool roles:

| Step | Catches |
|---|---|
| StyLua `--check` | formatting drift (cheap, stops noisy diffs) |
| selene | deprecated globals, shadowing, unused variables, suspicious code |
| luau-lsp analyze | type errors, wrong property names, misspelled services (needs the sourcemap and Roblox type definitions) |
| Lune tests | logic regressions in modules with no Instance dependencies ([[Lune - Run Luau Outside Studio]]) |
| `rojo build` | broken project.json, missing files, bad `init` layout |

Pin tool versions with Rokit so the agent and CI use the same binaries ([[Toolchain Managers - Rokit, Foreman and Aftman]]).

## Tell the agent in its instruction file

Add to `AGENTS.md` / `CLAUDE.md` (or Assistant Skills):

```
Before saying a task is done:
- run scripts/check.sh and paste the last 20 lines
- never disable a lint rule or add --!nocheck to make checks pass
- if a check cannot run, say so; do not claim success
- list anything that needs a Studio playtest
```

The second line matters: agents under pressure "fix" lint errors by suppressing them. Make that explicitly forbidden.

## Going further: tests inside real Roblox

Some code needs the engine (physics, Instances, DataStores). Options, from light to heavy:

- **Studio MCP**: the agent runs a playtest and reads Output through the Studio MCP server ([[Claude and the Roblox Studio MCP Server - Responsible Setup]]). Use a test place.
- **Open Cloud Luau Execution**: runs a Luau task against a place version in the cloud and returns logs, useful for running a Jest-Lua suite from CI ([[Unit Testing Luau with Jest-Lua and TestEZ]]).
- **Startup self-checks**: invariant asserts that run when a server boots, so a broken build fails loudly in the test place.

## What the loop does not replace

- Two-player and mobile playtests.
- Security review of remotes and purchases ([[Flow - Reviewing AI-Written Luau - Checklist of Common AI Mistakes]]).
- Judging whether the feature is fun.

## Pitfalls

- Missing `sourcemap.json`: luau-lsp then reports every `require` as unknown and agents start "fixing" correct code.
- Agents editing the check script itself. Put `scripts/` on the do-not-touch list or protect it with CODEOWNERS.
- Infinite fix loops. Cap retries and require a report.

## Related
[[Claude MCP AI Workflow - Hub]] · [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]] · [[Rojo, VS Code and luau-lsp - Local Setup from Zero]] · [[Studio Tools - Having an AI Write Your Studio Plugin - Spec, Review and Test Loop]]
