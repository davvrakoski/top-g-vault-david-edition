---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/pr-qa-template"
title: "Pull Request QA Template and Automated Checklist"
tags: [roblox, community, "cluster/testing-qa-and-devops", qa, github, checklist]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "Template and workflow below are original"
sources:
  - https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository
  - https://create.roblox.com/docs/studio/testing-modes
---
# Pull Request QA Template and Automated Checklist

**Why:** CI catches what machines can check. A pull request template makes the author answer the questions machines can't ("did you test on a phone?", "does this change the save format?") **before** review, in the same place every time.

GitHub picks up a file named `.github/pull_request_template.md` and pre-fills every new pull request with it.

## The template (original)

```markdown
## What changed
<!-- one or two sentences, player-facing if possible -->

## Risk
- [ ] Touches saved data (schema, keys, DataStore names)
- [ ] Touches purchases, currency or trading
- [ ] Touches RemoteEvents / server validation
- [ ] Changes a place other than the start place
- [ ] None of the above (cosmetic / tooling)

## Tested
- [ ] Unit tests added or updated (Lune or Jest Lua)
- [ ] Solo playtest (Test, F5) - client and server output clean
- [ ] Server & Clients with 2+ clients (multiplayer behaviour)
- [ ] Device Simulator: one phone, one tablet
- [ ] Network Simulator with added latency (if it involves remotes)
- [ ] Staging universe playtest (data / purchase / teleport changes)

## Release notes
- Feature flag or config name (if gated):
- Needs server restart after publish? yes / no
- Rollback safe? (old build can read data this build writes) yes / no / n.a.
```

The "Risk" boxes decide how deep the review goes; any of the first four means a second reviewer and a staging playtest. Tie severity and regression work to [[Bug Triage, Severity and Regression Workflow]].

## Make the checklist enforce itself (original)
A small job fails when a pull request that touches data or purchase code leaves the matching boxes empty. It reads the PR body from the event payload, so it needs no tokens beyond the default.

```yaml
# .github/workflows/pr-checklist.yml
name: pr-checklist
on:
  pull_request:
    types: [opened, edited, synchronize]

permissions:
  contents: read
  pull-requests: read

jobs:
  checklist:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - name: Require staging test for risky paths
        env:
          BODY: ${{ github.event.pull_request.body }}
          BASE: ${{ github.event.pull_request.base.sha }}
        run: |
          changed=$(git diff --name-only "$BASE"...HEAD)
          if echo "$changed" | grep -qE '^src/Server/(Data|Economy|Purchases)/'; then
            if ! printf '%s' "$BODY" | grep -qF -- '- [x] Staging universe playtest'; then
              echo "::error::Data/economy code changed: tick 'Staging universe playtest' after testing on staging."
              exit 1
            fi
          fi
```

Passing the body through an environment variable (not pasting `${{ }}` straight into the script) avoids shell injection from PR text.

## Keep it alive
- Review the template every few months; delete boxes nobody ticks honestly.
- Link the long-form gates instead of copying them: [[Definition of Done]], [[Pre-Release Gate]], [[Full Test Matrix]].
- Ticking a box you didn't do is a process bug, not a person bug: make the box cheaper (automate it) or remove it.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Definition of Done]] · [[Pre-Release Gate]] · [[QA Test Plan Template for Roblox Experiences]] · [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]]

<!-- TDOD_GRAPH_END -->
