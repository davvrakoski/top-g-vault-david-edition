---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/rollback-drills"
title: "Rollback Drills - Rehearsing a Bad Release"
tags: [roblox, community, "cluster/testing-qa-and-devops", live-ops, rollback, release]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/projects/version-history
  - https://create.roblox.com/docs/projects/update-games
  - https://create.roblox.com/docs/cloud/guides/usage-place-publishing
---
# Rollback Drills - Rehearsing a Bad Release

[[Release Readiness Runbook 2026]] lists the rollback paths (kill switch, config restore, place restore, revoke access). This note is about **practising** them, so the first time you roll back is not during a real incident with players watching.

## Two code-rollback routes and how long they really take
| Route | Steps | Gotcha |
|---|---|---|
| **Version History restore** | Creator Dashboard > Configurations > Places > place > Version History > Restore (or Studio: Open Local Copy, then Save to Roblox As) | Per the docs, restoring **does not publish**. You still publish and restart servers |
| **Republish the previous CI artifact** | Run a "redeploy" workflow with the old tag; it publishes the stored `.rbxl` | Only works if you kept artifacts and the old build does not need Studio-only instance types |

After either: **restart servers** (outdated only, with a bleed-off delay) so players leave the bad version; see [[Release game updates]].

## A redeploy-by-tag workflow (original)
Stored artifacts from [[Deploying with GitHub Actions - Test Place First, Production on Approval]] make this a two-click rollback:

```yaml
# .github/workflows/redeploy.yml
name: redeploy
on:
  workflow_dispatch:
    inputs:
      tag:
        description: "Release tag to put back live (e.g. v1.7.3)"
        required: true

jobs:
  redeploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4
        with:
          ref: ${{ inputs.tag }}
      - uses: CompeyDev/setup-rokit@v0.2.1
      - run: wally install
      # Rebuild from the tag: wally.lock and rokit.toml pin the same tool and package
      # versions, so this reproduces the old build. (Or download the old artifact
      # while it is still within its retention period.)
      - run: rojo build default.project.json --output game.rbxl
      - name: Publish
        run: |
          curl --fail-with-body -sS -X POST \
            "https://apis.roblox.com/universes/v1/${{ vars.UNIVERSE_ID }}/places/${{ vars.PLACE_ID }}/versions?versionType=Published" \
            -H "x-api-key: $KEY" -H "Content-Type: application/octet-stream" \
            --data-binary @game.rbxl
        env:
          KEY: ${{ secrets.ROBLOX_API_KEY }}
```

## The data question (decide before every release)
Rolling back code does **not** roll back data that the bad build already wrote. Ask in review:
1. Does this release write a new field or format? Then the **previous** build must tolerate it (ignore unknown fields, keep them on save).
2. Did it grant currency or items by mistake? Rollback won't remove them; you need a targeted repair script with an audit log.
3. Did it change a DataStore name or key scheme? Then rollback means old code reads the old store and players "lose" progress made since release. Avoid this in patch releases.

Session locking and versioned saves make all three easier ([[DataStore Session Locking, Retries, Versioning and Erasure]]).

## Run a drill (30 minutes, once per quarter)
On **staging**, never production:
1. Publish build N (good), then N+1 with a harmless visible change (a red sign).
2. Start a timer. Roll back using route 1. Note the time to "red sign gone for a fresh server".
3. Repeat with route 2.
4. Flip a kill-switch config off and on; time it.
5. Write the times and any confusing step into your runbook. Fix the confusing step.

Suggested targets to aim for (our recommendation, not a Roblox figure): kill switch in about a minute, full code rollback plus restart in under 15 minutes.

## Common mistakes
- Restoring a version and forgetting to publish, then wondering why players still see the bug.
- Restarting **all** servers instead of outdated ones, kicking players off the good version too.
- Not knowing which place version was the last good one (fix: tag-to-version mapping in [[Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label]]).
- Multi-place games: rolling back the lobby but not the match place.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Release Readiness Runbook 2026]] · [[Version History]] · [[Config Feature Flags and Content Data]] · [[Server Restart Notices with ServerRestartScheduled]]

<!-- TDOD_GRAPH_END -->
