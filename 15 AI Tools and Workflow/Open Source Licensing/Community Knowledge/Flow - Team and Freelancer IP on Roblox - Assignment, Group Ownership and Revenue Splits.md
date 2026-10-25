---
area: "15 AI Tools and Workflow"
cluster: "Open Source Licensing"
title: "Team and Freelancer IP on Roblox - Assignment, Group Ownership and Revenue Splits"
tags: [roblox, community-knowledge, licensing, teams, contracts]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/groups
  - https://create.roblox.com/docs/projects/game-ownership-transfer
  - https://www.copyright.gov/circs/circ30.pdf
---
# Team and Freelancer IP on Roblox - Assignment, Group Ownership and Revenue Splits

Roblox teams form fast and informally: a builder from Discord, a scripter from the DevForum Talent Hub, a friend who makes UI. Months later the game earns Robux and someone leaves angry, taking "their" models or demanding a share forever. Most of these fights come from three missing things: **who owns the work**, **who owns the game**, and **how money is split**. This note covers what Roblox's tools provide and what still has to be written down. General information only; for real contracts get legal advice in your country.

## 1. Who owns the work a person makes?

In many legal systems, including the US, the **creator owns copyright by default**, even if you paid them, unless there is a written agreement that says otherwise. The US Copyright Office's circular on works made for hire explains that for independent contractors, "work made for hire" applies only to certain categories and requires a signed written agreement; otherwise you need a written **assignment**. A model, script or song from a freelancer is therefore often still theirs legally unless you agreed in writing.

What to put in writing (short and plain is fine):

- **What**: the deliverables (e.g. "lobby map, 12 weapon models, source .blend files").
- **Rights**: assignment of copyright to you or your group, or an exclusive licence for use in Roblox and marketing.
- **Payment**: amount, currency (Robux or cash), milestones.
- **Source files**: delivered with the work (FBX/Blend, PSD, project files).
- **Credit**: how they are credited in game and on the game page.
- **Portfolio**: whether they may show the work publicly, and when (after launch).
- **AI use**: whether they may use AI tools, and that they must disclose it (see [[Flow - Who Owns AI-Generated Code and Assets - Copyright Status and Tool Terms]]).
- **Third-party assets**: they warrant they used only assets they have rights to and list licences.

## 2. Who owns the game?

- A game owned by a **user account** depends entirely on that person. Teams should put the game in a **group**. Roblox supports transferring a game to a group you have publish access to; first move private ModuleScripts and InsertService assets to the group, and recreate user-owned packages as group packages.
- Give each member a **role** with only the permissions they need (edit, publish, revenue view). Remove roles when someone leaves.
- Open Cloud API keys follow the permissions of the user who last generated them, so regenerate keys after ownership or role changes.
- Upload assets **to the group**, not personal accounts, so the game does not break when a member leaves or deletes their uploads.

Account security for groups: [[Policy - Creator Account Security - 2SV, Groups and Team Create Age Rules]].

## 3. How is money split?

Roblox groups support **one-time payouts** and **recurring payouts**. Recurring payouts can be set per game and for the whole group as percentages; the per-game split is taken first, then the remainder flows through the group split, then the rest stays in the group balance. The docs' example: a game split 40/30/10 with 20% remainder, then a group split of 20/20/10 on that remainder.

Notes:

- Private server subscription revenue keeps the split that applied when the subscription was bought (per the docs, may change).
- Only roles with revenue-management permission can change splits; keep that to the owner(s).
- Write down **why** each percentage exists and when it ends (e.g. "builder: 10% for 12 months after launch, then one-time buyout"). "Forever" percentages for one-off work are the most common source of disputes.

## 4. When someone leaves

1. Remove group roles and Team Create access the same day.
2. Rotate secrets and API keys they could see.
3. Check that all their assets are group-owned; re-upload any that are not (only if you hold the rights).
4. Update the recurring payout table according to the agreement.
5. Keep their credit if the agreement says so ([[Attribution in Practice - Credits Screens and License Files]]).

## Minors

Many Roblox developers are under 18. Contracts with minors may be unenforceable or need a parent or guardian in many places; age rules also apply to some Roblox features. Keep agreements simple, fair and with a parent involved.

## Related
[[Open Source Licensing - Hub]] · [[IP, Licensing and Asset Due Diligence]] · [[Studio Collaboration and Team Workflow]] · [[Asset and License Log Template]]
