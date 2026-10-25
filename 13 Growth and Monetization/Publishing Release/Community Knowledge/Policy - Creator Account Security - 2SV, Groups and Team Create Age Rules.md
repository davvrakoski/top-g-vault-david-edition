---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Creator Account Security - 2SV, Groups and Team Create Age Rules"
tags: [roblox, community-knowledge, publishing, policy, security, 2fa, groups, team-create]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account
  - https://en.help.roblox.com/hc/en-us/articles/45500519296532-Age-Guidelines-for-Collaborating-in-Roblox-Studio
  - https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use
  - https://create.roblox.com/docs/production/publishing/kids-and-select
---
# Creator Account Security - 2SV, Groups and Team Create Age Rules

> Not legal advice. Summary of the Help Center "Add 2-Step Verification to Your Account", "Age Guidelines for Collaborating in Roblox Studio" and the account sections of the Terms, checked 2026-10-25.

A creator account is a business asset: it owns games, receives Robux and holds API keys. Several programs now **require** 2-Step Verification, and Team Create requires age checks. Security settings therefore affect what you are allowed to do, not just how safe you are. For attack patterns (session theft, malicious plugins) see [[Developer Account Takeovers - Session Theft and Group Hygiene]].

## Programs that require 2SV (as of 2026-10-25)

- Publishing to **Roblox Kids and Select** audiences (owner account).
- **Creator Store seller** accounts.
- **Advertising Integrations** (plus government ID).

## 2SV methods and their gaps

- **Email code**, **authenticator app**, **security keys** (keys require the authenticator app as backup). Only one primary method at a time.
- A **verified email** is required to turn on 2SV at all.
- The help page notes that signing in with a **passkey** bypasses 2SV, and email-code 2SV is bypassed by email one-time-password login. Use the **authenticator app** on owner accounts and protect the email inbox itself with strong 2FA.
- Save **backup codes** offline. If you get a second-device prompt you did not trigger, deny it and change your password.

## What the Terms make you responsible for

- You must keep your credentials confidential and must not share them (except a guardian for a minor).
- You are responsible for **every action taken in your account**, authorised or not. A stolen account that uploads violating content is still your account's violation.
- Report a compromised account to Roblox Support **immediately**.

## Group ownership and roles

The Creator Terms give the **group owner** sole authority to authorise use of the group's UGC and to receive payments. Practical rules:

- Put games in a **group**, owned by a dedicated, 2SV-protected owner account that nobody uses day to day.
- Give collaborators **roles** with only the permissions they need (edit, publish, configure bans, view analytics). Many features check specific permissions, for example the Bans dashboard and RTBF configs.
- Owners must keep the group compliant with the Community Standards; Roblox can warn, remove content or restrict the group if they do not.
- Never give the owner password to a contractor. Use roles, then remove them when the job ends.

## Team Create age rules

- Working alone in Studio or Team Create needs no age check.
- **Collaborating** requires every participant to complete an age check; by default you can collaborate with your own age group.
- Cross-age collaboration needs either **trusted friend** status or, for under-16s, a **parent's permission** in Studio parental controls. Trust with more than 30 creators at once requires parental permission for under-16 creators.
- The **owner must age check** for anyone else to join, even in group games. Unchecked collaborators are blocked but keep "Save As" copy ability.
- When a game turns **Restricted**, collaborators who are not age-verified 18+ are removed from the session.

## Owner-account checklist

- [ ] Authenticator-app 2SV, backup codes stored offline
- [ ] Verified email with its own strong 2FA
- [ ] Owner account age-checked (and ID-verified if you want Kids/Select or seller features)
- [ ] Group roles reviewed every release; departed members removed
- [ ] API keys scoped per task and rotated (see Secrets note)

## Related
[[Publishing Release - Hub]] · [[Developer Account Takeovers - Session Theft and Group Hygiene]] · [[Secrets Store and HttpService - Keeping API Keys Out of Your Place]] · [[Policy - Age Checks, Account Verification and IsVerified Gating]]
