---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/hub"
title: "Testing QA and DevOps - Hub"
tags: [roblox, community, "cluster/testing-qa-and-devops", hub]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "mixed - see each note"
sources:
  - https://create.roblox.com/docs
  - https://github.com/Roblox/place-ci-cd-demo
  - https://devforum.roblox.com/t/stress-testing-tools/32413
---
# Testing QA and DevOps - Hub

Community and official tooling for **testing, CI, releases, logging and live-ops safety** in Roblox games. Every tool's license and maintenance status was checked on 2026-10-25 and is recorded in its note. Code and YAML in these notes are original examples; facts are paraphrased from the Roblox Creator Hub docs (CC BY 4.0) and each tool's own README or docs.

**Start here if you are new:** [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]], then [[Test Places, Staging Universes and Places in a Universe]], then [[Deploying with GitHub Actions - Test Place First, Production on Approval]].

The manual QA side (test plans, triage, release gates) lives in [[Testing - Hub]]; the automated-test concepts are in [[Unit Testing Luau with Jest-Lua and TestEZ]].

## Test frameworks and harnesses
- [[TestEZ in 2026 - Archived Status, License and Migration Path]] - archived 2024-09-14, Apache-2.0; hook/focus equivalents and a migration order.
- [[Jest Lua Setup Checklist - Wally, jest.config and runCLI]] - MIT; dependencies, config, the FFlag, a runner that returns a summary.
- [[Jest Lua runCLI Options for CI]] - ci, json, filters, snapshots; CI and Studio profiles.
- [[Lune Test Harness for Pure Luau Modules]] - a 40-line harness for engine-free modules, exit codes for CI.
- [[Wally Dev Dependencies and Lockfiles for Test Packages]] - dev-dependencies, committed lockfile, test vs release Rojo projects.

## Static checks
- [[selene for Roblox - Config, Std and Inline Filters]] - MPL-2.0; roblox std (floating vs pinned), lint severities, inline allows.
- [[StyLua for Roblox - Config, Ignore Rules and CI Check]] - MPL-2.0 (action MIT); defaults, ignores, `--check` exit code.
- [[luau-lsp analyze and Rojo Sourcemaps in CI]] - MIT; sourcemap + definitions, why to copy flags from `--help`.

## CI pipelines
- [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]] - setup-rokit, cheapest-failure-first order, artifact for rollback.
- [[Engine Tests in CI with Open Cloud Luau Execution]] - limits, scopes, a hardened Python runner, concurrency.
- [[Roblox place-ci-cd-demo - What the Official Sample Shows]] - Roblox's archived MIT sample, what to copy and what to modernise.
- [[rbxcloud CLI - Open Cloud from Scripts and CI]] - MIT; publish and Luau Execution commands.
- [[Running Tests in Studio from the Command Line - run-in-roblox vs RunScript]] - local Studio runners, self-hosted runner caveat.
- [[Code Coverage with ScriptContext EnableCoverage]] - engine coverage API from a Luau Execution task.
- [[Pull Request QA Template and Automated Checklist]] - PR template plus a job that enforces staging tests for risky paths.

## Integration, load and place checks
- [[Multi-Client Integration Recipes with StudioTestService]] - suite runner plugin, staggered joins, mid-trade disconnects.
- [[Load Testing Roblox Servers - Simulated Players and Bots]] - synthetic handler load, NPC stand-ins, real-player betas.
- [[Automated Place Lint with Lune - QA Checks on rbxl Files]] - backdoor requires, misplaced scripts, loose parts.

## Environments, releases and rollback
- [[Test Places, Staging Universes and Places in a Universe]] - why data stores force separate universes; place IDs by environment.
- [[Studio API Access and Data Safety During Testing]] - the Studio toggle, a fail-safe store factory.
- [[Deploying with GitHub Actions - Test Place First, Production on Approval]] - environments, approvals, build once.
- [[Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label]] - tag, commit, PlaceVersion, JobId on screen.
- [[Rollback Drills - Rehearsing a Bad Release]] - two rollback routes, the data question, a quarterly drill.
- [[Server Restart Notices with ServerRestartScheduled]] - countdown and pre-shutdown prep.

## Errors, logs and alerts
- [[Error Logging Pipeline - ScriptContext Error and Client Error Forwarding]] - fingerprinted, rate-limited collection with build context.
- [[Structured Logging with LogService Loggers]] - templates, context tables, hierarchical loggers.
- [[Error Reporting API - Grouping Rules as Code and New-Error Checks]] - rules synced from the repo, new-errors-since-release.
- [[Analytics Alerts as Code - Crash Rate and Error Alerts]] - crash-rate and player-drop alerts with webhooks.

## Checked and left out
- **Mantle** (blake-mealey, MIT): its README says it is no longer maintained; covered for reference in [[Asset Pipelines as Code - Asphalt, Tarmac and Mantle]], not recommended for new deploy pipelines.
- **Lemur** (the old Roblox API emulator TestEZ mentions for CI): superseded by Lune and Open Cloud Luau Execution; not given its own note.
- **Studio CLI smoke tests, Device/Network simulators, MCP playtests**: already covered in [[Device, Network and Controller Simulation Test Pass]].
- **Publish + restart server API calls**: already covered in [[Open Cloud APIs for Live Ops - Worked Examples]].

## Credits
| Source | License | Credit |
|---|---|---|
| Roblox Creator Hub documentation | CC BY 4.0 (code samples MIT) | Roblox Corporation |
| TestEZ | Apache-2.0 | Roblox |
| Jest Lua | MIT | jsdotlua (fork of Roblox jest-roblox) |
| place-ci-cd-demo | MIT | Roblox |
| Lune | MPL-2.0 | lune-org |
| selene | MPL-2.0 | Kampfkarren |
| StyLua / stylua-action | MPL-2.0 / MIT | JohnnyMorganz |
| luau-lsp | MIT | JohnnyMorganz |
| Rojo / Rokit / run-in-roblox | MPL-2.0 / MIT / MIT | rojo-rbx |
| setup-rokit | MIT | CompeyDev (fork of ok-nick/setup-aftman) |
| rbxcloud | MIT | Sleitnick |
| Wally | MPL-2.0 | UpliftGames |
| DevForum "Stress testing tools" thread | link only | its author, devforum.roblox.com/t/32413 |
| GitHub Docs (environments, PR templates) | link only | GitHub |

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Testing - Hub]] · [[Free Tools and Assets - Hub]] · [[Git Version Control - Hub]] · [[Open Cloud and External Tooling]]

<!-- TDOD_GRAPH_END -->
