---
area: "13 Growth and Monetization"
cluster: "Analytics Discovery"
source_note: "27_Production_Labs/09_Analytics_Onboarding_Lab"
title: "Analytics Onboarding Lab"
tags: [roblox, legendary, lab, "cluster/analytics-discovery"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Analytics Onboarding Lab

## Goal
Instrument the first-session funnel so design decisions are based on where players actually leave.

## Build procedure
1. Write the first-session steps on paper.
2. Choose one onboarding funnel.
3. Use stable event/step naming.
4. Log completion from authoritative server state where applicable.
5. Add custom fields only for questions you will use.
6. Annotate release date.
7. Review bounce and drop-off before acquiring more traffic.

## Evidence to collect
- before/after profiler screenshots or measurements when performance is involved;
- logs for rejected/failed actions;
- a short capture of the happy path;
- a note describing the worst failure discovered;
- exact build/device/server conditions.

## Test matrix
- [ ] first-time player.
- [ ] returning player.
- [ ] skipped tutorial.
- [ ] disconnect halfway.
- [ ] teleport to another place.

## Pass condition
Pass when each funnel step maps to a specific product decision instead of being telemetry collected “just because.”

## Failure review
If the lab fails, do not paper over it with waits, more particles, more retries or a giant refactor. Identify which layer owns the failure: state, timing, networking, data, physics, streaming, presentation, device input, or content. Fix the owner, then rerun the same test.

## Knowledge graph connections
**Primary cluster:** [[Analytics Discovery - Hub|Analytics Discovery]]

**Related:** [[Legendary Production Hub]]
