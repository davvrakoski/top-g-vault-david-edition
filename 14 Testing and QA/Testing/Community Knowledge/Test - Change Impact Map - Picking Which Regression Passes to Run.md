---
area: "14 Testing and QA"
cluster: "Testing"
title: "Change Impact Map - Picking Which Regression Passes to Run"
tags: [roblox, community-knowledge, testing, regression, risk-based-testing, release]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/activity-history
  - https://create.roblox.com/docs/projects/assets/packages
  - https://git-scm.com/docs/git-diff
---
# Change Impact Map - Picking Which Regression Passes to Run

This vault now has many test passes (combat, economy, UI state, teleport, streaming, dupes, chaos, purchases, safety). Nobody runs all of them every Friday, and a small team should not try. A **change impact map** answers "which passes does this release need?" in two minutes: list what changed, look up each change type in a table, and run the union. It is risk-based testing in its simplest form: spend test time where the change is, plus a small fixed smoke set everywhere.

## Step 1 - List what changed

Sources of truth:

- **Git**: `git diff --stat v1.3..HEAD` (or between the last release tag and now) lists every changed file. With a Rojo layout, folder names map straight to systems.
- **Studio-only edits**: the place's **Activity History** (Studio Window menu, or the Creator Dashboard page) shows publishes, committed script drafts and configuration changes such as audience access, Studio API access and private server settings, with who made them.
- **Packages**: if you use Packages, copies with **AutoUpdate** on pull the new version as soon as a place containing them is opened in Studio, so the next publish of any place can ship a package change nobody tested there. List the packages that got a new version.
- **Dashboard-only changes**: product prices, Configs, experiments, notifications. They change behaviour without any code diff.

## Step 2 - Look up each change

| If this changed... | Run these passes |
| --- | --- |
| Weapons, abilities, damage, hitboxes | [[Test - Combat Regression Checklist]] |
| Rewards, prices in code, multipliers, rebirth | [[Test - Economy Regression Checklist - Currency, Rewards and Sinks]] |
| Shop UI, product list, Robux prices | [[Test - Shop Price Change Regression - Hunting Hard-Coded Prices and Receipt Assumptions]] + [[Testing Purchases - Developer Products, Passes and ProcessReceipt]] |
| Save schema, data module, session locking | [[Test - Save Migration Tests - Fixture Saves, Golden Files and Mixed-Version Servers]] + [[QA - DataStore Failure Testing - Fault Injection and Retry Checks]] + [[Test - Server Lifecycle Chaos Pass - Shutdowns, Restarts and Rejoins]] |
| Trading, gifting, inventory | [[Test - Dupe Hunting Test Script - Trades, Gifts, Drops and Rejoins]] |
| Places, matchmaking, teleports | [[Test - Teleport and Multi-Place Flow Test Pass]] |
| Map layout, big new areas, streaming settings | [[Test - StreamingEnabled QA Pass - Forcing Stream-Out and Catching Nil Bugs]] |
| Menus, HUD, data shown in UI | [[Test - UI State Regression Checklist - Menus, Modals, Respawn and Live Data]] |
| Round loop, teams, spawning | [[Test - Join, Leave and Respawn Edge-Case Pass]] |
| New text input, names, signs, chat UI | [[Test - Child Safety QA - Filter Coverage, Chat Permissions and Policy Flags]] |
| New animations, sounds, imported models | [[Test - Asset Load Audit - Finding Animations, Sounds and Images That Fail in the Live Game]] + security backdoor sweep |
| Timed event, Configs schedule | [[Test - Live-Ops Event Dry Run - Rehearsing a Timed Event End to End]] |
| New remotes | [[RemoteEvent Fuzzing - Bad Input Tests Before Launch]] |
| New collaborator, plugin, HTTP service | [[Test - Pre-Launch Security Review - Settings, Backdoors, Secrets and Access]] |
| Heavy content, effects, long sessions | [[Soak Tests - Long-Session Memory and Leak Checks]] + [[MicroProfiler Benchmark Routes for Performance Regression Checks]] |

## Step 3 - Always run the smoke set

Regardless of the diff, every release gets about 15 minutes of: join on phone and PC, complete the core loop once, buy one cheap test item, leave and rejoin to see the save, and check the Error Report for new errors on the test universe. Shared modules make "unrelated" changes break distant systems; the smoke set is your net for that.

## Step 4 - Widen when the change is shared

If a changed file is a shared utility (signal library, data wrapper, remote wrapper, UI framework), treat it as touching **every** system that requires it. A quick way to see the blast radius is to search for the module name in `require(` calls. Shared-module changes earn a bug bash ([[Test - Bug Bash Runbook - One-Hour Team Test Before a Release]]) rather than a single pass.

## Step 5 - Write it down

In the release log: the change list, the passes chosen, who ran them, results. Over a few releases this shows which systems break most and which passes find the most bugs, which tells you where automated tests would pay off first.

## Related

[[Testing - Hub]] · [[Full Test Matrix]] · [[Pre-Release Gate]] · [[Release Readiness Runbook 2026]]
