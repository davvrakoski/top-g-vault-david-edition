---
area: "14 Testing and QA"
cluster: "Testing"
title: "Child Safety QA - Filter Coverage, Chat Permissions and Policy Flags"
tags: [roblox, community-knowledge, testing, safety, text-filter, policyservice, chat]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/text-filtering
  - https://create.roblox.com/docs/reference/engine/classes/TextChatService
  - https://create.roblox.com/docs/reference/engine/classes/PolicyService
  - https://create.roblox.com/docs/reference/engine/classes/VoiceChatService
  - https://create.roblox.com/docs/studio/testing-modes
  - https://devforum.roblox.com/t/text-filtering-does-nothing/2686136
---
# Child Safety QA - Filter Coverage, Chat Permissions and Policy Flags

Many Roblox players are children, and safety features are the area where "works on my account" is worst: your adult test account has chat on, no parental limits and an unrestricted region. Missing a filter on a pet name sign or showing trading to a restricted player can get an experience moderated. This note is a **test pass**, not an implementation guide: it finds every place user text appears, proves each one is filtered, and checks behaviour for restricted accounts. For how to call the filter, see [[Text Filtering in Practice - Pet Names, Signs and Offline Authors]].

## Step 1 - Build the text surface inventory

List every feature where text written by one player can be seen by another (or by the same player later). Typical rows:

| Surface | Author | Seen by | Filter call expected |
| --- | --- | --- | --- |
| Pet / plot / guild names | Player | Everyone | `GetNonChatStringForBroadcastAsync` |
| Signs, banners, billboards | Player | Everyone | Broadcast |
| Private note to one player | Player | One recipient | `GetNonChatStringForUserAsync` |
| Saved names loaded from DataStore | Offline player | Everyone | Filter again on display with the stored author ID |
| Random generated names | Server | Everyone | Filter (generated words can form bad words) |
| Text from an external web service | Third party | Everyone | Filter |
| Custom chat UI / whispers | Player | Others | TextChatService handles it; custom channels still use TextChannels |

Grep the codebase for every `TextBox`, `.Text =` assignment fed from remotes or DataStores, and `BillboardGui` text set from player data. Each hit must map to a row.

## Step 2 - Prove filtering happens (published build only)

Community reports agree that `TextService:FilterStringAsync` does not filter during Studio playtests, so filtering must be verified in a **published** test place on the Roblox client (community consensus; Roblox's page does not state it). For each surface:

1. Enter a mild known-bad word and a phone-number-like string.
2. Confirm the text is replaced with hashes for a second account.
3. Confirm the server, not the client, called the filter (search the LocalScripts: no filtering there, and no display of unfiltered text to other clients).
4. Kill the network on the filter call (wrap in a test flag that forces `pcall` failure). Expected: the text is **not shown**, rather than shown unfiltered.

## Step 3 - Chat permission checks

`TextChatService:CanUserChatAsync(userId)` reports whether a user may chat (parental controls can block it); `CanUsersChatAsync(a, b)` checks if two users can message each other, and `CanUsersDirectChatAsync` covers direct chat. Both users must be in the current server or the call errors. Test:

- An account with chat disabled by parental controls (ask a parent/guardian-managed test account owner, or a teammate's restricted alt) sees no input box in your custom chat UI and cannot use player-text features that act like chat.
- Your custom DM or party chat respects `CanUsersChatAsync` for each pair.
- `VoiceChatService:IsVoiceEnabledForUserIdAsync` gates any voice-only UI, so players without voice do not see broken buttons.

## Step 4 - Policy flags

Studio's **Player Emulator** (Test menu, Enable Test Profile, Region) changes what `PolicyService:GetPolicyInfoForPlayerAsync()` returns. Run once per region profile you care about and check:

| Field | Feature it must gate |
| --- | --- |
| `ArePaidRandomItemsRestricted` | Crates/eggs bought with Robux or Robux-bought currency |
| `IsPaidItemTradingAllowed` | Trading of purchased items |
| `IsContentSharingAllowed` | Player-made text, images, audio others can see |
| `AreAdsAllowed` | Immersive ads |
| `IsSubjectToChinaPolicies` | Region compliance changes |

Also force `GetPolicyInfoForPlayerAsync` to fail: the safe default is the **restricted** branch (hide the feature), not the open one.

## Pass criteria

- Every inventory row has a passing published-build test and an owner.
- No user text is displayed when filtering fails.
- Restricted-chat and restricted-policy profiles see no broken or forbidden UI.
- Results stored with the release, and re-run when a new text surface ships.

## Related

[[Testing - Hub]] · [[Policy - PolicyService Compliance - Loot Boxes, Trading, Ads and Regions]] · [[Policy - Text Chat Compliance - TextChatService, Rate Limits and Privacy Checks]] · [[Player Emulator QA - Pseudolocalization, Text Elongation and Region]]
