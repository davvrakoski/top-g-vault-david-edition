---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/run-in-roblox-vs-runscript"
title: "Running Tests in Studio from the Command Line - run-in-roblox vs RunScript"
tags: [roblox, community, "cluster/testing-qa-and-devops", testing, studio-cli, ci]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MIT (run-in-roblox); Roblox docs CC BY 4.0"
sources:
  - https://github.com/rojo-rbx/run-in-roblox
  - https://create.roblox.com/docs/studio/cli
  - https://jsdotlua.github.io/jest-lua/
---
# Running Tests in Studio from the Command Line - run-in-roblox vs RunScript

Three ways exist to run engine-dependent tests without clicking Play. This note compares the two that use a **local Studio install**; the cloud option is [[Engine Tests in CI with Open Cloud Luau Execution]].

## Option 1: run-in-roblox (community)
| | |
|---|---|
| **Maintainer** | rojo-rbx |
| **License** | MIT |
| **Status** | Not archived; last push 2024-03 (quiet). Example manifests pin 0.3.0 |
| **Link** | https://github.com/rojo-rbx/run-in-roblox |

It opens a place (optional) in Roblox Studio, runs one script until it finishes, **pipes Studio's output back to stdout/stderr**, and exits. Usage from its README: `run-in-roblox --place MyPlace.rbxlx --script starter-script.lua`. The Jest Lua docs use exactly this to run Jest from a terminal.

## Option 2: Studio's own `--task RunScript` (official)
Documented on the Studio command-line page: `RobloxStudioBeta.exe --task RunScript --runScriptFile <abs path> [--localPlaceFile <place>] [--outputFile <log>] [--quitAfterExecution]`. The script runs at **command-bar permission** after the place loads; without a place it uses the default Baseplate. Launched from a command line, Studio also writes verbose logs to stdout. The vault's [[Device, Network and Controller Simulation Test Pass]] has a worked smoke-test example.

## Which one?
| Need | Pick |
|---|---|
| No third-party binary, official and documented | RunScript |
| Live streaming of test output to the terminal | run-in-roblox (pipes output); RunScript writes to `--outputFile` |
| Run Jest Lua exactly as its docs show | run-in-roblox |
| No Studio on the machine (Linux CI) | Neither: use Open Cloud Luau Execution or Lune |

## The catch for CI
Both need **Roblox Studio installed and signed in** on the machine. GitHub's hosted Linux runners cannot do that. Teams that use these tools either run them on a **self-hosted Windows or macOS runner** (an always-on dev PC) or only locally as a pre-push check. If you self-host a runner, treat it like a production machine: dedicated account, no personal Roblox session with access to live games.

## A pre-push habit (original)
A tiny local script that a developer runs before pushing:

```powershell
# scripts/test-local.ps1  (Windows; adjust the Studio path to your Versions folder)
rojo build test.project.json --output build/test.rbxl
& "$env:LOCALAPPDATA\Roblox\Versions\<version>\RobloxStudioBeta.exe" `
  --task RunScript --localPlaceFile "$PWD\build\test.rbxl" `
  --runScriptFile "$PWD\ci\studio_smoke.luau" `
  --outputFile "$PWD\build\smoke.log" --quitAfterExecution
if (-not (Select-String -Path build\smoke.log -Pattern 'failures=0' -Quiet)) { exit 1 }
```

`ci/studio_smoke.luau` prints a final `failures=N` line, as in the device-pass example.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Device, Network and Controller Simulation Test Pass]] · [[Jest Lua Setup Checklist - Wally, jest.config and runCLI]] · [[Engine Tests in CI with Open Cloud Luau Execution]] · [[Studio command-line interface]]

<!-- TDOD_GRAPH_END -->
