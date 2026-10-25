---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Roblox Rulebook Map - Which Document Governs What"
tags: [roblox, community-knowledge, publishing, policy, legal, terms-of-use]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use
  - https://about.roblox.com/community-standards
  - https://en.help.roblox.com/hc/en-us/articles/15869919570708-Age-Restricted-Content-on-Roblox
  - https://create.roblox.com/docs/production/promotion/content-maturity
  - https://en.help.roblox.com/hc/en-us/articles/115005718246-Developer-Exchange-Terms-of-Use
  - https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards
---
# Roblox Rulebook Map - Which Document Governs What

> Not legal advice. This is a developer's summary in our own words, checked 2026-10-25. Always read the linked official page before you act, because Roblox edits these pages often.

Roblox has no single "developer agreement". The rules a game must follow are spread over a dozen pages that link to each other. Most moderation surprises happen because a team read one page (usually the Community Standards) and missed another (usually the Maturity questionnaire, the PolicyService rules or the Advertising Standards). Use this map to know where to look first.

## The stack, from widest to narrowest

| Document | Applies to | What a developer needs from it |
| --- | --- | --- |
| [Terms of Use](https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use) (User Terms + Creator Terms) | Everyone | Who owns your content, the license you give Roblox, what counts as Earned Robux, music rules, AI disclosure duties, privacy limits on player data |
| [Community Standards](https://about.roblox.com/community-standards) | Everyone | What content and behaviour is banned; the "Integrity" and "Security" sections cover monetization and off-platform links |
| [Age-Restricted Content policy](https://en.help.roblox.com/hc/en-us/articles/15869919570708-Age-Restricted-Content-on-Roblox) | Games rated 16+ / 18+ | What extra content is allowed behind an age check, and what stays banned even there |
| [Content maturity and compliance](https://create.roblox.com/docs/production/promotion/content-maturity) | Every published game | How to answer the questionnaire; wrong answers are a moderation offence |
| [Paid random items guidelines](https://create.roblox.com/docs/production/monetization/paid-random-items) | Games with loot boxes, eggs, spins | Odds disclosure format and PolicyService treatments |
| [Chat system guidelines](https://create.roblox.com/docs/chat/guidelines) | Games with any player-to-player text | TextChatService is mandatory; signs need rate limits |
| [DevEx Terms](https://en.help.roblox.com/hc/en-us/articles/115005718246-Developer-Exchange-Terms-of-Use) | Anyone cashing out | Eligibility, ongoing service duties, rejection grounds |
| [Advertising Standards](https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards) | Advertisers and games that show ads | Rewarded video rules, ad integrations, banned ad categories |
| Name and Logo guidelines | Anyone promoting off Roblox | No "Roblox"/"Blox" in game titles; use only the "Now on Roblox" badge |

Country appendices inside the Terms (EU/EEA, UK, Japan, South Korea, Vietnam, Australia, China) change consumer rights and dispute rules for players in those places.

## Which page answers which question

- "Can my zombie game show blood?" - Maturity questionnaire (Violence, Blood, Fear) then the Age-Restricted policy if it is realistic and heavy.
- "Can I sell a mystery crate?" - Paid random items page plus PolicyService reference.
- "Can I link my Discord?" - Community Standards, "Directing Users Off-Platform", plus the Social media links doc.
- "Can I use a song I bought on iTunes?" - Creator Terms "Music on Roblox" and the Audio Upload License Agreement. Short answer: no, unless you hold the rights.
- "Why was my DevEx rejected?" - DevEx Terms and the DevEx Creator Hub page.
- "Someone copied my game." - Intellectual Property Guidelines (copyright notice) or Rights Manager.

## Habits that keep you safe

1. Re-read the pages on this map before every major update, not only before launch. Most of them show an "updated" date that changes monthly.
2. Keep a short compliance log in your repo: date, which page you checked, what you changed.
3. When a page and a forum post disagree, the official page wins. Forum threads age fast.
4. The Terms of Use get a rewrite effective 2026-11-01; see [[Policy - Terms of Use Rewrite Effective 2026-11-01 - Merchant of Record]].

## Related
[[Publishing Release - Hub]] · [[Release Checklist]] · [[Release Readiness Runbook 2026]] · [[Text Chat, Moderation and Player Safety]] · [[Policy - What Gets Games Taken Down - Pre-Launch Compliance Audit]]
