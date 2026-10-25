---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Linking Discord to Roblox - Bloxlink Verification and Rank Binds"
tags: [roblox, community-knowledge, discord, community, verification, groups]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.blox.link/bloxlink/guides/binding/rankbind
  - https://docs.blox.link/bloxlink/guides/binding/grouprolebind
  - https://rowifi.xyz/docs/rankbinds
  - https://create.roblox.com/docs/projects/groups
  - https://create.roblox.com/docs/production/promotion/social-media-links
---
# Linking Discord to Roblox - Bloxlink Verification and Rank Binds

A game Discord gets far more useful once each member is linked to their Roblox account: you can give roles for in-game ranks, group membership or testers, cut down on impersonation, and look up a reporter's real UserId during bug or scam reports. Community bots such as **Bloxlink**, **RoVer** and **RoWifi** do this; Bloxlink is the most widely used and has public docs for its bind system.

## What a verification bot does

1. Member runs a verify command and proves they own a Roblox account (the bot's own flow, typically through its website/OAuth).
2. The bot stores Discord ID <-> Roblox UserId.
3. **Binds** map Roblox facts to Discord roles: group membership, group rank, badges, or game passes (check each bot's current docs for which bind types exist).
4. Optional nickname templates rename members to their Roblox username.

## Bloxlink binds (per its docs)

- Run `/bind` in your server (Bloxlink needs permission to view and talk in the channel), choose the **group** bind type.
- **Rank bind:** give a Discord role to specific group rolesets, e.g. ranks `1, 3` (list) or `1 - 3` (range). Example in the docs: role "MR" for the Manager and Staff Manager ranks.
- **Group role bind:** give one role to everyone in the group ("say everyone").
- The docs advise usually skipping the "remove other roles" option.

RoVer and the open-source verification bots in the search results use `groupid:rank` syntax with ranges, and rank 0 for non-members; check your chosen bot's docs for exact syntax.

## A role plan for a game server

| Discord role | Bound to | Unlocks |
|---|---|---|
| Verified | linked account | chat beyond #welcome |
| Member | in your Roblox group (Community) | #general, events |
| Tester | group rank "Tester" | #test-builds, test place link |
| Supporter | game pass or badge (if your bot supports it) | cosmetic color, #supporters |
| Mod / Dev | group ranks for staff | mod channels |

Keep staff roles **manually** assigned or tied to locked group ranks, never to something purchasable.

## Safety notes

- Verification bots get powerful permissions. Give the bot role only the permissions it needs (Manage Roles, Manage Nicknames), and place it **below** your staff roles so it can't edit them.
- Never ask members for their Roblox password or `.ROBLOSECURITY` cookie. Legit bots never need it; announce this in #rules, because "verify here" phishing links are a common scam.
- Pair with Discord's own **2FA requirement for moderators** and AutoMod.

## Connecting the game side

- Put your Discord on the game page with Roblox **social media links**. Per Roblox's docs, these links are only **visible to users age-verified as 16+**, and only creators age-verified as 16+ can add them; younger players never see them, so don't rely on links alone for a kids' game.
- Roblox groups (now shown as **Communities** on roblox.com) are the canonical place for ranks; Discord roles should mirror them, not the other way around.
- Reward linking in-game only in policy-safe ways (e.g. a cosmetic for joining the Roblox group via `GroupService:PromptJoinAsync`), not for actions outside Roblox you can't verify.

## Related
[[Community Discord - Hub]] - [[Discord - Community Setup]] - [[Discord Community Operations]] - [[Developer Account Takeovers - Session Theft and Group Hygiene]]
