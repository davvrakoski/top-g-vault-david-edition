---
area: "16 Fast Game Kit"
cluster: "Playbook"
tags: [fast-game-kit, roblox, playbook, launch, growth]
cssclasses: [tg-a16]
---

# Launch Week Checklist

## Why this matters
The first days after a game goes public are when Roblox's recommendations learn who the game is for, and when you learn whether the loop holds real players.
A messy launch (broken saves, misleading thumbnail, no analytics) wastes that window. This checklist runs from 7 days before launch to 7 days after.

> [!warning] No guarantees
> Nothing here guarantees traffic or revenue. Recommendations depend on how players behave in your game, and ad results vary widely. Use small budgets, measure, then decide. See the dev reports in [[Is Sponsoring Still Worth It - CTR Reality Check]] and [[Solo Dev Growth Case - 30k Robux of Ads for 2.3k Visits]].

## Overview

| When | Focus | Key notes |
|---|---|---|
| L-7 to L-4 | Storefront: thumbnails, icon, description | [[Thumbnails - Hub]] |
| L-3 to L-1 | Analytics, QA, soft launch | [[Analytics Discovery - Hub]] · [[Soft Launch Playbook - Private Test to Public in Four Stages]] |
| L (launch day) | Go public, monitor, post | [[Marketing - Launch Day Checklist - Off-Platform]] |
| L+1 to L+3 | Read numbers, fix the leak, small ad test | [[Retention Cohorts - Reading D1, D7, D30 and What Benchmarks Mean]] |
| L+4 to L+7 | First update, plan the cadence | [[LiveOps Calendar and Update Cadence Planner]] |

## L-7 to L-4: Storefront

### Icon
- [ ] One subject, one colour pop, readable at 150 px; no small text ([[Game Icon Design - Readable at 150px]]).
- [ ] Make 2-3 variants for testing later.
- [ ] Shows something from the actual game.

### Thumbnails (3-5)
- [ ] First thumbnail = the core action at its most exciting, staged in-game ([[In-Game Screenshot Staging for Marketing]] · [[Marketing - Clean Roblox Footage - Freecam, Hiding UI and Staging a Shot]]).
- [ ] Clear value contrast and one focal point ([[Thumbnail Composition and Value Design]]).
- [ ] **Honest:** everything shown exists in the game ([[Thumbnail clicks but players leave]] · official [[Thumbnails]]).
- [ ] Optional video thumbnail with real gameplay ([[Gameplay Video Thumbnail - Shot List and Edit Structure]]).
- [ ] Testing plan: [[Thumbnail and Icon A - B Test Playbook]] · [[Thumbnail Personalization and Icon Testing Workflow]] · [[Thumbnail A - B Test Interpretation]].

### Title, description, genre
- [ ] Title says what the game is in 2-4 words. No fake "UPDATE" or event tags.
- [ ] First 160 characters = hook + core action ([[Game Descriptions for Search - The 160-Character Hook]]).
- [ ] Genre and subgenre match the game ([[Genre and Subgenre Selection - The Three-Month Lock]]).
- [ ] Maturity questionnaire answered honestly ([[Maturity Questionnaire Walkthrough - Common Genre Answers]]).
- [ ] Social links follow the rules ([[Policy - Off-Platform Links, Social Links and Promotions]]).
- [ ] Credits for CC BY assets in the description or credits screen ([[Asset Licenses and Credits]]).

## L-3 to L-1: Analytics, QA, soft launch

### Analytics (must be live before going public)
- [ ] Funnel events: join, tutorial steps, first reward, first upgrade, first purchase prompt, first purchase ([[Analytics Custom Events, Funnels and Dashboards Setup]]).
- [ ] Economy events on every source and sink ([[Analytics Instrumentation Plan]]).
- [ ] Event names follow one standard ([[Analytics Event Naming Standard]]).
- [ ] Events verified in Studio and in a live server ([[QA - Analytics Event QA - Verifying Custom, Funnel and Economy Events]]).
- [ ] Error and crash alerts set ([[Analytics Alerts as Code - Crash Rate and Error Alerts]]).
- [ ] The Starter Code kit's analytics module is on and its event list matches your funnel ([[Starter Code - Hub]]).

### QA gate
- [ ] [[Pre-Release Gate]] and [[Release Readiness Runbook 2026]] passed.
- [ ] Purchases tested: every pass and product, rejoin after purchase ([[Testing Purchases - Developer Products, Passes and ProcessReceipt]]).
- [ ] Saves tested with failures and shutdowns ([[QA - DataStore Failure Testing - Fault Injection and Retry Checks]]).
- [ ] Low-end phone and gamepad pass ([[Low-End Device and Console Hardware Test Pass]] · [[Device, Network and Controller Simulation Test Pass]]).
- [ ] Performance numbers pass ([[Speed - Pre-Publish Performance Gate - Numbers to Pass Before Every Release]]).
- [ ] Security sweep ([[Test - Pre-Launch Security Review - Settings, Backdoors, Secrets and Access]]).
- [ ] Policy sweep ([[Policy - What Gets Games Taken Down - Pre-Launch Compliance Audit]]); odds UI if you sell random items ([[Policy - Paid Random Items - Odds Disclosure Checklist]]).

