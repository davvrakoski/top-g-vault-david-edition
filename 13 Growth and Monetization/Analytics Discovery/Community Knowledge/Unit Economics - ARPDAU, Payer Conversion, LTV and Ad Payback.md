---
area: "13 Growth and Monetization"
cluster: "Analytics Discovery"
title: "Unit Economics - ARPDAU, Payer Conversion, LTV and Ad Payback"
tags: [roblox, community-knowledge, analytics, monetization, ads, ltv, arpdau]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/analytics/monetization
  - https://create.roblox.com/docs/production/promotion/ads-manager
  - https://create.roblox.com/docs/production/monetization/developer-exchange
  - https://create.roblox.com/docs/production/analytics/retention
  - https://gamedevreports.substack.com/p/gameanalytics-mobile-gaming-benchmarks
---
# Unit Economics - ARPDAU, Payer Conversion, LTV and Ad Payback

"Should I spend 50,000 Robux on ads?" can only be answered with unit economics: how much one new player is worth versus what it costs to get them. Roblox's Creator Analytics gives the raw metrics; this note shows how to combine them into a decision you can make on a napkin.

## The metrics Roblox shows

From the Monetization analytics page:

- **Payer conversion** - share of users who pay.
- **ARPPU** - average revenue per paying user.
- **ARPDAU** - average revenue per daily active user; Roblox notes it combines payer conversion and ARPPU (roughly ARPDAU = conversion x ARPPU per day).
- Roblox's own warning: high ARPPU with low ARPDAU means revenue relies on a small group of spenders.

From Ads Manager reporting: **Spent**, **Impressions**, **Clicks**, **Plays**, **CPP (cost per play)** = spend / plays, **Playtime**, and **Earnings** attributed to the campaign (includes in-game purchases, ad revenue and Creator Rewards; excludes subscriptions).

## Estimating LTV (lifetime value) of a new player

A simple, honest estimate:

```
LTV ~= ARPDAU x (expected active days per new player)
expected active days ~= 1 + D1 + D2 + ... + D30   (sum of retention curve)
```

Example with made-up numbers: ARPDAU 0.8 Robux, retention D1 25%, D7 8%, D30 2%. Summing a smooth curve through those points gives roughly 3 active days in the first month, so LTV30 ~= 0.8 x 3 = 2.4 Robux per new player. Read your own retention table from the Retention dashboard rather than guessing; the curve's tail matters.

Convert to money with DevEx: the standard rate is 0.0038 USD per earned Robux (since 5 Sept 2025; older balances cash out at 0.0035). LTV in Robux x 0.0038 = USD per player.

## Ad payback check

```
payback ratio = (LTV per play) / CPP
```

- Ratio above 1 within your window (e.g. 30 days) -> ads can pay for themselves.
- Below 1 -> ads are marketing spend, not investment. They may still be worth it to seed a launch or to reach Recommended For You, which Roblox's Ads Manager doc mentions as a use of the **Plays** goal.

Remember that a "play" from an ad is often a lower-intent user than an organic one; compare cohorts.

## Which lever to pull

| Symptom | Lever |
|---|---|
| Low D1 (well under ~20-25%) | Fix FTUE before buying any traffic |
| OK retention, low conversion | Starter pack, cheaper first purchase, better shop placement |
| OK conversion, low ARPPU | More things worth buying for repeat payers (consumables, cosmetics) |
| High CPP | Thumbnail/creative CTR, targeting, or a better-fit audience |

For context, GameAnalytics' 2025 mobile benchmarks (2024 data, secondary coverage) put top-quartile D1 around 26-28% and median D7 around 3-4%. Roblox audiences differ from mobile app stores, so use these as a sanity range, not a target.

## Pitfalls

- Using total revenue / total users across all time (mixes old whales with new players).
- Ignoring Creator Rewards in LTV: engagement by Active Spenders also earns Robux.
- Judging a campaign in its first 24 hours: Ads Manager labels that period **Learning**.

## Related
[[Analytics Discovery - Hub]] - [[Monetization Analytics and Segmentation]] - [[Analytics and Discovery Operating System]] - [[Is Sponsoring Still Worth It - CTR Reality Check]]
