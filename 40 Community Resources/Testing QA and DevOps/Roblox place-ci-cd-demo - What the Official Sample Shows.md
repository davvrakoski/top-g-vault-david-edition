---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/place-ci-cd-demo"
title: "Roblox place-ci-cd-demo - What the Official Sample Shows"
tags: [roblox, community, "cluster/testing-qa-and-devops", ci, open-cloud, reference-repo]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MIT (place-ci-cd-demo)"
sources:
  - https://github.com/Roblox/place-ci-cd-demo
  - https://create.roblox.com/docs/cloud/reference/features/luau-execution
---
# Roblox place-ci-cd-demo - What the Official Sample Shows

| | |
|---|---|
| **What** | Roblox's sample of a full place CI/CD flow with Rojo and the Open Cloud Luau Execution API |
| **Maintainer** | Roblox (GitHub) |
| **Status** | **Archived** (last push 2024-09-17). Read it as a pattern, not a dependency |
| **License** | MIT |
| **Default branch** | `production` |
| **Link** | https://github.com/Roblox/place-ci-cd-demo |

Its README says it is a demonstration, not battle-tested for production. It is still the clearest official example of the shape a Roblox pipeline should have.

## The pipeline, in plain words
**Triggers:** pull requests and pushes targeting `production`.

| Job | Runs after | What it does |
|---|---|---|
| install-tools | - | Checks out, installs Foreman via `Roblox/setup-foreman`, caches `~/.foreman` keyed on the hash of `foreman.toml` |
| linting | install-tools | Shell script runs selene on `src` |
| formatting | install-tools | Shell script runs StyLua in check mode on `src` |
| luau-tests | install-tools | Builds the place with Rojo, uploads it to the **test** place, runs `tasks/runTests.luau` through Luau Execution (Python helper scripts) |
| deployment | all of the above, **push to production only** | `rojo upload` of `default.project.json` to the **production** place with the API key |

**Concurrency:** the luau-tests job sits in a group named `luau-execution` with `cancel-in-progress: false`, so test runs queue instead of cancelling each other. The README explains this was because of a per-universe concurrency limit at the time; the current reference allows 10 incomplete tasks per place, but queuing is still the safe default.

**Secrets and variables:** one secret `ROBLOX_API_KEY` (scopes `universe.places:write` and `universe.place.luau-execution-session:write`), and plain repository variables for the production and test universe/place IDs.

**Layout:** `.github/workflows/cicd.yml`, `scripts/shell/` (lint, check-format, test), `scripts/python/` (Open Cloud wrappers written only for the demo), `tasks/` (Luau sent to Luau Execution), `src/`, `default.project.json`, `foreman.toml`, `selene.toml`.

The test task itself is tiny: it requires `ReplicatedStorage.Shared.runTests` and calls it. All test logic lives in your game code, not in CI.

## What to copy, what to change in 2026
| Copy | Change |
|---|---|
| Separate test and production universes/places | Foreman to **Rokit** (current recommendation; see [[Toolchain Managers - Rokit, Foreman and Aftman]]) |
| Lint, format and tests as independent jobs that gate deploy | One API key per environment instead of one key for both |
| Deploy only from a protected branch | Add a manual approval (GitHub Environments) before production ([[Deploying with GitHub Actions - Test Place First, Production on Approval]]) |
| Concurrency group for Luau Execution | Newer action versions (`actions/checkout@v4` etc.; the demo pins v3) |
| Thin task file calling a runner module | Keep the release build as an artifact for rollback |

## Rojo upload vs Open Cloud publish
The demo deploys with `rojo upload` using `--api_key`, `--universe_id` and `--asset_id` (the place ID). The same result is available with a direct call to the Place Publishing API ([[Usage guide for place publishing]]) or the `rbxcloud` CLI ([[rbxcloud CLI - Open Cloud from Scripts and CI]]). Note the publishing API's documented limitation: places containing EditableImage, EditableMesh, PartOperation, SurfaceAppearance or BaseWrap changes should be published from Studio after modifying those.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Engine Tests in CI with Open Cloud Luau Execution]] · [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]] · [[Open Cloud APIs for Live Ops - Worked Examples]] · [[Open-Source Evaluation Rubric]]

<!-- TDOD_GRAPH_END -->
