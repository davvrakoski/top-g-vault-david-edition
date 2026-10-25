---
area: "13 Growth and Monetization"
cluster: "LiveOps Social"
title: "Season Pass Tier Pacing - XP per Tier and Mission Budget Math"
tags: [roblox, community-knowledge, liveops, season-pass, battle-pass, missions, balancing]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/game-design/season-pass-design
  - https://create.roblox.com/docs/resources/feature-packages/season-passes
  - https://create.roblox.com/docs/resources/feature-packages/missions
  - https://create.roblox.com/docs/production/monetization/passes
---
# Season Pass Tier Pacing - XP per Tier and Mission Budget Math

Roblox's season pass design guide gives the shape (start with about **one month** per season, about **ten tiers**, a **one-week rest** between seasons, claim-button rewards, a free and a premium track, retroactive premium rewards on mid-season upgrade). It leaves the numbers to you. This note turns that shape into a budget you can calculate in a spreadsheet so the final tier is reachable by your target players, not just by no-lifers.

## Step 1: decide who should finish

Pick a target player, e.g. "plays 4 days a week, 30 minutes a day". Over a 28-day season that is **16 play days, 480 minutes**.

Decide the finish rate you want for that player: e.g. reach the final free tier on day ~24 if they do all dailies, leaving slack for missed days.

## Step 2: XP budget from missions

Season XP comes from missions (Roblox's guide and Missions package frame it this way) plus optional playtime XP.

```
Daily missions:   3 per day x 100 XP  = 300 XP/day
Weekly missions:  5 per week x 400 XP = 2,000 XP/week
Playtime XP:      2 XP per minute (cap 60 XP/day)
```

Target player over 28 days:
- Dailies: 16 days x 300 = 4,800
- Weeklies (assume they finish 3 of 5 per week): 4 x 3 x 400 = 4,800
- Playtime: 16 x 60 = 960
- **Total ~ 10,560 XP**

## Step 3: spread across tiers

With 10 tiers and ~10,000 XP for the target, use a gentle ramp so early tiers come fast:

| Tier | XP to reach | Cumulative |
|---|---|---|
| 1 | 300 | 300 |
| 2 | 500 | 800 |
| 3 | 700 | 1,500 |
| 4 | 800 | 2,300 |
| 5 | 1,000 | 3,300 |
| 6 | 1,100 | 4,400 |
| 7 | 1,200 | 5,600 |
| 8 | 1,300 | 6,900 |
| 9 | 1,400 | 8,300 |
| 10 | 1,500 | 9,800 |

Tier 1 lands in the first session (one or two dailies). The final tier lands at ~93% of the target player's budget.

## Step 4: premium track value

- Premium adds rewards on the same tiers and optionally premium-only missions (Roblox: free pass holders should not complete premium missions or earn premium rewards).
- Price the pass against what it contains; Roblox's guide asks you to price according to reward value.
- **Retroactive rewards** on mid-season purchase, and **auto-grant unclaimed rewards** at season end (both recommended in the guide).

## Step 5: guardrails

- Don't let a paid XP boost alone finish the pass in a week; it devalues the final reward for everyone.
- Final reward: a brand-new asset, shown in 3D, retired after the season (Roblox's guidance) - but keep it cosmetic if your game has competitive play.
- Track tier reached per player with progression or custom events; if under ~20% of season-active players reach tier 10, the curve is too steep for your real audience (target is yours to set).

## Quick spreadsheet columns

`tier, xpNeeded, cumulative, dayReachedByTarget, freeReward, premiumReward, rewardValueSoft`

Fill `dayReachedByTarget = cumulative / dailyXpOfTarget` and look for gaps of more than ~4 days between tiers.

## Related
[[LiveOps Social - Hub]] - [[LiveOps Calendar and Update Cadence Planner]] - [[XP Curve Formulas - Time-to-Level Targets and Level Caps]] - [[Daily Quest Rotation - Deterministic Seeds and Fair Resets]]
