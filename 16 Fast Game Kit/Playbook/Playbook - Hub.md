---
area: "16 Fast Game Kit"
cluster: "Playbook"
tags: [fast-game-kit, roblox, playbook, graph-hub]
cssclasses: [tg-a16]
---

# Playbook - Hub

## Why this matters
The vault has thousands of notes; the Playbook is the short path through them. Each note is a plan you follow in order, and every step links the exact note or asset folder to open.
Use it with the [[Starter Code - Hub]] (the base project) and a recipe from [[Genre Recipes - Hub]] (what to build).

> [!warning] Estimates, not promises
> Every timeline in the Playbook is an estimate for a focused developer reusing the Starter Code kit and the vault's assets. Shipping fast is something you control; players and revenue are not, so nothing here promises either.

## The Playbook notes

| Note | Use it when | Time it covers |
|---|---|---|
| [[Ship a Roblox Game in 30 Days]] | You want a complete, polished first game with a real launch | 30 days, day by day |
| [[7-Day Cash-Grab Sprint - Simulator, Obby, Tycoon]] | You want a fast, small, monetized test game (honestly, inside policy) | 7 days |
| [[Scope Cutter - What to Build First]] | Before you start, and whenever you fall behind | Any time |
| [[Launch Week Checklist]] | From 7 days before going public to 7 days after | 2 weeks |
| [[AI-Assisted Build Workflow]] | You build with Claude Code, Claude Desktop, Cursor or Studio Assistant | Setup 1 hour, then per feature |

## Recommended order

```text
1. Scope Cutter            -> write the one-sentence loop and cut list
2. Genre Recipes - Hub     -> pick ONE recipe
3. Starter Code - Hub      -> set up the base project (Day 1)
4. AI-Assisted Build Workflow (optional) -> rules file + MCP setup
5. 30-day plan OR 7-day sprint -> build
6. Launch Week Checklist   -> go public, read numbers, ship update #1
```

## Pick your plan

| Question | 30-day plan | 7-day sprint |
|---|---|---|
| Genres | Any recipe | Simulator, Obby, Tycoon |
| Goal | A game you keep updating | A cheap experiment |
| Quality bar | Art pass, juice, onboarding, analytics | Kit art, basic juice, analytics |
| Monetization | 3-5 items, tested, policy-checked | 3-5 items, no paid random items in v1 |
| After launch | Weekly updates | Grow it (switch to 30-day Weeks 2-4) or move on |

## The rules behind every plan
1. **Reuse the plumbing.** Data, purchases, remotes, analytics and UI come from the Starter Code kit.
2. **Fun in grey boxes first.** Week 1 of every plan ends with a playtest of the core loop.
3. **Server decides.** Currency, damage and items are validated on the server ([[Threat Modeling Every Roblox Feature]]).
4. **One art family.** Pick one kit style from [[FBX Asset Library - Hub]] and stay in it.
5. **Phone first.** Test on a phone or the device emulator every day.
6. **Measure before you spend.** Analytics before ads; ads only after soft launch numbers look healthy.
7. **Stay inside policy.** Odds for paid random items, honest thumbnails, no copied IP ([[Policy - What Gets Games Taken Down - Pre-Launch Compliance Audit]]).
8. **Credit your assets.** CC BY packs (like [[100STYLE Mocap - Catalog]]) need a credits line ([[Asset Licenses and Credits]]).

## Where the Playbook points most often

| Area | Hub | Most-used notes |
|---|---|---|
| Planning | [[Foundations Planning - Hub]] | [[One-Page Design Docs for Roblox Games]] · [[Core Loop and Session Design for D1 and D7 Retention]] |
| Data | [[Data Backend - Hub]] | [[DataStore Session Locking, Retries, Versioning and Erasure]] |
| Security | [[Networking Security - Hub]] | [[Remote Payload Validation]] · [[Server-Side Movement Validation and Anti-Exploit Checks]] |
| Monetization | [[Monetization - Hub]] | [[Passes vs Developer Products vs Subscriptions - 2026 Decision Guide]] · [[Paid Random Items, Odds Disclosure and PolicyService]] |
| Analytics | [[Analytics Discovery - Hub]] | [[Analytics Custom Events, Funnels and Dashboards Setup]] · [[Your First Week of Analytics - Which Numbers to Read First]] |
| Store page | [[Thumbnails - Hub]] | [[Thumbnail Composition and Value Design]] · [[Game Icon Design - Readable at 150px]] |
| Launch | [[Publishing Release - Hub]] | [[Soft Launch Playbook - Private Test to Public in Four Stages]] · [[Release Readiness Runbook 2026]] |
| Live ops | [[LiveOps Social - Hub]] | [[LiveOps Calendar and Update Cadence Planner]] |
| QA | [[Testing - Hub]] | [[Pre-Release Gate]] · [[QA Test Plan Template for Roblox Experiences]] |
| AI tools | [[Claude MCP AI Workflow - Hub]] | [[One-Shot Game Build Prompt (OP)]] · [[Claude and the Roblox Studio MCP Server - Responsible Setup]] |
| Assets | [[FBX Asset Library - Hub]] | [[Modular Kits from the Kenney FBX Library]] · [[Top G Originals - VFX Mesh Pack]] |
| Community lessons | [[Reddit Game Design and Growth - Hub]] | [[Why Games Fail - Twelve Causes and Fixes]] · [[Turning a Weak Launch Around - The Honeymoon Window]] |

## Reality checks worth reading once
- [[Cash Grab Games That Earn Nothing]]: why late template copies usually flop.
- [[Low-CCU Revenue Reality - 60-78 CCU Earning 25k Robux a Year]]: what a small game can look like.
- [[Is Sponsoring Still Worth It - CTR Reality Check]]: ad spend expectations.
- [[So Your Game Died - Fun, Niche and Vision]]: what to do after a flop.
- [[The Roblox Game Development Mindset]]: long-run habits.

All of these are anecdotes and community reports, not forecasts.

## Related
[[Fast Game Kit - Hub]] · [[Genre Recipes - Hub]] · [[Starter Code - Hub]] · [[Top G Vault - Home]] · [[Master Build Order]] · [[Beginner to Shipping Roadmap]]
