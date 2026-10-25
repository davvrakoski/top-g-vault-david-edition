---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Regional Rules - Belgium, Brazil, Korea and Country Blocks"
tags: [roblox, community-knowledge, publishing, policy, regions, loot-boxes, compliance]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/promotion/regional-content-availability
  - https://en.help.roblox.com/hc/en-us/articles/48706630819476-Brazil-Digital-ECA-Updates
  - https://en.help.roblox.com/hc/en-us/articles/47965190783892-Promoting-Items-to-Younger-Audiences
  - https://create.roblox.com/docs/production/promotion/content-maturity
  - https://en.help.roblox.com/hc/en-us/articles/14663412502676-Roblox-is-Updating-our-Terms-of-Use
---
# Regional Rules - Belgium, Brazil, Korea and Country Blocks

> Not legal advice. Compiled from Roblox Help Center and Creator Hub pages checked 2026-10-25. Roblox does not publish a complete per-country rule list for developers; it exposes the result through PolicyService instead. Only the examples below are confirmed on official pages.

A Roblox game is global from day one, so local laws on loot boxes, child safety and consumer rights reach your game whether you planned for them or not. Roblox handles most of this by restricting features per player and, when needed, blocking whole games or items in a country. Your job is to wire up the tools so restrictions remove a feature rather than your game.

## Confirmed regional rules (official pages)

| Region | Rule | Source |
| --- | --- | --- |
| Belgium | No paid random items for users in Belgium (given as the example of `ArePaidRandomItemsRestricted`) | Help Center "Promoting Items to Younger Audiences" |
| Brazil | Under-18 users cannot access paid random items; access needs an 18+ age check. Games that declare paid random items without using PolicyService are not playable by under-18s in Brazil. Extra parental controls, sleep-time "do not disturb" defaults, and an ECA rights-violation report form. | Help Center "Brazil Digital ECA Updates" |
| South Korea, Saudi Arabia, Türkiye | Games with a **Restricted** (18+) label are unplayable for players located in, or who created accounts in, these countries (the page says "such as", so the list may be longer) | Creator Hub "Content maturity and compliance" |
| South Korea | New Terms appendix: 7-day withdrawal right on unused items; minors' purchases can be cancelled without guardian consent | Terms of Use update (effective 2026-11-01) |
| EEA | Consumer right of withdrawal added in the new Terms; 6 months to appeal moderation; out-of-court dispute bodies under the DSA | Terms update; Appeals help article |
| UK, Australia | Online Safety Act report forms for illegal or harmful content | Help Center reporting and appeals articles |
| China | Separate Luobu/Tencent publishing path; `IsSubjectToChinaPolicies` flag | Terms of Use Appendix (China), PolicyService |

Other countries may restrict paid random items or trading (unverified which ones; Roblox does not list them). That is exactly why the API exists.

## Country-level content blocks

Roblox may receive legal requests to restrict a type of content, or a specific game or avatar item, in one country. When that happens:

- **Games** become undiscoverable and unplayable in that country.
- **Avatar items** are hidden and taken off sale there.
- Everything else, including analytics in other regions, carries on. Restrictions can also be lifted later.

You usually cannot appeal a legal country block the way you appeal moderation; design so a block costs you one market, not the whole game.

## What to build so regions do not break you

1. Read `PolicyService:GetPolicyInfoForPlayerAsync` per player on join; never decide restrictions by country code yourself.
2. Provide a **non-random alternative** (direct purchase or earnable path) for every lootbox. Restricted players then still have a full game.
3. Keep trading gated on `IsPaidItemTradingAllowed` for both traders.
4. Avoid the Restricted label unless 18+ content is the point of the game; it removes whole countries.
5. Expect refund reversals from EEA and Korea; make your receipt handling idempotent and able to revoke.
6. Localise disclosures (odds, "unavailable in your region") with LocalizationService tables.

## Using location data

`LocalizationService:GetCountryRegionForPlayerAsync` returns a country code from IP geolocation. Use it for language, currency display or analytics, **not** as a substitute for PolicyService compliance flags.

## Related
[[Publishing Release - Hub]] · [[Policy - PolicyService Compliance - Loot Boxes, Trading, Ads and Regions]] · [[Managed Pricing, Price Tests and Regional Pricing]] · [[Regional Content Availability]]
