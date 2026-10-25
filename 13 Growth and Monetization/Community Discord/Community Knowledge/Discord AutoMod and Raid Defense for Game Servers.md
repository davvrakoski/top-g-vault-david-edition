---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Discord AutoMod and Raid Defense for Game Servers"
tags: [roblox, community-knowledge, discord, moderation, automod, safety]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://discord.com/moderation/1500000178701-321-auto-moderation-in-discord
  - https://docs.discord.com/developers/resources/auto-moderation
  - https://support.discord.com/hc/articles/4421269296535
  - https://create.roblox.com/docs/production/promotion/social-media-links
---
# Discord AutoMod and Raid Defense for Game Servers

A growing Roblox game's Discord attracts young members, scammers ("free Robux" links, fake verification), and occasional raids when a rival community or a viral moment points at you. Discord's built-in **AutoMod** plus correct server settings stop most of it before a moderator wakes up. These are the settings and limits from Discord's moderation guide and developer docs.

## 1. Server-level settings (Server Settings > Safety Setup)

| Setting | Recommendation from Discord's guide |
|---|---|
| **Verification level** | Medium for small servers; **High** (10-minute wait before new members can talk) for large or discoverable ones; Highest (phone) for small, sensitive servers; never None for a public server |
| **Explicit media filter** | Scan all members in larger communities |
| **Raid protection** | Don't rely only on built-in anti-raid for big servers; add a bot with raid detection; tighten AutoMod during a raid |

Also: require **2FA for moderator actions** (a Discord server option) so a stolen mod account can't ban everyone.

## 2. AutoMod rules (with documented limits)

| Rule type | Max per server | Use it for |
|---|---|---|
| Custom **keyword** rules | 6 | scam phrases, slurs, your game's known scam terms |
| **Commonly flagged words** preset | 1 | baseline profanity/slur filter |
| **Spam content** | 1 | suspected spam messages |
| **Mention spam** | 1 | raid pings (limit up to 50 mentions per message) |
| **Member profile** | 1 | block offensive usernames/bios |

Per keyword rule: up to **1,000 keywords** (60 chars each), up to **10 regex patterns** (260 chars each), and an **allow list** (100 entries) for false positives. Actions: **block message** (optional custom reply up to 150 chars), **send alert** to a mod channel, **timeout** (up to 4 weeks; keyword and mention-spam rules only). Exempt up to 20 roles and 50 channels.

## 3. A starter keyword set for Roblox communities

Block (with a friendly custom message):
- `free robux`, `robux generator`, `*rblx*.gift*`-style lookalike link patterns (use regex for lookalike domains)
- `.ROBLOSECURITY`, `cookie` + `paste` combinations (account-theft scams)
- "verify here" / "nitro free" phrasing used in phishing

Alert-only (for human review): trading-related words in non-trading channels, "scam", "hacked", "dupe".

Discord's guide suggests **blocking severe content and only alerting on subjective terms** so moderators decide edge cases.

## 4. Channel structure that reduces risk

- `#rules` + `#announcements` read-only; new members see these first.
- Slow mode on `#general` during updates (e.g. 5-10 s).
- Separate `#trading` (if your game has trading) with pinned "we never DM you first" warning.
- Images/links only for Verified role (pairs with the Roblox-link bot note).

## 5. Raid playbook (one page, pinned in #mod-chat)

1. Raise verification to High/Highest.
2. Pause invites (Server Settings > Invites).
3. Lower the mention-spam limit, add the raid's phrases to a keyword rule.
4. Bulk-ban with your mod bot; review the alert channel.
5. Post a calm announcement after it ends; revert settings.

## Notes for Roblox devs

- Your Discord is off-platform: Roblox's social links on your game page are visible only to age-verified 16+ users, but younger players may still find the server via YouTube or friends. Follow Discord's own age rules (Discord requires users to meet its minimum age).
- Never DM-verify or ask for Roblox passwords; say so in #rules.

## Related
[[Community Discord - Hub]] - [[Discord - Community Setup]] - [[Community Management Playbook - Discord, Feedback and Crisis Comms]] - [[Linking Discord to Roblox - Bloxlink Verification and Rank Binds]]
