---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/github-actions-deploy-approval"
title: "Deploying with GitHub Actions - Test Place First, Production on Approval"
tags: [roblox, community, "cluster/testing-qa-and-devops", ci, deploy, github-actions, release]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "Roblox docs CC BY 4.0 (facts); workflow below is original"
sources:
  - https://create.roblox.com/docs/cloud/guides/usage-place-publishing
  - https://create.roblox.com/docs/projects/update-games
  - https://create.roblox.com/docs/cloud/auth/api-keys
  - https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment
---
# Deploying with GitHub Actions - Test Place First, Production on Approval

**The rule:** a build reaches players only after (1) CI passed, (2) the *same file* ran on a staging place, and (3) a human clicked approve. Automation removes typing mistakes; the approval step keeps a human in charge of timing.

## Building blocks
- **Place Publishing API** (official): `POST /universes/v1/{universeId}/places/{placeId}/versions?versionType=Saved|Published`, body is the `.rbxl`/`.rbxlx`, response is `{ "versionNumber": N }`. Key needs `universe-places` write on that experience. See [[Usage guide for place publishing]].
- **GitHub Environments** (GitHub feature): an environment called `production` can require reviewers before a job that targets it starts, and can hold its own secrets. That makes the production API key unreachable from any job that was not approved.
- **Restart servers** after publishing so players move to the new version (dashboard, or the Open Cloud call shown in [[Open Cloud APIs for Live Ops - Worked Examples]]). Prefer "outdated servers only" plus a bleed-off delay, per [[Release game updates]].

## The workflow (original)

```yaml
# .github/workflows/release.yml
name: release
on:
  push:
    tags: ["v*"]          # releases are cut by tagging, e.g. v1.8.0

permissions:
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: CompeyDev/setup-rokit@v0.2.1
      - run: wally install
      - run: rojo build default.project.json --output game.rbxl
      - uses: actions/upload-artifact@v4
        with:
          name: release-${{ github.ref_name }}
          path: game.rbxl

  staging:
    needs: build
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: release-${{ github.ref_name }}
      - name: Publish to staging place
        run: |
          curl --fail-with-body -sS -X POST \
            "https://apis.roblox.com/universes/v1/${{ vars.UNIVERSE_ID }}/places/${{ vars.PLACE_ID }}/versions?versionType=Published" \
            -H "x-api-key: $KEY" -H "Content-Type: application/octet-stream" \
            --data-binary @game.rbxl
        env:
          KEY: ${{ secrets.ROBLOX_API_KEY }}

  production:
    needs: staging
    runs-on: ubuntu-latest
    environment: production     # required reviewers set in repo settings
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: release-${{ github.ref_name }}
      - name: Publish to production place
        run: |
          curl --fail-with-body -sS -X POST \
            "https://apis.roblox.com/universes/v1/${{ vars.UNIVERSE_ID }}/places/${{ vars.PLACE_ID }}/versions?versionType=Published" \
            -H "x-api-key: $KEY" -H "Content-Type: application/octet-stream" \
            --data-binary @game.rbxl | tee publish.json
        env:
          KEY: ${{ secrets.ROBLOX_API_KEY }}
      - name: Record the Roblox version number
        run: echo "Published ${{ github.ref_name }} as place version $(cat publish.json)" >> "$GITHUB_STEP_SUMMARY"
```

Notes on the design:
- `vars.*` and `secrets.*` resolve **per environment**, so the same step publishes to staging or production depending on which environment's IDs and key it gets.
- The staging place lives in a **separate staging universe** (own DataStores), so staging play can't touch player data. See [[Test Places, Staging Universes and Places in a Universe]].
- The production job downloads the artifact built once in `build`; it never rebuilds. What testers played is byte-for-byte what ships.
- The step summary links the git tag to the Roblox place version. You need that mapping during a rollback ([[Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label]]).

## Before you approve
Use the vault's gate notes: [[Pre-Release Gate]] and [[Release Readiness Runbook 2026]] (watch window, rollback paths). Approve outside your players' peak hours unless the fix is urgent.

## Limits to remember
- The publishing API does not update EditableImage, EditableMesh, PartOperation, SurfaceAppearance or BaseWrap instances; changes to those must be published from Studio.
- Multi-place games: publish every changed place, then restart. A lobby on version N teleporting into a match place on version N-1 is a classic release bug.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Usage guide for place publishing]] · [[Release game updates]] · [[Release Readiness Runbook 2026]] · [[Rollback Drills - Rehearsing a Bad Release]] · [[rbxcloud CLI - Open Cloud from Scripts and CI]]

<!-- TDOD_GRAPH_END -->
