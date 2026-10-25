---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Roblox Device Share Stats and What They Mean for Design (dated)"
tags: [roblox, community-knowledge, ui, platform, statistics, mobile, console, market]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.sec.gov/Archives/edgar/data/1315098/000131509825000033/rblx-20241231.htm
  - https://www.pocketgamer.biz/80-of-roblox-users-are-on-mobile-contributing-46-of-robux-revenue/
  - https://www.sec.gov/Archives/edgar/data/1315098/000131509825000326/ex991-q32025shareholderl.htm
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://create.roblox.com/docs/input/mobile
  - https://create.roblox.com/docs/production/publishing/console-guidelines
  - https://create.roblox.com/docs/production/analytics/performance
  - https://create.roblox.com/docs/production/analytics/analytics-dashboard
---
# Platform - Roblox Device Share Stats and What They Mean for Design (dated)

"Design for mobile first" is repeated so often that it is worth seeing the actual numbers, with dates and how solid each one is. Platform shares shift every year (consoles and new regions grow), so every figure below carries its period and source. Re-check them yearly; your own game's split, from the Performance Dashboard, beats any platform average.

## The numbers

| Figure | Value | Period | Source and confidence |
|---|---|---|---|
| Average daily active users | **82.9 M** | FY2024 average | Roblox 10-K for 2024 (primary) |
| DAU share by device | **Mobile ~80%, PC ~17%, Console ~3%** | FY2024 | PocketGamer.biz (April 23, 2025) citing the annual report. In the 10-K itself the split is in a chart image our tools could not read, so we confirmed it only via the secondary source |
| Revenue from Robux sold via Apple App Store | **30%** | FY2024 | 10-K text (primary) |
| Revenue from Robux sold via Google Play | **16%** | FY2024 | 10-K text (primary) |
| Average DAUs | **151.5 M (up 70% YoY)** | Q3 2025 | Q3 2025 shareholder letter, SEC 8-K exhibit (primary). No device split given |
| Hours engaged | **39.6 B (up 91% YoY)** | Q3 2025 | same letter |
| Android share of a typical game's players | **~65%** | doc checked 2026-10-25 | Creator Docs, *Test on hardware* |
| RAM of those Android devices | **~60% 2-4 GB, ~35% 4-8 GB, ~5% >8 GB** | doc checked 2026-10-25 | same |
| Devices scoring 10,000-20,000 on Passmark | **over 50% of players** | doc checked 2026-10-25 | same |
| "Majority of Roblox sessions are played on mobile devices" | qualitative | doc checked 2026-10-25 | Creator Docs, *Mobile input* |
| Console audience pitch | "200M+ Xbox and PlayStation players" | doc checked 2026-10-25 | Console guidelines. This describes the console platforms' reach, not Roblox's console DAU |

Not verified: secondary blogs claim console's share of activity rose sharply in 2025; we found no primary Roblox figure for that, so treat it as unverified.

## Reading the numbers correctly
- **Players vs money:** mobile was about 80% of DAU, but app-store Robux sales were 46% of revenue in 2024. The rest comes through other channels (desktop purchases, gift cards and so on). Mobile players matter most for reach and retention; PC and console players can matter more per head for revenue in some genres. Check your own game's payer split before cutting PC or console features.
- **Hardware reality:** most players are on modest Android phones with 2-4 GB RAM. That sets your memory and FPS budget (see [[Platform - Memory Limits on Low-End Phones - Budgets and Crash Avoidance]]).
- **Console is small but distinct:** about 3% of DAU (2024) is still millions of players, and a console-friendly UI usually also fixes gamepad play on PC and tablets.
- **Genre and region vary:** the hardware guide notes device demographics differ by country, age group and genre. A competitive shooter skews PC; a kids' roleplay game skews tablets and phones.

## Your own numbers
- **Performance Dashboard** (Creator Hub > Creations > your game > Monitoring > Performance): frame rate, memory and crash counts by device type, with Roblox update markers per platform.
- **Analytics breakdowns:** the analytics dashboard docs list a **Platform** breakdown with the values computer, phone, tablet, console and VR (users on several devices can be counted more than once). Compare retention between phone and computer; a big gap usually means a mobile UX problem, not "mobile players are worse".
- Revisit after major updates: a new feature that only works with a mouse shows up as a phone-only retention drop.

## Design consequences (summary)
1. Lay out for a small phone first; scale up.
2. Budget memory for a 2-4 GB Android device.
3. Every feature must have a touch path; then gamepad; then keyboard extras.
4. Do not ignore PC and console spenders: shortcuts, glyphs and readable 10-foot UI are cheap once the input layer is clean.
5. Date every stat you put in a design doc.

## Related
[[UI UX - Hub]] · [[Roblox 2026 Platform Snapshot]] · [[Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory]] · [[Platform - Touch Target Sizes and Mobile-First HUD Layout]]
