---
area: "01 Start Here"
cluster: "Start Here"
title: "Your First Week of Analytics - Which Numbers to Read First"
tags: [roblox, community-knowledge, start-here, analytics, retention, metrics]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/analytics/get-started
  - https://create.roblox.com/docs/production/analytics/analytics-dashboard
  - https://create.roblox.com/docs/production/analytics/funnel-events
  - https://create.roblox.com/docs/production/analytics/custom-events
  - https://create.roblox.com/docs/production/analytics/retention
---
# Your First Week of Analytics - Which Numbers to Read First

After your first public release, the Creator Dashboard fills with charts and it is easy to stare at visits and feel nothing. A beginner needs just a few numbers and one funnel to learn the most important lesson: **where do new players leave, and why?** This note explains how to unlock the dashboard, the six numbers to read in week one, and how to add a five-step onboarding funnel with a few lines of server code.

## Unlocking the dashboard

- The full KPI dashboard is available once a game has **more than 10 daily active users and 10 play hours for 7 consecutive days**.
- The owner needs a verified email and 2-Step Verification, then agrees to the Terms of Use on the game's Overview page (or later via **Activate Analytics**).
- For group games, only the owner and roles with the right permission can view analytics.

## The six numbers for week one

| Metric | Plain meaning | What a bad value usually points to |
| --- | --- | --- |
| **DAU** | Players per day | Discovery / thumbnail / icon (not the game itself) |
| **Average session length** | How long a visit lasts | Not enough to do, or confusion early |
| **D1 retention** | Share of new players back the next day | Onboarding: unclear goal, early difficulty spike |
| **D7 retention** | Back a week later | Weak progression: no reason to return |
| **Conversion rate** | Share of players who spent anything | Offers unclear, too expensive, or nothing worth buying |
| **ARPDAU** | Average revenue per daily user | Overall monetisation health |

D30 and ARPPU (spend per paying user) matter later. The docs describe these as the headline engagement, retention and monetisation metrics.

Do not compare yourself to front-page games in week one. Compare **this week to last week** after each change.

## Build an onboarding funnel (15 minutes)

A funnel tells you what percentage of new players reach each step. Most games lose the majority of players in onboarding, which makes it the best first funnel.

Pick 4-6 steps every new player should pass, for example for an obby:
1. Spawned
2. Reached stage 1
3. Reached stage 3
4. Reached stage 5
5. Opened the shop

Log them from **server** Scripts, right **after** the player completes each step:

```lua
local AnalyticsService = game:GetService("AnalyticsService")

local function logOnboarding(player, step, name)
	AnalyticsService:LogOnboardingFunnelStepEvent(player, step, name)
end

-- in your checkpoint code:
logOnboarding(player, 2, "Reached Stage 1")
```

Rules from the docs: events are sent only from the **server** and only in **published** games (not from clients or Studio). Keep step names short and consistent.

For other moments, use custom events:

```lua
AnalyticsService:LogCustomEvent(player, "BossDefeated")
```

## Reading the funnel

- A big drop between two steps = look at exactly what happens there. Play it as a new player on a phone.
- Typical early culprits: a hard jump right after spawn, a menu covering the screen, no clear arrow or goal, a loading screen that is too long.
- Fix one thing, release, wait a few days, compare. Change one variable at a time.

## Other dashboard pages worth a look

| Page | Use |
| --- | --- |
| **Acquisition** | Where players come from (home recommendations, search, friends, ads) |
| **Demographics** | Age, country, language: decide what to localise |
| **Feedback** | Ratings and comments |
| **Error Report / Performance** | Script errors and crashes from live servers |

## Pitfalls

- Reading percentages from tiny samples: 3 of 5 players is not "60% retention". Wait for numbers in the hundreds.
- Logging events from LocalScripts: nothing arrives.
- Renaming funnel steps every update: charts become impossible to compare.

## Related
[[00 START HERE - Top G Vault]] · [[Analytics Instrumentation Plan]] · [[First 10 Minutes Retention Design]] · [[Tutorial, Onboarding and FTUE]] · [[30 Official Roblox Docs/Production/Analytics/Get started with analytics|Get started with analytics (official)]]
