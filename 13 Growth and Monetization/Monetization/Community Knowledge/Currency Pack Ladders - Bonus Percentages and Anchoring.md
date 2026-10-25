---
area: "13 Growth and Monetization"
cluster: "Monetization"
title: "Currency Pack Ladders - Bonus Percentages and Anchoring"
tags: [roblox, community-knowledge, monetization, pricing, developer-products, currency]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://adriancrook.com/5-psychological-pricing-tactics-for-freemium-games/
  - https://developers.meta.com/horizon/resources/monetization-tips-framework/
  - https://wnhub.io/news/monetization/item-8145
  - https://create.roblox.com/docs/production/monetization/developer-products
  - https://create.roblox.com/docs/production/monetization/price-optimization
  - https://create.roblox.com/docs/production/monetization/regional-pricing
---
# Currency Pack Ladders - Bonus Percentages and Anchoring

Most Roblox games sell their premium currency (Gems, Diamonds, Tokens) as 4-6 developer products. How those packs are priced and labeled changes what players buy far more than the exact amounts. Mobile free-to-play stores have refined this "ladder" for years; the patterns below come from practitioner write-ups (Adrian Crook, Meta's monetization framework) adapted to Robux.

## Anatomy of a ladder

| Pack | Price (R$) | Gems | Bonus vs base rate | Label |
|---|---|---|---|---|
| Handful | 49 | 100 | base (2.04 gems/R$) | |
| Pouch | 99 | 220 | +9% | |
| Bag | 249 | 600 | +18% | **Most popular** |
| Chest | 499 | 1,300 | +27% | |
| Vault | 999 | 2,800 | +37% | **Best value** |

(Example numbers; tune your own.) Principles:

1. **Value improves as price rises** (Crook and others describe a ladder where each step is proportionally better). Show the bonus as "+18% bonus", not as a hidden ratio.
2. **Anchor with the top.** Crook describes showing the highest-priced pack first or most prominently so it sets the reference; the mid pack then feels moderate.
3. **A "Most popular" middle option** directs undecided players. A decoy works when the step next to it is clearly better value.
4. **Few, distinct steps.** Mobile data summarized by WN Hub found many games use a common five-step ladder and only tweak one point. Five or six packs are enough.
5. **Low, mid and high bands.** Meta's framework groups prices into low/medium/high, noting that high tiers are mostly bought by players who already made smaller purchases. Don't expect a new player's first buy to be the top pack.

## Make the gems worth something

A ladder only works if players can see what the currency buys. Price the shop so that:

- The cheapest useful item costs a bit more than the smallest pack (players buy the next pack up, then have leftovers that bring them back).
- Popular items map to pack sizes ("a Legendary egg = 500 gems").
- Earnable gems exist (daily rewards, quests) so free players engage with the same economy.

## Roblox specifics

- Currency packs are **developer products** (repeatable), fulfilled through the receipt handler. Grant exactly once per receipt.
- **Managed / regional pricing** can lower the Robux price in some regions (never more than 70% off and never above your default). Your gem amounts stay the same, so the effective value differs by region; protect trades and gifts with `GetUsersPriceLevelsAsync` if gems or items can move between players.
- Roblox's **price optimization** tool can test prices for you; run one change at a time.
- If gems can buy random items, the odds disclosure rules apply to everything those gems open.

## Ethics and trust

- Don't hide the gem-per-Robux rate behind odd numbers to confuse young players.
- Avoid "fake discounts" (a permanent "-50%" badge); it erodes trust, and Roblox's video-thumbnail rules already ban sale claims in that surface.

## Related
[[Monetization - Hub]] - [[Managed Pricing, Price Tests and Regional Pricing]] - [[Shop UX, Pricing and Player Trust]] - [[Game Pass Pricing Debates - Low vs High]]
