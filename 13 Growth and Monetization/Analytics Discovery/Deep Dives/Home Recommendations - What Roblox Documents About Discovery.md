---
area: "13 Growth and Monetization"
cluster: "Analytics Discovery"
tags: [deep-dive, roblox, discovery, recommendations, algorithm, analytics]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Home Recommendations - What Roblox Documents About Discovery

## Why this matters
"The algorithm" is the most mythologized topic in Roblox development, and most advice about it is guesswork. Roblox has published a fairly detailed description of how Home's **Recommended For You (RFY)** works: which signals matter most, which players count, and what limits exposure.
This note sticks to what is documented, marks what isn't, and turns it into a weekly diagnostic routine, so you spend effort where Roblox says it counts.

> [!warning] Scope
> Everything below is from Creator Docs › *Discovery* and *Discovery FAQ* as of the verified date. Roblox states it will keep adding, removing and re-weighting signals. **Signal weights, thresholds and formulas are not published.** Anyone quoting exact numbers is guessing.

---

## 1. How RFY decides (documented)

**Two stages:**
1. **Retrieval:** selects a subset of games each user might enjoy, based on signals such as engagement, retention and monetization. The FAQ says retrieval needs only a "very low minimum number of plays from any source".
2. **Ranking:** orders the most relevant games for that user. The pre-ranking list is per user, narrowing down to **roughly 100 games** shown on their Home page.

**Who counts:** every ranking signal is computed from users who **organically joined from the RFY sort on Home**. Users first acquired through ads, curation, friends, search, social media or anything else are **not counted** in ranking, even if they later return via Home.

**Explore and expand:** Roblox tests a game with new user cohorts (explore). If that cohort engages and monetizes well, it shows the game to more similar cohorts (expand). After a content update you may see an exploration spike.

**Per-user averages, not totals:** signals are averages per user, so a small game with highly engaged players isn't disadvantaged by size.

**No permanent penalty:** signals use a **moving window**. A game that underperformed can fix onboarding and get re-tested; the algorithm "tests your game daily".

**New games** don't wait 28 days. Signals arrive in stages: first-session (play-through and bounce) → Day 1 → Day 2–7 → Day 8–28.

---

## 2. The published signals

| Priority | Signal | Time segments | What it really asks |
|---|---|---|---|
| **Most important** | **Play-through rate (PTR):** users who play after seeing your tile | n/a | Do your icon, thumbnail and title make the *right* players click? |
| | **First play bounce rate** (negative signal) | < 60 s; 61–180 s | Does the first three minutes hold them? |
| | **Play days per user** | Day 1; Day 2–7; Day 8–28 | Do they come back on separate days? |
| | **Playtime per user** (capped at **60 min per user, per game, per day**) | Day 1; Day 2–7; Day 8–28 | Do sessions have depth? |
| **Important** | **Intentional co-play days per user** (joins, invites, private servers with friends) | segmented | Is it fun with friends? |
| | **Qualified play sessions per user** (filters accidental clicks and quick bounces) | segmented | Meaningful sessions, not just clicks |
| | **Spend days per user** | segmented | Do players find value worth spending on, repeatedly? |
| | **Robux spent per user** | segmented | Depth of monetization |

FAQ clarifications:
- PTR and first-play bounce measure **first sessions** of RFY-acquired users only. Returning traffic arrives through other sorts (Continue) and doesn't count as RFY impressions.
- Day 2–7 *play days* = average number of the 6 days in that window on which those users played.
- Day 1, 2–7 and 8–28 are used **separately and combined**. Fix the early windows first; strong Day 8–28 is unlikely with poor Day 1.
- A game strong in **only** retention or **only** monetization still gets impressions; strong in both "might receive broader distribution". If retention is low, fix core gameplay first.
- **Genre is not an explicit ranking factor.** The model learns from behaviour. Use accurate genre and tags anyway, because mismatched expectations cause bounces.
- Story-driven or finite games are **not penalized** for naturally lower Day 8–28.

---

## 3. Four things move your impressions (and only one is you)

1. What **you** do: updates and gameplay changes that move the signals.
2. What **Roblox** does: algorithm changes.
3. **Home traffic seasonality:** weekly (peaks usually on **Saturday**), summer/back-to-school, holidays.
4. **Competition:** if other games improve their signals more than you do, your distribution can fall even while your signals hold steady.

So a flat or falling impression line is **not proof** your game got worse. Compare signals, not just impressions.

---

## 4. What limits exposure (documented)

| Issue | Example from the docs |
|---|---|
| Leading with giveaways / monetary implications | A game titled "Robux! Play now!" |
| Mismatched metadata and content | "The Great Dinosaur Quest" thumbnail, generic obby gameplay |
| Non-unique games | Same title and visuals or place file as an existing game |
| Safety, moderation or Community Standards violations | Any |

