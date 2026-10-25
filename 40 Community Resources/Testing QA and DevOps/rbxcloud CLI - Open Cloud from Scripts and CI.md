---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/rbxcloud-cli"
title: "rbxcloud CLI - Open Cloud from Scripts and CI"
tags: [roblox, community, "cluster/testing-qa-and-devops", open-cloud, cli, ci]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MIT (rbxcloud)"
sources:
  - https://github.com/Sleitnick/rbxcloud
  - https://sleitnick.github.io/rbxcloud/
  - https://sleitnick.github.io/rbxcloud/cli/cli-experience
  - https://sleitnick.github.io/rbxcloud/cli/cli-luau-execution
---
# rbxcloud CLI - Open Cloud from Scripts and CI

| | |
|---|---|
| **What** | Command-line tool and Rust library (`rbxcloud` crate) for the Roblox Open Cloud API |
| **Maintainer** | Sleitnick (Stephen Leitnick) |
| **License** | MIT |
| **Version seen** | 0.17.0 in the README install examples (2026-10-25) |
| **Install** | Through a toolchain manager (README shows `aftman add Sleitnick/rbxcloud@0.17.0`; Rokit uses the same GitHub repo id) |
| **Link** | https://github.com/Sleitnick/rbxcloud · docs https://sleitnick.github.io/rbxcloud |

**Why use it:** instead of maintaining your own curl or Python wrappers, CI steps become one readable command. The CLI docs have sections for Assets, DataStore, OrderedDataStore, Experience (publish), Place, Universe, Messaging, Luau Execution, Group, Inventory, Notification, Subscription, User and User Restriction.

## Publishing a place
From the CLI docs:

```
rbxcloud experience publish -f <file.rbxl> -t <saved|published> -p <PLACE_ID> -u <UNIVERSE_ID> -a <API_KEY>
```

- `-t saved` creates a version without making it live (good for test places and staged releases).
- `-t published` makes it the live version.
- The key can come from the `RBXCLOUD_API_KEY` environment variable instead of `-a`, which keeps it out of the command line (and out of CI logs).

CI step (original):

```yaml
- name: Publish to staging (saved version)
  run: rbxcloud experience publish -f game.rbxl -t saved -p "$STAGING_PLACE" -u "$STAGING_UNIVERSE"
  env:
    RBXCLOUD_API_KEY: ${{ secrets.ROBLOX_STAGING_API_KEY }}
    STAGING_PLACE: ${{ vars.ROBLOX_STAGING_PLACE_ID }}
    STAGING_UNIVERSE: ${{ vars.ROBLOX_STAGING_UNIVERSE_ID }}
```

## Luau Execution from the CLI
The docs list three commands:
- `rbxcloud luau execute -u <UNIVERSE> -i <PLACE> (-s "<script>" | -f <file>) [-r <VERSION>] [-t <TIMEOUT>]`
- `rbxcloud luau get-task -u ... -i ... -s <SESSION_ID> -t <TASK_ID>`
- `rbxcloud luau get-logs -u ... -i ... -s <SESSION_ID> -t <TASK_ID> [-w flat|structured]`

There is **no built-in wait/poll flag** documented, so a CI script still loops on `get-task` until the state is final. If you need retries and summary parsing, the Python script in [[Engine Tests in CI with Open Cloud Luau Execution]] is easier to control.

## Other handy uses in a QA/live-ops toolbox
- **Messaging:** broadcast a "restart soon" or event signal to running servers during a release.
- **DataStore:** read a tester's save in the **test** universe to verify a migration.
- **Assets:** upload images or audio as part of a build.

Every command here acts on live cloud resources. Use separate keys per universe, and never give a CI key DataStore write on production unless a reviewed tool needs it ([[Open Cloud APIs for Live Ops - Worked Examples]] has the safety rules).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Engine Tests in CI with Open Cloud Luau Execution]] · [[Deploying with GitHub Actions - Test Place First, Production on Approval]] · [[Open Cloud and External Tooling]] · [[Asset Pipelines as Code - Asphalt, Tarmac and Mantle]]

<!-- TDOD_GRAPH_END -->
