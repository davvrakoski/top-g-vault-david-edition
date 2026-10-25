---
area: "15 AI Tools and Workflow"
cluster: "Git Version Control"
title: "Branching for Small Roblox Teams - Trunk-Based with Feature Flags"
tags: [roblox, community-knowledge, git, branching, releases, feature-flags, team-workflow]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://trunkbaseddevelopment.com/
  - https://www.conventionalcommits.org/en/v1.0.0/
  - https://create.roblox.com/docs/projects/update-games
---
# Branching for Small Roblox Teams - Trunk-Based with Feature Flags

Two to six developers on a Roblox game rarely need GitFlow's develop/release/hotfix branch maze. What hurts small teams is long-lived feature branches that drift for weeks, then collide with everyone else's changes and the live place. **Trunk-based development** (short branches merged into `main` daily or every couple of days, unfinished work hidden behind flags) fits Roblox well, because the deploy target is a place you can publish many times a day and test in a separate staging place.

## The model

```
main ──●──●──●──●──●──●──●──   always deployable to the TEST place
        \  /    \    /
  feat/shop-ui   fix/dash-cooldown     (hours to ~2 days old)
              tag v1.4.0 ──> deploy to PRODUCTION place
```

Rules:
1. **`main` always builds and passes CI** (format, lint, type check, tests; see [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]]).
2. Branches are short: `feat/…`, `fix/…`, `chore/…`. Rebase or merge `main` in daily.
3. Every merge goes through a pull request with at least one review (or an AI review pass plus self-review for solo devs; [[AI Code Review Prompt]]).
4. `main` deploys automatically to the **test place**; production is deployed from a **tag** after a playtest ([[Deploying with GitHub Actions - Test Place First, Production on Approval]]).
5. Hotfix: branch from the production tag, fix, tag `v1.4.1`, deploy, then merge back to `main`.

## Feature flags instead of long branches

Big features (a new map, a trading system) are merged in small pieces while **switched off**:

```lua
-- ReplicatedStorage/Shared/Flags.luau (own example)
return table.freeze({
	TradingEnabled = false,
	NewMapRotation = false,
})
```

- Code paths check the flag; the server is the authority on flags that matter for security.
- For live toggles without a redeploy, read flags from a config source (attributes on a server-only folder, a DataStore/MemoryStore value, or Roblox's configuration tools) as described in [[Config Feature Flags and Content Data]].
- Delete the flag and the old path once the feature is fully live; dead flags are tech debt.

## Commit messages people can scan

Conventional Commits gives a lightweight format: `type(scope): summary`.

| Type | Use |
| --- | --- |
| `feat` | new player-facing behaviour |
| `fix` | bug fix |
| `perf` | performance change |
| `refactor` | no behaviour change |
| `chore` | tooling, deps, CI |
| `docs` | docs only |

Example: `fix(combat): stop double hit when tool re-equipped`. A `!` after the type (or a `BREAKING CHANGE:` footer) marks breaking changes, such as a save-data format change. These messages make release notes and `git log --oneline` readable, and let tools generate changelogs.

## Roblox-specific wrinkles

- **Place content isn't in Git.** Builders work in Team Create on the test place; scripters in Git. Agree who publishes what, and use Studio's Version History for world changes ([[Studio Collaboration and Team Workflow]]).
- **Save-data changes need extra care.** Any PR that changes DataStore schemas needs a migration and a rollback plan ([[Rollback Drills - Rehearsing a Bad Release]]).
- **Releasing means restarting servers.** Old servers keep old code until they restart; protocol changes must tolerate mixed versions for a while ([[Remote Protocol Versioning]], [[Update Cadence and Server Restarts Without Losing Players]]).
- **Build label.** Stamp the git tag into the build so bug reports name the version ([[Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label]]).

## When to use something heavier
- Several live games sharing libraries: put shared code in Wally packages with their own versioning.
- Console certification or partner deadlines: a `release/x.y` stabilization branch for a few days is fine; keep it short-lived.

## Related
[[Git Version Control - Hub]] · [[Git Script Sync Rojo Team Workflow]] · [[Studio Collaboration and Team Workflow]] · [[Test Places, Staging Universes and Places in a Universe]]
