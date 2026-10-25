---
area: "40 Community Resources"
cluster: "Reddit Game Design and Growth"
source_note: "community/reddit-growth/fantasy-forest-launch-postmortem"
title: "Fantasy Forest Launch Postmortem - 0 to 2000 CCU in 4 Weeks"
tags: [roblox, community, reddit, "cluster/reddit-game-design-and-growth"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/from-0-to-2000-players-in-4-weeks-fantasy-forest-launch-post-mortem/2044257
cssclasses: [tg-a40]
---

# Fantasy Forest Launch Postmortem - 0 to 2000 CCU in 4 Weeks

> **Source:** Roblox DevForum postmortem by **FriendlyStoneGolem** (solo dev), 5 Nov 2022. Anecdotal; all numbers are as the poster stated them. (Reddit blocks automated access, so this cluster uses DevForum community threads.)

## The setup
- Solo developer. Earlier game *Dragon Blade* took over a year and briefly hit the PC front page; a farming sim built in ~5 months got no traction even with ads.
- Inspired by the RDC talk "Finding Success Through Rapid Iteration" (Wacky Wizards team): ship a prototype fast, let data decide.
- *Fantasy Forest* (animal roleplay) reused animal assets bought for the earlier game. Work started 23 Sep, first public release 7 Oct: about **2 weeks** of dev.
  - Week 1: experiments (flying, customization). Week 2: polish and more animals.

## Launch timeline (as reported)
| Phase | What the dev did | Result |
|---|---|---|
| Launch week | ~20k Robux ads on day 1, then 5k/day for 5 days (~40k total) | CCU stayed under 100 (around 40 early) |
| Week 2 | Stopped ads; shipped content (more animals, a decoration mode) aimed at session time | Avg session rose from ~9 to ~13 min over weeks 2-4 |
| Growth | No paid push | 500 CCU (22 Oct), 1k (29 Oct), 2k (5 Nov) |

- Early D1 retention already looked like a "Top 200" game in the Analytics dashboard; session time was the weak metric, so that is what the updates targeted.
- Weekend bumps in new players per hour came from engagement signals, not ads.

## Benchmarks the dev recommends
- D1 retention of at least **15%**.
- Initial average session of **8-9 minutes**.

## What worked / what failed
- Worked: tiny scope, fast release, reading D1 and session time per feature, putting effort into content once the metrics showed promise.
- Failed: ads as the growth engine. In the poster's words, ads alone no longer bring a significant number of users.

## Takeaways
- Ship a small, testable version in weeks, not a year; use ads only to buy a data sample.
- Pick ONE weak metric (here session time) and point every update at it.
- If D1 is good and session time climbs, the recommendation system can carry the game without more ad spend.
- Reuse owned assets to make cheap prototypes.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Game Design and Growth - Hub]]

**Related notes:** [[Core Loop and Session Design for D1 and D7 Retention]] · [[Discovery, Retention and Analytics]] · [[Home Recommendations - What Roblox Documents About Discovery]] · [[Turning a Weak Launch Around - The Honeymoon Window]]

<!-- TDOD_GRAPH_END -->
