---
area: "13 Growth and Monetization"
cluster: "Analytics Discovery"
title: "Retention Cohorts - Reading D1, D7, D30 and What Benchmarks Mean"
tags: [roblox, community-knowledge, analytics, retention, cohorts, benchmarks]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/analytics/retention
  - https://create.roblox.com/docs/production/analytics/funnel-events
  - https://gamedevreports.substack.com/p/gameanalytics-mobile-gaming-benchmarks
  - https://gamedevreports.substack.com/p/gameanalytics-benchmarks-in-mobile
  - https://create.roblox.com/docs/production/recommendation
---
# Retention Cohorts - Reading D1, D7, D30 and What Benchmarks Mean

Retention is the metric that decides whether a Roblox game grows: recommendations reward games players come back to, and every ad Robux is wasted if players leave after one session. But a single "D1 = 18%" number tells you almost nothing until you read it as a **cohort** and compare like with like. This note explains how to read the Retention dashboard and how to use public benchmarks without fooling yourself.

## Definitions that trip people up

- **Cohort:** all players whose first play happened on the same day (or week).
- **Classic D1 retention:** share of a cohort that played again exactly on day 1 after their first day. D7 = on day 7, D30 = on day 30. (Rolling retention, "on day N or later", gives higher numbers; don't mix them.)
- **New vs returning:** Roblox's Retention dashboard focuses on new-user cohorts; always check which population a chart shows.

## How to read a cohort table

1. **Look across, then down.** Across a row = how one cohort decays. Down a column = whether D1 is improving week by week (your updates working).
2. **Compare cohorts by source.** Players from ads, from Recommended For You, from a YouTuber and from search behave differently. A drop in D1 right after a sponsored campaign is often a traffic-mix change, not a broken game; Roblox's own retention doc calls a dip after a large influx of new users "typical and temporary". The dashboard offers daily cohorts (first 10 days) and weekly cohorts (10 weeks, Monday-Sunday).
3. **Find the cliff.** If D1 is fine but D7 collapses, the first-week content runs out. If D1 itself is low, the first session (FTUE) fails: use funnel events to find the step.
4. **Use weekly averages.** Daily cohorts are noisy for small games; under a few hundred new players a day, wait for a week of data.

## Benchmarks: use with care

Public numbers come mostly from mobile analytics (GameAnalytics). Secondary coverage of their 2025 report (2024 data, ~11,600 games) gives roughly:

| Metric | Top 25% | Median-ish | Bottom 25% |
|---|---|---|---|
| D1 | ~26-28% | low 20s (Q1 2024 median ~23%) | ~10-11% |
| D7 | ~7-8% | ~3.4-3.9% | ~1.5% |
| D28 | under 3% for 75% of games | | |

Caveats: these are mobile app-store games, classic retention, and vary by genre, region and platform (iOS higher than Android). Roblox players start a game with one tap from Home, so D1 for Roblox games can look different; your own trend matters more than the benchmark.

## What to do with each pattern

| Pattern | Likely cause | First fix |
|---|---|---|
| Low D1 (<~15%) | first 5 minutes unclear or slow | FTUE funnel, faster first reward |
| OK D1, low D7 | no mid-term goal | daily quests, next-zone goals, streak |
| OK D7, low D30 | content runs out | LiveOps cadence, prestige, social systems |
| D1 dropped after update | regression | compare by cohort date, roll back if needed |

## Instrumentation tips

- Log onboarding steps with `AnalyticsService:LogOnboardingFunnelStepEvent` so D1 problems can be traced to a step.
- Tag acquisition source (share link, event join data, ads) in a custom field to segment cohorts.
- Annotate update dates on your charts (alerts and annotations exist in Creator Analytics) to link changes to versions.

## Related
[[Analytics Discovery - Hub]] - [[First 10 Minutes Retention Design]] - [[Core Loop and Session Design for D1 and D7 Retention]] - [[Unit Economics - ARPDAU, Payer Conversion, LTV and Ad Payback]]
