---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Marketing - Share Links per Channel - Naming, LaunchData Perks and Reading Results"
tags: [roblox, community-knowledge, marketing, share-links, analytics, attribution]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/promotion/share-links
  - https://create.roblox.com/docs/production/analytics/acquisition
  - https://create.roblox.com/docs/production/promotion/deeplinks
  - https://create.roblox.com/docs/creator-rewards
  - https://support.google.com/youtube/answer/12220281
---
# Marketing - Share Links per Channel - Naming, LaunchData Perks and Reading Results

Roblox has no UTM parameters. Traffic from outside Roblox lands in the **"Other"** bucket of the Acquisition dashboard unless it comes through a **Share Link**. A creator who posts on TikTok, YouTube and Discord with one plain game URL can't tell which channel brought players who stay. One Share Link per channel, per creator and per campaign fixes that. It also makes those players count toward **Creator Rewards audience expansion**.

## 1. Facts from the docs

- Create links at Creator Dashboard > **Creations > Share Links > Create link**. Give it a unique **campaign name**, pick the game, and optionally turn on **Use custom LaunchData**.
- **No limit** on links per game. Roblox recommends separate links per channel.
- Group games: you need the **Share Links Manager** permission, and you create the link from the group.
- Old `roblox.com/games/start?placeId=...&launchData=...` deep links are **deprecated** for public use. Use Share Links instead.
- LaunchData is readable via `Player:GetJoinData().LaunchData`. Keep it **≤ 200 bytes** decoded. It's visible and editable by users, so never trust it for anything valuable.

## 2. A naming scheme that stays readable

Use `channel_format_yyyymm_detail`, lowercase, and keep the scheme the same across links:

| Campaign name | Used for |
|---|---|
| `tt_bio_202611` | TikTok profile bio |
| `tt_vid_202611_bossreveal` | one viral TikTok, pinned comment |
| `yt_shorts_desc_202611` | all Shorts descriptions this month |
| `yt_devlog_ep04` | long-form devlog episode 4 |
| `dc_announce_202611` | Discord announcement channel |
| `cr_<creatorname>_202611` | one partner creator (pay on results) |

Keep a small sheet with columns `campaign, url, posted where, date, cost`.

## 3. LaunchData perks (small, cosmetic, server-checked)

Give a link a short tag such as `src=tt1` and grant a harmless welcome item once per player. A minimal server read:

```lua
local Players = game:GetService("Players")
local PERKS = { tt1 = "TikTokTrail", yt1 = "DevlogBadgeHat" } -- allow-list

Players.PlayerAdded:Connect(function(player)
    local data = player:GetJoinData()
    local tag = data and data.LaunchData
    local perk = tag and PERKS[string.match(tag, "^src=(%w+)$") or ""]
    if perk then
        -- grant once: check your profile/DataStore flag before awarding
        print(player.Name, "arrived via", tag, "->", perk)
    end
end)
```

Use an allow-list, grant only once (store a flag), and never grant currency that can be traded. Anyone can copy the link.

## 4. Reading the results

Analytics > **Acquisition**, switched to the Share Links view, shows per link: **users with plays**, **conversion rate**, **D7 retention**, **7D playtime per user**, **30D payer conversion** and **30D revenue per user**.

Decision rules that work for a small team:
1. **Rank by D7 retention and 7D playtime, not raw plays.** A link that brings 2,000 players who leave quickly is worth less than 300 who come back.
2. Compare platforms side by side: views on the platform (YouTube "How viewers find your content", TikTok analytics) → share-link plays → D7. A video with lots of views and almost no plays didn't make people want to play. Rework the hook or the call to action.
3. For a paid creator, compare cost against plays and against 30D revenue per user from **that creator's link only**.
4. Audience expansion pays a **35% revenue share on the first $100** of qualifying purchases (60 days) when a new or lapsed (60+ days) user joins via your Share Link and plays 10+ minutes that day. The game must average **100+ DAU** over the following 60 days. ID verification and DevEx terms apply.

## Pitfalls
- One link reused everywhere: no attribution.
- Link shorteners in front of Share Links are fine for neat bios, but count clicks there **and** plays in Roblox. The gap between the two is your drop-off.
- LaunchData perks that are worth farming invite alt-account abuse.

## Related
[[Community Discord - Hub]] · [[Invites, Referrals, Share Links and Notifications]] · [[Creator Rewards - Designing for Daily Engagement and Audience Expansion]] · [[Retention Cohorts - Reading D1, D7, D30 and What Benchmarks Mean]]
