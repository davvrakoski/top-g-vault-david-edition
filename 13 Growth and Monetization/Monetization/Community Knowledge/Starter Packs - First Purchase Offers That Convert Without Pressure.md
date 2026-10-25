---
area: "13 Growth and Monetization"
cluster: "Monetization"
title: "Starter Packs - First Purchase Offers That Convert Without Pressure"
tags: [roblox, community-knowledge, monetization, starter-pack, bundles, conversion]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/game-design/monetization-foundations
  - https://create.roblox.com/docs/resources/feature-packages/bundles
  - https://create.roblox.com/docs/production/experiments
  - https://create.roblox.com/docs/production/analytics/economy-events
  - https://www.deconstructoroffun.com/blog/2024/4/8/free-to-play-starter-pack-pricing-when-conversion-is-king-we-may-price-too-low
  - https://mobilefreetoplay.com/free-to-play-monetization-making-the-first-purchase/
---
# Starter Packs - First Purchase Offers That Convert Without Pressure

The hardest purchase to get is the first one; after a player has bought once, buying again is far easier. Free-to-play games therefore use a **starter pack**: a one-time, clearly high-value bundle for new players. Roblox's monetization glossary defines it as an initial offer a new user sees within the first few minutes after joining, and Roblox's own **Bundles** feature package ships a ready-made timed starter offer.

## What goes in it

Good starter packs (pattern from F2P design writing, e.g. mobilefreetoplay.com):

- **Value that pays off through play**, not a currency dump. A permanent +1 pet slot, a better starting tool, a cosmetic, plus a modest currency amount. Giving a huge pile of currency can let a new payer "finish" early and leave.
- **Something visible** (cosmetic, aura, title) so the buyer feels it and others see it.
- **Clearly better value than the regular shop** (show the comparison: "Worth 1,200 Gems - 299 R$").
- **Only for new players**, one purchase per account.

## When and how to show it

- **Early, but after the first fun.** Roblox's definition says within the first few minutes. Show it after the first win (first hatch, first round, first zone) rather than on the loading screen of a brand new player, and never as a blocking popup on the first frame.
- **Timed availability:** the Bundles package's `RelativeTime` type exists for exactly this: "single-use starter pack offer that displays to all new players for 24 hours". It shows on the HUD and re-prompts in later sessions until bought or expired. Its `includeOfflineTime` option decides whether time offline counts; `singleUse` makes it never reappear.
- **One honest timer.** Fake countdowns that reset are a trust killer and look manipulative to parents.
- **Context:** Roblox's contextual-purchase guidance warns that big promo spaces need enough context for players to judge the item's value.

## Price

- Typical Roblox starter packs sit at the low end of your price ladder. Low price maximizes conversion, but analyst Julian Runge argues on Deconstructor of Fun that when conversion is the only goal, teams often **price starter packs too low**; test at least two prices.
- Roblox **Experiments** list "starter pack types, pricing" as a monetization test idea, so you can A/B test price and contents in-game.
- With managed/regional pricing on, the actual price varies by region; design the value, not a single number.

## Implementation notes

- Sell as a **developer product** (you must track one-time ownership yourself) or a **pass** if it's truly permanent; record `StarterPackBought = true` in the save inside your receipt handler.
- Log the grant with `AnalyticsService:LogEconomyEvent` using an IAP source (Roblox's economy events doc literally lists "starter pack" as an IAP example).
- If the pack contains random items (an egg), the paid random items odds rules apply.

## Metrics

- **Payer conversion** of new-player cohorts with vs without the pack.
- Second purchase rate of starter-pack buyers (the real goal).
- Refund/complaint rate and reviews mentioning "pay to win".

## Related
[[Monetization - Hub]] - [[Shop UX, Pricing and Player Trust]] - [[Purchase Fulfillment and Receipt Reliability]] - [[Community Monetization Guide - Price Ladders and Player Types]]
