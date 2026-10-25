---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "What Gets Games Taken Down - Pre-Launch Compliance Audit"
tags: [roblox, community-knowledge, publishing, policy, launch, checklist, moderation, compliance]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://about.roblox.com/community-standards
  - https://create.roblox.com/docs/production/promotion/content-maturity
  - https://create.roblox.com/docs/chat/guidelines
  - https://create.roblox.com/docs/production/monetization/paid-random-items
  - https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox
  - https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use
---
# What Gets Games Taken Down - Pre-Launch Compliance Audit

> Not legal advice. A practical audit built from the official pages linked above, checked 2026-10-25. It is our checklist, not a Roblox list; Roblox does not publish "top takedown reasons".

Roblox scans every published or updated game, scans every uploaded asset, and acts on reports. The rules that most often turn a game private, reduce its audience or freeze its revenue fall into a handful of groups. Run this audit before launch and before each large update; one item failing can cost the whole release.

## 1. Rating and audience

- [ ] Full Maturity & Compliance Questionnaire done, answered for the **most extreme** moment.
- [ ] No restricted content added before receiving the Restricted label.
- [ ] Title, description, icon, thumbnails and videos are general-audience even if the game is 18+.
- [ ] Questionnaire resubmitted after any update that changes an answer.

Without maturity info, playability is restricted for everyone; inaccurate info is a moderation offence.

## 2. Monetization

- [ ] Every Robux-funded random reward shows full numeric odds before purchase, sums to 100%, updates with luck boosts.
- [ ] `PolicyService` flags gate loot boxes, paid trading, ads and subscriptions on the server.
- [ ] No simulated gambling (staking Robux, currency or items on chance).
- [ ] No donation-for-cause prompts, no Robux or cash giveaways, no "free Robux".
- [ ] Ads follow the Advertising Standards; brand deals registered as Advertising Integrations.

## 3. Communication

- [ ] All player-to-player text through `TextChatService`; no legacy chat code.
- [ ] Signs and similar UGC text filtered and rate-limited to 1 minute.
- [ ] Voice not required to play; voice routing uses the Audio API, not side channels.

## 4. Off-platform and personal data

- [ ] No URLs, invite codes, emails or QR codes in the game.
- [ ] No feature asks players for real names, ages, contacts or off-Roblox handles.
- [ ] RTBF templates or webhook in place for every store with user data.

## 5. Content

- [ ] No real tragedies, real political figures or campaigns, real drugs, tobacco, vapes.
- [ ] No sexual content, dating mechanics, bedrooms or bathrooms in social hangouts (outside 18+ rules).
- [ ] No profanity in text, audio or images (including obfuscated spellings).
- [ ] Generative AI disclosed, filtered, and rated (memory across sessions means 18+).

## 6. IP

- [ ] No "Roblox" or "Blox" in the title.
- [ ] Every model, texture, sound and song is yours, licensed, Roblox Licensed Music or a Roblox-provided asset.
- [ ] No third-party characters, logos or brand names without a license.

## 7. Integrity and security

- [ ] No obfuscated or hidden scripts; no `require(assetId)` backdoors from free models.
- [ ] Kicks and bans go through `Player:Kick` / `Players:BanAsync`, not an external system that replaces them.
- [ ] No misleading metadata or duplicate copies of your own game to farm discovery.
- [ ] No bots or fake engagement (also kills ad payouts and Kids/Select evaluation).
- [ ] Owner account with authenticator 2SV; group roles least-privilege.

## 8. After launch

- [ ] Someone reads Roblox messages daily (moderation notices, RTBF list, copyright notices).
- [ ] Appeals handled within the 30-day window.
- [ ] Compliance log updated with each release.

## Related
[[Publishing Release - Hub]] · [[Release Checklist]] · [[Release Readiness Runbook 2026]] · [[Policy - Roblox Rulebook Map - Which Document Governs What]] · [[Policy - Moderation Appeals for Games, Assets and Accounts]]
