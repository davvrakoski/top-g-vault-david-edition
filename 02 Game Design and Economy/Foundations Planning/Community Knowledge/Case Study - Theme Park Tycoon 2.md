---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
title: "Case Study - Theme Park Tycoon 2"
tags: [roblox, community-knowledge, case-study, tycoon, building, sandbox]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.roblox.com/games/69184822/Theme-Park-Tycoon-2
  - https://en.wikipedia.org/wiki/List_of_Roblox_games
---
# Case Study - Theme Park Tycoon 2

Theme Park Tycoon 2 (Den_S, solo developer) is a freeform park builder in the RollerCoaster Tycoon tradition: build rides and custom coasters, place paths and scenery, keep guests happy and clean, and grow income. It matters because it is the opposite of a "button tycoon": it is a real creative builder that has lasted since 2012, and its passes sell building freedom, not money.

## Snapshot (Roblox page, seen 2026-10-25)
| Metric | Value |
|---|---|
| Visits | 1.63 billion |
| Playing | ~5.1k |
| Favorites | 6.1 million |
| Likes | ~89% of 2.3M votes |
| Server size | 6 |
| Created / updated | 2012-01-02 / 2026-08-31 |

Compared to RollerCoaster Tycoon; has global leaderboards for revenue and guest counts, and missions (Wikipedia list).

## Core loop
1. Start with an empty plot and a budget.
2. Build rides, stalls and paths; design your own coasters.
3. Guests arrive and pay; manage sanitation and amenities.
4. Income buys more rides and scenery; expand the park.
5. Visit friends' parks; climb leaderboards; do missions.

## Session shape
Long creative sessions; the park persists, so players return to continue projects. Small servers (6 plots) suit building with friends.

## Progression and economy
- Money from guests is the main gate; rides cost more as they get bigger.
- Park rating and guest satisfaction systems (sanitation is mentioned by Wikipedia).
- Leaderboards give competitive builders a target.

## Monetization (store page, 2026-10-25)
Five passes, all builder freedom: Increased Height Limit (74), Enable Ride Operations (90), Extra Colors (90), Disable Collisions (270, overlap items for detailed builds), 24 Extra Expansion Plots (374). Each removes a building constraint. Several pass texts tell you to rejoin after buying outside the game, a small UX cost of passes checked only on join.

## Social hooks
- Showcasing parks to visitors; friends can build together on one plot (the page says "together with your friends").
- Leaderboards for revenue and guests.

## Update cadence
Slow and steady; updated 2026-08-31. A builder game can go months between updates because players make their own content.

## Why it grew
- Brought a beloved PC genre to Roblox with real coaster design tools.
- Creative ceiling: the best parks are shared in videos and screenshots.
- Fair monetization (constraints, not cash) keeps the audience loyal.

## Lessons you can copy
1. **Sell constraint removal in builders.** Height, collisions, colors and plot size are the levers creative players pay for.
2. **Players are your content.** A good building tool makes updates less urgent.
3. **Add leaderboards for builders.** Revenue or guest rankings give a sandbox competitive goals.
4. **Check passes live, not only on join.** Use `MarketplaceService.PromptGamePassPurchaseFinished` to grant passes bought mid-session so players need not rejoin.
5. **Persist the creation.** Saving the park is what makes players return to a long project.

## Related
[[Foundations Planning - Hub]] - [[Case Study - Patterns Across Hit Roblox Games]] - [[Tycoon Genre Breakdown - Droppers, Button Ladders and Pacing]] - [[Case Study - Lumber Tycoon 2]]
