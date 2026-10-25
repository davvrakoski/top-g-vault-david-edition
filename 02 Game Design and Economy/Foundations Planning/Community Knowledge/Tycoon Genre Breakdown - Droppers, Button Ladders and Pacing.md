---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
title: "Tycoon Genre Breakdown - Droppers, Button Ladders and Pacing"
tags: [roblox, community-knowledge, genre, tycoon, economy, pacing]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/experience-genres
  - https://create.roblox.com/docs/production/game-design/core-loops
  - https://www.gamedeveloper.com/design/the-math-of-idle-games-part-i
  - https://create.roblox.com/docs/production/analytics/funnel-events
---
# Tycoon Genre Breakdown - Droppers, Button Ladders and Pacing

Roblox describes the Tycoon subgenre (under Simulation) as games simulating the management of a business or base, often collecting money from "droppers" to upgrade the base. The classic Roblox tycoon is a **linear build list**: step on a button, pay, a piece of your base appears, income goes up, next button. It is one of the easiest genres to build and one of the easiest to pace badly.

## Loop

```
Droppers make parts -> conveyor -> collector adds cash -> buy next button
          ^                                                    |
          |---------------- more droppers / upgraders <--------|
                     (walls, decor, weapons, floors)
```

Two kinds of buttons:

- **Income buttons:** droppers, upgraders (multiply part value on the conveyor), faster conveyors.
- **Content buttons:** walls, floors, vehicles, weapons, NPCs, a second floor. These cost money but don't earn; they are what players screenshot and show friends.

## The button ladder

Treat the build list as a spreadsheet with one row per button: cost, income added, cumulative income/sec, seconds to afford. Rules that keep it smooth:

1. **Seconds-to-afford should stay in a band** (e.g. 15-90 s early, 1-4 min mid). Big jumps mean players stand on an empty plot doing nothing.
2. **Alternate income and content buttons** so the base visibly grows between income bumps.
3. **Branching after the first ~10 buttons.** Two or three buttons visible at once (cheap/expensive, income/content) turns waiting into choosing.
4. **Signpost the next big goal** (a giant locked second floor, a helicopter pad) from the first minute.
5. **End state.** A completed tycoon needs a rebirth ("sell your company, keep a multiplier") or a second plot type; otherwise players leave at 100%.

Cost growth can be exponential like idle games (each button ~1.1-1.3x the previous) with droppers adding linear income; upgraders act as the multipliers that catch income up.

## Multiplayer and plots

- Plot claim on join, release on leave; save progress per player, not per plot (see the tycoon plot layout note).
- PvP tycoons add walls/doors only owners pass, weapons, and raid incentives; decide early, because it changes everything (base defense, griefing reports).
- Show other players' progress: a rich neighbor's mansion is motivation.

## Performance

Dropper parts are the classic lag source. Use pooled parts or no physics at all (move a value along the conveyor in code and render a cheap visual), cap parts per plot, and despawn on collect.

## Monetization patterns

- 2x cash pass, auto-collect, VIP droppers, skip-button products ("Buy this button for R$").
- Keep skips modest; skipping the build *is* skipping the game.

## Analytics

Log a funnel step per key button (e.g. button 1, 5, 10, 20, first floor, rebirth). The step with the biggest drop shows exactly where pacing breaks.

## Related
[[Foundations Planning - Hub]] - [[Simulator Tycoon Starter Architecture]] - [[Tycoon Plot Layout and Plot Assignment]] - [[Tycoon Starters - Factorial Defense and Industry Tycoon (MIT)]]