### Soft launch (stages 1-2)
- [ ] 10-50 friends/testers, then small public with no ads ([[Soft Launch Playbook - Private Test to Public in Four Stages]]).
- [ ] In-game bug report button or feedback survey ([[In-Game Bug Report Button - Capturing Useful Context]] · [[QA - In-Game Feedback Surveys and Rating Prompts]]).
- [ ] Watch 3 real players play without helping.

## L: Launch day
- [ ] Make public at a time your audience is online; stay available for 4-6 hours.
- [ ] Watch errors, server crashes and concurrent players live ([[Server Heartbeat, Ping and Bandwidth Monitoring]]).
- [ ] Post 1-3 short clips ([[Marketing - Short-Form Hooks - Winning the First Two Seconds]] · [[Marketing - YouTube Shorts for a Roblox Game - Specs, Related Video Links and Repurposing]]).
- [ ] Announce in your Discord and Roblox community ([[Roblox Communities as Your On-Platform Hub - Roles, Announcements and Forums]]).
- [ ] Share links per channel so you can see what worked ([[Marketing - Share Links per Channel - Naming, LaunchData Perks and Reading Results]]).
- [ ] Hotfix plan ready: who can roll back, how ([[Release Rollback and Incident Response]]).
- Full off-platform list: [[Marketing - Launch Day Checklist - Off-Platform]].

## L+1 to L+3: Read the numbers, then spend

### What to read first
| Metric | Where it leaks | Fix first |
|---|---|---|
| Thumbnail CTR low | Storefront | Icon/thumbnail tests ([[Thumbnail and Icon A - B Test Playbook]]) |
| Many leave in first 2 minutes | Onboarding | [[First-Session Drop-Off Fixes - Mythical Mining Onboarding Review]] |
| Short sessions | Loop pacing | [[Core Loop and Session Design for D1 and D7 Retention]] |
| D1 low | No reason to return | Daily reward, "next goal" at session end |
| Players but no payers | Shop/offer | [[Monetization Analytics and Segmentation]] · [[Unit Economics - ARPDAU, Payer Conversion, LTV and Ad Payback]] |

Beginner guide: [[Your First Week of Analytics - Which Numbers to Read First]].

### Sponsored ads (small test only)
- [ ] Only after soft launch numbers look healthy. Ads amplify a working funnel; they do not fix a leaking one ([[50k Robux Sponsorship Flop - What Replies Diagnosed]]).
- [ ] Start with a small daily budget for 3-5 days, 2+ creatives, compare CTR and cost per play ([[Sponsored Ads Experiments - Trap Arena Targeting Tests]]).
- [ ] Choose format: sponsored experience vs search ads ([[Search Ads vs Sponsored Experiences - Dev Reports 2024-2025]]). Official: [[Ads Manager]] · [[Search ads]] · [[Advertising standards]].
- [ ] Ad creative must be honest and meet advertising standards, the same as thumbnails.
- [ ] Stop or change creatives that underperform; do not raise budget on a bad funnel.
- Revenue side (rewarded video, immersive ads): [[Immersive Ads, Rewarded Video and Sponsored Games]] · [[Ad Revenue Reality - Rewarded Video and Immersive Ads Dev Reports]].

## L+4 to L+7: First update and cadence
- [ ] Ship update #1 within 7 days: fix the top leak + one small content drop from your cut list ([[Scope Cutter - What to Build First]]).
- [ ] Patch notes players read ([[Patch Notes and In-Game Update Boards Players Actually Read]] · [[Marketing - Update Logs and Patch Notes That Get Read]]).
- [ ] Use update/event notifications where allowed ([[Experience events and updates]] · [[Experience notifications]]).
- [ ] Restart servers without losing players ([[Update Cadence and Server Restarts Without Losing Players]]).
- [ ] Set a cadence you can keep: many small teams aim for a weekly small update and a bigger one every 2-4 weeks ([[LiveOps Calendar and Update Cadence Planner]] · [[LiveOps and Content Rotation]]).
- [ ] If the launch was weak, use the window to change the hook, not to quit on day 3 ([[Turning a Weak Launch Around - The Honeymoon Window]]).

## Do not
- Do not buy bots, fake likes or "visit" services. They break community rules and corrupt your data.
- Do not pay creators without disclosure rules ([[Marketing - Paid Promo Disclosure - FTC, ASA and Platform Labels]]).
- Do not change the genre setting every day; recommendations need consistent signals.
- Do not ship big untested changes on launch day.

## Related
[[Playbook - Hub]] · [[Ship a Roblox Game in 30 Days]] · [[Publishing Release - Hub]] · [[Community Discord - Hub]] · [[LiveOps Social - Hub]] · [[Home Recommendations - What Roblox Documents About Discovery]] · [[Release Checklist]]
