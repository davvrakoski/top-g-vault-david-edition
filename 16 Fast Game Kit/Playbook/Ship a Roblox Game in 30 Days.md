---
area: "16 Fast Game Kit"
cluster: "Playbook"
tags: [fast-game-kit, roblox, playbook, 30-day-plan]
cssclasses: [tg-a16]
---

# Ship a Roblox Game in 30 Days

## Why this matters
Most first games die in month three of "almost done". A fixed 30-day plan with a public launch on Day 30 forces the cuts that make a game shippable.
Every day below names the exact vault notes and asset folders to open, so you spend the month building, not searching.

> [!warning] Estimates, not promises
> The day counts assume one developer working about 4-6 focused hours a day, starting from [[Starter Code - Hub]] and a recipe from [[Genre Recipes - Hub]]. Your pace will vary. Shipping on Day 30 does not guarantee players or Robux; it gives you a real game to measure and improve.

## Before Day 1 (30 minutes)
- Pick one genre recipe: [[Genre Recipes - Hub]]. Do not mix two.
- Read [[Scope Cutter - What to Build First]] and write your one-sentence loop.
- Skim [[Genre and Subgenre Selection - The Three-Month Lock]] so the genre you pick on the experience page matches the game.

## The plan at a glance

| Week | Goal | Done when |
|---|---|---|
| 1 (Days 1-7) | Core loop playable with grey boxes | A stranger can play 5 minutes without help |
| 2 (Days 8-14) | Progression, saving, economy | Leave + rejoin keeps everything; 30 minutes of goals exist |
| 3 (Days 15-21) | Art pass, juice, UI, monetization | Looks like a game in screenshots; shop works in Studio test |
| 4 (Days 22-30) | QA, soft launch, launch | Public, analytics live, update #1 planned |

## Week 1: Core loop in grey boxes

| Day | Do this | Open these notes / assets |
|---|---|---|
| 1 | Install the Starter Code kit, sync with Rojo, rename the game, publish a private place | [[Starter Code - Hub]] · [[Rojo, VS Code and luau-lsp - Local Setup from Zero]] · [[Git for Roblox Repos - .gitignore, Binary Places and LFS]] · [[Saving and Version History - Never Lose a Place]] |
| 2 | Write a one-page design doc: loop, controls, 3 upgrade tiers, win/lose, first 10 minutes | [[One-Page Design Docs for Roblox Games]] · [[Core Loop and Session Design for D1 and D7 Retention]] · your genre recipe |
| 3 | Blockout the map with primitives or the Prototype Kit | [[Kenney - Prototype Kit]] · [[Map Blockout to Art Pass Workflow]] · [[Scale in Studs - Real-World Sizes Converted]] |
| 4 | Build the core action (click, shoot, jump, punch, drop) server-authoritative | Genre recipe "Systems" table · [[Server-Authoritative Melee Pattern]] or [[Hitscan and Projectile Weapon Blueprint]] · [[Remote Payload Validation]] |
| 5 | Add the reward: currency from the Starter Code kit, a leaderstat, a sound | [[Secure Shop and Currency Blueprint]] · [[First Leaderboard with leaderstats]] · [[UI and Feedback Sound Design - Clicks, Rewards and Errors]] |
| 6 | Add the first upgrade that makes the action better | [[Incremental Cost Curves - Exponential Costs and Bulk Buy Math]] · [[Config Feature Flags and Content Data]] |
| 7 | **Test day.** 2-3 people play for 10 minutes; write down every confusion | [[Playtest Scripts and Session Facilitation]] · [[Team Test - Collaborative Playtesting in Studio]] |

**Week 1 gate:** if the loop is not fun with grey boxes, fix the loop now. Art will not save it ([[Eight Years of Roblox Dev - Tall vs Fat Features]]).

## Week 2: Progression, saving, economy

| Day | Do this | Open these notes / assets |
|---|---|---|
| 8 | Confirm PlayerData saves every field you added; add schema version | [[DataStore Session Locking, Retries, Versioning and Erasure]] · [[Net - Player Data Schema Design - Keys, Defaults and Size Budget]] · [[BindToClose and Server Shutdown Save Flush]] |
| 9 | Progression ladder: levels/zones/stages with XP curve | [[Progression, XP, and Skill Tree Blueprint]] · [[XP Curve Formulas - Time-to-Level Targets and Level Caps]] |
| 10 | Economy sheet: every source and sink with numbers | [[Economy Sources and Sinks Spreadsheet Model]] · [[Economy - Inflation, Sources and Sinks]] |
| 11 | Second content tier (new zone, weapon, stage set, room) | Genre recipe build order, Week 2 |
| 12 | Onboarding: first 30 seconds, arrow to first goal | [[First 10 Minutes Retention Design]] · [[Tutorial, Onboarding and FTUE]] · [[Map - Objective Markers and Off-Screen Arrows - BillboardGui, Edge Clamping and Distance]] |
| 13 | Daily reward + codes from the Starter Code kit, wired to real rewards | [[Daily and Weekly Reward Blueprint]] · [[Promo Codes - Redeem System With Live Configs and Abuse Guards]] |
| 14 | **Test day.** Leave/rejoin, two players at once, spam remotes | [[Test - Join, Leave and Respawn Edge-Case Pass]] · [[RemoteEvent Fuzzing - Bad Input Tests Before Launch]] |

