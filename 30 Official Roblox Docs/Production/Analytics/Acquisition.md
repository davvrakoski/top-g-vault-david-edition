---
title: "Acquisition"
description: "Explains how to interpret and improve acquisition metrics for your game."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/analytics/acquisition"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to interpret and improve acquisition metrics for your game.*

**Acquisition** measures where new and returning users are coming from and how well they convert.

When acquiring users to your game, such as announcing an in-game event or creating ad campaigns, make sure your game has good [[30 Official Roblox Docs/Production/Analytics/Retention|retention]] and [[30 Official Roblox Docs/Production/Analytics/Engagement|engagement]].

## View acquisition metrics

To view your game's acquisition analytics:

1. Navigate to your [Creations](https://create.roblox.com/dashboard/creations) page on **Creator Dashboard** and select your game.
1. In the **Analytics** menu on the left, select **Acquisition**.

You can view analytics for individual or group owned game. To view the latter, you need to have [[30 Official Roblox Docs/Production/Analytics/Analytics dashboard|group permissions for analytics]].

## Acquisition sources

On the acquisition dashboard, you'll see the following charts and tables:

- New users with play per source
- New users with impressions per source
- Returning users with plays per source
- Returning users with impressions per source
- Play through rate
- Cumulative new users funnel

Here's a list of all the available acquisition sources:

| Source | Description |
| --- | --- |
| Home recommendations | **Recommended Experiences** section on **Home** |
| Continue play | **Continue Play** on **Home** |
| Today's Picks | **Today's Picks** on **Home** |
| Home other | **Favorites** and all other traffic on **Home** |
| Friends | **Friend Activity** section on **Home** |
| Search | Organic traffic from **Search** results and **Recommended Experiences** on **Experience Details** page |
| Charts | **All sorts** on **Charts** |
| Sponsored ads | Acquisition from [[30 Official Roblox Docs/Production/Promotion/Ads Manager\|sponsored experiences]] and **Sponsored Takeovers** on **Home** |
| Search ads | Acquisition from [[30 Official Roblox Docs/Production/Promotion/Ads Manager\|search ads]] |
| Portal ads | Acquisition from [[30 Official Roblox Docs/Production/Monetization/Immersive ads#Portal ads\|portal ads]] |
| Teleport | Traffic coming from another game through [[30 Official Roblox Docs/Projects/Teleport between places\|teleporting]] |
| Other | All other traffic with unknown sources or can't be attributed, including the traffic from external sources |

> [!info]
> If your game has [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places|Exclude from Recommendations]] enabled, all other analytics remain available, but **Home recommendations** metrics are zero; games excluded from recommendations aren't included in **Recommended For You**, so they can't receive any traffic from it.

## Acquisition attribution

You can view the acquisition dashboard by [[30 Official Roblox Docs/Production/Analytics/Acquisition#Acquisition sources|acquisition source]] or by [[30 Official Roblox Docs/Production/Promotion/Share links|share links]]. The dashboard categorizes results for both views as follows:

| Attribution | Description |
| --- | --- |
| Users with plays | Unique new users with plays on the game. |
| Conversion rate | Percent of new users who played your game after viewing an impression. |
| D7 retention | Percentage of new players acquired in the date range who played again on the 8th day (D8) after their first session ended. |
| 7D playtime per user (cumulative) | Cumulative playtime for new players acquired in the date range in their first 7 days divided by the number of new players acquired in the date range. |
| 30D payer conversion (cumulative) | Number of paying users from new players acquired in the date range in their first 30 days divided by the number of new players acquired in the date range. |
| 30D revenue per user (cumulative) | Cumulative revenue, excluding subscriptions, engagement payouts, and immersive ads, for new players acquired in the date range in their first 30 days divided by the number of new players acquired in the date range. |

*(image in the full Top G Vault)*

## Improve acquisition

To improve acquisition, you can run an acquisition funnel to identify sources that might drive more traffic or convert better, such as:

- The sources driving **the most number of new users** to your game.
- The sources with the best **end-to-end conversion rate**.

### Improve acquisition from Roblox sources

Among all Roblox sources, **Home** is usually where the vast majority of users find games. To improve your game's discovery on Home:

1. **Improve engagement and retention.** Get your [[30 Official Roblox Docs/Production/Analytics/Engagement#Improve average session time|session time]] and [[30 Official Roblox Docs/Production/Analytics/Retention#Improve day 1 retention|day 1 retention]] to be comparable or above your similar game benchmarks. The algorithm cares about these metrics because they signal how engaging and satisfying your game is for users.
2. **Optimize monetization.** Get your [[30 Official Roblox Docs/Production/Analytics/Monetization#Improve payer conversion rate|payer conversion]] rate and [[30 Official Roblox Docs/Production/Analytics/Monetization#Improve average revenue per paying user (ARPPU)|ARPPU]] (average revenue per paying user) to be comparable or above your similar game benchmarks. The algorithm cares about these metrics because they measure how invested users are in your game.

*(image in the full Top G Vault)*

You can adopt the following strategies to improve the number of users visiting your game from Roblox sources, including **Home**, **Discover**, and **Search**:

1. **Improve your retention**: Day 1 retention signals how engaging and satisfying your game is for users. Games with high Day 1 retention are more likely to be featured in **Recommended Experiences**. For more information on improving Day 1 retention, see [[30 Official Roblox Docs/Production/Analytics/Retention#Improve day 1 retention|Day 1 retention]].

2. **Grow your engagement**. Average session time measures how much time users spend in your game and signals how much users enjoy your content. Games with high average session time are more likely to be featured in **Recommended Experiences**.

For more information on Roblox sources and best practices on improving the discovery of your game, see [[30 Official Roblox Docs/General/Discovery|Discovery]].

### Improve play through rate from Roblox sources

You can get more users to convert by making your game metadata engaging and accurate:

1. **Use a title, description, and icon** that's true and unique to your game.
2. **Add images and videos** to your game detail page to engage users.

*(image in the full Top G Vault)*

## Improve acquisition from external sources

Here are some tips to get users to visit your game from external sources:

1. **Create social accounts and post regularly**: Add social accounts such as Twitter, YouTube, and Instagram to your Roblox Game Detail Page. Share regular updates, teasers, and screenshots to build buzz for your game. Reply to other large social accounts to grow your following.
2. **Create a user community**: Users in your community can share feedback, suggestions, bug reports, fan art, and more. Engage with your community regularly by hosting events and replying to comments and suggestions.
3. **Partner with other creators and influencers**: You can partner with other creators who make similar games to grow together. You can also reach out to influencers who have large followings on platforms like YouTube or Twitch to see if they're willing to use or review your game.
4. **Create [[30 Official Roblox Docs/Production/Promotion/Share links|share links]]**: Track your off-platform user acquisition and use the **New users funnel** table to understand:
   - **Users with qualified plays**: How many new users are joining from each link?
   - **7-day playtime per user**: Which links are bringing in users who engage the most?
   - **D7 retention**: Which platforms drive users that keep coming back?
   - **30-day revenue per user**: Which channels are attracting users who spend in-game?

*(image in the full Top G Vault)*

---
*Source: [Acquisition](https://create.roblox.com/docs/production/analytics/acquisition) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
