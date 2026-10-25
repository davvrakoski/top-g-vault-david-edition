---
area: "13 Growth and Monetization"
cluster: "Monetization"
title: "Creator Rewards - Designing for Daily Engagement and Audience Expansion"
tags: [roblox, community-knowledge, monetization, creator-rewards, share-links, retention]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/creator-rewards
  - https://create.roblox.com/docs/production/promotion/share-links
  - https://create.roblox.com/docs/production/monetization/engagement-based-payouts
  - https://www.lindseygamble.com/blog/roblox-introduces-creator-rewards-new-ways-for-creators-to-get-paid
---
# Creator Rewards - Designing for Daily Engagement and Audience Expansion

Since **24 July 2025**, Roblox pays creators through **Creator Rewards**, which replaced Engagement-Based Payouts (the old Premium Payouts) and the Creator Affiliate program. It pays for two things you can design for: being one of the first games a paying player opens each day, and bringing new or returning users onto Roblox. Many older guides still talk about "Premium playtime"; that model is gone.

## 1. Daily Engagement Rewards (automatic, no enrollment)

- You earn **5 Robux per Active Spender per day** if your game is one of the **first three games** that user launches that day **and** they spend **10+ minutes** in it that day (time across multiple visits counts).
- **Active Spender** = spent at least $9.99 (Robux, Premium or UGC subscriptions) in the last 60 days, and was not new or reactivated in that period.

What this means for design:

- **Be a "first game of the day".** Daily reasons to open your game first: daily rewards, streaks, daily quests, offline earnings, timed events at predictable times, friends who play it.
- **Get to 10 minutes.** A session that ends at minute 8 earns nothing from this program. Look at your session length distribution; push the median past 10 minutes with a satisfying first loop, not with forced waiting.
- Paid-access games are eligible too.

## 2. Audience Expansion Rewards (needs ID verification)

When a **New User** (new to Roblox) or **Reactivated User** (away 60+ days) joins Roblox through you and plays your game 10+ minutes that day, you earn **35% of their first $100 of Qualifying Purchases anywhere on Roblox for 60 days**. Attribution paths:

1. They click your game's **Share Link** and join/rejoin Roblox.
2. They arrive via your game's **direct link** as their first session that day.
3. They **search your game's name** and enter it as their first session that day.

Conditions: your game must hold an **average of 100+ DAU for 60 days** after the join date, and the creator (or for group games, a member with group revenue permission) must be ID-verified and in good standing.

Design and marketing implications:

- **Off-platform marketing now pays twice:** the player plus a revenue share. Put Share Links (not plain URLs) in YouTube descriptions, TikTok bios and Discord.
- **A memorable, searchable name** helps the "search your experience name" path.
- Build **in-game share prompts** at proud moments (rare drop, boss kill).

## 3. What gets you penalized

Roblox lists: bots or automated activity, teleport manipulation to inflate time, encouraging alt accounts, impersonation, and high chargeback rates. Rewards are paid as Earned Robux with a **60-day hold**.

## Where to see it

Creator Hub reward data for experiences and for share links (see the official page's "Access reward data" section). Track it next to your Ads Manager spend: Ads Manager's "Earnings" column includes Creator Rewards earned from campaign traffic.

## Quick checklist

- [ ] Median session > 10 min for returning spenders.
- [ ] One strong daily reason to open your game first.
- [ ] Share Links used in every off-platform post.
- [ ] Account ID-verified for Audience Expansion.
- [ ] No reward-for-alts or AFK-farm teleport tricks.

## Related
[[Monetization - Hub]] - [[Passes vs Developer Products vs Subscriptions - 2026 Decision Guide]] - [[Invites, Referrals, Share Links and Notifications]] - [[Streaks With Grace - Freezes, Repairs and Loss Aversion]]