Also:
- **A custom thumbnail is required** for RFY impressions. Games with only the default thumbnail aren't eligible.
- Affected games show a **Creator Dashboard banner** that updates daily. Roblox re-classifies quality with every update.
- When near-identical games exist, Roblox says it highlights the one that **first added the unique metadata and/or place file**, not simply the oldest game.
- Reusing **your own** old thumbnails or icons across your games/groups is fine.
- *Audience › Advanced Settings › Exclude from recommendations* removes the game from RFY entirely; Home recommendation metrics then read zero.

---

## 5. Other surfaces (and what they're for)

| Surface | How you get there |
|---|---|
| **Continue Playing** | Returning players; this is your retention showing up |
| **Friends / Friend Activity** | Co-play and invites (see [[Invites, Referrals, Share Links and Notifications]]) |
| **Sponsored** | Ads Manager; separate from RFY (see [[Immersive Ads, Rewarded Video and Sponsored Games]]) |
| **Standout Games** | Hand-curated by Roblox: novel mechanics, distinctive visuals, under-represented genres |
| **Live Events** | Time-limited events with quests and rewards |
| **Game details page** | Experience Events, groups, passes and subscriptions; also shows similar games |
| **Search** | Relevance-based, with semantic natural-language search ("food games") in supported languages |
| **Discover (charts, trending)** | Top and trending sorts of best-performing content |
| **Notifications** | Experience notifications and opt-in prompts, which help resurrect lapsed players |

---

## 6. A weekly discovery review (30 minutes)

1. **Acquisition › Home Recommendations tab:** impressions and plays trend. Did impressions move?
2. If yes, check the **most important** signals in order: PTR → first-play bounce (<60 s, 61–180 s) → play days (D1, D2–7, D8–28) → playtime per user.
   The docs note that impression drops typically *follow* drops in PTR, play days and playtime, or a rise in bounce.
3. If those are stable, check the **important** tier: co-play days, qualified sessions, spend days, Robux per user.
4. Compare against the **benchmark games** shown at the bottom. Benchmarks don't affect ranking; use them to spot weak signals.
5. Check external factors: Saturday peaks, school holidays, a big competitor update.
6. Pick **one** signal to improve this week and map it to a lever:

| Weak signal | Lever |
|---|---|
| PTR | Thumbnail personalization, icon, title accuracy ([[Thumbnail Personalization and Icon Testing Workflow]]) |
| Bounce < 60 s | Load time, spawn view, no pre-control popups |
| Bounce 61–180 s | First loop and first reward ([[Core Loop and Session Design for D1 and D7 Retention]]) |
| Play days D2–7 | Daily goals, offline progress, rotations |
| Playtime | Session depth, more to do per visit (cap is 60 min/day) |
| Co-play | Invites, party features, co-op goals |
| Spend days | Small repeatable purchases with clear value |

---

## Myths vs documentation

| Myth | What the docs say |
|---|---|
| "Ads hurt your algorithm ranking" | No; ad users are excluded from RFY signals, and RFY impressions can dip because those users count as already acquired |
| "Big games are favoured" | Signals are per-user averages |
| "A bad launch kills a game forever" | Moving window; daily re-testing; old games can grow again |
| "Change your genre tag to get more traffic" | Genre isn't an explicit factor; inaccurate tags cause bounces |
| "Benchmarks decide your ranking" | Benchmarks don't affect RFY at all |
| "4-hour sessions boost you" | Playtime counts up to 60 minutes per user, per game, per day |

---

## Common mistakes
- Judging discovery by impressions alone, without checking signals and seasonality.
- Buying traffic to "train the algorithm" (ad-acquired users don't enter RFY signals).
- Clickbait thumbnails that raise clicks but also bounce, hurting two "most important" signals at once.
- Giveaway-led titles ("FREE ROBUX") that reduce exposure.
- Shipping only the default thumbnail.
- Copying a trending game's title and visuals so closely that it is classed as non-unique.
- Over-reacting to the temporary PTR dip the FAQ says is normal when impressions grow.

## Checklist
- [ ] Custom thumbnail and accurate, unique title/description/icon
- [ ] No reduced-exposure banner on the Creator Dashboard
- [ ] Weekly review of Home Recommendations signals in documented priority order
- [ ] Seasonality and competitor context noted before conclusions
- [ ] One signal targeted per update, with a matching lever
- [ ] Ad cohorts evaluated separately from organic RFY cohorts
- [ ] Notifications and events set up for non-RFY surfaces

---

**Sources checked (2026-10-25):** Creator Docs: Discovery; Discovery FAQ; Analytics › Acquisition; Publishing › Thumbnails (personalization); Publishing › Publish games and places (Exclude from recommendations).

**Related:** [[Analytics Discovery - Hub]] · [[Discovery, Retention and Analytics]] · [[Analytics and Discovery Operating System]] · [[First 10 Minutes Retention Design]] · [[Thumbnails - Hub]] · [[Roblox 2026 Platform Snapshot]]
