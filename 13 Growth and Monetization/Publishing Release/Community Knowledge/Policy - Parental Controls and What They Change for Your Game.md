---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Parental Controls and What They Change for Your Game"
tags: [roblox, community-knowledge, publishing, policy, parental-controls, kids, design]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://en.help.roblox.com/hc/en-us/articles/30428310121620-Parental-Controls-Overview
  - https://en.help.roblox.com/hc/en-us/articles/39143693116052-Understanding-Age-Checks-on-Roblox
  - https://create.roblox.com/docs/chat/guidelines
---
# Parental Controls and What They Change for Your Game

> Not legal advice. Summary of the Help Center "Parental Controls Overview" (edited 2026-10-14), checked 2026-10-25. Controls change often; re-check before designing around a specific limit.

Parents of younger players can switch off, limit or approve most of what a game relies on: joining, chatting, spending, trading visibility and play time. Roblox enforces these settings for you, but your game has to **degrade gracefully** when they are on. A game that assumes chat, unlimited spending or an always-visible inventory will feel broken to a large share of its audience.

## Two ways parents manage controls

- A **linked parent account** (manage from their own device, emails about activity and requests).
- **Parent mode** on the child's device (no parent account needed; no real-time alerts).

Children can send **requests** (for example, to allow a game) that parents approve or deny.

## What parents can change, and what it means for you

| Control | Parent can... | Design implication |
| --- | --- | --- |
| Content maturity | Choose Minimal, Mild, Moderate or Restricted ceiling; block or allow specific games; allow sensitive-issue games | A rating bump can remove your game for many kids overnight |
| Content May Vary | Not available to under-9s; parents of 9-15 can allow a specific game | Finish the full questionnaire to avoid this label |
| Preview games | Choose whose early-access games the child can test | Early testers from younger groups need parental permission |
| Experience chat / direct chat | On or off; under-9 needs consent for chat, under-13 for direct chat | Applies to Roblox chat, **not** to chat-like features you build, which is why yours must use TextChatService |
| Friends chat, parties | All friends, trusted friends, no one | Party-based matchmaking must work without chat |
| Studio collaboration | Age-group limits | Young team members may need parental permission |
| Quick Words | On or off | Offer pings or emotes, not only Quick Words |
| Visibility, private servers | Who sees online status, who joins private servers | "Join friend" and private server invites can fail silently |
| Spending | Monthly limit 0-10,000 (local currency), notifications; limits stop at 13 | Purchase prompts can be declined by the platform; handle `PromptProductPurchaseFinished` with `isPurchased = false` cleanly |
| Robux transfers | Default 500/day, 1,000/month; approvals | Transfer-based features may need parent approval |
| Inventory visibility | Everyone, friends, no one | Trading UIs should not assume they can show another player's inventory |
| Screen time | Daily limit in 15-minute steps (until 13) | Players can be cut off mid-session; save progress often |

## Design rules that follow

1. **Never require chat** to progress. Quick actions, pings and emotes keep games playable with chat off.
2. **Autosave** frequently and on important events; screen-time cut-offs end sessions without warning.
3. **Handle declined purchases** without nagging or re-prompting. Repeated prompts to a child who hit a limit look like pressure tactics.
4. **Keep the store copy calm** (see [[Policy - Shop Messaging for Young Players and Dark Patterns]]).
5. **Rate accurately**; parents see each game's maturity and play time in their "Top games" view and can block from there.

## Related
[[Publishing Release - Hub]] · [[Roblox Kids and Select - Reaching Players Under 16 in 2026]] · [[Social Systems - Parties, Friends and Co-Play]] · [[Purchase Fulfillment and Receipt Reliability]]
