---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Experience Rules, In-Game Bans and Player Refund Disputes"
tags: [roblox, community-knowledge, publishing, policy, bans, game-rules, refunds, support]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://en.help.roblox.com/hc/en-us/articles/203312500-Understanding-Custom-Experience-Rules-on-Roblox
  - https://create.roblox.com/docs/players
  - https://create.roblox.com/docs/production/bans
  - https://en.help.roblox.com/hc/en-us/articles/6566665691924-Contacting-an-Experience-s-Creators-for-Help
  - https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use
---
# Experience Rules, In-Game Bans and Player Refund Disputes

> Not legal advice. Summary of the Help Center "Understanding Custom Experience Rules", the Creator Hub ban guidelines and Bans dashboard, the "Contacting an Experience's Creators" article and Creator Terms dispute clauses, checked 2026-10-25.

You are allowed to run your game like a club with house rules: ban cheaters, punish toxicity, wipe exploited items. But Roblox sets rules for **how** you do it, and players who lose purchases through your bans can complain to Roblox. Getting the process right protects both your community and your revenue.

## Rules for your own game rules

- Your rules may add to, but **never contradict**, the Terms of Use and Community Standards (for example, no rule excluding people by gender).
- Post them **clearly, somewhere every player can reach** (an in-game rules screen, plus the description).
- Apply them **fairly**, not to target particular users.
- Breaking your custom rules cannot be reported through Roblox's Report Abuse; you handle enforcement.
- Players appeal your bans **to you**. Roblox steps in only if your rules or enforcement break Roblox policy, and it can moderate the game if they do.

## Use Roblox's ban tools

The Community Standards list "third-party kicks or bans without the Kick and Ban API" as misuse of Roblox systems. Use:

- `Players:BanAsync` / `UnbanAsync` in scripts (supports durations, alt-account option, public and private reasons), or
- the **Bans dashboard** in Creator Hub (Moderation > Bans): ban by numeric user IDs, optional "apply to all known alt accounts", public reason shown to the user, private reason for staff, view ban history, unban.

Group staff need the **Configure bans for all group games** permission.

## Ban messages

The text-filtered public reason may mention platforms in general ("Visit the Discord on my game page") but **not** a specific handle, username, direct link or personal information.

## Purchases and bans

- Players may lose access to items bought in your game if you ban them under your rules.
- If a player is banned from a game for **more than 14 days**, their subscription for that game is **cancelled automatically without refund**.
- **Creators cannot issue Robux or money refunds.** Players are told to contact Roblox Support for refunds.
- Under the Creator Terms, if Roblox refunds a player after a complaint about your game, it may **deduct the same Earned Robux from you**, and its decision is final.
- Creators must handle player complaints "quickly and professionally".

## A fair-enforcement setup

1. Written rules screen, versioned with a date.
2. Server-side evidence log per ban (what was detected, when, by which system or moderator), keyed by UserId only.
3. Graduated actions: warning, short ban, long ban, permanent.
4. An appeal path via your game page's social links (age-checked 16+) or an in-game form that stores text filtered and rate-limited.
5. Review appeals within a set time and record outcomes.
6. For item wipes after an exploit, announce what was removed and why.

## Related
[[Publishing Release - Hub]] · [[Ban API in Practice - BanAsync, Alt Detection and Appeals]] · [[Admin Command Safety - Server-Side Permission Checks]] · [[Policy - Moderation Appeals for Games, Assets and Accounts]]
