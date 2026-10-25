---
area: "14 Testing and QA"
cluster: "Testing"
title: "Error Report and Crashes Triage After an Update"
tags: [roblox, community-knowledge, testing, error-report, crashes, triage, live-ops]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/analytics/error-report
  - https://create.roblox.com/docs/production/analytics/crashes
  - https://devforum.roblox.com/t/how-to-post-a-bug-report/24388
---
# Error Report and Crashes Triage After an Update

The Creator Dashboard already collects your Luau errors and server crashes; the hard part is reading them in a fixed order right after a publish, before players flood Discord. This note is a 15-minute post-release triage routine built only on the two official monitoring pages: **Error Report** and **Crashes** (both under Monitoring for the game). It assumes you have analytics permission for the owning group.

## Before you publish

1. Note the place version you are about to publish (write it in the release log).
2. Open Error Report with **Date range = last 1 day** and turn on **Show version** so the chart gets version annotations.
3. Screenshot the current top 10 errors by Count. This is your baseline.

## The 15-minute routine (30-60 minutes after publish)

**Step 1 - Spike check (2 min).** Error Report chart, last 1 hour, Show version on. Compare the server, client and total lines before and after the new version mark. A step up exactly at the mark is your release.

**Step 2 - New errors only (5 min).** Set **New errors since** to the version you just published and pick the place. Now the table only shows messages first seen in this build. Sort by Count. For each of the top rows:
- Check **Type** (server or client) and **First seen version**.
- Expand the row to read the **stack trace**; it names the script and line.
- Copy message + trace + version into a bug using the team template.

**Step 3 - Platform split (3 min).** For client errors, filter by **Platform** and **OS**. An error only on one OS usually means input, UI layout or memory, not logic.

**Step 4 - Crashes (3 min).** Open the Crashes chart. Crashes are split into **out-of-memory** (yours to fix) and **platform** crashes (engine-level; Roblox monitors these, and the docs suggest filing a DevForum bug report if they rise sharply). For an OOM spike, open a **server out-of-memory snapshot**: it is a JSON summary of the data model captured as the server ran out of memory, shown as a treemap. Filter snapshots by place version and server uptime: high uptime points to a leak, low uptime points to something big loaded at start.

**Step 5 - Decide (2 min).**

| Finding | Action |
| --- | --- |
| New server error in a purchase, save or trade path | Severity 1: kill switch or roll back now |
| New client error that blocks a core loop on one platform | Hotfix today |
| OOM crashes rising with uptime | Soak test the build, see [[Soak Tests - Long-Session Memory and Leak Checks]] |
| Old noisy warning | Add an **Ignore** rule so it stops hiding real issues |
| Many variants of one message (IDs in the text) | Add a **Group** rule with a regex |

## Keeping the report readable

- Custom rules (up to **100 per experience**) are evaluated top to bottom and stop at the first match. Put narrow Group rules above broad Ignore rules, or a broad Ignore will swallow a real error.
- Never Ignore a message from your own scripts permanently; fix it or downgrade it. Ignore is for engine noise and legacy prints.
- Error messages with player names or numbers in them split into many rows. Write errors with a stable prefix (for example `[Shop] receipt failed:`) so grouping works.

## Error budget habit

Track two numbers per release in the release log: new-error count after one hour, and OOM crashes in the first 24 hours. If either goes up two releases in a row, the next release is a stability release. This keeps the dashboard a decision tool instead of a page nobody opens.

## Related

[[Testing - Hub]] · [[Bug Triage, Severity and Regression Workflow]] · [[Error Reporting API - Grouping Rules as Code and New-Error Checks]] · [[Release Regression Check - Performance Dashboard by Place Version]]
