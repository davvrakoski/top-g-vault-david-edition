---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Player Data, COPPA and GDPR Basics for Creators"
tags: [roblox, community-knowledge, publishing, policy, privacy, gdpr, coppa, data]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use
  - https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy
  - https://create.roblox.com/docs/production/publishing/RTBF-and-creators
  - https://about.roblox.com/community-standards
  - https://www.ftc.gov/news-events/topics/protecting-consumer-privacy-security/kids-privacy-coppa
---
# Player Data, COPPA and GDPR Basics for Creators

> Not legal advice, and not a substitute for a privacy lawyer. Summary of the Creator Terms "Privacy" section, the Roblox Privacy and Cookie Policy (updated 2026-10-23) and "RTBF and creators", checked 2026-10-25.

Roblox is the main data controller for its players, and it deliberately gives you very little personal data. That protects you. The risk appears when a game starts collecting **more** than Roblox gives (Discord handles, emails, chat logs, voice clips) or sends data **out** (webhooks, analytics services). Then you are holding personal data about many children, and laws like the U.S. COPPA and the EU/UK GDPR can reach you.

## What Roblox shares with you

Per the Privacy Policy, creators get a player's **username, display name, user ID, game metrics, UGC transaction details and regional location** (derived from IP). Roblox does **not** share the IP address itself. Location is provided so you can understand your player base and meet country laws.

Even a UserId is treated as personal data by Roblox's RTBF page, because it identifies a person.

## What the Creator Terms forbid you to do with player data

If you receive any user personal information, you may not use it to:

- provide services to third parties;
- build or supplement profiles or segments on individual users, devices or browsers, on Roblox or elsewhere;
- link one device's behaviour to such profiles;
- and you must not knowingly **sell** a user's personal information (the Terms name the California CCPA).

Both you and Roblox may use **experience data** for legitimate purposes such as improving the game, legal compliance and business analytics.

## What the Community Standards forbid players (and your features) from sharing

Emails, passwords, addresses, phone numbers, financial details and sensitive credentials, with limits depending on age. Do not build forms, "link your account" prompts or support flows that ask players for these inside the game.

## COPPA in one paragraph

Roblox states it complies with the U.S. Children's Online Privacy Protection Act, which governs collecting personal information from children under 13. Roblox collects only non-personal information from under-13 sign-ups. If your own off-platform systems (website, Discord bot, mailing list) collect data from Roblox players, assume many are under 13 and read the FTC's COPPA guidance before collecting anything.

## GDPR-style duties that reach you

- **Erasure:** when a user deletes their account, you must permanently delete their personal data you hold (see the erasure note).
- **Minimisation:** do not keep data "just in case". Save what the game needs, keyed by UserId.
- **Security:** Creator Terms require commercially reasonable protection of user data your API clients collect, and prompt notice to users of unauthorised access where the law requires it.

## Safe data design checklist

- [ ] DataStore keys contain the UserId in the name or scope (`Player_123`), never only usernames
- [ ] No free-text fields saved that could contain real names or contacts
- [ ] Chat logs are not exported; Roblox already keeps what moderation needs
- [ ] Webhooks and logging send UserIds only when needed, never chat text or names
- [ ] RTBF deletion templates configured for every store holding user data
- [ ] External services you use (analytics, backend) listed in a team privacy doc with what they receive

## Related
[[Publishing Release - Hub]] · [[Policy - Right to Erasure - Deletion Templates and Webhook Workflow]] · [[Discord Webhooks from Roblox - Why They Break and Safer Logging]] · [[RTBF and creators]]