## Week 3: Art, juice, UI, monetization

| Day | Do this | Open these notes / assets |
|---|---|---|
| 15 | Swap grey boxes for kit art (one kit family only) | [[Modular Kits from the Kenney FBX Library]] · [[FBX Import Settings, Scale and Collision Fidelity]] · [[FBX Asset Library - Hub]] |
| 16 | Props and dressing: Poly Haven or KayKit, not both styles | [[Poly Haven Roblox-Ready - Catalog]] · [[More Free Sources - KayKit]] · [[World - Clutter and Prop Density]] |
| 17 | Lighting preset for your genre | [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] · [[Lighting, Atmosphere and Graphics]] |
| 18 | Juice: VFX on every reward and hit | [[Mesh VFX Recipes with the Top G VFX Mesh Pack]] · [[Top G Originals - VFX Mesh Pack]] · [[FX - Level-Up and Reward Bursts - Light Pillars, Confetti and Screen Pops]] · [[Hitstop, Screen Shake and Camera Impact Feel]] |
| 19 | HUD + shop skin from the Starter Code kit; phone layout first | [[Platform - Touch Target Sizes and Mobile-First HUD Layout]] · [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]] · [[Shop UX, Pricing and Player Trust]] |
| 20 | Monetization: 2-3 passes + 1-2 dev products, tested | [[Passes vs Developer Products vs Subscriptions - 2026 Decision Guide]] · [[Testing Purchases - Developer Products, Passes and ProcessReceipt]] · [[Starter Packs - First Purchase Offers That Convert Without Pressure]] |
| 21 | Animations: Kenney/KayKit clips or 100STYLE locomotion (credit required) | [[Importing FBX Animations and Retargeting - Kenney Rig Walkthrough]] · [[100STYLE Mocap - Catalog]] · [[Free Animation Picker by Game Type]] |

## Week 4: QA, soft launch, launch

| Day | Do this | Open these notes / assets |
|---|---|---|
| 22 | Analytics: funnel (join, tutorial steps, first upgrade, first purchase) | [[Analytics Custom Events, Funnels and Dashboards Setup]] · [[Analytics Event Naming Standard]] · [[QA - Analytics Event QA - Verifying Custom, Funnel and Economy Events]] |
| 23 | Performance pass on a low-end phone | [[Speed - Pre-Publish Performance Gate - Numbers to Pass Before Every Release]] · [[Mobile Performance Deep Dive]] · [[Instance Count and Part Budgets]] |
| 24 | Security + policy audit | [[Test - Pre-Launch Security Review - Settings, Backdoors, Secrets and Access]] · [[Policy - What Gets Games Taken Down - Pre-Launch Compliance Audit]] · [[Maturity Questionnaire Walkthrough - Common Genre Answers]] |
| 25 | Thumbnails (3) + icon + description | [[Thumbnail Composition and Value Design]] · [[Game Icon Design - Readable at 150px]] · [[Game Descriptions for Search - The 160-Character Hook]] |
| 26 | Credits screen for CC BY assets; license log | [[Asset Licenses and Credits]] · [[Attribution in Practice - Credits Screens and License Files]] |
| 27 | Soft launch: friends + small public, no ads | [[Soft Launch Playbook - Private Test to Public in Four Stages]] · [[Bug Triage, Severity and Regression Workflow]] |
| 28 | Fix the top 3 problems from soft launch data | [[Your First Week of Analytics - Which Numbers to Read First]] · [[Session Time and D1 Rescue - Tag Obby Teardown]] |
| 29 | Release gate, then plan update #1 | [[Release Readiness Runbook 2026]] · [[Pre-Release Gate]] · [[LiveOps Calendar and Update Cadence Planner]] |
| 30 | **Launch.** Public, small ad test, post clips, watch numbers | [[Launch Week Checklist]] · [[Marketing - Launch Day Checklist - Off-Platform]] |

## Daily rhythm (keeps the 30 days honest)
- [ ] Start: read yesterday's last line in your resume note ([[Project State, Decisions and Resume Notes]]).
- [ ] Build the day's item only. New ideas go to a "later" list.
- [ ] Commit + publish to the private place at the end of the day.
- [ ] Play your own game for 5 minutes on a phone (or the device emulator).
- [ ] Write one line: what is done, what is next.

## If you fall behind
| Behind by | Cut this | Keep this |
|---|---|---|
| 1-2 days | Second content tier (Day 11) | Saving, onboarding |
| 3-4 days | Animations (Day 21), extra props (Day 16) | Juice on the core action |
| 5+ days | Monetization beyond 1 pass; daily rewards | Analytics, thumbnails, security audit |

Never cut: data saving, server validation, odds disclosure (if you sell random items), the credits line for CC BY assets.

## After Day 30
- Weeks 5-8: weekly updates driven by analytics, see [[Launch Week Checklist]] and [[Turning a Weak Launch Around - The Honeymoon Window]].
- Second game: reuse the Starter Code kit and this plan. Teams report the second game goes much faster because the plumbing is done.

## Related
[[Playbook - Hub]] · [[Fast Game Kit - Hub]] · [[7-Day Cash-Grab Sprint - Simulator, Obby, Tycoon]] · [[AI-Assisted Build Workflow]] · [[Master Build Order]] · [[Beginner to Shipping Roadmap]] · [[Publishing Your First Experience - 2026 Release Checklist]]
